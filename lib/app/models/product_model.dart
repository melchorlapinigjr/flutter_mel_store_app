class ProductModel {
  int? id;
  String? name;
  String? tagline;
  String? firstBrewed;
  String? description;
  String? imageUrl;
  double? abv;
  int? ibu;
  int? targetFg;
  int? targetOg;
  int? ebc;
  int? srm;
  double? ph;
  int? attenuationLevel;
  List<String>? foodPairing;
  String? brewersTips;
  String? contributedBy;

  ProductModel(
      {this.id,
      this.name,
      this.tagline,
      this.firstBrewed,
      this.description,
      this.imageUrl,
      this.abv,
      this.ibu,
      this.targetFg,
      this.targetOg,
      this.ebc,
      this.srm,
      this.ph,
      this.attenuationLevel,
      this.foodPairing,
      this.brewersTips,
      this.contributedBy});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tagline = json['tagline'];
    firstBrewed = json['first_brewed'];
    description = json['description'];
    imageUrl = json['image_url'];
    abv = json['abv'];
    ibu = json['ibu'];
    targetFg = json['target_fg'];
    targetOg = json['target_og'];
    ebc = json['ebc'];
    srm = json['srm'];
    ph = json['ph'];
    attenuationLevel = json['attenuation_level'];
    foodPairing = json['food_pairing'].cast<String>();
    brewersTips = json['brewers_tips'];
    contributedBy = json['contributed_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['tagline'] = tagline;
    data['first_brewed'] = firstBrewed;
    data['description'] = description;
    data['image_url'] = imageUrl;
    data['abv'] = abv;
    data['ibu'] = ibu;
    data['target_fg'] = targetFg;
    data['target_og'] = targetOg;
    data['ebc'] = ebc;
    data['srm'] = srm;
    data['ph'] = ph;
    data['attenuation_level'] = attenuationLevel;

    data['food_pairing'] = foodPairing;
    data['brewers_tips'] = brewersTips;
    data['contributed_by'] = contributedBy;
    return data;
  }
}
