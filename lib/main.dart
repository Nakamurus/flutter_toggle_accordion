import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:toggle_accordion/models/question.dart';
import 'package:toggle_accordion/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'According',
        home: Scaffold(
            backgroundColor: Colors.deepPurple,
            appBar: AppBar(title: Text('Accordion')),
            body: (Padding(
              padding: EdgeInsets.only(top: 32),
              child: Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: Column(
                      children: <Widget>[
                        Text('Questions And Answers About Login',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        FutureBuilder(
                          future: DefaultAssetBundle.of(context)
                              .loadString('assets/data.json'),
                          builder: (context, snapshot) {
                            final parsedJson = json.decode(snapshot.data);
                            final List<Question> questions = parsedJson
                                .map((json) => Question.fromJson(json))
                                .toList()
                                .cast<Question>();
                            return Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: questions.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return QandA(question: questions[index]);
                                },
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))));
  }
}
