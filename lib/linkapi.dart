class AppLinkApi {
  static String linkServeurName = "http://192.168.98.161/ecommerce";
  //

  // //===================================Image===================================//

  static String imagesCategories = "$linkServeurName/upload/categories";

  static String imagesItems = "$linkServeurName/upload/items";
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
  static String ordersprepare = "$linkServeurName/admin/order/orderdetails.php";
  static String ordersarchive = "$linkServeurName/admin/order/prepare.php";
  // static String acceptedorders = "$linkServeurName/delivery/order/accepted.php";
  static String approveorder = "$linkServeurName/admin/order/approve.php";
  static String orderview = "$linkServeurName/delivery/order/view.php";

  //notifications
  static String notifications = "$linkServeurName/notifications.php";

  //Categories
  static String categoriesview = "$linkServeurName/admin/categories/view.php";
  static String categoriesadd = "$linkServeurName/admin/categories/add.php";
  static String categoriesedit = "$linkServeurName/admin/categories/edit.php";
  static String categoriesdelete =
      "$linkServeurName/admin/categories/delete.php";

  //items
  static String itemsview = "$linkServeurName/admin/items/view.php";
  static String itemsadd = "$linkServeurName/admin/items/add.php";
  static String itemsedit = "$linkServeurName/admin/items/edit.php";
  static String itemsdelete = "$linkServeurName/admin/items/delete.php";
}
