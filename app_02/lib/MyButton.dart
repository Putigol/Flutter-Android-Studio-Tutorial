import "package:flutter/material.dart";

class MyButton extends StatelessWidget {
  const MyButton({super.key});

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
                onPressed: () {print("ElevatedButton");},
                child:Text("ElevatedButton", style: TextStyle(fontSize: 24)),
            ),

            SizedBox(height: 20),

            /*
              TextButton là một button phẳng, không có đổ bóng,
              thường dùng cho các hành động thứ yếu
              hoặc trong các thành phần như Dialog, Card.
            */
            TextButton(
                onPressed: () {print("TextButton");},
                child:Text("TextButton", style: TextStyle(fontSize: 24)),
            ),

            /*
              OutlinedButton là button có viền bao quanh, không có màu nền,
              phù hợp cho các thay thế.
            */
            SizedBox(height: 20),
            OutlinedButton(
                onPressed: () {print("OutlinedButton");},
                child:Text("OutlinedButton", style: TextStyle(fontSize: 24)),
            ),

            /*
              IconButton là button chỉ gồm icon, không có văn bản,
              thường dùng trong AppBar, ToolBar.
            */
            SizedBox(height: 20,),
            IconButton(
                onPressed: () {print("IconButton");},
                icon: Icon(Icons.favorite),
            ),

            /*
              FloatingActionButton là button hình tròn,  nổi trên giao diện,
              thường dùng cho hành động chính của màn hình.
            */
            SizedBox(height: 20,),
            FloatingActionButton(
                onPressed: () {print("FloatingActionButton");},
                child: Icon(Icons.add),
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
