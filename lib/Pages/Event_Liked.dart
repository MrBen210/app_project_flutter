import 'package:flutter/material.dart';

class EventsLiked extends StatelessWidget {
  const EventsLiked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoris'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.orange,
      ),

    );
  }
}
