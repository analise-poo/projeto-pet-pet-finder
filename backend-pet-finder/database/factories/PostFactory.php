<?php

namespace Database\Factories;

use App\Models\Post;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class PostFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Post::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->name(),
            'breed' => $this->faker->word(),
            'sex' => $this->faker->randomElement(['m', 'f']),
            'ls_address' => $this->faker->sentence(2),
            'ls_datetime' => $this->faker->datetime(),
            'observation' => $this->faker->text(),
            'user_id' => User::factory()->create(),
        ];
    }
}
