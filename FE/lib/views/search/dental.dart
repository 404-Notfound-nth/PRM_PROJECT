//this model

class Dental {
  final String nameDental;
  final String addressDental;
  final double rating;

  const Dental({
    this.nameDental,
    this.addressDental,
    this.rating,
  });

  factory Dental.fromJson(Map<String, dynamic> json) => Dental(
      nameDental: json['name'],
      addressDental: json['address'],
      rating: json["rating"].toDouble());

  Map<String, dynamic> toJson() =>
      {'name': nameDental, 'address': addressDental, 'rating': rating};
}
