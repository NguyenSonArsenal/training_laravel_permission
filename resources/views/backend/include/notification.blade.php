@if (session()->has('notification_success'))
    <div class="alert alert-success" role="alert">
        {{ session()->get('notification_success') }}
    </div>
@endif

@if (session()->has('notification_error'))
    <div class="alert alert-danger" role="alert">
        {{ session()->get('notification_error') }}
    </div>
@endif
