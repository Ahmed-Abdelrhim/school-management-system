<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Cache;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Login>
 */
class LoginFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $users = User::query()->pluck('id')->toArray();
        return [
            'user_id' => $users[array_rand($users,1)],
            'ip' => $this->faker->ipv4,
            'last_login_at' => $this->faker->dateTimeBetween('-2 week', Carbon::now()),
        ];
    }
}
