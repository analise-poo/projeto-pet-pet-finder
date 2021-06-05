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
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:20',
            'breed' => 'required',
            'sex' => 'required|max:1',
            'age' => 'required|max:3',
            'ls_address' => 'required|max:40',
            'ls_datetime' => 'required|date',
            'observation' => 'max:40',
            'user_id' => 'required',
        ]);

        $post = Post::create([
            'name' => $request->input('name'),
            'breed' => $request->input('breed'),
            'sex' => $request->input('sex'),
            'age' => $request->input('age'),
            'ls_address' => strtotime($request->input('ls_address')),
            'ls_datetime' => $request->input('ls_datetime'),
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
        return $post;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Post $post)
    {
        $request->validate([
            'name' => 'required|max:20',
            'breed' => 'required',
            'sex' => 'required|max:1',
            'age' => 'required|max:3',
            'ls_address' => 'required|max:40',
            'ls_datetime' => 'required|date',
            'observation' => 'max:40',
        ]);

        $post->update(
            $request->only('name','breed', 'sex', 'age', 'ls_address', 'ls_datetime', 'ls_time', 'observation')
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
