import 'package:wikiMeow/main.dart';
import 'package:wikiMeow/widgets/panels/CatPanelWidget.dart';
import 'package:flutter/material.dart';

class CatsSearch extends StatelessWidget {
  const CatsSearch({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        leading: Padding(padding:  const EdgeInsets.all(12),
        child: Image.network("https://cdn-icons-png.flaticon.com/512/12/12321.png")),
        title: const Center(child: Text("Types of cats", style: TextStyle(fontWeight: FontWeight.bold))),
        actions: [IconButton(onPressed: () => {}, icon: const Icon(Icons.favorite))]),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
        itemCount: listOfCats.length,
        itemBuilder: (context, index) {
          return CatPanelWidget(catModel: listOfCats[index]); 
      })
    );
  }
}