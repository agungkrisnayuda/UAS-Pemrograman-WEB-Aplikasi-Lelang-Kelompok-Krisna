<template>

<div class="auction-page">

    <!-- Background Blur -->
    <div class="bg-circle one"></div>
    <div class="bg-circle two"></div>

    <!-- Navbar -->
    <div class="navbar-custom">

        <div
            class="logo"
            @click="router.push('/auctions')"
        >
            Primakara Auction
        </div>

            <button
                class="btn-logout"
                @click="logout"
            >
                Logout
            </button>

        </div>
        <div class="top-actions">

    <button
        class="btn-back"
        @click="goBack"
    >
        ← Back to Auctions
    </button>

</div>

    <!-- Detail Auction -->
    <div class="detail-container">

        <!-- Image -->
        <div class="image-card">

            <div
                v-if="loading"
                class="image-skeleton"
            ></div>

            <img
                v-else
                :src="imageUrl(auction.image)"
                alt="auction"
            >

        </div>

        <!-- Information -->
        <div class="info-card">

            <span
                        class="badge-live"
            :class="{
                active: auction.status === 'active',
                ended: auction.status === 'ended',
                scheduled: auction.status === 'scheduled'
            }">
                {{ auction.status }}
            </span>

            <h1>
                {{ auction.title }}
            </h1>

            <div class="countdown-box">
                ⏳ {{ countdown }}
            </div>

            <div class="price-box">

                <span>Starting Price</span>

                <h2>
                    Rp {{ Number(auction.start_price).toLocaleString("id-ID") }}
                </h2>

            </div>

            <div class="highest-bid-box">

                <span>Highest Bid</span>

                <h2>
                    Rp {{ Number(highestBid).toLocaleString("id-ID") }}
                </h2>

            </div>

            <div
                v-if="auction.status !== 'ended'"
                class="bid-section"
            >

                <input
                    v-model="amount"
                    type="number"
                    class="bid-input"
                    placeholder="Enter your bid amount"
                >
                <button
                    class="btn-bid"
                    v-if="isStarted && !isEnded"
                    @click="placeBid"
                >
                    Place Bid
                </button>
                <div v-if="!isStarted"     class="auction-ended">
                    Auction starts in:
                    {{ countdownToStart }}
                </div>

                <div v-if="isEnded"     class="auction-ended">
                    Auction Ended
                </div>

            </div>

        </div>

    </div>

    <!-- Winner -->
    <div
        v-if="auction.status === 'ended' && auction.winner"
        class="winner-card"
    >

        <h2>
            🏆 Auction Winner
        </h2>

        <h3>
            {{ auction.winner.name }}
        </h3>

        <p>
            Winning Bid:
            Rp {{ Number(highestBid).toLocaleString("id-ID") }}
        </p>

    </div>

    <!-- Bid History -->
    <div class="bid-history">

        <h2>
            Bid History
        </h2>

        <div
            v-if="auction.bids.length === 0"
            class="bid-item"
        >
            No bids yet
        </div>

        <div
            v-for="bid in auction.bids"
            :key="bid.id"
            class="bid-item"
        >

            <div>
                👤 {{ bid.user?.name }}
            </div>

            <strong>
                Rp {{ Number(bid.amount).toLocaleString("id-ID") }}
            </strong>

        </div>

    </div>

</div>

</template>

<script setup>
import Swal from "sweetalert2";
import {
    ref,
    computed,
    onMounted,
    onUnmounted
} from "vue";

import { useRoute } from "vue-router";
import api from "../api/axios";



let timer = null;

const updateTimer = () => {

    const now = new Date();

    if (auction.value.status === "scheduled") {

        const startTime = new Date(
            auction.value.starts_at
        );

        const diff = startTime - now;

        if (diff <= 0) {

            auction.value.status = "active";

            return;
        }

        countdown.value = diff;
    }

    else if (auction.value.status === "active") {

        const endTime = new Date(
            auction.value.ends_at
        );

        const diff = endTime - now;

        if (diff <= 0) {

            auction.value.status = "ended";

            return;
        }

        countdown.value = diff;
    }
};

const amount = ref("");
const placeBid = async () => {

    try {

        await api.post(
            `/auctions/${route.params.id}/bid`,
            {
                amount: amount.value
            }
        );

        Swal.fire({
            icon: "success",
            title: "Bid Submitted",
            text: "Your bid has been placed.",
            background: "#1e293b",
            color: "#fff",
            timer: 2000,
            showConfirmButton: false
        });

        amount.value = "";

        loadAuction();

    } catch (error) {

        console.error(error);

        Swal.fire({
            icon: "error",
            title: "Bid Failed",
            text: error.response?.data?.message || "Something went wrong",
            background: "#1e293b",
            color: "#fff"
        });
    }
};
import { useRouter } from "vue-router";

const router = useRouter();

const logout = () => {

    sessionStorage.removeItem("token");

    router.push("/");
};
const route = useRoute();

const auction = ref({
    bids: [],
});

const imageUrl = (path) => {

    if(!path){
        return "";
    }

    return `http://127.0.0.1:8000/storage/${path}`;
};
const highestBid = computed(() => {

    if (!auction.value.bids?.length) {
        return 0;
    }

    return Math.max(
        ...auction.value.bids.map(
            bid => Number(bid.amount)
        )
    );
});



const loadAuction = async () => {

    const response = await api.get(
        `/auctions/${route.params.id}`
    );

    auction.value = response.data;

    updateCountdown();
};

let refreshTimer;

onMounted(() => {

    loadAuction();

    timer = setInterval(() => {
        updateCountdown();
    }, 1000);

    refreshTimer = setInterval(() => {
        loadAuction();
    }, 3000);

});
onUnmounted(() => {
    clearInterval(timer);
    clearInterval(refreshTimer);
});

const goBack = () => {
    router.push("/auctions");
};

const isStarted = computed(() => {
    return new Date() >= new Date(auction.value.starts_at);
});

const isEnded = computed(() => {
    return new Date() >= new Date(auction.value.ends_at);
});

const countdownToStart = ref("Loading...");
const countdown = ref("Loading...");
const updateCountdown = () => {

    const now = new Date();

    const startTime = new Date(
        auction.value.starts_at
    );

    const endTime = new Date(
        auction.value.ends_at
    );

    // BELUM MULAI
    if(now < startTime){

        const diff = startTime - now;

        const minutes = Math.floor(
            diff / 1000 / 60
        );

        const seconds = Math.floor(
            (diff / 1000) % 60
        );

        countdownToStart.value =
            `${minutes}m ${seconds}s`;

        countdown.value =
            `Starts in ${minutes}m ${seconds}s`;

        auction.value.status =
            "scheduled";

        return;
    }

    // SUDAH BERJALAN
    if(now < endTime){

        const diff = endTime - now;

        const minutes = Math.floor(
            diff / 1000 / 60
        );

        const seconds = Math.floor(
            (diff / 1000) % 60
        );

        countdown.value =
            `${minutes}m ${seconds}s`;

        auction.value.status =
            "active";

        return;
    }

    // SUDAH BERAKHIR
    countdown.value = "Auction Ended";

    auction.value.status = "ended";
};
</script>

<style scoped>

.image-skeleton{
    width:100%;
    height:400px;
    border-radius:20px;
    background:rgba(255,255,255,.08);
    animation:pulse 1.5s infinite;
}

@keyframes pulse{
    0%{
        opacity:.4;
    }
    50%{
        opacity:.8;
    }
    100%{
        opacity:.4;
    }
}

.top-actions{
    margin-bottom:20px;
}

.btn-back{
    border:none;
    padding:12px 20px;
    border-radius:12px;
    color:white;
    font-weight:600;
    background:rgba(255,255,255,.08);
    backdrop-filter:blur(20px);
    transition:.3s;
}

.btn-back:hover{
    transform:translateY(-2px);
    background:rgba(255,255,255,.15);
}
.auction-page{
    min-height:100vh;
    background:#0f172a;
    padding:30px;
    position:relative;
    overflow:hidden;
}

/* Background Blur */

.bg-circle{
    position:absolute;
    border-radius:50%;
    filter:blur(120px);
    z-index:0;
}

.one{
    width:350px;
    height:350px;
    background:#3b82f6;
    top:-120px;
    left:-120px;
    opacity:.25;
}

.two{
    width:350px;
    height:350px;
    background:#6366f1;
    right:-120px;
    bottom:-120px;
    opacity:.25;
}

/* Navbar */

.navbar-custom{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
    position:relative;
    z-index:2;
}

.logo{
    color:white;
    font-size:30px;
    font-weight:700;
    cursor:pointer;
}

.btn-logout{
    border:none;
    padding:12px 22px;
    border-radius:12px;
    color:white;
    font-weight:600;
    background:#ef4444;
    transition:.3s;
}

.btn-logout:hover{
    transform:translateY(-2px);
}

/* Layout */

.detail-container{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:30px;
    position:relative;
    z-index:2;
}

/* Cards */

.image-card,
.info-card,
.bid-history,
.winner-card{
    background:rgba(15,23,42,.75);
    backdrop-filter:blur(20px);
    border:1px solid rgba(255,255,255,.08);
    border-radius:24px;
    padding:25px;
    box-shadow:
        0 10px 30px rgba(0,0,0,.25);
}
.auction-ended{
    background:rgba(239,68,68,.15);
    color:#ef4444;
    padding:12px;
    border-radius:12px;
    text-align:center;
    font-weight:600;
    margin-top:10px;
}
/* Image */

.image-card img{
    width:100%;
    height:500px;
    object-fit:cover;
    border-radius:18px;
}

/* Status */

.status-badge{
    display:inline-block;
    padding:8px 15px;
    border-radius:20px;
    background:#22c55e;
    color:white;
    font-size:14px;
    font-weight:600;
}

/* Title */

.info-card h1{
    color:white;
    margin:20px 0;
    font-size:38px;
    font-weight:700;
}

/* Countdown */

.countdown-box{
    background:rgba(59,130,246,.15);
    border:1px solid rgba(59,130,246,.2);
    color:#60a5fa;
    padding:15px;
    border-radius:14px;
    margin-bottom:20px;
    font-size:22px;
    font-weight:600;
}

/* Price */

.price-box,
.highest-bid-box{
    background:rgba(255,255,255,.04);
    border-radius:16px;
    padding:18px;
    margin-bottom:15px;
}

.price-box span,
.highest-bid-box span{
    color:#94a3b8;
    display:block;
    margin-bottom:8px;
}

.price-box h2,
.highest-bid-box h2{
    color:white;
    font-size:30px;
    font-weight:700;
}

/* Bid Form */

.bid-section{
    margin-top:25px;
}

.bid-input{
    width:100%;
    height:55px;
    border:none;
    outline:none;
    border-radius:14px;
    padding:0 18px;
    color:white;
    background:rgba(255,255,255,.08);
    margin-bottom:15px;
}

.bid-input::placeholder{
    color:#94a3b8;
}

.btn-bid{
    width:100%;
    height:55px;
    border:none;
    border-radius:14px;
    color:white;
    font-weight:600;
    background:linear-gradient(
        135deg,
        #3b82f6,
        #6366f1
    );
    transition:.3s;
}

.btn-bid:hover{
    transform:translateY(-2px);
    box-shadow:
        0 10px 25px rgba(99,102,241,.4);
}

/* Winner */

.winner-card{
    margin-top:30px;
    text-align:center;
    position:relative;
    z-index:2;
}

.winner-card h2{
    color:#facc15;
    margin-bottom:10px;
}

.winner-card h3{
    color:white;
    font-size:28px;
}

.winner-card p{
    color:#cbd5e1;
}

/* Bid History */

.bid-history{
    margin-top:30px;
    position:relative;
    z-index:2;
}

.bid-history h2{
    color:white;
    margin-bottom:20px;
}

.bid-item{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:16px;
    border-radius:14px;
    margin-bottom:12px;
    background:rgba(255,255,255,.05);
    color:white;
    transition:.3s;
}

.bid-item:hover{
    background:rgba(255,255,255,.08);
}

.bid-item strong{
    color:#60a5fa;
}

/* Mobile */

@media(max-width:768px){

    .auction-page{
        padding:20px;
    }

    .detail-container{
        grid-template-columns:1fr;
    }

    .info-card h1{
        font-size:28px;
    }

    .image-card img{
        height:300px;
    }

    .navbar-custom{
        flex-direction:column;
        gap:15px;
    }

    .btn-logout{
        width:100%;
    }
}
.badge-live{


    display:inline-block;
    padding:8px 15px;
    border-radius:20px;
    background:#22c55e;
    color:white;
    font-size:14px;
    font-weight:600;
}
.badge-live.active{
    background:#22c55e;
}

.badge-live.ended{
    background:#ef4444;
}
</style>