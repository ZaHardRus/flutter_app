import 'package:flutter/material.dart';

import 'Movie_Details_Main_Info.dart';

class MovieDetails extends StatefulWidget {
  final int movieId;

  const MovieDetails({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TMDB")),
      body: ColoredBox(
        color: Color.fromRGBO(24, 23, 27, 1),
        child: ListView(
          children: [
            MovieDetailsMainInfo(),
          ],
        ),
      ),
    );
  }
}
