import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';
import 'package:music_rental_flutter/widgets/my_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  late File _image = File("assets/image/logo.png");
  final ImagePicker imagePicker = ImagePicker();
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController price = TextEditingController();

  Future chooseImage() async {
    var pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  uploadProduct() async {
    final uri = Uri.parse(StaticValues.apiUrlProduct);
    var request = http.MultipartRequest('POST', uri);
    if (name.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: "Product name is Empty".text.make(),
        ),
      );
    } else if (desc.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: "Product Description needed".text.make(),
        ),
      );
    } else if (price.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: "Products Price is empty".text.make(),
        ),
      );
    } else {
      request.fields['name'] = name.text;
      request.fields['desc'] = desc.text;
      request.fields['price'] = price.text;
      var pic = await http.MultipartFile.fromPath("image", _image.path);
      request.files.add(pic);
      var response = await request.send();
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: "Products Added".text.make(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: "There was a problem adding the products!!".text.make(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              "Add Product".text.xl3.makeCentered(),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  hintText: "Product Name",
                ),
              ),
              TextFormField(
                controller: desc,
                decoration: const InputDecoration(
                  hintText: "Description",
                ),
              ),
              TextFormField(
                controller: price,
                decoration: const InputDecoration(
                  hintText: "Price",
                ),
              ),
              IconButton(
                onPressed: () {
                  chooseImage();
                },
                icon: const Icon(Icons.camera),
              ),
              Container(
                child: _image == null
                    ? 'No Image Selected'.text.make()
                    : Image.file(_image),
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                onPressed: () {
                  uploadProduct();
                },
                btnText: "Save",
                color: const [Color(0xff027f47), Color(0xff01a95c)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
