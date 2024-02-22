class MyProjectModel{
  final String id;
  final String name;
  final String url;
  final List img;
  final String descriptions;

  MyProjectModel({
    required this.id,
    required this.name,
    required this.url,
    required this.img,
    required this.descriptions,


  });
  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'name':name,
      'url':url,
      'img':img,
      'descriptions':descriptions,

    };
  }
  factory MyProjectModel.fromMap(Map<String,dynamic> json){
    return MyProjectModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      img: json['img'],
      descriptions: json['descriptions'],


    );
  }
}