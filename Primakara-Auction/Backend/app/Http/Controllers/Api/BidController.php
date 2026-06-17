<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Auction;
use App\Models\Bid;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Events\BidPlaced;

class BidController extends Controller
{
    public function store(Request $request, Auction $auction)
    {
        $request->validate([
            'amount' => 'required|numeric'
        ]);

        $highestBid = $auction->bids()
            ->orderByDesc('amount')
            ->first();

        $currentPrice = $highestBid
            ? $highestBid->amount
            : $auction->start_price;

        $minimumBid = $currentPrice + $auction->bid_increment;

        if ($request->amount < $minimumBid) {
            return response()->json([
                'message' => "Minimal bid adalah {$minimumBid}"
            ], 422);
        }

        if ($auction->user_id == Auth::id()) {
            return response()->json([
                'message' => 'Tidak boleh bid lelang sendiri'
            ], 403);
        }

        $bid = Bid::create([
            'auction_id' => $auction->id,
            'user_id' => Auth::id(),
            'amount' => $request->amount
        ]);
        
        event(new BidPlaced($bid));

        return response()->json([
            'message' => 'Bid berhasil',
            'bid' => $bid
        ]);
    }
}