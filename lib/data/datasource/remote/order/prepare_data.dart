import 'package:admin_ecommerce/core/class/crud.dart';
import 'package:admin_ecommerce/linkapi.dart';

class PrepareData {
  Crud crud;

  PrepareData(this.crud);

  prepare(String ordersid, String usersid, String typeorder) async {
    var response = await crud.postData(AppLinkApi.orderprepare,
        {"ordersid": ordersid, "usersid": usersid, "typeorder": typeorder});

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }
}
