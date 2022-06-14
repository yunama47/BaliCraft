<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class modelPengrajin extends Model
{
    use HasFactory;
    public $primaryKey = 'id_peng';
    //untuk mendeskripsikan field yang dapat dimanipulasi
    protected $fillable = ['nama_peng', 'id_peng', 'alamat', 'email',];
    public function barang()
    {
        return $this->hasMany(modelBarang::class, 'id_peng', 'id_peng');
    }
    static function getAll()
    {
        $return = DB::table('model_pengrajins');
        return $return;
    }
}
