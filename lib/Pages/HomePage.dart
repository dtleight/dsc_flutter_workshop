
import 'package:flutter/material.dart';
import '../APIRouter.dart';
import '../Movie.dart';


class HomePage extends StatefulWidget {
  const HomePage();

  @override
  createState()
  {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
{

  TextEditingController searchText = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        actions: [Container(width: 250, child: TextField(controller: searchText, onChanged: (String text){ setState(() {

        });}, ))],
      ),
      body:FutureBuilder<List<Movie>>(
      future: APIRouter().getMovies(searchText.text),
          builder: (context, snapshot)
          {
            if(snapshot.hasData)
              {
            List<Movie> movies = snapshot.data ?? [];
            print(movies);
              return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(movies[index].posterURL),
                      title: Text(movies[index].title),
                      subtitle: Text(movies[index].year),
                    );
                  });
            }
            else
              {
                return CircularProgressIndicator();
              }
      })



    );
  }
}
