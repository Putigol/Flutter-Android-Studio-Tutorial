import "package:flutter/material.dart";
import "package:flutter/services.dart";

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Trả về Scaffold - widget cung cấp bố cục Material Design cơ bản
    return Scaffold(
      appBar: AppBar(
        title: const Text('App 02'),
        backgroundColor: Colors.blueAccent,
        elevation: 4, //Đổ bóng
        actions: [
          IconButton(
            onPressed: () {
              print("B1!");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("B2!");
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              /*
               TextField là widget cho phép người dùng nhập văn bản thông qua bàn phím.
               Đây là thành phần thiết yếu trong hầu hết các ứng dụng, từ biểu mẫu đăng nhập, tìm kiếm,
               đến nhập liệu trong các ứng dụng phức tạp.
              */
              //Họ tên
              TextField(
                decoration: InputDecoration(
                  labelText: "Họ và tên",
                  hintText: "Nhập họ và tên",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              //Email
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "abc@gmail.com",
                  //Ghi chú hỗ trợ
                  helperText: "Email không được để trống",
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.clear),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.blue[200],
                ),
                //Hỗ trợ nhập dạng email
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),

              //SĐT
              TextField(
                decoration: InputDecoration(
                  labelText: "Số điện thoại",
                  hintText: "Nhập số điện thoại",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.phone),
                  suffixIcon: Icon(Icons.clear),
                  filled: true,
                  fillColor: Colors.blue[200],
                ),
                //Hỗ trợ nhập dạng số điện thoại
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
              ),
              SizedBox(height: 20),

              //Ngày sinh
              TextField(
                decoration: InputDecoration(
                  labelText: "Ngày sinh",
                  hintText: "Nhập ngày sinh",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.date_range),
                  suffixIcon: Icon(Icons.clear),
                  filled: true,
                  fillColor: Colors.blue[200],
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 20),

              //Mât khẩu
              TextField(
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  hintText: "Nhập mật khẩu",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  filled: true,
                  fillColor: Colors.blue[200],
                ),
                obscureText: true, //Ẩn mật khẩu
                obscuringCharacter: "*", //Ký hiệu ẩn
              ),
              SizedBox(height: 20),

              //Sự kiện trong 1 TextField
              TextField(
                onChanged: (value) {
                  print("Đang nhập: $value");
                },
                onSubmitted: (value) {
                  print("Đã nhập: $value");
                },
                decoration: InputDecoration(
                  labelText: "Câu hỏi bí mật",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
            ], //children
          ),
        ),
      ),
    );
  }
}
