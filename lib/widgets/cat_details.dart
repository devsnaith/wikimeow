import 'package:wikiMeow/main.dart';
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
  @override
  Widget build(BuildContext context) {
    bool isitFav = favIndexes.contains(widget.catModel);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[50],
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: isitFav ? const Color.fromARGB(255, 216, 7, 77) : Colors.black,
          label: TextButton.icon(onPressed: () => {
            setState(() {
              if(isitFav) {
                favIndexes.remove(widget.catModel);
              }else {
                favIndexes.add(widget.catModel);
              }
            })
          },
          label: Text(isitFav ? "Remove from Favorite" : "Add to Favorite", style: const TextStyle(color: Colors.white),),
          icon: Icon(isitFav ? Icons.heart_broken : Icons.favorite, color: Colors.white,)),
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