import 'package:flutter/material.dart';
import 'garage_screen.dart';
import '../utils/json_loader.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<List<dynamic>> loadGarages() async {
    return await loadJsonData('assets/data/garage_data.json');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SE Garages')),
      body: FutureBuilder<List<dynamic>>(
        future: loadGarages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading Garages'));
          } else {
            final garages = snapshot.data ?? [];
            return ListView.builder(
              itemCount: garages.length,
              itemBuilder: (context, index) {
                final garage = garages[index];
                return ListTile(
                  leading: Image.asset(
                    'assets/' + garage['image'],
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover
                  ),
                  title: Text(garage['name'], style: TextStyle(fontSize: 20)),
                  subtitle: Row(
                    children: <Widget>[
                      Text('อยู่ในเครือ: '),
                      ...garage['insurers'].map((insurer) =>                       Container(
                        margin:  EdgeInsets.only(right: 8),
                        child: DecoratedBox(
                          decoration: const BoxDecoration(color: Colors.blue),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(insurer, style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      )).toList()
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GarageScreen(garage: garage),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}