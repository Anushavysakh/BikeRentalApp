class Bike {
  int? id;
  String? name;
  String? image;
  String? category;
  int? displacementCc;
  int? maxSpeedKmph;
  int? rentPerHourInr;

  Bike({
     this.id,
     this.name,
     this.image,
     this.category,
     this.displacementCc,
     this.maxSpeedKmph,
     this.rentPerHourInr,
  });

  factory Bike.fromJson(Map<dynamic, dynamic> json) {
    return Bike(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      category: json['category'],
      displacementCc: json['displacement_cc'],
      maxSpeedKmph: json['max_speed_kmph'],
      rentPerHourInr: json['rent_per_hour_inr'],
    );
  }
}