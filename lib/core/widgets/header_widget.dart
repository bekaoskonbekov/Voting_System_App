import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final IconButton icon;
  const HeaderWidget({
    required this.title,
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: icon),
            Container(
              height: 180,
              width: 280.0,
              padding: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: Center(
                child: Image.asset('assets/map.png'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Text(title, style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
