import 'package:app_1/Widgets/Components/Movie_Details.dart';
import 'package:app_1/Widgets/Screens/Auth/AuthWidget.dart';
import 'package:app_1/Widgets/Screens/Home/HomeWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromRGBO(3, 37, 65, 1),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color.fromRGBO(3, 37, 65, 1),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[600]),
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/auth': (context) => AuthWidget(),
        '/home': (context) => HomeWidget(),
        '/home/movie_details': (context) {
          final argument = ModalRoute.of(context)?.settings.arguments;
          if(argument is int){
            return MovieDetails(movieId: argument);
          }else{
            return MovieDetails(movieId: 0);
          }
        }
      },
      initialRoute: '/auth',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Ошибка навигации"),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/auth');
                      },
                      child: Text("Назад"))
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
