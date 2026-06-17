<template>
    <div class="auction-page">

        <!-- Background Blur -->
        <div class="bg-circle one"></div>
        <div class="bg-circle two"></div>

        <!-- Header -->
        <div class="container py-5">

<div class="navbar-custom">

    <div class="logo">
        Primakara Auction
    </div>

<div class="nav-actions">

    <button
        class="btn-add"
        @click="router.push('/auctions/create')"
    >
        + Add Auction
    </button>

    <button
        class="btn-nav"
        @click="router.push('/my-auctions')"
    >
        My Auctions
    </button>
<div class="user-info">
     {{ auth.user?.name }}
</div>
    <button
        class="btn-logout"
        @click="logout"
    >
        Logout
    </button>

</div>

</div>

            <!-- Search -->
            <div class="search-card">

            <input
                v-model="search"
                type="text"
                class="search-input"
                placeholder="Search auction..."
            />

            </div>

            <!-- Statistics -->
            <div class="stats-grid">

                <div class="stat-card">
                    <h3>{{ auctions.length }}</h3>
                    <span>Total Auctions</span>
                </div>

                <div class="stat-card">
                    <h3>
                        {{
                            auctions.filter(
                                a => a.status === 'active'
                            ).length
                        }}
                    </h3>
                    <span>Active</span>
                </div>

                <div class="stat-card">
                    <h3>
                        {{
                            auctions.filter(
                                a => a.status === 'ended'
                            ).length
                        }}
                    </h3>
                    <span>Ended</span>
                </div>

            </div>

            <!-- Auction Grid -->
            <div class="auction-grid">

                <div
    v-for="auction in filteredAuctions"
    :key="auction.id"
    class="auction-card"
>

    <div class="card-image">

        <!-- Placeholder jika belum ada gambar -->
<img
    :src="imageUrl(auction.image)"
    alt="auction"
/>

        <span
            class="badge-live"
            :class="{
                active: auction.status === 'active',
                ended: auction.status === 'ended',
                scheduled: auction.status === 'scheduled'
            }"
        >
            {{ auction.status }}
        </span>

    </div>

    <div class="card-content">

        <small class="auction-id">
            Auction #{{ auction.id }}
        </small>

        <h3 class="auction-title">
            {{ auction.title }}
        </h3>

        <div class="price-box">

            <span class="price-label">
                Starting Price
            </span>

            <div class="price">
                Rp {{ Number(auction.start_price).toLocaleString('id-ID') }}
            </div>

        </div>

        <button
            class="btn-detail"
            @click="goToDetail(auction.id)"
        >
            View Details →
        </button>

    </div>

</div>

            </div>

            <!-- Empty State -->
            <div
                v-if="auctions.length === 0"
                class="empty-state"
            >
                <h3>No Auctions Found</h3>
                <p>Create your first auction.</p>
            </div>

        </div>

    </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from "vue";
import api from "../api/axios";
import { useRouter } from "vue-router";
import { computed } from "vue";
const search = ref("");
const filteredAuctions = computed(() => {
    return auctions.value.filter(item =>
        item.title
            .toLowerCase()
            .includes(search.value.toLowerCase())
    );
});
const closedAuctions = computed(() => {
    return auctions.value.filter(
        a => a.status === "ended"
    ).length;
});
const router = useRouter();

const goToDetail = (id) => {
    router.push(`/auctions/${id}`);
};

const auctions = ref([]);

const loadAuctions = async () => {
    try {

        const response = await api.get("/auctions");

        auctions.value = response.data;

    } catch (error) {

        console.error(error);
    }
};

let refreshTimer;

onMounted(() => {

    loadAuctions();

    refreshTimer = setInterval(() => {
        loadAuctions();
    }, 5000);

});

onUnmounted(() => {
    clearInterval(refreshTimer);
});

import Swal from "sweetalert2";

const logout = async () => {

    const result = await Swal.fire({
        title: "Logout?",
        text: "Are you sure you want to logout?",
        icon: "question",
        showCancelButton: true,
        confirmButtonText: "Logout",
        confirmButtonColor: "#ef4444",
        background: "#1e293b",
        color: "#fff"
    });

    if(result.isConfirmed){

        sessionStorage.removeItem("token");

        router.push("/");
    }
};

const imageUrl = (path) => {
    if (!path) {
        return "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=1000";
    }

    return `http://127.0.0.1:8000/storage/${path}`;
};


import { useAuthStore } from "../stores/auth";

const auth = useAuthStore();
</script>

<style scoped>

.btn-add{
    border:none;
    padding:12px 20px;
    border-radius:12px;
    color:white;
    font-weight:600;
    background:linear-gradient(
        135deg,
        #3b82f6,
        #6366f1
    );
    transition:.3s;
}

.btn-add:hover{
    transform:translateY(-2px);
    box-shadow:
        0 10px 25px rgba(99,102,241,.4);
}
.navbar-custom{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:40px;
}

.logo{
    color:white;
    font-size:28px;
    font-weight:700;
}

.nav-actions{
    display:flex;
    gap:12px;
}

.btn-nav{
    border:none;
    background:rgba(255,255,255,.08);
    color:white;
    padding:12px 20px;
    border-radius:12px;
}
.user-info{
    padding:12px 18px;
    border-radius:12px;
    background:rgba(255,255,255,.08);
    color:white;
    font-weight:600;
    display:flex;
    align-items:center;
    backdrop-filter:blur(20px);
}
.btn-logout{
    border:none;
    background:#ef4444;
    color:white;
    padding:12px 20px;
    border-radius:12px;
}

.auction-page{
    min-height:100vh;
    background:#0f172a;
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

.two{
    width:300px;
    height:300px;
    background:#6366f1;
    right:-100px;
    bottom:-100px;
    opacity:.2;
}

.hero-card{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

.hero-title{
    color:white;
    font-size:42px;
    font-weight:700;
}

.hero-subtitle{
    color:#94a3b8;
}

.btn-add{
    border:none;
    padding:14px 24px;
    border-radius:12px;
    background:linear-gradient(
        135deg,
        #3b82f6,
        #6366f1
    );
    color:white;
    font-weight:600;
}

.search-card{
    margin-bottom:30px;
}

.search-input{
    width:100%;
    height:55px;
    border:none;
    border-radius:16px;
    padding:0 20px;
    background:rgba(255,255,255,.08);
    backdrop-filter:blur(20px);
    color:white;
}

.stats-grid{
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:20px;
    margin-bottom:30px;
}

.stat-card{
    background:rgba(255,255,255,.08);
    backdrop-filter:blur(20px);
    border-radius:20px;
    padding:25px;
    text-align:center;
}

.stat-card h3{
    color:white;
    font-size:32px;
}

.stat-card span{
    color:#94a3b8;
}

.auction-grid{
    display:grid;
    grid-template-columns:
        repeat(auto-fill,minmax(280px,1fr));
    gap:25px;
}

.auction-card{
    background:rgba(255,255,255,.08);
    backdrop-filter:blur(20px);
    border-radius:24px;
    overflow:hidden;
    transition:.3s;
}

.auction-card:hover{
    transform:translateY(-8px);
}

.card-image{
    height:180px;
    background:linear-gradient(
        135deg,
        #3b82f6,
        #6366f1
    );
    position:relative;
}

.badge-live{
    position:absolute;
    top:15px;
    right:15px;
    padding:6px 12px;
    border-radius:20px;
    background:#22c55e;
    color:white;
    font-size:12px;
}
.badge-live.active{
    background:#22c55e;
}

.badge-live.ended{
    background:#ef4444;
}
.card-content{
    padding:20px;
}

.card-content h3{
    color:white;
    margin-bottom:15px;
}

.price{
    font-size:24px;
    font-weight:700;
    color:#60a5fa;
    margin-top:5px;
}

.btn-detail{
    width:100%;
    border:none;
    height:50px;
    border-radius:14px;
    font-weight:600;
    color:white;
    background:linear-gradient(
        135deg,
        #3b82f6,
        #6366f1
    );
    transition:.3s;
}

.btn-detail:hover{
    transform:translateY(-2px);
    box-shadow:0 10px 25px rgba(99,102,241,.4);
}

.empty-state{
    text-align:center;
    color:white;
    margin-top:50px;
}
.card-image img{
    width:100%;
    height:100%;
    object-fit:cover;
    transition:.4s;
}

.auction-card:hover img{
    transform:scale(1.08);
}
.auction-id{
    color:#94a3b8;
    display:block;
    margin-bottom:8px;
}
.auction-title{
    font-size:20px;
    font-weight:700;
    color:white;
    margin-bottom:20px;
}
.price-box{
    background:rgba(255,255,255,.05);
    padding:12px;
    border-radius:12px;
    margin-bottom:18px;
}

.price-label{
    color:#94a3b8;
    font-size:12px;
}
</style>