import 'package:flutter/material.dart';
import 'package:quiz_application/quizBrain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

quizBrain q = quizBrain();

class _MyHomePageState extends State<MyHomePage> {
  List<Icon> scoreKeeper = [];

  Function quizAgain() {
    setState(() {
      scoreKeeper.removeRange(0, scoreKeeper.length);
      q.setNum(0);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    q.getQuestion(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text(
                    'TRUE',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  color: Colors.teal,
                  onPressed: () {
                    setState(() {
                      bool ans = q.getCorrectAnswer();
                      if (q.isInRange()) {
                        print('R');
                        if (ans == true) {
                          scoreKeeper.add(Icon(
                            Icons.check,
                            color: Colors.teal,
                          ));
                        } else {
                          scoreKeeper.add(Icon(
                            Icons.close,
                            color: Colors.redAccent,
                          ));
                        }
                      }
                      q.nextQuestion(context, quizAgain);
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text('FALSE',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      )),
                  color: Colors.redAccent,
                  onPressed: () {
                    setState(() {
                      bool ans = q.getCorrectAnswer();

                      print('R');
                      if (q.isInRange()) {
                        if (ans == false) {
                          scoreKeeper.add(Icon(
                            Icons.check,
                            color: Colors.teal,
                          ));
                        } else {
                          scoreKeeper.add(Icon(
                            Icons.close,
                            color: Colors.redAccent,
                          ));
                        }
                      }

                      q.nextQuestion(context, quizAgain);
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: scoreKeeper,
              ),
            )
          ],
        ),
      ),
    );
  }
}
