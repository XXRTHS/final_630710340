import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:final_630710340/screen/HomePage.dart';
import 'package:final_630710340/screen/Nakhon_Pathom.dart';
import 'package:flutter/material.dart';

class newPage extends StatelessWidget {
  const newPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: London(),
    );
  }
}

class London extends StatelessWidget {
  const London({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
        ],
      ),
    );
  }
}
