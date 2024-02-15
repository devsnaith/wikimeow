import 'package:wikiMeow/model/cat_model.dart';
import 'package:wikiMeow/widgets/cat_details.dart';
import 'package:flutter/material.dart';

class CatPanelWidget extends StatelessWidget {
  final CatModel catModel;
  const CatPanelWidget({
    required this.catModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return CatDetails(catModel: catModel);
      },)),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                child: Card(clipBehavior: Clip.hardEdge,
                  child: Image.network(catModel.imageLink!, fit: BoxFit.cover, width: double.infinity),
                )
              ),
              Text(catModel.name!, style: const TextStyle(fontWeight: FontWeight.bold)),
            ]
          )
        )
      ),
    );
  }
}