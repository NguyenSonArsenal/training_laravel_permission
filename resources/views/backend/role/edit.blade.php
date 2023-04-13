@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12 mb-3">
                <a href="{{ route('role.index') }}" class="btn btn-sm btn-primary">Back</a>
            </div>

            <div class="col-md-6">
                <form method="post" action="{{ route('role.update', ['role' => $data->id]) }}">
                    @csrf
                    @method('PUT')
                    @include('backend.include.validation')

                    <input type="hidden" name="id" value="{{ $data->id }}">

                    <div class="form-group">
                        <label>Tên role</label>
                        <input type="text" name="name" class="form-control bg-white"
                               placeholder="Nhập tên role" value="{{ getOldData($data, 'name') }}">
                    </div>

                    <div class="form-group mt-2">
                        <label>Tên hiển thị</label>
                        <input type="text" name="display_name" class="form-control bg-white"
                               placeholder="Nhập tên hiển thị role" value="{{ getOldData($data, 'display_name') }}">
                    </div>

                    <div class="form-group mt-2">
                        <label>Quyền</label>
                        @foreach($permissions as $item)
                            <div class="form-check">
                                <input class="form-check-input" name="permissions[]" type="checkbox"
                                       value="{{ $item->id }}" id="id_{{$item->id}}"
                                       {{ in_array($item->id, old('permissions', $myPermission)) ? "checked" : "" }}
                                >
                                <label class="form-check-label" for="id_{{$item->id}}">{{ $item->display_name }}</label>
                            </div>
                        @endforeach
                    </div>

                    <button type="submit" class="btn btn-primary mt-3">Submit</button>
                </form>
            </div>
        </div>
    </div>
@endsection
