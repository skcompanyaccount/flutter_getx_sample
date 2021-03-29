import 'package:http/http.dart' as http;
import 'dart:convert';

class Api{
  static const String apiUrl="https://jsonplaceholder.typicode.com/users";

  Future<dynamic> fetchUsers()async{
    try{
      final http.Response response=await http.get(Uri.parse(apiUrl));
      final List<dynamic> userList=jsonDecode(response.body);

      return List<Map<String, dynamic>>.from(userList);
    }catch(e){
      return e.toString();
    }
  }

}