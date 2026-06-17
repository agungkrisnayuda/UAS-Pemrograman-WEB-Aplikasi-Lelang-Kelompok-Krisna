<template>
    <div class="login-page">

        <div class="card shadow-lg login-card">
        <div class="text-center mb-4">

        <div >

            <img class="logo mb-3"
                src="/favicon.png"
                alt="Primakara Auction"
    
            />

        </div>

            <h1 class="title">
                Primakara Auction
            </h1>

            <p class="subtitle">
                Realtime Auction Platform
            </p>

        </div>

            <form @submit.prevent="login">

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
                    class="btn btn-primary w-100"
                >
                    Login
                </button>

            </form>

            <div class="text-center mt-3 register-text">

                <small>
                    Don't have an account?
                    <router-link
                        to="/register"
                        class="register-link"
                    >
                        Register
                    </router-link>
                </small>

            </div>

        </div>

    </div>
</template>

<script setup>
import Swal from 'sweetalert2'
import { useRouter } from "vue-router";
import { ref } from "vue";
import { useAuthStore } from "../stores/auth";

const router = useRouter();
const auth = useAuthStore();

const email = ref("");
const password = ref("");

const logout = () => {

    sessionStorage.removeItem("token");
    sessionStorage.removeItem("user");

    router.push("/");
};

const login = async () => {

    try {

        await auth.login(
            email.value,
            password.value
        );

        await Swal.fire({
            icon: 'success',
            title: 'Welcome Back!',
            text: 'Login successful.',
            confirmButtonColor: '#6366f1',
            background: '#1e293b',
            color: '#fff',
            timer: 1500,
            showConfirmButton: false
        })

        router.push('/auctions')

    } catch (error) {

        console.error(error);

        Swal.fire({
            icon: 'error',
            title: 'Login Failed',
            text: 'Email or password is incorrect.',
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
.logo{
    width:120px;
    height:120px;
    margin:auto;

    display:flex;
    justify-content:center;
    align-items:center;

    border-radius:50%;

    background:linear-gradient(
        135deg,
        #3b82f6,
        #6366f1
    );

    padding:3px;

    box-shadow:
        0 0 40px rgba(59,130,246,.4);
}

.logo-image{
    width:100%;
    height:100%;
    object-fit:contain;
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

    overflow: hidden;
}

.login-card {

    width: 450px;

    background: rgba(255,255,255,.08);

    backdrop-filter: blur(20px);

    border: 1px solid rgba(255,255,255,.1);

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
.form-control:focus {

    background: rgba(255,255,255,.12);

    color: white;

    border-color: #3b82f6;

    box-shadow: 0 0 20px rgba(59,130,246,.3);
}
.form-control {

    transition:
        .3s ease;
}

.form-control:hover {

    border-color:
        rgba(
            59,
            130,
            246,
            .5
        );
}
.form-label {
    color: #e2e8f0;
    font-weight: 500;
}
.register-text {
    color: #cbd5e1;
}

.register-link {
    color: #60a5fa;
    text-decoration: none;
    font-weight: 600;
    margin-left: 4px;
    transition: .3s;
}

.register-link:hover {
    color: #93c5fd;
}
.title {

    color: white;

    font-size: 32px;

    font-weight: 700;
}

.subtitle {
  color: #cbd5e1;
    font-size: 14px;
}

.btn-login {

    height: 50px;

    border-radius: 12px;

    font-weight: 600;

    background: linear-gradient(
        135deg,
        #3b82f6,
        #6366f1
    );

    border: none;

    transition: .3s;
}

.btn-login:hover {

    transform: translateY(-3px);

    box-shadow: 0 10px 25px rgba(59,130,246,.35);
}
.login-card {
    transition: .3s;
}

.login-card:hover {
    transform: translateY(-5px);
}
@keyframes fadeUp {

    from {

        opacity: 0;

        transform:
            translateY(40px);
    }

    to {

        opacity: 1;

        transform:
            translateY(0);
    }
}
.register-link {
    color: #60a5fa;
    text-decoration: none;
    font-weight: 600;
    transition: .3s;
}

.register-link:hover {
    color: #93c5fd;
}
</style>