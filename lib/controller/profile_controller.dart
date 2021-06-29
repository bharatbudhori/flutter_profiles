import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  void addDataToServer() {
    var profileCollection = FirebaseFirestore.instance.collection('Profile');
    // adding dummy data in server
    profileCollection.add(
      {
        'Name': 'Jason Jones',
        'Age': 23,
        'Gender': 'male',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkstvneL1UVFnPpjuthvShjgYbPSrdNXIMcw&usqp=CAU',
      },
    );
    profileCollection.add(
      {
        'Name': 'Marry Helena',
        'Age': 18,
        'Gender': 'female',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBklLiQVsa8TmddZ5zrLtYM_LxHoo-p2dfLw&usqp=CAU',
      },
    );
    profileCollection.add(
      {
        'Name': 'Joe Biden',
        'Age': 60,
        'Gender': 'male',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQW7n9Vy7e3K_tPdO_oY5-i9FVw06hIOG5FKA&usqp=CAU',
      },
    );
    profileCollection.add(
      {
        'Name': 'Will Smith',
        'Age': 37,
        'Gender': 'male',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiA2XoTdDp4qbzohAeFSPs2ftDEqUD7tEPhQ&usqp=CAU',
      },
    );
    profileCollection.add(
      {
        'Name': 'Tom Cruise',
        'Age': 35,
        'Gender': 'male',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsLWfhRGKi5rXDo26WACBsX_aVbDYdAakP4w&usqp=CAU',
      },
    );
    profileCollection.add(
      {
        'Name': 'Peter Parker',
        'Age': 20,
        'Gender': 'male',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo60AHRTjw24L31V_JfO3JnGEaNHh9Wi7DRw&usqp=CAU',
      },
    );
    profileCollection.add(
      {
        'Name': 'Jolly Smidth',
        'Age': 28,
        'Gender': 'female',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkstvneL1UVFnPpjuthvShjgYbPSrdNXIMcw&usqp=CAU',
      },
    );
    profileCollection.add(
      {
        'Name': 'Selena Jones',
        'Age': 19,
        'Gender': 'female',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU4g8xUnnDU4kVOp8_-3f3aPDusw_D2AlyXw&usqp=CAU',
      },
    );
    profileCollection.add(
      {
        'Name': 'Shruti Rathore',
        'Age': 22,
        'Gender': 'female',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQllXTxv83WZUoDMYfgH4afUDonCRhFIX6g7Q&usqp=CAU',
      },
    );
    profileCollection.add(
      {
        'Name': 'Sneha Gupta',
        'Age': 24,
        'Gender': 'female',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRCbR-pphuyA-nv-YN0ZyvD3p0u6Jw1rX18g&usqp=CAU',
      },
    );
    profileCollection.add(
      {
        'Name': 'Vishal Thakur',
        'Age': 23,
        'Gender': 'male',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyiFVsLMBnPRwmWFECSkNg7J-omkqIqmjbRA&usqp=CAU',
      },
    );
    profileCollection.add(
      {
        'Name': 'Bharat Budhori',
        'Age': 20,
        'Gender': 'male',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNOhpV67XSI4Vz5Z_L7XoWiH7UzZQDBTzS3g&usqp=CAU',
      },
    );
    profileCollection.add(
      {
        'Name': 'Hellen Keller',
        'Age': 62,
        'Gender': 'female',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUHee9HY50WTW0v8Zkq8BtUohwYhZA87ozWA&usqp=CAU',
      },
    );
    profileCollection.add(
      {
        'Name': 'Jasmine Morgan',
        'Age': 50,
        'Gender': 'female',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTecoInAkROPa_xVGPOPeMPZeW5sDKLloMbNw&usqp=CAU',
      },
    );
    profileCollection.add(
      {
        'Name': 'Morgan Freeman',
        'Age': 54,
        'Gender': 'male',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkHdpaMtNroRoemjX9boEC5ZoEg-vykP0yFA&usqp=CAU',
      },
    );
  }
}
