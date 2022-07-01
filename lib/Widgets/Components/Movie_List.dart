import 'package:app_1/Utils/AppImages.dart';
import 'package:flutter/material.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final _moviesData = [
    Movie(
        id: 1,
        score: 0.85,
        title: "Star wars ep.1",
        date: "April 7, 19989",
        description:
            "Мальчику с далекой планеты суждено изменить судьбу галактики. Зрелищное, но недооцененное начало великой саги",
        image: AppImages.wars),
    Movie(
        id: 2,
        score: 0.80,
        title: "Star wars ep.2",
        date: "April 7, 19989",
        description:
            "Мальчику с далекой планеты суждено изменить судьбу галактики. Зрелищное, но недооцененное начало великой саги",
        image: AppImages.wars),
    Movie(
        id: 3,
        score: 0.97,
        title: "Star wars ep.3",
        date: "April 7, 19989",
        description:
            "Мальчику с далекой планеты суждено изменить судьбу галактики. Зрелищное, но недооцененное начало великой саги",
        image: AppImages.wars),
    Movie(
        id: 4,
        score: 0.78,
        title: "Star wars ep.4",
        date: "April 7, 19989",
        description:
            "Мальчику с далекой планеты суждено изменить судьбу галактики. Зрелищное, но недооцененное начало великой саги",
        image: AppImages.wars)
  ];

  var _filteredMovies = <Movie>[];

  final _searchFieldController = TextEditingController();

  void _onMovieTap(int index) {
    final filmId = _moviesData[index].id;
    Navigator.of(context).pushNamed('/home/movie_details', arguments: filmId);
  }

  void _searchMovies() {
    final query = _searchFieldController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _moviesData.where((Movie element) {
        return element.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _moviesData;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _moviesData;
    _searchFieldController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(top: 70),
            itemCount: _filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, index) {
              final movie = _filteredMovies[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(5, 3))
                        ],
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Image(image: movie.image),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15),
                                Text(movie.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                SizedBox(height: 15),
                                Text(
                                  movie.date,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[500]),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  movie.description,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 15),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => _onMovieTap(index),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ))
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchFieldController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withAlpha(236),
                border: OutlineInputBorder(),
                label: Text("Поиск")),
          ),
        )
      ],
    );
  }
}

class Movie {
  final int id;
  final double score;
  final AssetImage image;
  final String title;
  final String date;
  final String description;

  Movie(
      {required this.id,
      required this.score,
      required this.title,
      required this.date,
      required this.description,
      required this.image});
}
