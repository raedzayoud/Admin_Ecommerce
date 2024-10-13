import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    // Initialize Firebase
    await Firebase.initializeApp();
    
    // Activate Firebase App Check (Optional if you are using it)
    await FirebaseAppCheck.instance.activate();

    // Initialize SharedPreferences
    sharedPreferences = await SharedPreferences.getInstance();
    
    // Subscribe to Firebase Messaging topic "services"
    await FirebaseMessaging.instance.subscribeToTopic("services");

    return this;
  }
}

// Function to initialize services before app starts
initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
