import 'package:dsc_tutorial_workshop/Movie.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class APIRouter
{
  String API_KEY = "";



   Future<List<Movie>> getMovies(String query) async
  {
    final response = await http.get(Uri.parse("http://www.omdbapi.com/?s=" + query + "&apikey=" + API_KEY ));
    var results = json.decode(response.body)["Search"] as List<dynamic>;
    return results.map((e) => Movie(e['Title'], e['Year'], e['Poster'])).toList();
    //return json.decode(response.body)['Search'].map((e)=>  new Movie(e['Title'] as String, e['Year'] as String , e['Poster'] as String )).toList();
  }
}