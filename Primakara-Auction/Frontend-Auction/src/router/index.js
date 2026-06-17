import { createRouter, createWebHistory } from "vue-router";
import LoginView from "../views/LoginView.vue";
import RegisterView from "../views/RegisterView.vue";
import AuctionsView from "../views/AuctionsView.vue";
import AuctionDetailView from "../views/AuctionDetailView.vue";
import CreateAuctionView from "../views/CreateAuctionView.vue";
import MyAuctionsView from "../views/MyAuctionsView.vue";
import EditAuctionView from "../views/EditAuctionView.vue";

const routes = [
    {
        path: "/",
        component: LoginView,
    },
    {
        path: "/register",
        component: RegisterView,
    },
    {
        path: "/auctions",
        component: AuctionsView,
    },
    {
        path: "/auctions/create",
        component: CreateAuctionView,
    },
    {
        path: "/my-auctions",
        component: MyAuctionsView,
    },
    {
        path: "/edit-auction/:id",
        component: EditAuctionView,
    },
    {
        path: "/auctions/:id",
        component: AuctionDetailView,
    }
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;