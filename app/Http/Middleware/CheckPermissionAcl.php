<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CheckPermissionAcl
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next, $permission = null)
    {
        // Lấy tất cả quyền khi user đang login vào hệ thống
        // // 1. Lấy tất cả role of user
        $listRoleOfUser = DB::table('users')
            ->join('role_user', 'users.id', '=', 'role_user.user_id')
            ->join('roles', 'role_user.role_id', '=', 'roles.id')
            ->select('roles.*')
            ->where('users.id', auth()->id())
            ->get()->pluck('id')->toArray();

        // // 2. Lấy tất cả quyền tương ứng với các role trên
        $listRoleOfUser = DB::table('roles')
            ->join('permission_role', 'permission_role.role_id', '=', 'roles.id')
            ->join('permissions', 'permissions.id', '=', 'permission_role.permission_id')
            ->select('permissions.*')
            ->whereIn('roles.id', $listRoleOfUser)
            ->get()->unique()->pluck('name')->toArray();

        if (in_array($permission, $listRoleOfUser)) {
            return $next($request);
        }
        return abort(401);
    }
}
