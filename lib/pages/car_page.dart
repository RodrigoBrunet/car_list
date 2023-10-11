import 'package:flutter/material.dart';

class CarPage extends StatefulWidget {
  const CarPage({super.key});

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car List'),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: ClipRRect(
                    child: Text('T'),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
          separatorBuilder: (_, __) => const Divider(color: Colors.transparent),
          itemCount: 5),
    );
  }
}
