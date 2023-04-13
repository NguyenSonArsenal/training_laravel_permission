<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\UserRequest;
use App\Models\Role;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
    public function index()
    {
        $data = User::all();
        return view('backend.user.index', compact(['data']));
    }

    public function create()
    {
        $roles = Role::all();
        return view('backend.user.create', compact(['roles']));
    }

    public function store(UserRequest $request)
    {
        // Bắt đầu các hành động trên CSDL
        DB::beginTransaction();
        try {
            $params = request()->all();
            $params['password'] = bcrypt($params['password']);

            // Insert new user
            $user = new User();
            $user->fill($params);
            $user->save();

            // Insert to role
            $user->roles()->attach(request('roles', []));
            //Commit dữ liệu khi hoàn thành kiểm tra
            DB::commit();
            return redirect()->route('user.index')->with('notification_success', 'Thành công');
        } catch (\Exception $e) {
            //Gặp lỗi nào đó mới rollback
            DB::rollBack();
            return redirect()->route('user.index')->with('notification_error', 'Đã có lỗi sảy ra');
        }
    }

    public function edit($id)
    {
        $data = User::findOrFail($id);
        $roles = Role::all();
        $myRoles = array_column($data->roles->toArray(), 'id');
        return view('backend.user.edit', compact(['data', 'roles', 'myRoles']));
    }

    public function update($id, UserRequest $request)
    {
        $user = User::findOrFail($id);
        DB::beginTransaction();
        try {
            $user->fill(request()->all());
            $user->save();
            $user->roles()->sync(request('roles'));
            DB::commit();
            return redirect()->route('user.index')->with('notification_success', 'Thành công');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->route('user.index')->with('notification_error', 'Đã có lỗi sảy ra');
        }
    }

    public function destroy($id)
    {
        $user = User::findOrFail($id);
        try {
            $myRoles = array_column($user->roles->toArray(), 'id');
            $user->roles()->detach($myRoles);
            $user->delete(); // returns true/false
            DB::commit();
            return redirect()->back()->with('notification_success', 'Thành công');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->with('notification_error', 'Đã có lỗi sảy ra');
        }
    }
}
