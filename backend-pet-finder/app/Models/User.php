<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use QCod\ImageUp\HasImageUploads;

class User extends Authenticatable
{
    use HasFactory, Notifiable, HasApiTokens, HasImageUploads;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'phone',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $imagesUploadPath = 'uploads';
    protected static $imageFields = [
        'avatar'
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    protected function avatarUploadFilePath($file) {
        return $this->id . '-avatar.' . $file->getClientOriginalName();
    }

    public function posts() {
        return $this->hasMany(Post::class);
    }
}
