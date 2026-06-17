<?php

namespace App\Console\Commands;

use App\Models\Auction;
use Illuminate\Console\Attributes\Description;
use Illuminate\Console\Attributes\Signature;
use Illuminate\Console\Command;

#[Signature('app:close-expired-auctions')]
#[Description('Menutup lelang yang sudah melewati batas waktu')]
class CloseExpiredAuctions extends Command
{
    public function handle()
    {
        $auctions = Auction::whereIn('status', ['scheduled', 'active'])
            ->where('ends_at', '<=', now())
            ->get();

        foreach ($auctions as $auction) {

            $highestBid = $auction->bids()
                ->orderByDesc('amount')
                ->first();

            $auction->update([
                'status' => 'ended',
                'winner_id' => $highestBid?->user_id
            ]);

            if ($highestBid) {
                $this->info(
                    "Auction {$auction->id} winner: User {$highestBid->user_id} with bid {$highestBid->amount}"
                );
            }
        }

        $this->info("{$auctions->count()} auction(s) ended.");

        return Command::SUCCESS;
    }
}