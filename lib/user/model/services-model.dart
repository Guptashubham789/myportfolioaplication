class ServicesModel{
  final String id;
  final String name;
 
  ServicesModel({
    required this.id,
    required this.name,


  });
  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'name':name,

    };
  }
  factory ServicesModel.fromMap(Map<String,dynamic> json){
    return ServicesModel(
        id: json['id'],
        name: json['name'],


    );
  }
}