@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12 mb-3">
                <a href="{{ route('user.index') }}" class="btn btn-sm btn-primary">Back</a>
            </div>

            <div class="col-md-6">
                <form method="post" action="{{ route('user.update', ['user' => $data->id]) }}">
                    @csrf
                    @method('PUT')

                    @include('backend.include.validation')
                    <input type="hidden" name="id" value="{{ $data->id }}">

                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="name" class="form-control bg-white"
                               placeholder="Nhập tên người dùng" value="{{ getOldData($data, 'name') }}">
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="email" class="form-control bg-white" readonly
                               placeholder="Nhập email" value="{{ getOldData($data, 'email') }}">
                    </div>

                    <div class="form-group mt-2">
                        <label>Role</label>
                        <select name="roles[]" id="select2" multiple="multiple" style="width: 100%">
                            @foreach($roles as $role)
                                <option value="{{ $role->id }}"
                                    {{ in_array($role->id, old('roles', $myRoles)) ? 'selected' : '' }}>
                                    {{ $role->display_name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary mt-3">Submit</button>
                </form>
            </div>
        </div>
    </div>
@endsection
