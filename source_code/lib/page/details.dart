import 'package:flutter/material.dart';
import 'package:riseup_test/utils/s_size.dart';

import '../models/email_response.dart';

class EmailDetails extends StatefulWidget {
  Hydra_member data;

  EmailDetails({required this.data});

  @override
  State<EmailDetails> createState() => _EmailDetailsState();
}

class _EmailDetailsState extends State<EmailDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.data.subject.toString()),),
      body: SingleChildScrollView(child: Column(children: [
        SizedBox(height: sHeight(10, context),),
        Text('From: '+ widget.data.from!.address.toString()),
        SizedBox(height: sHeight(10, context),),
        Text('Name: '+ widget.data.from!.name.toString()),
        SizedBox(height: sHeight(10, context),),
        Text('Subject: '+ widget.data.subject.toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Name: '+ widget.data.intro.toString()),
        ),
      ],
      ),),
    );
  }
}
