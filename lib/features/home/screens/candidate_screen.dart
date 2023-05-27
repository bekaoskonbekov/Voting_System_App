import 'package:flutter/material.dart';

class CandidateScreen extends StatelessWidget {
  const CandidateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          Expanded(
            flex: 3,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 30,
                    ),
                    Text(
                      'Lorem Ipsum',
                    )
                  ],
                );
              },
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 0,
              mainAxisSpacing: 20,
            ),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey,
                    ),
                    child: Image.asset(
                      'assets/map.png',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Кандидаты',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ],
              );
            },
          ),
        ]),
      ),
    );
  }
}
