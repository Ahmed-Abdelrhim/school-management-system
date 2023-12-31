<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Yajra\DataTables\Facades\DataTables;

class UserController extends Controller
{
    public function UserView()
    {
        return view('backend.user.view_user');
        // return $users = User::query()->where('role', 'Operator')->count();
        // $allData = User::all();


        //        if (ucfirst(strtolower(auth()->user()->role)) != 'Admin')
        //            return view('errors.403');
        //
        //        $data['allData'] = User::query()->where('usertype', 'Admin')->select(['id', 'role', 'name', 'email', 'code'])->get();
        //        return view('backend.user.view_user', $data);

    }

    public function usersJson()
    {
        $users = User::query()->get();
        return DataTables::of($users)
            ->addColumn('id', function ($user) {
                return $user->id;
            })
            ->addColumn('name', function ($user) {
                return $user->name;
            })
            ->addColumn('email', function ($user) {
                return $user->email;
            })
            ->addColumn('code', function ($user) {
                return $user->code;
            })
            ->addColumn('actions', function ($user) {
                return view('backend.user._action', ['user' => $user]);
            })
            ->rawColumns(['actions'])
            ->tojson();
            // ->make(true);
    }


    public function UserAdd()
    {
        return view('backend.user.add_user');
    }


    public function UserStore(Request $request)
    {
        if (ucfirst(strtolower(auth()->user()->role)) != 'Admin')
            return view('errors.403');

        $validatedData = $request->validate([
            'email' => 'required|unique:users,email',
            'name' => 'required',
        ]);

//        $data = new User();
//        $code = rand(0000, 9999);
//        $data->usertype = 'Admin';
//        $data->role = $request->role;
//        $data->name = $request->name;
//        $data->email = $request->email;
//        $data->password = bcrypt($code);
//        $data->code = $code;
//        $data->save();


        try {
            DB::beginTransaction();
            $user = User::query()->insert([
                'name' => $request->name,
                'email' => $request->email,
                'role' => $request->role,
                'usertype' => 'Admin',
                'password' => bcrypt('12345678'),
                'code' => Str::random(0000, 9999),
                'gender' => 'Male',
                'created_at' => Carbon::now(),
            ]);
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['status' => false]);
        }
        return response()->json(['status' => true]);
    }


    public function UserEdit($id)
    {
        $id = decrypt($id);
        if (ucfirst(strtolower(auth()->user()->role)) != 'Admin')
            return view('errors.403');

        $editData = User::query()->find($id);
        return view('backend.user.edit_user', compact('editData'));

    }


    public function UserUpdate(Request $request, $id)
    {

        if (ucfirst(strtolower(auth()->user()->role)) != 'Admin')
            return view('errors.403');

        $data = User::query()->find($id);
        $data->name = $request->name;
        $data->email = $request->email;
        $data->role = $request->role;
        $data->save();

        $notification = array(
            'message' => 'User Updated Successfully',
            'alert-type' => 'info'
        );

        return redirect()->route('user.view')->with($notification);

    }


    public function UserDelete($id)
    {
        if (ucfirst(strtolower(auth()->user()->role)) != 'Admin')
            return view('errors.403');

        $user = User::query()->find($id);
        $user->delete();

        $notification = array(
            'message' => 'User Deleted Successfully',
            'alert-type' => 'info'
        );

        return redirect()->route('user.view')->with($notification);
    }

    public function playing()
    {

    }


}
