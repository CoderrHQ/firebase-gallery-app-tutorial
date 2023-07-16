import 'dart:io';

import 'package:firebase_gallery_tutorial/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Gallery Screen'),
        actions: [
          image == null
              ? const SizedBox()
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.save),
                ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: image == null
                ? Image.asset('images/image_placeholder.png')
                : Image.file(
                    fit: BoxFit.cover,
                    image!,
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          image = await pickImage();
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
