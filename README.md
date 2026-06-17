# UAS-Pemrograman-WEB-Aplikasi-Lelang-Kelompok-Krisna

# 🎯 Primakara Auction

Realtime Online Auction Platform built with Laravel 12, Vue.js 3, MySQL, Laravel Reverb, and Bootstrap.

---

## 📖 About Project

Primakara Auction adalah aplikasi lelang online realtime yang memungkinkan pengguna membuat lelang, melakukan bidding secara langsung (realtime), serta menentukan pemenang secara otomatis setelah waktu lelang berakhir.

Project ini dibuat sebagai tugas UAS Pemrograman Web.

---

## ✨ Features

### Authentication
- Login
- Register
- Logout

### Auction Management
- Create Auction
- Edit Auction
- Delete Auction
- Upload Auction Image

### Realtime Auction
- Realtime Bid menggunakan Laravel Reverb
- Update harga tertinggi secara otomatis
- Update riwayat bid secara realtime

### Scheduler System
- Auction Scheduled
- Auction Active
- Auction Ended
- Auto Close Auction

### Winner System
- Menentukan pemenang otomatis
- Menampilkan user dengan bid tertinggi

### UI Features
- Responsive Design
- Modern Dashboard
- SweetAlert Notification
- Countdown Timer

---

# 🛠️ Tech Stack

## Backend

- Laravel 12
- Laravel Reverb
- Laravel Broadcasting
- Laravel Scheduler
- MySQL

## Frontend

- Vue 3
- Vue Router
- Axios
- Bootstrap 5
- SweetAlert2

---

# 🗂️ Database Structure

## Users

| Field | Type |
|---------|---------|
| id | bigint |
| name | varchar |
| email | varchar |
| password | varchar |

---

## Auctions

| Field | Type |
|---------|---------|
| id | bigint |
| title | varchar |
| description | text |
| image | varchar |
| start_price | decimal |
| bid_increment | decimal |
| starts_at | datetime |
| ends_at | datetime |
| status | enum |
| winner_id | bigint |

---

## Bids

| Field | Type |
|---------|---------|
| id | bigint |
| auction_id | bigint |
| user_id | bigint |
| amount | decimal |
| created_at | timestamp |

---

# 📊 ERD

```text
USERS
  |
  | 1
  |
  | N
BIDS
  |
  | N
  |
  | 1
AUCTIONS

USERS
  |
  | 1
  |
  | N
AUCTIONS (Winner)
```

---

# 🚀 Installation

## Clone Repository

```bash
git clone https://github.com/USERNAME/primakara-auction.git
```

---

# Backend Setup

Masuk ke folder backend

```bash
cd backend
```

Install dependency

```bash
composer install
```

Copy file environment

```bash
cp .env.example .env
```

Generate key

```bash
php artisan key:generate
```

---

## Configure Database

Edit file `.env`

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=auction_db
DB_USERNAME=root
DB_PASSWORD=
```

---

## Migration

```bash
php artisan migrate
```

atau

```bash
php artisan migrate:fresh --seed
```

---

## Storage Link

```bash
php artisan storage:link
```

---

## Run Backend

```bash
php artisan serve
```

Backend berjalan pada:

```text
http://127.0.0.1:8000
```

---

# Frontend Setup

Masuk ke folder frontend

```bash
cd frontend
```

Install dependency

```bash
npm install
```

Run project

```bash
npm run dev
```

Frontend berjalan pada:

```text
http://localhost:5173
```

---

# Realtime Setup (Laravel Reverb)

Jalankan server Reverb

```bash
php artisan reverb:start
```

---

# Queue Worker

```bash
php artisan queue:work
```

---

# Scheduler

Project ini menggunakan Laravel Scheduler untuk:

- Mengaktifkan auction sesuai waktu mulai
- Menutup auction otomatis ketika waktu habis

Jalankan scheduler:

```bash
php artisan schedule:work
```

atau

```bash
php artisan schedule:run
```

---

# Commands Used

## Activate Auction

```bash
php artisan auction:activate
```

## Close Expired Auction

```bash
php artisan app:close-expired-auctions
```

---

# Realtime Event

## BidPlaced Event

Broadcast Channel:

```php
auction.{auction_id}
```

Event Name:

```php
bid.placed
```

---

# User Flow

1. User Register
2. User Login
3. User Create Auction
4. Auction Status = Scheduled
5. Countdown menuju Start Time
6. Auction Status = Active
7. User melakukan Bid Realtime
8. Waktu Habis
9. Auction Status = Ended
10. Winner ditentukan otomatis

---

# Screenshots

## Login Page

Tambahkan screenshot login disini

---

## Register Page

Tambahkan screenshot register disini

---

## Auction List

Tambahkan screenshot auction list disini

---

## Create Auction

Tambahkan screenshot create auction disini

---

## Auction Detail

Tambahkan screenshot auction detail disini

---

## Winner Result

Tambahkan screenshot winner disini

---

# Author

**Made by:**

MrArsel  
Universitas Primakara  
Program Studi Sistem Informasi

---

# License

This project is developed for educational purposes.
