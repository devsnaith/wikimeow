import 'package:wikiMeow/model/cat_model.dart';
import 'package:wikiMeow/widgets/panels/CatDetailsWidget.dart';
import 'package:wikiMeow/widgets/secret_widget.dart';
import 'package:flutter/material.dart';

class CatDetails extends StatelessWidget {
  const CatDetails({super.key, required this.catModel});
  final CatModel catModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[50],
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          label: TextButton.icon(onPressed: () => {},
          label: const Text("Add to Favorite", style: TextStyle(color: Colors.white),),
          icon: const Icon(Icons.favorite, color: Colors.white,)),
          onPressed: () => {}, 
        ),
        appBar: AppBar(
          title: Center(child: Text(catModel.name!, style: const TextStyle(fontWeight: FontWeight.bold))),
          leading: IconButton(onPressed: () => {
            Navigator.of(context).pop()
          }, icon: const Icon(Icons.navigate_before)),
          actions: [
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {

                return const SecretWidget(); // <---- THIS IS SECRET; DO NOT GO THERE!!!!!!!!!!

              },)),
              child:  IconButton(onPressed: null, icon: Container()),
            )
          ],
        ),
        body: CatDetailsWidget(catModel: catModel),
        ),
    );
  }
}