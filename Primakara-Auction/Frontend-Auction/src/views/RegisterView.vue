<template>
    <div class="login-page">

        <div class="card shadow-lg login-card">

            <div class="text-center mb-4">

                <div class="logo mb-3">
                    👤
                </div>

                <h1 class="title">
                    Create Account
                </h1>

                <p class="subtitle">
                    Join Primakara Auction
                </p>

            </div>

            <form @submit.prevent="register">

                <div class="mb-3">
                    <label class="form-label">
                        Full Name
                    </label>

                    <input
                        v-model="name"
                        type="text"
                        class="form-control"
                        placeholder="Enter your name"
                    />
                </div>

                <div class="mb-3">
                    <label class="form-label">
                        Email
                    </label>

                    <input
                        v-model="email"
                        type="email"
                        class="form-control"
                        placeholder="Enter your email"
                    />
                </div>

                <div class="mb-3">
                    <label class="form-label">
                        Password
                    </label>

                    <input
                        v-model="password"
                        type="password"
                        class="form-control"
                        placeholder="Enter your password"
                    />
                </div>

                <button
                    type="submit"
                    class="btn btn-login w-100"
                >
                    Create Account
                </button>

            </form>

            <div class="text-center mt-3 register-text">

                <small>
                    Already have an account?
                    <router-link
                        to="/"
                        class="register-link"
                    >
                        Login
                    </router-link>
                </small>

            </div>

        </div>

    </div>
</template>

<script setup>
import Swal from 'sweetalert2'
import { ref } from "vue";
import { useRouter } from "vue-router";
import api from "../api/axios";

const router = useRouter();

const name = ref("");
const email = ref("");
const password = ref("");

const register = async () => {

    try {

        await api.post("/register", {
            name: name.value,
            email: email.value,
            password: password.value
        });

        await Swal.fire({
            icon: 'success',
            title: 'Registration Successful',
            text: 'Your account has been created successfully.',
            confirmButtonColor: '#6366f1',
            background: '#1e293b',
            color: '#fff',
            timer: 2000,
            showConfirmButton: false
        })

        router.push("/")

    } catch (error) {

        console.error(error);

        Swal.fire({
            icon: 'error',
            title: 'Registration Failed',
            text: error.response?.data?.message || 'Something went wrong.',
            confirmButtonColor: '#ef4444',
            background: '#1e293b',
            color: '#fff'
        })
    }
};
</script>

<style scoped>

.logo {
    animation: pulse 3s infinite;
}

@keyframes pulse {
    0% {
        box-shadow: 0 0 20px rgba(59,130,246,.3);
    }
    50% {
        box-shadow: 0 0 40px rgba(59,130,246,.6);
    }
    100% {
        box-shadow: 0 0 20px rgba(59,130,246,.3);
    }
}

.logo {
    width: 80px;
    height: 80px;
    margin: auto;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 40px;
    border-radius: 50%;
    background: linear-gradient(
        135deg,
        #3b82f6,
        #6366f1
    );
}

.login-page {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;

    background:
        radial-gradient(
            circle at top left,
            rgba(59,130,246,.25),
            transparent 40%
        ),
        radial-gradient(
            circle at bottom right,
            rgba(99,102,241,.25),
            transparent 40%
        ),
        #0f172a;
}

.login-card {
    width: 450px;
    background: rgba(255,255,255,.08);
    backdrop-filter: blur(20px);
    border-radius: 24px;
    padding: 40px;
    animation: fadeUp .8s ease;
}

.form-control {
    background: rgba(255,255,255,.08);
    border: 1px solid rgba(255,255,255,.1);
    color: white;
    height: 50px;
}

.form-control::placeholder {
    color: #94a3b8;
}

.form-label {
    color: white;
}

.title {
    color: white;
    font-weight: 700;
}

.subtitle {
    color: #cbd5e1;
}

.btn-login {
    height: 50px;
    border-radius: 12px;
    font-weight: 600;
    border: none;
    background: linear-gradient(
        135deg,
        #3b82f6,
        #6366f1
    );
}

.register-link {
    color: #60a5fa;
    text-decoration: none;
}

.register-text {
    color: #cbd5e1;
}

@keyframes fadeUp {
    from {
        opacity: 0;
        transform: translateY(40px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

</style>