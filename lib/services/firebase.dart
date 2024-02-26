import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:wikiMeow/model/cat_model.dart';

class FireBaseService {
  final database = FirebaseFirestore.instance;
  Future<bool> addData(Map<String, dynamic> map) async {
    bool returnStatus = false;
    String identifier = (await UniqueIdentifier.serial)!;
    await database
        .collection(identifier)
        .add(map)
        .then((value) => returnStatus = true);
    return returnStatus;
  }

  Future<List<CatModel>> getData() async {
    String identifier = (await UniqueIdentifier.serial)!;
    List<Map<String, dynamic>> allData = [];
    await database.collection(identifier).get().then((value) {
      for (var group in value.docs) {
        allData.add(group.data());
      }
    });
    return allData.map((e) => CatModel.fromJson(e)).toList();
  }
}
