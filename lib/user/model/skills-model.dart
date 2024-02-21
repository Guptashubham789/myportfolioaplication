class SkillsModel{
  final String sid;
  final String language;
  final String Knowledge;

  SkillsModel({
    required this.sid,
    required this.language,
    required this.Knowledge,


  });
  Map<String,dynamic> toMap(){
    return{
      'sid':sid,
      'language':language,
      'Knowledge':Knowledge,

    };
  }
  factory SkillsModel.fromMap(Map<String,dynamic> json){
    return SkillsModel(
        sid: json['sid'],
      language: json['language'],
      Knowledge: json['Knowledge'],


    );
  }
}