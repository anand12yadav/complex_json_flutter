import 'dart:convert';
import 'package:complex_json_flutter/model.dart';
import 'package:http/http.dart' as http;

class Services{
 static const url="https://jsonplaceholder.typicode.com/photos";
 static Future<List<Album>> getphoto() async {
    try{
      final response=await http.get(url);
      if(response.statusCode ==200){
          List<Album> list= parsePhoto(response.body);
          return list;
      }else{
        throw Exception;
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
}

 List<Album> parsePhoto(String responseBody){
  final parsed=json.decode(responseBody).cast<Map<String,dynamic>>();
 return parsed.map<Album>((json)=> Album.fromJson(json)).toList();
}