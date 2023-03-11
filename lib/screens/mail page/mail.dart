import 'package:flutter/material.dart';
import 'package:kyo/screens/mail page/generating_page.dart';

class Mail extends StatelessWidget {
  const Mail({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: (ListTile(
        leading: CircleAvatar(
          child: Text('A'),
        ),
        title: Text('Email Title'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "imed mokrane",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('10:45 AM'),
            Icon(Icons.star_border),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GenPage()),
          );
        },
      )),
    );
  }
}
