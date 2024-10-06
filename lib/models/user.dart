class User {

  String? id;
  String? name;
  String? email;
  String? mobile;
  String? profile;

  User(this.id, this.name, this.email, this.mobile, this.profile);

  User.fromJson(Map<String,dynamic> json) : id = json['id'],name = json['name'],email = json['email'],mobile = json['mobile'],profile = json['profile'];

  Map<String,dynamic> toJson()=>{
    'id':id,
    'name':name,
    'email':email,
    'mobile':mobile,
    'profile':profile
  };
}