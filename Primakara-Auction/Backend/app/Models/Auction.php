<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class Auction extends Model
{
    protected $fillable = [
        'user_id',
        'title',
        'description',
        'image',
        'start_price',
        'bid_increment',
        'starts_at',
        'ends_at',
        'status',
        'winner_id'
    ];
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function bids()
    {
        return $this->hasMany(Bid::class);
    }
    public function highestBid()
    {
        return $this->hasOne(Bid::class)
            ->orderByDesc('amount');
    }
    public function winner()
    {
        return $this->belongsTo(User::class, 'winner_id');
    }
}
