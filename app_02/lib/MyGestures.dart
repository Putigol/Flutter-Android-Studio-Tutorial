import "package:flutter/material.dart";

class MyGestures extends StatelessWidget {
  const MyGestures({super.key});

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
            //GestureDetector - bắt được các sự kiện
            GestureDetector(
              onTap: () {
                print("Nội dung được tap");
              },
              onDoubleTap: () {
                print("Nội dung được double tap");
              },
              onLongPress: () {
                print("Nội dung được long press");
              },
              onPanUpdate: (details) {
                print("Di chuyển: ${details.delta}");
              },
              onPanEnd: (details) {
                print("Kết thúc di chuyển");
              },

              child: Container(
                width: 200,
                height: 200,
                color: Colors.redAccent,
                child: Center(child: Text("GestureDetector")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
