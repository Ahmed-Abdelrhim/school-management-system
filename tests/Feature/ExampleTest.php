<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ExampleTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testBasicTest()
    {
        $response = $this->get('/');
        $response->assertStatus(200);
    }

    public function test_back_has_posts()
    {
        $title = 'Laravel is very powerful framework to create full stack applications';
        $response = $this->get('/back');
        $response->assertStatus(200);
        $response->assertViewHas('posts' , function ($collection) use  ($title) {
            return $collection->contains($title);
        });
    }
}
