<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use QCod\ImageUp\HasImageUploads;

class Post extends Model
{
    use HasFactory, HasImageUploads;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'image',
        'name',
        'breed',
        'sex',
        'ls_address',
        'ls_datetime',
        'observation',
        'user_id'
    ];

    protected $imagesUploadPath = 'posts';
    protected static $imageFields = [
        'image'
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'ls_datetime' => 'datetime',
    ];

    protected function imageUploadFilePath($file) {
        return $this->id . '-image-' . $file->getClientOriginalName();
    }

    public function user() {
        return $this->belongsTo(User::class);
    }
}
