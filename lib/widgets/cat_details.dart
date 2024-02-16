import 'package:wikiMeow/model/cat_model.dart';
import 'package:wikiMeow/widgets/panels/CatDetailsWidget.dart';
import 'package:wikiMeow/widgets/secret_widget.dart';
import 'package:flutter/material.dart';

class CatDetails extends StatefulWidget {
  const CatDetails({super.key, required this.catModel});
  final CatModel catModel;

  @override
  State<CatDetails> createState() => _CatDetailsState();
}

class _CatDetailsState extends State<CatDetails> {
  bool floatinBackgroundColorBlack = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[50],
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: floatinBackgroundColorBlack ? Colors.black : Colors.pink,
          label: TextButton.icon(onPressed: () => {
            setState(() {
              floatinBackgroundColorBlack = !floatinBackgroundColorBlack;
            })
          },
          label: const Text("Add to Favorite", style: TextStyle(color: Colors.white),),
          icon: const Icon(Icons.favorite, color: Colors.white,)),
          onPressed: () => {
          }, 
        ),
        appBar: AppBar(
          title: Center(child: Text(widget.catModel.name!, style: const TextStyle(fontWeight: FontWeight.bold))),
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
        body: CatDetailsWidget(catModel: widget.catModel),
        ),
    );
  }
}