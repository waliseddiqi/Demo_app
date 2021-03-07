class CourtsModel {
  final String $id;
  final int id;
  final int position;
  final String name;
  final String address;
  final String district;
  final String city;
  final String firsttel;
  final String secondtel;
  final String firstmobiletel;
  final String secondmobiletel;
     
  CourtsModel
  ({this.$id, this.id, this.position, this.name, this.address, this.district, this.city, this.firsttel, this.secondtel, this.firstmobiletel, this.secondmobiletel });

  factory CourtsModel.fromJson(Map<String, dynamic> json) {
    return new CourtsModel(
        $id: json['sid'],
        id: json["Id"],
        name: json["Ad"],
        position: json["Sira"],
        address: json["Adres"],
        district: json["Ilce"],
        city: json["Sehir"],
        firsttel: json["SabitTel1"],
        secondtel: json["SabitTel2"],
        firstmobiletel: json["CepTel1"],
        secondmobiletel: json["CepTel2"]);  
  }
}
