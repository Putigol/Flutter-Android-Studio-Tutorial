import "package:flutter/material.dart";

class MyButton_P3 extends StatelessWidget {
  const MyButton_P3({super.key});

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

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            /*
              ElevatedButton là 1 button nổi với hiệu ứng đổ bóng,
              thường được sử dụng cho các hành động chính trong ứng dụng.
            */
            //Khoá nút nhấn
            ElevatedButton(
              onPressed: null,
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
            SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                print("Pressed!");
              },
              //Nhấn giữ
              onLongPress: () {
                print("Long pressed!");
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
            InkWell(
              onTap: () {
                print("InkWell");
              },
              onDoubleTap: () {
                print("Double tapped!");
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
    );
  }
}
