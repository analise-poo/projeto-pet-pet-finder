<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return User::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'phone' => 'numeric|between:10,11',
            'email' => 'required|unique:users|max:128',
            'password' => 'required|min:16',
        ]);

        $user = User::create([
            'name' => $request->input('name'),
            'phone' => $request->input('phone'),
            'email' => $request->input('email'),
            'password' => bcrypt($request->input('password')),
        ]);

        return $user;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        if ($user->avatar) {
            $user->avatar = url('/') . '/storage/' . $user->avatar;
        } else {
            $user->makeHidden(['avatar']);
        }
        return $user;
    }

    public function updateProfile(Request $request, User $user)
    {
        $request->validate([
            'avatar' => 'image|mimes:jpeg,png,jpg|max:2048',
            'name' => 'required',
            'phone' => 'numeric|between:10,11',
            'email' => 'required|max:128',
        ]);

        if ($request->hasFile('avatar')) {
            $user->uploadImage($request->file('avatar'), 'avatar');
        }
        
        $user->update($request->only('name', 'phone', 'email'));

        return response()->json([
            'msg' => 'Atualizado com sucesso.',
            'user' => $user,
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        $user->delete();
        return response()->json(['msg' => 'Removido com sucesso.']);
    }
}
