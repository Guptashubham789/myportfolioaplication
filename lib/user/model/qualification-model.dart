class QualificatioModel{
  final String qid;
  final String qdegree;
  final String branch;
  final String qdate;
  final String quniversity ;
  final dynamic createdAt;
  final String clgname;
  final String marks;
  QualificatioModel({
    required this.qid,
    required this.branch,
    required this.qdate,
    required this.quniversity,
    required this.createdAt,
    required this.qdegree,
    required this.clgname,
    required this.marks,

  });
  Map<String,dynamic> toMap(){
    return{
      'qid':qid,
      'qdegree':qdegree,
      'branch':branch,
      'qdate':qdate,
      'quniversity':quniversity,
      'createdAt':createdAt,
      'clgname':clgname,
      'marks':marks,
    };
  }
  factory QualificatioModel.fromMap(Map<String,dynamic> json){
    return QualificatioModel(
        qid: json['qid'],
        qdegree: json['qdegree'],
        branch: json['branch'],
        qdate: json['qdate'],
        quniversity: json['quniversity'],
        createdAt: json['createdAt'],
      clgname:json['clgname'],
      marks: json['marks']

    );
  }
}