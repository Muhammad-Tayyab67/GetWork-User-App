class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? password;
  String? cityName;
  String? cnic;
  String? mobileNo;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.lastName,
      this.cnic,
      this.cityName,
      this.mobileNo,
      this.password});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        cnic: map['cnic'],
        cityName: map['cityName'],
        mobileNo: map['mobileNo'],
        password: map['password']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'cnic': cnic,
      'mobileNo': mobileNo,
      'cityName': cityName,
      'password': password
    };
  }
}
