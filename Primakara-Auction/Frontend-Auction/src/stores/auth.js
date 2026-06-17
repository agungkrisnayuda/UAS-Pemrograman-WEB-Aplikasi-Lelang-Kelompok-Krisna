import { defineStore } from "pinia";
import api from "../api/axios";

export const useAuthStore = defineStore("auth", {
    state: () => ({
        user: JSON.parse(sessionStorage.getItem("user")) || null,
        token: sessionStorage.getItem("token") || null,
    }),

    actions: {
        async login(email, password) {
            const response = await api.post("/login", {
                email,
                password,
            });

            this.token = response.data.token;
            this.user = response.data.user;

            sessionStorage.setItem("token", this.token);
            sessionStorage.setItem(
                "user",
                JSON.stringify(this.user)
            );

            return response.data;
        },

        logout() {
            sessionStorage.removeItem("token");
            sessionStorage.removeItem("user");

            this.token = null;
            this.user = null;
        },
    },
});