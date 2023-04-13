<?php

namespace App\Http\Requests\Backend;

use Illuminate\Foundation\Http\FormRequest;

class RoleRequest extends FormRequest
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
            'name' => 'bail|required|max:64|unique:roles,name,' . request('id'),
            'display_name' => 'bail|required|max:64',
        ];
    }

    public function attributes()
    {
        return [
            'name' => 'tên role',
            'display_name' => 'tên hiển thị',
        ];
    }
}
