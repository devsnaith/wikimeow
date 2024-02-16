import 'package:flutter/material.dart';
import 'package:wikiMeow/main.dart';
import 'package:wikiMeow/widgets/panels/CatPanelWidget.dart';

class FavoriteCats extends StatefulWidget {
  const FavoriteCats({super.key});

  @override
  State<FavoriteCats> createState() => _FavoriteCatsState();
}

class _FavoriteCatsState extends State<FavoriteCats> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.navigate_before), onPressed: () {
            Navigator.of(context).pop();
          }),
          actions: [
            IconButton(icon: const Icon(Icons.delete), onPressed: () {
              setState(() {
                favIndexes.removeRange(0, favIndexes.length);
              });
            })
          ],
          title: const Center(child:Text("FavoriteCats",
            style: TextStyle(fontWeight: FontWeight.bold))),
          ),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
            itemCount: favIndexes.length,
            itemBuilder: (context, index) {
              return CatPanelWidget(catModel: favIndexes[index]); 
          }),
        ),  
    );
  }
}