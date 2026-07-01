import "package:flutter/material.dart";

class MyText extends StatelessWidget {
  const MyText({super.key});

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

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Pressed!");
        },

        child: const Icon(Icons.add_ic_call),
      ),

      body: const Center(
        child: Column(
          children: [
            //Tạo khoảng cách
            const SizedBox(height: 50),
            //Text cơ bản
            const Text("Nguyễn Phúc Thịnh"),
            const SizedBox(height: 20),

            const Text(
              "Xin chào các bạn đang học lập trình Dart/Flutter",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "Flutter là bộ công cụ phát triển giao diện người dùng (UI) mã nguồn mở do Google tạo ra. Nó cho phép lập trình viên xây dựng các ứng dụng đa nền tảng (chạy trên iOS, Android, Web, Windows, macOS và Linux) chỉ từ một mã nguồn duy nhất (codebase), giúp tiết kiệm đáng kể thời gian và chi phí.",
              textAlign: TextAlign.center,
              //Giới hạn dòng nếu text quá dài
              maxLines: 3,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.5,
              ),
            ),

          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
