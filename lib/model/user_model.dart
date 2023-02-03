class UserModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserModel({this.id, this.email, this.firstName, this.lastName, this.avatar});
//Here we are returning from json and From api getting the data in the form of map
  UserModel.fromJson(Map<String, dynamic> json) {
    //Here we are returning this values
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
}