class AppLinkApi {
  static String linkServeurName = "http://192.168.72.52/ecommerce";
  //

  // //===================================Image===================================//

  // static String imagesCategories = "$linkServeurName/upload/categories";

  // static String imagesItems = "$linkServeurName/upload/items";
  // //===================================Test===================================//
  // static String test = "$linkServeurName/test.php";
  // //===================================auth===================================//

  //static String signup = "$linkServeurName/auth/signup.php";
  static String login = "$linkServeurName/admin/auth/login.php";
 

  //===================================Forgetpassword===================================//

  static String checkemail =
      "$linkServeurName/admin/forgetpassword/checkemail.php";
  static String resetpassword =
      "$linkServeurName/admin/forgetpassword/resetpassword.php";
  static String verifycode =
      "$linkServeurName/admin/forgetpassword/verifycode.php";

  //===================================Home===================================//

  static String homepage = "$linkServeurName/home.php";

//order
  static String ordersprepare =
      "$linkServeurName/admin/order/orderdetails.php";
  static String ordersarchive = "$linkServeurName/admin/order/prepare.php";
 // static String acceptedorders = "$linkServeurName/delivery/order/accepted.php";
  static String approveorder = "$linkServeurName/admin/order/approve.php";
  static String orderview = "$linkServeurName/delivery/order/view.php";
  
  //notifications
  static String notifications = "$linkServeurName/notifications.php";
}