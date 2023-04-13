@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12 mb-3">
                <a href="{{ route('user.index') }}" class="btn btn-sm btn-primary">Back</a>
            </div>

            <div class="col-md-6">
                <form method="post" action="{{ route('user.store') }}">
                    @csrf
                    @include('backend.include.validation')

                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="name" class="form-control bg-white" placeholder="Nhập tên người dùng" value="{{ old('name') }}">
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="email" class="form-control bg-white" placeholder="Nhập email" value="{{ old('email') }}">
                    </div>
                    <div class="form-group mt-2">
                        <label>Password</label>
                        <input type="password" class="form-control bg-white" name="password" placeholder="Nhập mật khẩu">
                    </div>
                    <div class="form-group mt-2">
                        <label>Password Confirmation</label>
                        <input type="password" class="form-control bg-white" name="password_confirmation" placeholder="Nhập lại mật khẩu">
                    </div>
                    <div class="form-group mt-2">
                        <label>Role</label>
                        <select name="roles[]" id="select2" multiple="multiple" style="width: 100%">
                            @foreach($roles as $role)
                                <option value="{{ $role->id }}" {{ in_array($role->id, old('roles', [])) ? 'selected' : '' }}>{{ $role->display_name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary mt-3">Submit</button>
                </form>
            </div>
        </div>
    </div>
@endsection
