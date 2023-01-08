// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

CheckLogin (BuildContext ctx, String userName, String passWord){
  if(userName.isEmpty || passWord.isEmpty)
  {
    showDialog(
                  context: ctx,
                  builder: (ctx){
                    return AlertDialog(
                      title: const Text('Thông báo'),
                      content: const Text('Đăng nhập thất bại'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(ctx),
                        child: const Text('OK')
                        )
                      ],
                    );
                  }
                );
    return;
  }
  if(userName == passWord){
    // Navigator.push(
    //   ctx,
    //   MaterialPageRoute(
    //     builder: (context) => Start(),
    //   )
    // );
    return;
  }
  else{
    showDialog(
                  context: ctx,
                  builder: (ctx){
                    return AlertDialog(
                      title: const Text('Thông báo'),
                      content: const Text('Đăng nhập thất bại'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(ctx),
                        child: const Text('OK')
                        )
                      ],
                    );
                  }
                );
  }

}

/*
  showDialog(
                  context: ctx,
                  builder: (ctx){
                    return AlertDialog(
                      title: Text('Đăng nhập'),
                      content: Text('Usernam hoặc Password trống'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(ctx),
                        child: Text('OK')
                        )
                      ],
                    );
                  }
                );
*/