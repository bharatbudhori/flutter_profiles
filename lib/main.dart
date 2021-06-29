import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_task_app/controller/profile_controller.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
              icon: Icon(Icons.filter_alt_sharp),
              onPressed: () {
                Get.bottomSheet(Container(
                  height: 300,
                ));
              })
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     profileController.addDataToServer();
      //   },
      // ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Profile').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data.docs.map<Widget>(
              (documnets) {
                return Card(
                  margin: EdgeInsets.all(5),
                  elevation: 10,
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(documnets['imageUrl']),
                      ),
                    ),
                    title: Text(documnets['Name']),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
