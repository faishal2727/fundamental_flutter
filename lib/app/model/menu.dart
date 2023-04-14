class Menus {
  List<Foods> foods;
  List<Drinks> drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) {
    return Menus(
        foods: List<Foods>.from(
            json["foods"].map((datas) => Foods.fromJson(datas))),
        drinks: List<Drinks>.from(
            json["drinks"].map((datas) => Drinks.fromJson(datas)))
          );
  }
}

class Foods {
  String name;

  Foods({required this.name});
  factory Foods.fromJson(Map<String, dynamic> json) {
    return Foods(name: json["name"]);
  }
}

class Drinks {
  String name;

  Drinks({required this.name});

  factory Drinks.fromJson(Map<String, dynamic> json) {
    return Drinks(name: json["name"]);
  }
}
