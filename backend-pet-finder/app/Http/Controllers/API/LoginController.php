<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if (Auth::attempt($request->only('email', 'password'))) {
            return response()->json([
                'user_id' => Auth::user()->getAuthIdentifier(),
                'token' => Auth::user()->createToken('token')->plainTextToken
            ]);
        }

        return response()->json(['msg' => 'Credenciais inválidas.'], 404);
    }
}
