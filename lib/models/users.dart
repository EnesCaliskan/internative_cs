class User{
  final String Id;
  final String FirstName;
  final String LastName;
  final String FullName;
  final String Email;
  final String BirthDate;
  final String ProfilePhoto;
  final List<dynamic> FriendIds;

  User({
  required this.Id,
  required this.FirstName,
  required this.LastName,
  required this.FullName,
  required this.Email,
  required this.BirthDate,
  required this.ProfilePhoto,
  required this.FriendIds,
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        Id: json['Id'] as String,
        FirstName: json['FirstName'] as String,
        LastName: json['LastName'] as String,
        FullName: json['FullName'] as String,
        Email: json['Email'] as String,
        BirthDate: json['BirthDate'] as String,
        ProfilePhoto: json['ProfilePhoto'] as String,
        FriendIds: json['FriendIds'] as List<dynamic>,
    );
  }




}

