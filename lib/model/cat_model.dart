class CatModel {
  String? length;
  String? origin;
  String? imageLink;
  int? familyFriendly;
  int? shedding;
  int? generalHealth;
  int? playfulness;
  int? childrenFriendly;
  int? grooming;
  int? intelligence;
  int? otherPetsFriendly;
  double? minWeight;
  double? maxWeight;
  double? minLifeExpectancy;
  double? maxLifeExpectancy;
  String? name;

  CatModel(
      {this.length,
      this.origin,
      this.imageLink,
      this.familyFriendly,
      this.shedding,
      this.generalHealth,
      this.playfulness,
      this.childrenFriendly,
      this.grooming,
      this.intelligence,
      this.otherPetsFriendly,
      this.minWeight,
      this.maxWeight,
      this.minLifeExpectancy,
      this.maxLifeExpectancy,
      this.name});

  CatModel.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    origin = json['origin'];
    imageLink = json['image_link'];
    familyFriendly = json['family_friendly'];
    shedding = json['shedding'];
    generalHealth = json['general_health'];
    playfulness = json['playfulness'];
    childrenFriendly = json['children_friendly'];
    grooming = json['grooming'];
    intelligence = json['intelligence'];
    otherPetsFriendly = json['other_pets_friendly'];
    minWeight = json['min_weight'];
    maxWeight = json['max_weight'];
    minLifeExpectancy = json['min_life_expectancy'];
    maxLifeExpectancy = json['max_life_expectancy'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['length'] = this.length;
    data['origin'] = this.origin;
    data['image_link'] = this.imageLink;
    data['family_friendly'] = this.familyFriendly;
    data['shedding'] = this.shedding;
    data['general_health'] = this.generalHealth;
    data['playfulness'] = this.playfulness;
    data['children_friendly'] = this.childrenFriendly;
    data['grooming'] = this.grooming;
    data['intelligence'] = this.intelligence;
    data['other_pets_friendly'] = this.otherPetsFriendly;
    data['min_weight'] = this.minWeight;
    data['max_weight'] = this.maxWeight;
    data['min_life_expectancy'] = this.minLifeExpectancy;
    data['max_life_expectancy'] = this.maxLifeExpectancy;
    data['name'] = this.name;
    return data;
  }
}