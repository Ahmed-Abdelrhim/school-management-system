<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TaskUpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'title' => ['nullable','string','min:6' ,'max:255'],
            'slug' => ['nullable','string','max:255'],
            'excerpt' => ['nullable','string','max:255'],
            'description' => ['nullable','string','max:255'],
            'min_to_read' => ['nullable', 'numeric'],
            'is_published' => ['nullable', 'numeric' ,'between:0,1'],
        ];
    }
}
