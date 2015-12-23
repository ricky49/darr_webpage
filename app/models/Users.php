<?php namespace App\Models;

use Illuminate\Database\Eloquent\Model as Capsule;

class Users extends Capsule
{
	protected $fillable = ['status_id', 'firstname', 'lastname', 'email', 'display_name'];

    protected $table = 'users';

    public $timestamps = false;

    public function status()
    {
        return $this->hasOne('App\Models\UsersStatus','id','status_id');
    }

}