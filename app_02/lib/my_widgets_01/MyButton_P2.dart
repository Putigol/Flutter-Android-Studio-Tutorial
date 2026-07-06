import "package:flutter/material.dart";

class MyButton_P2 extends StatelessWidget {
  const MyButton_P2({super.key});

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

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            /*
              ElevatedButton là 1 button nổi với hiệu ứng đổ bóng,
              thường được sử dụng cho các hành động chính trong ứng dụng.
            */
            ElevatedButton(
              onPressed: () {
                print("ElevatedButton");
              },
              child: Text("ElevatedButton", style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                //màu nội dung bên trong
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),

                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                //Đổ bóng
                elevation: 5,
              ),
            ),
            SizedBox(height: 20),
            // InkWell
            // InkWell không phải là button,
            // nhưng nó cho phép tạo hiệu ứng gợn sóng (ripple effect)
            // khi nhấn vào bất kỳ widget nào.
            InkWell(
              onTap: () {
                print("InkWell");
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ),
                child: Text("Button tuỳ chỉnh cới InkWell"),
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
