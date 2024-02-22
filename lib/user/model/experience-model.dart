class ExperienceModel{
  final String id;
  final String cname;
  final String cposition;
  final String endDate;
  final String startDate;
  final String learnTechnology;
  final dynamic createdAt;
  ExperienceModel({
    required this.id,
    required this.cname,
    required this.cposition,
    required this.endDate,
    required this.startDate,
    required this.learnTechnology,
    required this.createdAt,

  });
  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'cname':cname,
      'cposition':cposition,
      'endDate':endDate,
      'startDate':startDate,
      'learnTechnology':learnTechnology,
      'createdAt':createdAt,
    };
  }
  factory ExperienceModel.fromMap(Map<String,dynamic> json){
    return ExperienceModel(
        id: json['id'],
        cname: json['cname'],
        cposition: json['cposition'],
        endDate: json['endDate'],
        startDate: json['startDate'],
        learnTechnology: json['learnTechnology'],
        createdAt: json['createdAt']
    );
  }
}