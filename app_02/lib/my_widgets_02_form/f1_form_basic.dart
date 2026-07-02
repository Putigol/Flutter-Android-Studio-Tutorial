import 'package:flutter/material.dart';

class FormBasicDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<FormBasicDemo> {
  //Sử dụng global key để truy cập vào trạng thái của Form
  final _formKey = GlobalKey<FormState>();
  String? _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Basic Demo")),
      body: Padding(
        padding: EdgeInsets.all(16),
        // Form là widget chứa và quản lý các trường nhập liệu
        // Key: được sử dụng để truy cập vào trạng thái của Form
        // Phương thức validate() kiểm tra tính hợp lệ của tất cả trường
        // Phương thức save() gọi hàm onSaved của mỗi trường
        // Phương thức reset() đặt lại giá trị của tất cả trường
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Họ và tên",
                  hintText: "Nhập họ và tên của bạn",
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  _name = value;
                },
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //Nếu Form hợp lệ thì gọi hàm onSaved của mỗi trường
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print("Name: $_name");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Form submitted")),
                        );
                      }
                    },
                    child: Text("Submit"),
                  ),
                  SizedBox(width: 10),

                  ElevatedButton(onPressed: () {
                    _formKey.currentState!.reset();
                    setState(() {
                      _name = null;
                    });
                  }, child: Text("Reset")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
