import 'package:get/get.dart';

validinput(String val, int min, int max, String type) {
  // if (type == "username") {
  //   if (!GetUtils.isUsername(val)) {
  //     return "not valid username";
  //   }
  // }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }
  if (type == "age") {
    if (!GetUtils.isNumericOnly(val)) {
      return "not valid age";
    }
  }
  if (val.isEmpty) {
    return "can't be empty";
  }
  if (val.length < min) {
    return "can't less than $min";
  }
  if (val.length > max) {
    return "can't less than $max";
  }
}
