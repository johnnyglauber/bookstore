<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Publisher extends Model
{
    /**
     * @return HasMany
     **/
    public function books()
    {
        return $this->hasMany(Book::class);
    }
}
