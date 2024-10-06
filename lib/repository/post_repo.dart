import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class PostRepo{
  Future<bool> postRepoFun({int? userId, int? id, String? title, String? body}) async {

      try{

        final Map<String, dynamic> bodyEncode = {"userId": userId, "id": id, "title": title, "body": body };
        http.Response response = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"), body:bodyEncode );
        if(response.statusCode == 201){
          debugPrint(response.body);
          return true;
        }else{
          return false;
        }
      }catch (e){
             throw Exception("Response Not Found...");
      }
  }
}