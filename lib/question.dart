import 'package:flutter/material.dart';

import 'package:toggle_accordion/models/question.dart';

class QandA extends StatefulWidget {
  final Question question;

  const QandA({Key key, this.question}) : super(key: key);

  @override
  _QandAState createState() => _QandAState();
}

class _QandAState extends State<QandA> {
  bool showInfo = false;

  void toggle() {
    setState(() {
      showInfo = !showInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.question.title;
    final info = widget.question.info;
    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      trailing: MaterialButton(
        shape: CircleBorder(),
        color: Colors.grey[200],
        child: Icon(
          showInfo ? Icons.remove : Icons.add,
          color: Colors.red[800],
        ),
        onPressed: () => toggle(),
      ),
      subtitle: Text(showInfo ? info : ''),
    );
  }
}
