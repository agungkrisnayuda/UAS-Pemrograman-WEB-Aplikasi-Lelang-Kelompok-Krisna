<template>
<div class="create-page">

    <div class="bg-circle one"></div>
    <div class="bg-circle two"></div>

    <div class="form-card">
        <div class="top-actions">

            <button
                class="btn-back"
                @click="router.push('/auctions')"
            >
                ← Back to Auctions
            </button>

        </div>
        <h1>Create Auction</h1>

        <p class="subtitle">
            Create your own auction listing
        </p>

        <input
            v-model="form.title"
            placeholder="Auction Title"
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
        <input
            type="file"
            @change="handleImage"
        />

        <input
            v-model="form.bid_increment"
            type="number"
            placeholder="Bid Increment"
        >

        <label>Start Date</label>
        <input
            v-model="form.starts_at"
            type="datetime-local"
        >

        <label>Duration (Minutes)</label>
        <input
            v-model="form.duration"
            type="number"
            placeholder="Example: 8"
        >
        <button
            @click="createAuction"
        >
            Create Auction
        </button>

    </div>

</div>
</template>

<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";
import Swal from "sweetalert2";
import api from "../api/axios";

const router = useRouter();

const form = ref({
    title:"",
    description:"",
    start_price:"",
    bid_increment:"",
    starts_at:"",
    duration:""
});

const image = ref(null);

const handleImage = (event) => {
    image.value = event.target.files[0];
};

        const formatDateTime = (date) => {
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, "0");
            const day = String(date.getDate()).padStart(2, "0");
            const hours = String(date.getHours()).padStart(2, "0");
            const minutes = String(date.getMinutes()).padStart(2, "0");

            return `${year}-${month}-${day}T${hours}:${minutes}`;
        };



const createAuction = async () => {
    try {

        const startDate = new Date(form.value.starts_at);

        const endDate = new Date(startDate);

        endDate.setMinutes(
            endDate.getMinutes() +
            parseInt(form.value.duration)
        );

        const formData = new FormData();

        formData.append(
            "title",
            form.value.title
        );

        formData.append(
            "description",
            form.value.description
        );

        formData.append(
            "start_price",
            form.value.start_price
        );

        formData.append(
            "bid_increment",
            form.value.bid_increment
        );

        formData.append(
            "starts_at",
            form.value.starts_at
        );

        formData.append(
            "ends_at",
            formatDateTime(endDate)
        );

        if (image.value) {
            formData.append(
                "image",
                image.value
            );
        }

        console.log(
            "START:",
            form.value.starts_at
        );

        console.log(
            "END:",
            formatDateTime(endDate)
        );

        await api.post(
            "/auctions",
            formData,
            {
                headers: {
                    "Content-Type":
                    "multipart/form-data"
                }
            }
        );

        Swal.fire({
            icon: "success",
            title: "Auction Created"
        });

        router.push("/auctions");

    } catch (error) {

        console.error(error);

        Swal.fire({
            icon: "error",
            title: "Failed",
            text:
                error.response?.data?.message ||
                error.message
        });
    }
};
</script>

<style scoped>

.create-page{
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
    filter:blur(120px);
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

.form-card{
    width:650px;
    padding:35px;
    border-radius:24px;
    background:rgba(15,23,42,.8);
    backdrop-filter:blur(20px);
    border:1px solid rgba(255,255,255,.08);
    position:relative;
    z-index:1;
}

h1{
    color:white;
    margin-bottom:8px;
}

.subtitle{
    color:#94a3b8;
    margin-bottom:25px;
}

input,
textarea{
    width:100%;
    margin-bottom:15px;
    padding:15px;
    border:none;
    border-radius:12px;
    background:rgba(255,255,255,.08);
    color:white;
}

textarea{
    min-height:120px;
    resize:none;
}

label{
    color:#cbd5e1;
    display:block;
    margin-bottom:8px;
}

button{
    width:100%;
    height:55px;
    border:none;
    border-radius:12px;
    color:white;
    font-weight:600;
    background:linear-gradient(
        135deg,
        #3b82f6,
        #6366f1
    );
    margin-top:10px;
}

button:hover{
    opacity:.9;
}

.top-actions{
    margin-bottom:20px;
}

.btn-back{
    width:auto;
    height:auto;
    padding:12px 20px;
    border:none;
    border-radius:12px;
    background:rgba(255,255,255,.08);
    color:white;
    font-weight:600;
    cursor:pointer;
    backdrop-filter:blur(20px);
    transition:.3s;
}

.btn-back:hover{
    transform:translateY(-2px);
    background:rgba(255,255,255,.15);
}

</style>