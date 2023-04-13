<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\RoleRequest;
use App\Http\Requests\Backend\UserRequest;
use App\Models\Permission;
use App\Models\PermissionRole;
use App\Models\Role;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class RoleController extends Controller
{
    public function index()
    {
        $data = Role::all();
        return view('backend.role.index', compact(['data']));
    }

    public function create()
    {
        $permissions = Permission::all();
        return view('backend.role.create', compact(['permissions']));
    }

    public function store(RoleRequest $request)
    {
        DB::beginTransaction();
        try {
            $permissions = request('permissions');
            $entity = new Role();
            $entity->fill(request()->all());
            $entity->save();
            $entity->permissions()->attach($permissions);
            DB::commit();
            return redirect()->route('role.index')->with('notification_success', 'Thành công');
        } catch (\Exception $e) {
            dd($e);
            DB::rollBack();
            return redirect()->route('role.index')->with('notification_error', 'Đã có lỗi sảy ra');
        }
    }

    public function edit($id)
    {
        $data = Role::findOrFail($id);
        $permissions = Permission::all();
        $myPermission = PermissionRole::whereRoleId($id)->pluck('permission_id')->toArray();
        return view('backend.role.edit', compact(['data', 'permissions', 'myPermission']));
    }

    public function update($id, RoleRequest $request)
    {
        $entity = Role::findOrFail($id);
        DB::beginTransaction();
        try {
            $entity->fill(request()->all());
            $entity->save();
            $entity->permissions()->sync(request('permissions'));
            DB::commit();
            return redirect()->route('role.index')->with('notification_success', 'Thành công');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->route('role.index')->with('notification_error', 'Đã có lỗi sảy ra');
        }
    }

    public function destroy($id)
    {
        $entity = Role::findOrFail($id);
        try {
            $entity->permissions()->detach();
            $entity->delete();
            return redirect()->back()->with('notification_success', 'Thành công');
        } catch (\Exception $e) {
            return redirect()->back()->with('notification_error', 'Đã có lỗi sảy ra');
        }
    }
}
