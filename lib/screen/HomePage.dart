import 'dart:convert';
import 'package:final_630710340/models/weather.dart';
import 'package:final_630710340/screen/London.dart';
import 'package:final_630710340/screen/Nakhon_Pathom.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _dio = Dio(BaseOptions(responseType: ResponseType.plain));
  List<Weather>? _weather;
  String? _error;

  void getWeather() async {
    try {
      setState(() {
        _error = null;
      });

      // await Future.delayed(const Duration(seconds: 3), () {});


      final response = await _dio.get('https://cpsu-test-api.herokuapp.com/api/1_2566/weather/current?city=Bangkok');

      if (response.data != null) {
        final jsonData = json.decode(response.data.toString());
        setState(() {
          _weather = Weather.fromJson(jsonData) as List<Weather>?;
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
      debugPrint('Error: ${e.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (_error != null) {
      body = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_error!),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              getWeather();
            },
            child: const Text('RETRY'),
          )
        ],
      );
    } else if (_weather == null) {
      body = const Center(child: CircularProgressIndicator());
    } else {
      body = Row(
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Bangkok'),
              )
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Nakhon_Pathom()),
                  );
                },
                child: const Text('Nakhon Pathom'),
              )
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const London()),
                  );
                },
                child: const Text('London'),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _weather!.length,
                itemBuilder: (context, index) {
                  var weather = _weather![index];
                  Column(
                    children: [
                      Text(
                        "${weather.city}",
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.black),
                      ),
                      Text(
                        "${weather.country}",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal,color: Colors.black),
                      ),
                      Text(
                        "${weather.lastUpdate}",
                        style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                      ),
                    ],
                  );
                  Row(
                    children: [
                      Image.network("https://cdn.weatherapi.com/weather/128x128/day/116.png"),
                      Text("Partly cloudy",style: TextStyle(fontSize: 20, color: Colors.black)
                      ),],
                  );

                }),
          )
        ],
      );
    }
    return Scaffold(body: body);
  }
}
