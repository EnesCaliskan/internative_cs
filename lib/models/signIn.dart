
class SignIn{
  final String token;

  SignIn({required this.token});

  factory SignIn.fromJson(Map<String, dynamic> json){
    return SignIn(
        token: json['Token'] as String,
    );
  }


}