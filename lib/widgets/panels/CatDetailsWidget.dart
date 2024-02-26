import 'package:wikiMeow/model/cat_model.dart';
import 'package:flutter/material.dart';

class CatDetailsWidget extends StatelessWidget {
  const CatDetailsWidget({super.key, required this.catModel});
  final CatModel catModel;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Image.network(
        catModel.imageLink!,
        height: MediaQuery.of(context).size.height * 0.3,
        fit: BoxFit.cover,
      ),
      DataRow(
          name: "Origin",
          value: catModel.origin ?? "unset",
          icon: Icon(Icons.location_pin)),
      DataRow(
          name: "Max Weight",
          value: catModel.maxWeight ?? "unset",
          icon: Icon(Icons.monitor_weight)),
      DataRow(
          name: "Min Weight",
          value: catModel.minWeight ?? "unset",
          icon: Icon(Icons.monitor_weight_outlined)),
      DataRow(
          name: "Length",
          value: catModel.length ?? "unset",
          icon: Icon(Icons.line_weight)),
      DataRow(
          name: "Family Friendly",
          value: catModel.familyFriendly,
          icon: Icon(Icons.health_and_safety_outlined)),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
      )
    ]);
  }
}

class DataRow extends StatelessWidget {
  final String name;
  final Widget icon;
  final value;
  const DataRow({
    super.key,
    required this.name,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("${value}"),
      leading: icon,
    ));
  }
}
