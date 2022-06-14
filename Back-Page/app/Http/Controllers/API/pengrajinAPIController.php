<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\modelPengrajin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class pengrajinAPIController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        $pengrajin = modelPengrajin::getAll();
        if (isset($_GET['s']) && $_GET['s'] != null && $_GET['s'] != " ") {
            $s = $_GET['s'];
            $pengrajin = $pengrajin
                ->where('nama_peng', 'like', "%$s%");
        }
        $pengrajin = $pengrajin->paginate(5);
        return response()->json($pengrajin);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function create()
    {
        //create
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function store(Request $request)
    {
        //set pesan kesalahan
        $messages = [
            'required' => 'Kolom : attribute harus lengkap',
            'numeric' => 'Kolom : attribute Harus Angka.',
        ];
        //untuk menyimpan data
        $validasi = $request->validate([
            'id_peng' => '',
            'nama_peng' => 'required',
            'alamat' => 'required',
            'email' => 'required',
        ], $messages);
        DB::beginTransaction();
        try {
            $response = modelPengrajin::create($validasi);
            DB::commit();
            return response()->json([
                'success' => true,
                'message' => 'success',
                'data' => $response,
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
        $pengrajin = modelPengrajin::find($id);
        return response()->json($pengrajin);
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validasi = $request->validate([
            'id_peng' => '',
            'nama_peng' => 'required',
            'alamat' => 'required',
            'email' => 'required',
        ]);
        DB::beginTransaction();
        try {
            $response = modelPengrajin::find($id);
            $response->update($validasi);
            DB::commit();
            return response()->json([
                'success' => true,
                'message' => 'success',
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
            $peng = modelPengrajin::find($id);
            $peng->delete();
            DB::commit();
            return response()->json([
                'success' => true,
                'message' => 'success',
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
