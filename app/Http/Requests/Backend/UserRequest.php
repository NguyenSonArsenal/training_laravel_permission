<?php

namespace App\Http\Requests\Backend;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'bail|required|max:64',
            'email' => $this->id ? '' : 'bail|required|max:64|unique:users,email,' . $this->id,
            'password' => $this->id ? '' : 'bail|required|confirmed|min:6',
            'roles' => 'bail|required',
        ];
    }

    public function attributes()
    {
        return [
            'roles' => 'quyền',
        ];
    }
}
