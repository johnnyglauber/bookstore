<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Book extends Model
{
    /**
     * @return BelongsTo
     **/
    public function publisher()
    {
        return $this->belongsTo(Publisher::class);
    }

    /**
     * @return HasMany
     **/
    public function sales()
    {
        return $this->hasMany(Sale::class);
    }
}
