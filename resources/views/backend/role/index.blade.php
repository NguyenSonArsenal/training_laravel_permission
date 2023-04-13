@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12 mb-3">
                <a href="{{ route('role.create') }}" class="btn btn-sm btn-primary">Create</a>
            </div>

            @include('backend.include.notification')

            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Display name</th>
                        <th scope="col">Permission</th>
                        <th scope="col">Handle</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($data as $key => $item)
                        <tr>
                            <th scope="row">{{ 1 + $key }}</th>
                            <td>{{ $item->name }}</td>
                            <td>{{ $item->display_name }}</td>
                            <td>
                                <ul>
                                    @foreach($item->permissions as $permission)
                                        <li>{{ $permission->display_name }}</li>
                                    @endforeach
                                </ul>
                            </td>
                            <td>
                                <a href="{{ route('role.edit', ['role' => $item->id]) }}" class="btn btn-sm btn-primary">Edit</a>
                                <form action="{{ route('role.destroy', ['role' => $item->id]) }}" method="post" onsubmit="return confirm('Are you sure')" class="d-inline-block">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection
