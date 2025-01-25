import 'package:flutter/material.dart';

class GarageScreen extends StatelessWidget {
  final Map<String, dynamic> garage;

  const GarageScreen({Key? key, required this.garage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(garage['name']),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/' + garage['image'],
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on),
                    Text(garage['location']),
                  ]
                ),
                Container(
                  margin: EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(garage['detail'])
                ),
                ...garage['insurers'].map((insurer) => Row(
                  children: [
                    Icon(Icons.check),
                    Text(insurer),
                  ],
                )).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
