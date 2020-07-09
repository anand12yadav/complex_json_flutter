class Person{
  final String id;
  final String name;
  final int age;
  final List<String> place;
  final List<Images> images;
  final Address address;


  Person({this.id,this.name,this.age,this.place,this.images,this.address});

  factory Person.fromJson(Map<String,dynamic> json){
    return Person(
        id:json["id"],
        name: json["name"],
        age: json["age"],
        place: parsePlaces(json["place"]),
        address: Address.fromJson(json["address"])
    );
  }

  static List<String> parsePlaces(placesJson){
    List<String> placeList=List<String>.from(placesJson);
    return placeList;
  }

  static List<Images> parseImages(imagesJson){
    var list=imagesJson["images"] as List;
    List<Images> imagesList=list.map((data) => Images.fromjson(data)).toList();
    return imagesList;
  }
}

class Images{
 final  int id;
 final  String name;

 Images({this.id,this.name});

 factory Images.fromjson(Map<String,dynamic> parsedJson){
   return Images(
     id: parsedJson["id"],
     name: parsedJson["name"]
     );
 }
}

class Address{
   final String street_no;
   final Details details;
 Address({this.street_no,this.details});
 factory Address.fromJson(Map<String,dynamic> json){
   return Address(street_no: json['street_no'],
   details: Details.fromJson(json["details"])
   );
 }
}

class Details{
  final int house_no;
  final String town;

  Details({this.house_no,this.town});

  factory Details.fromJson(Map<String,dynamic> json){
    return Details(house_no: json["house_no"],town:json["town"] );
  }
}

class Album{
   final int albumId;
   final int id;
   final String title;
   final String url;
   final String thumbnailUrl;

   Album({this.albumId,this.id,this.title,this.url,this.thumbnailUrl});

   factory Album.fromJson(Map<String,dynamic> json){
     return Album(
       albumId: json["albumId"],
       id: json["id"],
       title: json["title"],
       url: json["url"],
       thumbnailUrl: json["thumbnailUrl"],
     );
   }
}

