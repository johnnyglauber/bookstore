<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Publisher extends Model
{
    /**
     * Retorna a data do cadastro no formato brasileiro.
     *
     * @param  string  $value
     * @return string
     */
    public function getCreatedAtAttribute($value)
    {
        return date('d/m/Y à\s H:i:s', strtotime($value));
    }

    /**
     * @return HasMany
     **/
    public function books()
    {
        return $this->hasMany(Book::class);
    }
}
