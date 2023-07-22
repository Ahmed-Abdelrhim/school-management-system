<?php

namespace App\Http\Requests\Api;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class RegisterRequest extends FormRequest
{
    public array $genders = ['male' , 'female'];
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
            'name' => ['bail' , 'required' , 'string' , 'max:255' , 'min:8'],
            'email' => ['required' , 'string' ,'email' ,'max: 255'],
            'mobile' => ['required' , 'numeric' ,'regex:/(01)[0-9]{9}/'],
            'gender' => ['required' , Rule::in($this->genders) ],
            'image' => ['nullable', 'string' ,'max:255'],
            'religion' => ['nullable' , 'string' , 'max:255' , "min:6"],
            'password' => ['required' , 'string' ,'max: 255'],
        ];
    }

    public function messages()
    {
        return [
            'required' => 'The :attribute field is required.',
            'mobile' => 'The mobile field should be in format `01` followed by 9 digits. ',

        ];
    }
}
