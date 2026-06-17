<template>

<div class="auction-page">

    <div class="bg-circle one"></div>
    <div class="bg-circle two"></div>

    <div class="container py-5">

        <div class="header">

            <h1>My Auctions</h1>

            <button
                class="btn-back"
                @click="router.push('/auctions')"
            >
                ← Back
            </button>

        </div>

        <div class="auction-grid">

            <div
                v-for="auction in myAuctions"
                :key="auction.id"
                class="auction-card"
            >

                <img
                    :src="imageUrl(auction.image)"
                    class="card-image"
                >

                <div class="card-content">

                    <h3>
                        {{ auction.title }}
                    </h3>

                    <p class="price">
                        Rp {{ Number(auction.start_price).toLocaleString('id-ID') }}
                    </p>

                    <div class="actions">

                        <button
                            class="btn-detail"
                            @click="goToDetail(auction.id)"
                        >
                            Detail
                        </button>

                        <button
                            class="btn-edit"
                            @click="goToEdit(auction.id)"
                            v-if="auction.status !== 'ended'"
                        >
                            Edit
                        </button>

                        <button
                            class="btn-delete"
                            @click="deleteAuction(auction.id)"
                        >
                            Delete
                        </button>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

</template>

<script setup>
import { ref, onMounted, computed } from "vue";
import api from "../api/axios";
import Swal from "sweetalert2";
import { useRouter } from "vue-router";

const router = useRouter();

const auctions = ref([]);

const currentUser = JSON.parse(
    sessionStorage.getItem("user")
);

const myAuctions = computed(() => {

    return auctions.value.filter(
        auction =>
        auction.user_id === currentUser?.id
    );
});

const imageUrl = (path) => {

    if(!path){
        return "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800";
    }

    return `http://127.0.0.1:8000/storage/${path}`;
};

const loadAuctions = async () => {

    const response =
        await api.get("/auctions");

    auctions.value =
        response.data;
};

const goToDetail = (id) => {

    router.push(
        `/auctions/${id}`
    );
};
const goToEdit = (id) => {
    router.push(`/edit-auction/${id}`);
};
const deleteAuction = async (id) => {

    const result =
        await Swal.fire({
            title:"Delete Auction?",
            icon:"warning",
            showCancelButton:true,
            confirmButtonColor:"#ef4444",
            background:"#1e293b",
            color:"#fff"
        });

    if(!result.isConfirmed){
        return;
    }

    await api.delete(
        `/auctions/${id}`
    );

    Swal.fire({
        icon:"success",
        title:"Deleted",
        background:"#1e293b",
        color:"#fff"
    });

    loadAuctions();
};

onMounted(() => {
    loadAuctions();
});
</script>

<style scoped>

.auction-page{
    min-height:100vh;
    background:#0f172a;
    padding:40px;
}

.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

.header h1{
    color:white;
}

.btn-back{
    border:none;
    padding:12px 20px;
    border-radius:12px;
    background:#3b82f6;
    color:white;
}

.auction-grid{
    display:grid;
    grid-template-columns:
    repeat(auto-fill,minmax(300px,1fr));
    gap:25px;
}

.auction-card{
    background:rgba(255,255,255,.08);
    border-radius:20px;
    overflow:hidden;
}

.card-image{
    width:100%;
    height:220px;
    object-fit:cover;
}

.card-content{
    padding:20px;
}

.card-content h3{
    color:white;
}

.price{
    color:#60a5fa;
    font-weight:700;
}

.actions{
    display:flex;
    gap:10px;
    margin-top:15px;
}

.btn-detail,
.btn-edit,
.btn-delete{
    flex:1;
    border:none;
    height:45px;
    border-radius:12px;
    color:white;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

.btn-detail{
    background:linear-gradient(
        135deg,
        #3b82f6,
        #2563eb
    );
}

.btn-edit{
    background:linear-gradient(
        135deg,
        #f59e0b,
        #ea580c
    );
}

.btn-delete{
    background:linear-gradient(
        135deg,
        #ef4444,
        #dc2626
    );
}

.btn-detail:hover,
.btn-edit:hover,
.btn-delete:hover{
    transform:translateY(-2px);
}

.btn-detail:hover{
    box-shadow:0 10px 20px rgba(59,130,246,.35);
}

.btn-edit:hover{
    box-shadow:0 10px 20px rgba(245,158,11,.35);
}

.btn-delete:hover{
    box-shadow:0 10px 20px rgba(239,68,68,.35);
}

</style>