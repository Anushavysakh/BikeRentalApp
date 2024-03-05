class Accessory {
  int? id;
  String? name;
  int? quantity;
  int? rentPerDay;
  String? image;

  Accessory({
    this.id,
     this.name,
     this.quantity,
     this.rentPerDay,
     this.image,
  });


  Accessory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    rentPerDay = json['rent_per_day'];
    image = json['image'];
  }
}
