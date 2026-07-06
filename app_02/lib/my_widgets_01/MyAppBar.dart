import "package:flutter/material.dart";

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

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

      body: const Center(child: Text('Hello, World!')),

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
