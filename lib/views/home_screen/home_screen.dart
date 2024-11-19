import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              // Pick an image.
                              final XFile? pickedImageFile = await picker
                                  .pickImage(source: ImageSource.camera);
                              if (pickedImageFile != null) {
                                imagePath = pickedImageFile.path;
                                Navigator.pop(context);

                                setState(() {});
                              }
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              size: 50,
                            )),
                        IconButton(
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              // Pick an image.
                              final XFile? pickedImageFile = await picker
                                  .pickImage(source: ImageSource.gallery);
                              if (pickedImageFile != null) {
                                imagePath = pickedImageFile.path;
                                Navigator.pop(context);
                                setState(() {});
                              }
                            },
                            icon: Icon(
                              Icons.image,
                              size: 50,
                            )),
                      ],
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage:
                    imagePath != null ? FileImage(File(imagePath!)) : null,
                radius: 100,
              ),
            ),
            imagePath != null ? Image.file(File(imagePath!)) : SizedBox()
          ],
        ),
      ),
    );
  }
}
