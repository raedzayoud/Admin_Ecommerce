
import 'package:admin_ecommerce/core/class/crud.dart';
import 'package:admin_ecommerce/linkapi.dart';

class ResetpasswordData {
  Crud crud;

  ResetpasswordData(this.crud);

  postData(String password, String email) async {
    var response = await crud.postData(AppLinkApi.resetpassword, {
      "email": email,
      "password": password,
    });

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
