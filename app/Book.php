<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Book extends Model
{
    public $additional_attributes = ['full_book_info'];

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

    public function getFullBookInfoAttribute($value)
    {
        return $this->name . ' | R$ ' . $this->price . ' | Editora ' . $this->publisher->name;
    }

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
