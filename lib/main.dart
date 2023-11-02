import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagepicker/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ImagePickerController im = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX State Mangement',style: TextStyle(fontSize: 14,color: Colors.white),),centerTitle: true,backgroundColor: Colors.blueAccent,),
      body: Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'value1',
            child: Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: im.imagepath.isNotEmpty ? FileImage(File(im.imagepath.toString())) : null,
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            im.getImage();
          }, child: Text("Pick Image")),
        ],
      ),
      ),
    );
  }
}

