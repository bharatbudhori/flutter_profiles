//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_task_app/controller/profile_controller.dart';
import 'package:flutter_task_app/model/Profile.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_sharp),
            onPressed: () {
              Get.to(() => FilterPage());
              // showModalBottomSheet(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return Container(
              //       height: 200,
              //       color: Colors.amber,
              //       child: Center(
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           mainAxisSize: MainAxisSize.min,
              //           children: <Widget>[
              //             const Text(
              //               'Set Age',
              //               style: TextStyle(fontSize: 25),
              //             ),
              //             GetBuilder(
              //                 init: profileController,
              //                 builder: (controller) {
              //                   return Slider.adaptive(
              //                     value: profileController.setAge[0],
              //                     min: 0,
              //                     max: 100,
              //                     divisions: 10,
              //                     label: age.round().toString(),
              //                     onChanged: (var value) {
              //                       //profileController.fetchData(age);
              //                       profileController.updateAge(value);
              //                     },
              //                   );
              //                 }),
              //             TextButton(
              //               onPressed: () async {
              //                 Navigator.of(context).pop();
              //                 await profileController.fetchData(age);
              //               },
              //               child: Text(
              //                 'Apply Filter',
              //                 style: TextStyle(fontSize: 22),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // );
            },
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     profileController.addDataToServer();
      //   },
      // ),
      body: GetBuilder(
        init: profileController,
        builder: (controller) {
          if (profileController.usertList.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage(
                    'https://image.freepik.com/free-vector/no-data-concept-illustration_114360-616.jpg',
                  ),
                ),
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'No user matched your criteria :(',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.teal,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            );
          } else {
            return ListView.builder(
              itemCount: controller.usertList.length,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  margin: EdgeInsets.all(5),
                  elevation: 10,
                  child: ListTile(
                    onTap: () {
                      Get.to(
                        () => UserDetail(
                          user: controller.usertList[index],
                        ),
                      );
                    },
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
          }
        },
      ),
    );
  }
}

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Age Filter'),
      ),
      body: Center(
        child: Container(
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
                  value: profileController.setAge[0],
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: profileController.setAge[0].round().toString(),
                  onChanged: (var value) {
                    setState(() {
                      profileController.setAge[0] = value;

                      //profileController.updateAge(value);
                    });
                  },
                ),
                TextButton(
                  onPressed: () async {
                    await profileController
                        .fetchData(profileController.setAge[0]);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Apply Filter',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserDetail extends StatelessWidget {
  final Profile user;

  UserDetail({
    this.user,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.imageUrl),
              radius: 100,
            ),
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  user.name,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  user.age.toString(),
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  user.gender,
                  style: TextStyle(fontSize: 30),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
