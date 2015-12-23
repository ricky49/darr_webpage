<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model as Capsule;

class UsersStatus extends Capsule
{
	protected $fillable = ['id', 'name', 'description'];

    protected $table = 'users_status';
}