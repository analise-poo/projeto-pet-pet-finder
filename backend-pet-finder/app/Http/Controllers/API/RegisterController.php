<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class RegisterController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'phone' => 'required|numeric|digits_between:10,11',
            'email' => 'required|unique:users|max:128',
            'password' => 'required',
        ]);

        $user = User::create([
            'uuid' => (string) \Illuminate\Support\Str::uuid(),
            'name' => $request->input('name'),
            'phone' => $request->input('phone'),
            'email' => $request->input('email'),
            'password' => bcrypt($request->input('password')),
        ]);
              
        return response()->json(['msg' => 'Registrado com sucesso.']);
    }
}
