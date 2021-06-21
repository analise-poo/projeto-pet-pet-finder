<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Post;
use Illuminate\Http\Request;

class PostsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Post::all();
    }

    /**
     * Função que retorna um post com alguns campos
     * removidos.
     *
     * @param  \App\Models\Post $post
     * @return \Illuminate\Http\Response
     */
    public function details()
    {
        $posts = Post::all()->each(function($post){
            $post = $post->makeHidden(['created_at','updated_at', 'sex', 'ls_address', 'ls_datetime', 'observation']);
            $post->image = url('/') . '/storage/' . $post->image;
        });
        return $posts;
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
            'image' => 'required|image|mimes:jpeg,png,jpg|max:2048',
            'name' => 'required|max:20',
            'breed' => 'required',
            'sex' => 'required|max:1',
            'ls_address' => 'required|max:40',
            'ls_datetime' => 'required|date',
            'observation' => 'max:40',
            'user_id' => 'required',
        ]);

        $post = Post::create([
            'image' => $request->file('image'),
            'name' => $request->input('name'),
            'breed' => $request->input('breed'),
            'sex' => $request->input('sex'),
            'ls_address' => $request->input('ls_address'),
            'ls_datetime' => strtotime($request->input('ls_datetime')),
            'observation' => $request->input('observation'),
            'user_id' => $request->input('user_id'),
        ]);

        return $post;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        $post = $post->makeHidden(['created_at','updated_at']);
        $post->image = url('/') . '/storage/' . $post->image;
        if ($post->user->image) {
            $post->user->image = url('/') . '/storage/' . $post->image;
        } else {
            $post->user->makeHidden(['avatar']);
        }
        $post->user->makeHidden(['phone', 'email', 'email_verified_at', 'created_at', 'updated_at']);
        return $post;
    }

    public function updatePost(Request $request, Post $post)
    {
        $request->validate([
            'image' => 'image|mimes:jpeg,png,jpg|max:2048',
            'name' => 'required|max:20',
            'breed' => 'required',
            'sex' => 'required|max:1',
            'ls_address' => 'required|max:40',
            'ls_datetime' => 'required|date',
            'observation' => 'max:40',
        ]);

        if ($request->hasFile('image')) {
            $post->uploadImage($request->file('image'), 'image');
        }
        
        $post->update(
            $request->only('name','breed', 'sex', 'ls_address', 'ls_datetime', 'ls_time', 'observation')
        );

        return response()->json([
            'msg' => 'Atualizado com sucesso.',
            'post' => $post,
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        $post->delete();
        return response()->json(['msg' => 'Removido com sucesso.']);
    }
}
