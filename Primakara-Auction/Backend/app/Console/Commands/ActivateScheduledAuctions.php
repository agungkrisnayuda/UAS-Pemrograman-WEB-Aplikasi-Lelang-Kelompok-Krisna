<?php

namespace App\Console\Commands;

use App\Models\Auction;
use Illuminate\Console\Command;

class ActivateScheduledAuctions extends Command
{
    protected $signature = 'auction:activate';

    protected $description = 'Activate scheduled auctions';

    public function handle()
    {
        $count = Auction::where('status', 'scheduled')
            ->where('starts_at', '<=', now())
            ->update([
                'status' => 'active'
            ]);

        $this->info("$count auction activated.");

        return Command::SUCCESS;
    }
}