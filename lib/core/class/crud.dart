import 'dart:convert';
import 'package:admin_ecommerce/core/class/statusrequest.dart';
import 'package:admin_ecommerce/core/function/checkinternet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(
      String linkapi, Map<String, String> data) async {
    try {
      if (await checkInternet()) {
        var reponse = await http.post(Uri.parse(linkapi), body: data);
        if (reponse.statusCode == 200 || reponse.statusCode == 201) {
          Map reponsebody = jsonDecode(reponse.body);
          print(reponsebody);
          return Right(reponsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverexception);
    }
  }
}
