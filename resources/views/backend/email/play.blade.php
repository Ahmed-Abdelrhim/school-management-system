<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">

    <link rel="stylesheet" href="{{ asset('assets/modules/bootstrap/dist/css/bootstrap.min.css') }}">

    <!-- Template CSS -->
    @if(app()->getLocale() == 'ar')
        <link rel="stylesheet" href="{{ asset('assets/css/style-ar.css') }}">
    @else
        <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">
    @endif
    <link rel="stylesheet" href="{{ asset('assets/css/components.css') }}">
    <link rel="stylesheet" href="{{ asset('css/custom.css') }}">
    <title>Visitor Mail</title>
</head>



<body>
<div>
    <h3>
        Dear {{$name}} Your Order  has been Shipped
    </h3>


</div>
</body>
</html>
