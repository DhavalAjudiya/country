import 'dart:convert';
import 'dart:io' as Io;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImageToPdf extends StatefulWidget {
  const ImageToPdf({Key? key}) : super(key: key);

  @override
  State<ImageToPdf> createState() => _ImageToPdfState();
}

class _ImageToPdfState extends State<ImageToPdf> {
  String? base64Image;
  String? pickedImageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        InkWell
          (
          onTap: () {
            pickImage();
          },
          child: Container(
            width: 400,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: pickedImageFile!.isEmpty
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: const [
                  Icon(Icons.cloud_upload),
                  Text(
                    "uploadImgOrFile",
                    style: TextStyle(fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 12,),
                  )
                ],
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(

                    (pickedImageFile)
                        .toString()
                        .split("/")
                        .last,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        )
      ],),
    );
  }

  void pickImage() async {
    FilePickerResult? pickedImage =
    await FilePicker.platform.pickFiles(
        type: FileType.custom allowedExtensions: ['jpg', 'pdf', 'png', 'jpeg'],
        allowMultiple: false);

    final bytes = Io.File(pickedImage?.files.single.path ?? "")
        .readAsBytesSync();
    base64Image = base64Encode(bytes);
    if (pickedImage != null) {
      pickedImageFile = pickedImage.paths.first ?? "";
    }
  }
}
