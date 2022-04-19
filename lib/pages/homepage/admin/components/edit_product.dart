import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_rental_flutter/pages/homepage/admin/admin_home.dart';
import 'package:music_rental_flutter/pages/login/admin_login.dart';
import 'package:music_rental_flutter/pages/models/product.dart';
import 'package:music_rental_flutter/pages/static/static_values.dart';
import 'package:music_rental_flutter/widgets/my_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

const storage = FlutterSecureStorage();

class EditProduct extends StatefulWidget {
  final Product product;
  const EditProduct({Key? key, required this.product}) : super(key: key);

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  late File _image = File("assets/image/logo.png");
  // load placeholder image form Network
  final ImagePicker imagePicker = ImagePicker();
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  void initState() {
    super.initState();
    storage.read(key: "userToken").then((token) {
      if (token == null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const AdminLogin(),
            ));
      }
    });
    name.text = widget.product.name;
    desc.text = widget.product.desc;
    price.text = widget.product.price.toString();
    _image = File(StaticValues.host + widget.product.image);
  }

  Future chooseImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    print("\n" + pickedImage!.path + "\n");
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  updateProduct() async {
    final uri = Uri.parse(StaticValues.apiUrlProduct);
    // request with token
    var request = http.MultipartRequest('PATCH', uri);
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
      request.headers['Authorization'] =
          'Bearer ${await storage.read(key: 'userToken')}';
      request.fields.addAll({
        'id': widget.product.id.toString(),
        'name': name.text,
        'desc': desc.text,
        'price': price.text,
      });

      // append image
      request.files.add(await http.MultipartFile.fromPath(
        'avatar',
        _image.path,
        filename: _image.path.split('/').last,
      ));

      var response = await request.send();
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: "Products Updated".text.make(),
          ),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AdminHome(),
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
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              "Edit Product".text.xl3.makeCentered(),
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
                // if image path contain http image.network otherwise image file or default image form assets
                child: _image == null
                    ? Image.asset("assets/image/logo.png")
                    : _image.path.contains("http")
                        ? Image.network(_image.path)
                        : Image.file(_image),
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                onPressed: () {
                  updateProduct();
                },
                btnText: "Update Product",
                color: const [Color(0xff027f47), Color(0xff01a95c)],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
