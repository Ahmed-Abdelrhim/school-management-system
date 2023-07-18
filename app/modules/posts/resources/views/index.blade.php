@extends('admin.admin_master')
@section('admin')
    <div class="content-wrapper" id="app">
        <div class="container-full">
            <!-- Content Header (Page header) -->
            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">Posts List</h3>
                                <a href="{{ route('users.add') }}" style="float: right;"
                                   class="btn btn-rounded btn-success mb-5"> Add Post</a>
                                <a href="{{ route('download.pdf') }}" style="float: right; margin-right: 10px"
                                   class="btn btn-rounded btn-success mb-5"> Download PDF</a>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="table-responsive">

                                    {{--   <posts-index></posts-index>  --}}


                                    <!-- example1    table table-bordered table-striped   -->
                                    <table id="posts" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>

{{--                                            <th>ID</th>--}}
{{--                                            <th>Title</th>--}}
{{--                                            <th>Excerpt</th>--}}
{{--                                            <th>Description</th>--}}
{{--                                            <th>Min_To_Read</th>--}}
{{--                                            <th width="25%">Action</th>--}}
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Last Login IP</th>
                                            <th>Last Login At</th>
                                        </tr>
                                        </thead>
                                        <tbody>
{{--                                        @foreach ($users as $user)--}}
{{--                                            <tr>--}}
{{--                                                <td>{{ $user->name }}</td>--}}
{{--                                                <td>{{ $user->email }}</td>--}}
{{--                                                <td>{{ $user->last_login }}</td>--}}
{{--                                        @endforeach--}}
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->


                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </section>
            <!-- /.content -->

        </div>
    </div>

@endsection
@section('scripts')
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>

{{--    <script src="{{asset('js/app.js')}}"></script>--}}


    {{--    <script>--}}
    {{--        $(document).ready(function () {--}}
    {{--            $('#search').on('keyup', function() {--}}
    {{--                let value = $('#search').val();--}}
    {{--                if (value !== '') {--}}
    {{--                    // Send Ajax request Here to get posts--}}
    {{--                    console.log(value);--}}
    {{--                    $.ajax({--}}
    {{--                        url: '{{ route('post.search') }}',--}}
    {{--                        method: 'GET',--}}
    {{--                        data: {--}}
    {{--                            searchItem: value--}}
    {{--                        },--}}
    {{--                        dataType: 'json',--}}
    {{--                        success: function (data) {--}}
    {{--                            console.log(data);--}}
    {{--                        }--}}
    {{--                    });--}}
    {{--                }--}}
    {{--            });--}}
    {{--        });--}}
    {{--    </script>--}}

        <script type="text/javascript">
            $(function () {
                var table = $('#posts').DataTable({
                    serverSide: true,
                    processing: true,
                    pagingType: 'full_numbers',
                    paging: true,
                    pagingTypeSince: 'numbers',
                    'fixedHeader': true,
                    ajax: "{{Route('data.sub')}}",
                    "ordering": false,
                    columns: [
                        // {data: 'id', name: 'id'},
                        {data: 'name', name: 'name'},
                        {data: 'email', name: 'email'},
                        {data: 'last_login_ip', name: 'last_login_ip'},
                        {data: 'last_login_at', name: 'last_login_at'},
                        // {data: 'description', name: 'description'},
                        // {data: 'min_to_read', name: 'min_to_read'},
                        // {data: 'actions', name: 'actions'} [done],
                    ]
                });
            });
        </script>
@endsection
