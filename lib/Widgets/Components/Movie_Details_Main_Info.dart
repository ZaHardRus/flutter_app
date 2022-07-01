import 'package:app_1/Utils/AppImages.dart';
import 'package:flutter/material.dart';

import 'Progress_Bar.dart';

class MovieDetailsMainInfo extends StatelessWidget {
  const MovieDetailsMainInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopPoster(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _MovieName(),
        ),
        _Score(),
        SizedBox(height: 12),
        _Summary(),
        SizedBox(height: 12),
        Text(
          "Overview",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            textAlign: TextAlign.justify,
            "Мирная и процветающая планета Набу. Торговая федерация, не желая платить налоги, вступает в прямой конфликт с королевой Амидалой, правящей на планете, что приводит к войне. На стороне королевы и республики в ней участвуют два рыцаря-джедая: учитель и ученик, Квай-Гон-Джин и Оби-Ван Кеноби...",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Джордж Лукас", style: TextStyle(color: Colors.white)),
                SizedBox(height: 8),
                Text("Сценарий", style: TextStyle(color: Colors.white)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Джордж Лукас", style: TextStyle(color: Colors.white)),
                SizedBox(height: 8),
                Text("Сценарий", style: TextStyle(color: Colors.white)),
              ],
            )
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Джордж Лукас", style: TextStyle(color: Colors.white)),
                SizedBox(height: 8),
                Text("Сценарий", style: TextStyle(color: Colors.white)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Джордж Лукас", style: TextStyle(color: Colors.white)),
                SizedBox(height: 8),
                Text("Сценарий", style: TextStyle(color: Colors.white)),
              ],
            )
          ],
        )
      ],
    );
  }
}

class _TopPoster extends StatelessWidget {
  const _TopPoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AppImages.warsBig),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Image(
            image: AppImages.wars,
            height: 200,
          ),
        )
      ],
    );
  }
}

class _MovieName extends StatelessWidget {
  const _MovieName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: "Star Wars ep.1",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        TextSpan(
            text: " 1987",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 18)),
      ]),
      maxLines: 3,
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "R, 04.29.2021, (US), Action Adventure War, 1h 49m",
      maxLines: 3,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 15),
    );
  }
}

class _Score extends StatelessWidget {
  const _Score({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: RadialPercentWidget(
                        child: Text(
                          "72",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        percent: 0.72,
                        fillColor: Colors.transparent,
                        lineColor: Colors.green,
                        freeColor: Colors.lightBlueAccent.withOpacity(0.5),
                        lineWidth: 5),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Score"),
                ],
              )),
          Container(width: 1, height: 15, color: Colors.grey),
          TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.play_arrow),
                  Text("Play Trailer"),
                ],
              )),
        ],
      ),
    );
  }
}
