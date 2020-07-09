import 'dart:convert';

import 'package:complex_json_flutter/model.dart';
import 'package:complex_json_flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Parsing extends StatefulWidget {
  @override
  _ParsingState createState() => _ParsingState();
}

class _ParsingState extends State<Parsing> {

  Future<String> loadingPersonFromAsset ()async{
    return await rootBundle.loadString('json/person.json');
  }

  Future loadPerson() async{
    String jsonString =await loadingPersonFromAsset();
    final jsonResponse=json.decode(jsonString);
    Person person=new Person.fromJson(jsonResponse);
    print(person.name);
    print(person.place);
    print(person.images); //this will print the instances of images present
    print(person.images[0]); //this will print the first instance of images
    print(person.images[0].name); //this will print the name of first instance of images
    print(person.address.street_no);
    print(person.address.details.town);

    print("loading......");
    Services.getphoto().then((value) {
     print(value.length);
      print(value[0].title);
    }
    );

  }

  @override
  void initState() {
   
    super.initState();
    loadPerson();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}