import 'package:flutter/material.dart';

class FormBasicDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<FormBasicDemo> {
  //Sử dụng global key để truy cập vào trạng thái của Form
  final _formKey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _obscurePassword = true;
  String? _name;
  String? _selectedCity;
  final List<String> _cities = [
    "Hà Nội",
    "Hồ Chí Minh",
    "Đà Nẵng",
    "Hải Phòng",
    "Cần Thơ",
    "Đồng Nai",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Basic Demo")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            //cho phép cuộn
            child: Column(
              children: [
                // TextFormField là phiên bản mở rộng của TextField tích hợp với Form
                // Validator là hàm kiểm tra tính hợp lệ của dữ liệu
                // Controller cho phép truy cập và điều khiển giá trị
                // obscureText cho phép ẩn văn bản
                // AutovalidateMode điều khiển thời điểm validation được kích hoạt

                // Họ tên
                TextFormField(
                  controller: _fullnameController,
                  decoration: InputDecoration(
                    labelText: "Họ và tên",
                    hintText: "Nhập họ và tên của bạn",
                    suffixIcon: Icon(Icons.clear),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    _name = value;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Họ và tên không được để trống";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 40),

                //Email
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Nhập email của bạn",
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.clear),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email không được để trống";
                    }
                    // Kiểm tra định dạng email
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return "Email không hợp lệ";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 40),

                //SĐT
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: "Số điện thoại",
                    hintText: "Nhập số điện thoại của bạn",
                    prefixIcon: Icon(Icons.phone),
                    suffixIcon: Icon(Icons.clear),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Số điện thoại không được để trống";
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return "Số điện thoại phải đủ 10 chữ số";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 40),

                //Mật khẩu
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Mật khẩu",
                    hintText: "Nhập mật khẩu",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  obscuringCharacter: '*',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Mật khẩu không được để trống";
                    }
                    if (value.length < 6) {
                      return "Mật khẩu phải có ít nhất 6 ký tự";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 40),

                //Xác nhận mật khẩu
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: "Xác nhận mật khẩu",
                    hintText: "Nhập lại mật khẩu",
                    prefixIcon: Icon(Icons.lock_clock_outlined),
                    border: OutlineInputBorder(),
                  ),
                  obscuringCharacter: '*',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng xác nhận mật khẩu";
                    }
                    if (value != _passwordController.text) {
                      return "Mật khẩu không khớp";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 40),

                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: "Thành phố",
                    border: OutlineInputBorder(),
                  ),
                  items: _cities.map((city) {
                    return DropdownMenuItem(value: city, child: Text(city));
                  }).toList(),

                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng chọn thành phố";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 30),

                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        //Nếu Form hợp lệ thì gọi hàm onSaved của mỗi trường
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Form submitted")),
                          );
                        }
                      },
                      child: Text("Submit"),
                    ),

                    SizedBox(width: 10),

                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                        setState(() {
                          _name = null;
                        });
                      },
                      child: Text("Reset"),
                    ),
                  ],
                ),
              ], //children
            ),
          ),
        ),
      ),
    );
  }
}
