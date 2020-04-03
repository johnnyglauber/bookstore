<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Sale extends Model
{
    /**
     * Retorna o nome do usuário que fez a venda.
     *
     * @param  string  $value
     * @return string
     */
    public function getUserIdAttribute($value)
    {
        return User::find(auth()->user()->id)->name;
    }

    /**
     * Retorna a data de realização da venda no formato brasileiro.
     *
     * @param  string  $value
     * @return string
     */
    public function getCreatedAtAttribute($value)
    {
        return date('d/m/Y à\s H:i:s', strtotime($value));
    }

    /**
     * @return BelongsTo
     **/
    public function book()
    {
        return $this->belongsTo(Book::class);
    }

    /**
     * @return BelongsTo
     **/
    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    /**
     * @return BelongsTo
     **/
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
