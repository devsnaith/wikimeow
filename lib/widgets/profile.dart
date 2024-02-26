import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wikiMeow/model/cat_model.dart';
import 'dart:convert';

import 'package:wikiMeow/services/firebase.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController originController = new TextEditingController();
  TextEditingController minWeightController = new TextEditingController();
  TextEditingController maxWeightController = new TextEditingController();
  TextEditingController lengthController = new TextEditingController();
  TextEditingController familyFriendlyController = new TextEditingController();
  String? imgEncoded;

  bool server = false;
  List<CatModel> firebaseData = [];

  @override
  void initState() {
    super.initState();
    reloadFirebaseData();
  }

  reloadFirebaseData() async {
    print("Getting Data From Server!");
    firebaseData = await FireBaseService().getData();
    server = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          onPressed: () {
            if (!server) {
              return;
            }

            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                      // height: 300,
                      width: double.infinity,
                      child: Padding(
                          padding: EdgeInsets.all(32),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "New Cat Dialog",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextField(
                                    controller: nameController,
                                    decoration:
                                        InputDecoration(hintText: "Name")),
                                TextField(
                                    controller: originController,
                                    decoration:
                                        InputDecoration(hintText: "Origin")),
                                TextField(
                                    controller: minWeightController,
                                    decoration: InputDecoration(
                                        hintText: "Min Weight")),
                                TextField(
                                    controller: maxWeightController,
                                    decoration: InputDecoration(
                                        hintText: "Max Weight")),
                                TextField(
                                    controller: lengthController,
                                    decoration:
                                        InputDecoration(hintText: "Length")),
                                TextField(
                                    controller: familyFriendlyController,
                                    decoration: InputDecoration(
                                        hintText: "Family Friendly")),
                                Row(
                                  children: [
                                    TextButton(
                                        onPressed: () async {
                                          final ImagePicker image =
                                              ImagePicker();
                                          final XFile? imageFile =
                                              await image.pickImage(
                                                  source: ImageSource.gallery);
                                          imgEncoded = base64Encode(
                                              File(imageFile!.path)
                                                  .readAsBytesSync());
                                        },
                                        child: const Text("Add Image")),
                                    Spacer(),
                                    ElevatedButton(
                                        onPressed: () async {
                                          var map = {
                                            "length": lengthController.text,
                                            "origin": originController.text,
                                            "image_link": imgEncoded,
                                            "family_friendly": int.tryParse(
                                                familyFriendlyController.text),
                                            "min_weight": double.tryParse(
                                                minWeightController.text),
                                            "max_weight": double.tryParse(
                                                maxWeightController.text),
                                            "name": nameController.text
                                          };
                                          bool status = await FireBaseService()
                                              .addData(map);
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                    child: Padding(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Card(
                                                            color: Colors.white,
                                                            child: ListTile(
                                                              leading: Icon(status
                                                                  ? Icons.upload
                                                                  : Icons
                                                                      .error),
                                                              title: Text(
                                                                  "Uploaded!"),
                                                              subtitle: Text(
                                                                  "${status ? "Done!" : "Error"}"),
                                                            ))));
                                              });
                                          setState(() {});
                                        },
                                        child: Text("Share"))
                                  ],
                                )
                              ])));
                });
          },
          label: const Row(
            children: [
              Icon(Icons.add),
              Text(
                "New Cat",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )),
      appBar: AppBar(
        title: Text(server ? "Profile" : "Getting Data...",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        itemCount: firebaseData.length,
        itemBuilder: (context, index) {
          CatModel cat = firebaseData[index];
          var img = Base64Decoder().convert(cat.imageLink!);
          return Card(
            child: ListTile(
              leading: Image.memory(img),
              title: Text(cat.name!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(children: [
                Row(children: [
                  Text(
                    "Origin: ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(cat.origin!),
                ]),
                Row(children: [
                  Text(
                    "Length: ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("${cat.length}"),
                ]),
                Row(children: [
                  Text(
                    "Min Weight: ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("${cat.minWeight}"),
                ]),
                Row(children: [
                  Text(
                    "Max Weight: ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("${cat.maxWeight}"),
                ]),
                Row(children: [
                  Text(
                    "Family Friendly: ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("${cat.familyFriendly}"),
                ]),
              ]),
            ),
          );
        },
      ),
    );
  }
}
