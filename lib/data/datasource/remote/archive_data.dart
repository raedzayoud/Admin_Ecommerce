
import 'package:admin_ecommerce/core/class/crud.dart';
import 'package:admin_ecommerce/linkapi.dart';

class ArchiveData {
  Crud crud;

  ArchiveData(this.crud);

  getDataArchive(String deliveryid) async {
    var response = await crud.postData(AppLinkApi.ordersarchive, {
      "deliveryid":deliveryid
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