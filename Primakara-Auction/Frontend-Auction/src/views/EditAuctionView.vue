<template>
<div class="edit-page">

    <div class="bg-circle one"></div>
    <div class="bg-circle two"></div>
    <div class="top-actions">

    <button
        class="btn-back"
        @click="goBack"
    >
        ← Back
    </button>

</div>
<div class="form-card">

    <h1>Edit Auction</h1>

    <input
        v-model="form.title"
        placeholder="Title"
    >

    <textarea
        v-model="form.description"
        placeholder="Description"
    ></textarea>

    <input
        v-model="form.start_price"
        type="number"
        placeholder="Start Price"
    >

    <div
    v-if="imagePreview"
    class="image-preview"
>
    <img
        :src="imagePreview"
        alt="preview"
    >
</div>
    <input
    type="file"
    @change="handleImage"
/>

    <input
        v-model="form.bid_increment"
        type="number"
        placeholder="Bid Increment"
    >

    <input
        v-model="form.starts_at"
        type="datetime-local"
    >

    <input
        v-model="form.ends_at"
        type="datetime-local"
    >

    <button
        @click="updateAuction"
    >
        Save Changes
    </button>

</div>
</div>
</template>

<script setup>
import { ref, onMounted } from "vue";
import { useRoute, useRouter } from "vue-router";
import api from "../api/axios";
import Swal from "sweetalert2";

const route = useRoute();
const router = useRouter();

const image = ref(null);

const imagePreview = ref("");

const form = ref({
    title:"",
    description:"",
    start_price:"",
    bid_increment:"",
    starts_at:"",
    ends_at:"",
});

const loadAuction = async () => {

    const response =
        await api.get(
            `/auctions/${route.params.id}`
        );

    form.value = response.data;

    imagePreview.value =
        response.data.image
        ? `http://127.0.0.1:8000/storage/${response.data.image}`
        : "";
};

const updateAuction = async () => {

    try{

        const formData = new FormData();

        formData.append("title", form.value.title);
        formData.append("description", form.value.description);
        formData.append("start_price", form.value.start_price);
        formData.append("bid_increment", form.value.bid_increment);
        formData.append("starts_at", form.value.starts_at);
        formData.append("ends_at", form.value.ends_at);

        if(image.value){
            formData.append("image", image.value);
        }

        formData.append("_method", "PUT");

        await api.post(
            `/auctions/${route.params.id}`,
            formData,
            {
                headers:{
                    "Content-Type":"multipart/form-data"
                }
            }
        );

        Swal.fire({
            icon:"success",
            title:"Auction Updated",
            background:"#1e293b",
            color:"#fff"
        });

        router.push("/my-auctions");

    }catch(error){

        console.error(error);

        Swal.fire({
            icon:"error",
            title:"Update Failed"
        });
    }
};
const handleImage = (event) => {

    image.value = event.target.files[0];

    if(image.value){
        imagePreview.value =
            URL.createObjectURL(image.value);
    }
};

onMounted(() => {
    loadAuction();
});

const goBack = () => {
    router.go(-1);
};
</script>

<style scoped>

.top-actions{
    position:absolute;
    top:30px;
    left:30px;
    z-index:10;
}

.btn-back{
    border:none;
    padding:12px 20px;
    border-radius:12px;
    color:white;
    font-weight:600;
    background:rgba(255,255,255,.08);
    backdrop-filter:blur(20px);
    cursor:pointer;
    transition:.3s;
}

.btn-back:hover{
    transform:translateY(-2px);
    background:rgba(255,255,255,.15);
}
.edit-page{
    min-height:100vh;
    background:#0f172a;
    display:flex;
    justify-content:center;
    align-items:center;
    position:relative;
    overflow:hidden;
}

.bg-circle{
    position:absolute;
    border-radius:50%;
    filter:blur(100px);
}

.one{
    width:300px;
    height:300px;
    background:#3b82f6;
    top:-100px;
    left:-100px;
    opacity:.2;
}
.image-preview{
    text-align:center;
    margin-bottom:20px;
}

.image-preview img{
    width:100%;
    max-height:250px;
    object-fit:cover;
    border-radius:16px;
}
.two{
    width:300px;
    height:300px;
    background:#6366f1;
    right:-100px;
    bottom:-100px;
    opacity:.2;
}

.form-card{
    width:500px;
    background:rgba(255,255,255,.08);
    backdrop-filter:blur(20px);
    border-radius:24px;
    padding:30px;
}

.form-card h1{
    color:white;
    margin-bottom:20px;
}

.form-card input,
.form-card textarea{
    width:100%;
    margin-bottom:15px;
    padding:12px;
    border:none;
    border-radius:12px;
    background:rgba(255,255,255,.08);
    color:white;
}

.form-card button{
    width:100%;
    height:50px;
    border:none;
    border-radius:12px;
    color:white;
    font-weight:600;
    background:linear-gradient(
        135deg,
        #3b82f6,
        #6366f1
    );
}
</style>