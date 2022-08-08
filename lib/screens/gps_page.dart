import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GpsPage extends StatefulWidget {

  GpsPage({Key? key}) : super(key: key);
  @override
  State<GpsPage> createState() => _GpsPageState();
}
class _GpsPageState extends State<GpsPage> {
  get shouldLogOut => null;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference? users;
  String userID="";
  String userName="";
  @override
  void initState () {
    super.initState();
    Future.delayed(Duration.zero, () async => {
      //users= firestore.collection('users')
      getUsers()
    });
  }
void getUsers() async {
  await firestore.collection('users').get().then((value) {
    value.docs.forEach((element) {
      print(element.data().keys.first);
      print(element.data().keys.first.runtimeType);
      print(element.data().values.first.toString());
      print(element.data().values.first..toString().runtimeType);
     setState(() {
       userID=element.data().keys.first;
       userName=element.data().values.first.toString();
     });
    });
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPS Co-ordinates'),
        actions: [
          // Log Out Button
          Padding(
            padding: const EdgeInsets.all(8),
            child:
            GestureDetector(child: const Icon(Icons.logout), onTap: (){}),
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(userID),
            Text(userName),
          ],


        )
      ),
    );
  }
}


