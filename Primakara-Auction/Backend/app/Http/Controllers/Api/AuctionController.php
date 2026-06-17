<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Auction;
use Illuminate\Http\Request;
use App\Http\Requests\StoreAuctionRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;


class AuctionController extends Controller
{
    private function updateAuctionStatuses()
{
    // Scheduled -> Active
    Auction::where('status', 'scheduled')
        ->where('starts_at', '<=', now())
        ->update([
            'status' => 'active'
        ]);

    // Active/Scheduled -> Ended
    Auction::whereIn('status', ['scheduled', 'active'])
        ->where('ends_at', '<=', now())
        ->update([
            'status' => 'ended'
        ]);
}
public function index()
{
    Auction::where('status', 'scheduled')
        ->where('starts_at', '<=', now())
        ->update([
            'status' => 'active'
        ]);

    Auction::whereIn('status', ['scheduled', 'active'])
        ->where('ends_at', '<=', now())
        ->update([
            'status' => 'ended'
        ]);

    return Auction::with('user')->get();
}

public function store(StoreAuctionRequest $request)
{
    $imagePath = null;

    if($request->hasFile('image'))
    {
        $imagePath = $request
            ->file('image')
            ->store('auctions', 'public');
    }

    $auction = Auction::create([
        'user_id' => Auth::id(),
        'title' => $request->title,
        'description' => $request->description,
        'image' => $imagePath,
        'start_price' => $request->start_price,
        'bid_increment' => $request->bid_increment,
        'starts_at' => $request->starts_at,
        'ends_at' => $request->ends_at,
        'status' => 'scheduled'
    ]);

    return response()->json($auction);
}

public function show(Auction $auction)
{
    if (
        $auction->status === 'scheduled' &&
        now()->greaterThanOrEqualTo($auction->starts_at)
    ) {
        $auction->update([
            'status' => 'active'
        ]);
    }

    if (
        $auction->status !== 'ended' &&
        now()->greaterThanOrEqualTo($auction->ends_at)
    ) {
        $auction->update([
            'status' => 'ended'
        ]);
    }

    $auction->refresh();

    return $auction->load([
        'user',
        'winner',
        'bids.user'
    ]);
}

    public function update(Request $request, Auction $auction)
    {
        if($auction->user_id != auth()->id())
        {
            return response()->json([
                'message' => 'Unauthorized'
            ], 403);
        }

        $data = [
            'title' => $request->title,
            'description' => $request->description,
            'start_price' => $request->start_price,
            'bid_increment' => $request->bid_increment,
            'starts_at' => $request->starts_at,
            'ends_at' => $request->ends_at,
        ];

        if($request->hasFile('image'))
        {
            // Hapus gambar lama
            if($auction->image)
            {
                Storage::disk('public')->delete($auction->image);
            }

            // Simpan gambar baru
            $data['image'] = $request
                ->file('image')
                ->store('auctions', 'public');
        }

        $auction->update($data);

        return response()->json($auction);
    }

    public function destroy(Auction $auction)
    {
        if($auction->user_id != auth()->id())
        {
            return response()->json([
                'message'=>'Unauthorized'
            ],403);
        }

        $auction->delete();

        return response()->json([
            'message'=>'Deleted'
        ]);
    }
}