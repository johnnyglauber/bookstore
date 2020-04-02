<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Customer extends Model
{
    /**
     * @return HasMany
     **/
    public function sales()
    {
        return $this->hasMany(Sale::class);
    }
}
