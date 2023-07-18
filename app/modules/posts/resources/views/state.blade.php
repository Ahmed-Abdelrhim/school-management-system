@extends('admin.admin_master')
@section('admin')
    <div class="content-wrapper">
        <div class="container-full">
            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-xl-3 col-6">
                        <div class="box overflow-hidden pull-up">
                            <div class="box-body">
                                <div class="icon bg-primary-light rounded w-60 h-60">
                                    {{--                                    <i class="text-primary mr-0 font-size-24 mdi mdi-account-multiple"></i>--}}

                                    <img src="{{asset('upload/credit-card.png')}}" style="width: 86px; height: 60px;"
                                         alt=""/>
                                </div>
                                <div>
                                    <p class="text-mute mt-20 mb-0 font-size-16"></p>
                                    <h3 class="text-white mb-0 font-weight-500">3400 EGP
                                        <small class="text-success">
                                            <i class="fa fa-caret-up"></i>
                                            {{--  <i class="fa-duotone fa-credit-card"></i>--}}
                                            +2.5 %
                                        </small>
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- /.content -->
        </div>
    </div>
@endsection
