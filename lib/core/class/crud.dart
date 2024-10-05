import 'dart:convert';
import 'dart:io';
import 'package:admin_ecommerce/core/class/statusrequest.dart';
import 'package:admin_ecommerce/core/function/checkinternet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

String _basicAuth = 'Basic ' + base64Encode(utf8.encode('raed:raed12'));

Map<String, String> _myheaders = {'authorization': _basicAuth};

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

  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
      String url, Map<String, String> data, File? image,
      [String? namerequest]) async {
    try {
      if (namerequest == null) {
        namerequest = "files";
      }

      var uri = Uri.parse(url);
      var request = http.MultipartRequest("POST", uri);
      request.headers.addAll(_myheaders);

      if (image != null) {
        var length = await image.length();
        var stream = http.ByteStream(image.openRead());
        stream.cast();
        var multipartFile = http.MultipartFile(namerequest, stream, length,
            filename: basename(image.path));
        request.files.add(multipartFile);
      }

      // Add data to request
      data.forEach((key, value) {
        request.fields[key] = value;
      });

      // Send Request
      var myrequest = await request.send();

      // Get Response Body
      var response = await http.Response.fromStream(myrequest);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } catch (e) {
      print('Exception: $e');
      return const Left(StatusRequest.serverexception);
    }
  }
}
