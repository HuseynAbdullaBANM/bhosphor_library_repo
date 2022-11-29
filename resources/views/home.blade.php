@extends('layouts.Navbar')

@section('content')
<div class="container">
        <div class="col-md-12">
            @if (session('status'))
            <div class="alert alert-success" role="alert">
                {{ session('status') }}
            </div>
            @endif
            @can('isAdmin')
            @else
            <user-book-list></user-book-list>
            @endcan
        </div>
</div>
@endsection
