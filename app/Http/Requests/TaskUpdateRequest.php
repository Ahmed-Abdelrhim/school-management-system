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
            'title'        => ['required','string','min:6' ,'max:255'],
            'slug'         => ['required','string','max:255'],
            'excerpt'      => ['required','string','max:255'],
            'description'  => ['required','string','max:255'],
            'min_to_read'  => ['required', 'numeric'],
            'is_published' => ['required', 'numeric' ,'between:0,1'],
        ];
    }
}
