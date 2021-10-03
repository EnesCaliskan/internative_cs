import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internative_cs/models/users.dart';
import 'package:internative_cs/repository/userFetcher.dart';
import 'package:http/http.dart' as http;
import 'package:internative_cs/screens/profile_page.dart';
import 'package:internative_cs/controller/tokenController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    getToken().then((value){
              if(value != ''){
                token = value!;
              }
            });
    return Scaffold(
      body: FutureBuilder<List<User>>(
          future: fetchUsers(http.Client(), token),
          builder: (context, snapshot){
            if(snapshot.hasError) {
              print('An error has occured! ' + snapshot.error.toString());
              return Center(child: Text('An error has occured! ' + snapshot.error.toString()));
            }
            else if(snapshot.hasData) {
              return UserList(users: snapshot.data!);
            }
            else{
              return const Center(
                  child: CircularProgressIndicator(),
              );
            }
          },
      ),
    );
  }
}

class UserList extends StatefulWidget {
  const UserList({Key? key, required this.users}) : super(key: key);
  final List<User> users;

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 20.0, top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Users', style: TextStyle(fontSize: 20.0),),
                IconButton(
                  onPressed: (){
                    clearToken();
                    Navigator.popAndPushNamed(context, '/login');
                  },
                  icon: Icon(Icons.logout, color: Colors.red),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
                itemCount: widget.users.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: ListTile(
                        title: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(widget.users[index].ProfilePhoto),
                              backgroundColor: Colors.transparent,
                              radius: 30.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: Text(
                                widget.users[index].FullName,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage(
                                      users: widget.users,
                                      selectedIndex: index,
                                    ),
                                ),
                            );
                          });
                        },
                      ),
                    ),
                  );
                }
            ),
          )
        ],
    );
  }
}

