import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

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
  final _dateOfBirthController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  bool _obscurePassword = true;
  File? _profileImage;
  String? _name;
  String? _selectedCity;
  String? _selectedGender;
  bool _isAgreed = false;
  DateTime? _dateOfBirth;
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
                //Ảnh đại diện
                // Để quản lý một tệp tin (File), ta dùng FormField<File>
                FormField<File>(
                  validator: (value) {
                    if (value == null) {
                      return 'Vui lòng chọn ảnh đại diện';
                    }
                    return null;
                  },
                  //Builder vẽ giao diện. Nó chứa trạng thái của ô chọn ảnh này
                  // (có lỗi không, lỗi gì, giá trị hiện tại là gì).
                  builder: (FormFieldState<File> state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ảnh đại diện',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          // "Hành động" chọn ảnh
                          child: GestureDetector(
                            onTap: () async {
                              final XFile? image = await showDialog(
                                context: context,
                                // Một AlertDialog (hộp thoại) hiện lên cho phép chọn giữa
                                // Thư viện (ImageSource.gallery)
                                // hoặc Máy ảnh (ImageSource.camera).
                                builder: (context) => AlertDialog(
                                  title: Text('Chọn nguồn'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        //Lấy từ thư viện
                                        leading: Icon(Icons.photo_library),
                                        title: Text('Thư viện'),
                                        onTap: () async {
                                          // Navigator.pop(context, ...): Sau khi chọn ảnh xong,
                                          // nó sẽ đóng hộp thoại và trả kết quả ảnh về cho biến image.
                                          Navigator.pop(
                                            context,
                                            await _picker.pickImage(
                                              source: ImageSource.gallery,
                                            ),
                                          );
                                        },
                                      ),
                                      ListTile(
                                        //Chụp trực tiếp
                                        leading: Icon(Icons.camera_alt),
                                        title: Text('Máy ảnh'),
                                        onTap: () async {
                                          Navigator.pop(
                                            context,
                                            await _picker.pickImage(
                                              source: ImageSource.camera,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );

                              if (image != null) {
                                setState(() {
                                  _profileImage = File(image.path);
                                  // báo cho hệ thống Form biết rằng:
                                  // "Dữ liệu đã thay đổi rồi nhé, đừng báo lỗi thiếu ảnh nữa!".
                                  state.didChange(_profileImage);
                                });
                              }
                            },
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(60),
                                border: Border.all(
                                  color: state.hasError
                                      ? Colors.red
                                      : Colors.grey.shade300,
                                  width: 2,
                                ),
                              ),
                              // Nếu chưa chọn ảnh mà nhấn "Submit",
                              // cái viền sẽ tự động biến thành màu đỏ để cảnh báo.
                              // _profileImage != null ? ... : ...:
                              // Nếu có ảnh: Hiện ảnh lên bằng Image.file.
                              // Nếu chưa có: Hiện icon Icons.add_a_photo (hình máy ảnh có dấu cộng).
                              child: _profileImage != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(60),
                                      child: Image.file(
                                        _profileImage!,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Icon(
                                      Icons.add_a_photo,
                                      size: 40,
                                      color: Colors.grey.shade400,
                                    ),
                            ),
                          ),
                        ),
                        // Nếu validator trả về lỗi, nó sẽ hiện một dòng chữ màu đỏ state.errorText
                        // (ví dụ: "Vui lòng chọn ảnh đại diện") ngay dưới cái Avatar.
                        if (state.hasError)
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                state.errorText!,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),

                SizedBox(height: 30),

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

                SizedBox(height: 30),

                //Ngày sinh
                TextFormField(
                  controller: _dateOfBirthController,
                  decoration: InputDecoration(
                    labelText: "Ngày sinh",
                    hintText: "Nhập ngày sinh của bạn",
                    suffixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2026),
                    );
                    if (pickedDate != null) {
                      String formattedDate = DateFormat(
                        "dd/MM/yyyy",
                      ).format(pickedDate);
                      setState(() {
                        _dateOfBirthController.text = formattedDate;
                        _dateOfBirth = pickedDate;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ngày sinh không được để trống";
                    } else {
                      return null;
                    }
                  },
                ),

                SizedBox(height: 30),

                //Chọn giới tính
                FormField<String>(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng chọn giới tính";
                    }
                    return null;
                  },
                  initialValue: _selectedGender,
                  builder: (FormFieldState<String> state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Giới tính",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: state.hasError
                                  ? Colors.red
                                  : Colors.grey.shade300,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: RadioListTile<String>(
                                  title: Text("Nam"),
                                  value: "male",
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value;
                                      state.didChange(value);
                                    });
                                  },
                                  activeColor: Colors.blue,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: RadioListTile<String>(
                                  title: Text('Nữ'),
                                  value: 'female',
                                  groupValue: _selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value;
                                      state.didChange(value);
                                    });
                                  },
                                  activeColor: Colors.pink,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (state.hasError)
                          Padding(
                            padding: EdgeInsets.only(left: 12, top: 8),
                            child: Text(
                              state.errorText!,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),
                      ],
                    );
                  },
                ),

                SizedBox(height: 30),

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

                SizedBox(height: 30),

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

                SizedBox(height: 30),

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

                SizedBox(height: 30),

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

                SizedBox(height: 30),

                //Chọn thành phố
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

                //Điều khoản
                CheckboxListTile(
                  title: Text(
                    "Tôi đồng ý với điều khoản và chính sách của công ty XYZ",
                  ),
                  value: _isAgreed,
                  onChanged: (value) {
                    setState(() {
                      _isAgreed = value!;
                      print('Đồng ý: $_isAgreed');
                    });
                  },
                  //Ô checkbox căn bên trái
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                SizedBox(height: 20),

                Row(
                  children: [
                    //Submit
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

                    //Reset
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
