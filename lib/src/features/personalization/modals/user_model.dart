import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/formatters/formatter.dart';

class UserModel {
  final String id;
  // final String? displayName;
  String firstName;
  String lastName;
  // final String username;
  final String email;
  final String phoneNumber;
  final String? password;
  String profilePicture;
  final String? uid;

  UserModel({
    required this.id,
    required this.profilePicture,
    this.uid,
    // this.displayName,
    required this.firstName,
    required this.lastName,
    // this.username,
    required this.email,
    required this.phoneNumber,
    this.password,
  });

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNo => TcFormatter.formatPhoneNumber(phoneNumber!);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName){
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length>1?nameParts[1].toLowerCase():'';

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;

  }

  static UserModel empty()=> UserModel(id: '', lastName: '', firstName: '',email: '',phoneNumber: '',profilePicture: '',password: '',);
  Map<String, dynamic>toJson() {
    return {
      // "DisplayName": displayName,
      "FirstName": firstName,
      "LastName": lastName,
      "Email": email,
      "PhoneNumber": phoneNumber,
      // 'Username':username,
      "ProfilePicture": profilePicture,
      "Password": password,
      // "UID": uid,
    };
  }


  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data()!=null){
      final data = document.data()!;
      return UserModel(
        id: document.id,
        // displayName: data["DisplayName"]??'',
        firstName: data["FirstName"]??'',
        lastName: data["LastName"]??'',
        email: data["Email"]??'',
        phoneNumber: data["Phone"]??'',
        password: data["Password"]??'',
        profilePicture: data["ProfilePicture"]??'',
      );
    } else {
      return UserModel.empty();
    }
  }
}