//import 'package:cloud_firestore/cloud_firestore.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ProfileController profileController = Get.put(ProfileController());
  double age = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_sharp),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    color: Colors.amber,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text(
                            'Set Age',
                            style: TextStyle(fontSize: 25),
                          ),
                          Slider.adaptive(
                            value: age,
                            min: 0,
                            max: 100,
                            divisions: 10,
                            label: age.round().toString(),
                            onChanged: (double value) {
                              //profileController.fetchData(age);
                              setState(() {
                                age = value;
                              });
                            },
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              profileController.fetchData(age);
                            },
                            child: Text(
                              'Apply Filter',
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          profileController.addDataToServer();
        },
      ),
      body: GetBuilder(
        init: profileController,
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.usertList.length,
            itemBuilder: (BuildContext context, index) {
              return Card(
                margin: EdgeInsets.all(5),
                elevation: 10,
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        controller.usertList[index].imageUrl,
                      ),
                    ),
                  ),
                  title: Text(controller.usertList[index].name),
                  subtitle: Text(controller.usertList[index].gender),
                  trailing: Text(
                    controller.usertList[index].age.toString(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
