class ProfileModel{
  final String id;
  final List img;
  final String profile;
  final String name;
  final String email;
  final String mobile;
  final String dob;
  final String address;
  final dynamic createdAt;
  ProfileModel({
    required this.id,
  required this.img,
  required this.profile,
  required this.name,
  required this.email,
  required this.mobile,
  required this.dob,
  required this.address,
  required this.createdAt,

});
  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'img':img,
      'profile':profile,
      'name':name,
      'email':email,
      'mobile':mobile,
      'dob':dob,
      'address':address,
      'createdAt':createdAt,
    };
  }
  factory ProfileModel.fromMap(Map<String,dynamic> json){
    return ProfileModel(
        id: json['id'],
        img: json['img'],
        profile: json['profile'],
        name: json['name'],
        email: json['email'],
        mobile: json['mobiled'],
        dob: json['dob'],
        address: json['address'],
        createdAt: json['createdAt']
    );
  }
}