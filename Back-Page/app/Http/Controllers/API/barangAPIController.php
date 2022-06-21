<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\modelBarang;
use App\Models\modelPengrajin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class barangAPIController extends Controller
{
    private function generateLinkGambar($id){
        // return 'https://drive.google.com/uc?id='.$id.'&export=download';
        return 'https://drive.google.com/uc?id='.$id.'&export=media';
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $res['barang'] = modelBarang::getPengrajin();
        //search
        if (isset($_GET['s']) && $_GET['s'] != null && $_GET['s'] != " ") {
            $s = $_GET['s'];
            $res['barang'] = $res['barang']
                ->where('nama_kerajinan', 'like', "%$s%");
        }
        //filter dengan nama pembuat
        if (isset($_GET['peng']) && $_GET['peng'] != '') {
            $res['barang'] = $res['barang']->where('nama_peng', $_GET['peng']);
        }
        // $path = Storage::disk("google")->url($fileName);
        $res['all_brg'] = $res['barang']->get();
        $res['barang'] = $res['barang']->paginate(4);
        $res['pengrajin'] = modelPengrajin::all();
        return response()->json($res);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $pengrajin = modelPengrajin::all();
        return response()->json($pengrajin);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $messages = [
            'required' => 'error : harap isi bidang ini',
            'numeric' => 'error : Harus Angka.',
        ];
        $validasi = $request->validate([
            'id_brg' => '',
            'nama_kerajinan' => 'required',
            'bahan' => 'required',
            'harga' => 'required|numeric',
            'keterangan' => '',
            'id_peng' => 'required',
            'gambar' => 'required',
            'link_gambar' => ''
        ], $messages);
        DB::beginTransaction();
        try {
            $fileName = $request->file('gambar')->store('', 'google');
            $dataGambar = Storage::disk("google")->getMetaData($fileName);
            $validasi['gambar'] = $dataGambar['path'];
            $validasi['link_gambar'] = barangAPIController::generateLinkGambar($dataGambar['path']);
            $response = modelBarang::create($validasi);
            DB::commit();
            return response()->json([
                'success' => true,
                'message' => 'success',
                'data' => $response,
                'drive' => $dataGambar
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'message' => 'Err',
                'errors' => $e->getMessage(),
            ]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //menampilkan data edit
        $res['pengrajin'] = modelPengrajin::all();
        $res['barang'] = modelBarang::find($id);
        return response()->json($res);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    // }
    public function update(Request $request, $id)
    {
        $messages = [
            'required' => 'error : harap isi bidang ini',
            'numeric' => 'error : Harus Angka.',
        ];
        $validasi = $request->validate([
            'id_brg' => '',
            'nama_kerajinan' => 'required',
            'bahan' => 'required',
            'harga' => 'required|numeric',
            'keterangan' => '',
            'id_peng' => 'required',
            'gambar' => '',
            'link_gambar' => ''
        ], $messages);
        DB::beginTransaction();
        try {
            $barang = modelBarang::find($id);
            if ($request->file('gambar')){ //kalo ganti gambar delet yg lama uplod yg baru
                $deletGambar = Storage::disk("google")->delete($barang->gambar);
                $fileName = $request->file('gambar')->store('', 'google');
                $dataGambar = Storage::disk("google")->getMetaData($fileName);
                $validasi['gambar'] = $dataGambar['path'];
                $validasi['link_gambar'] = barangAPIController::generateLinkGambar($dataGambar['path']);
            }else{
                $validasi['gambar'] = $barang->gambar;
                $validasi['link_gambar'] = $barang->link_gambar;
                $dataGambar = 'gambar tidak diubah';
            }
            $barang->delete();
            $response = modelBarang::create($validasi);
            DB::commit();
            return response()->json([
                'success' => true,
                'message' => 'success',
                'data' => $response,
                'drive' => $dataGambar
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'message' => 'Err',
                'errors' => $e->getMessage(),
            ]);
        }    
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        DB::beginTransaction();
        try {
            $barang = modelBarang::find($id);
            $deletGambar = Storage::disk("google")->delete($barang->gambar);
            $barang->delete();
            DB::commit();
            return response()->json([
                'message' => 'success',
                'hapusdata' => true,
                'hapusGambar' => $deletGambar
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'message' => 'Err',
                'errors' => $e->getMessage(),
            ]);
        }
    }
}
