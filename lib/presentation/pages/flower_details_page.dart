import 'package:flutter/material.dart';
import 'package:sample_app_zebra_technology/domain/Entities/entity.dart';

class FlowerLandingPage extends StatelessWidget {
  final Flowers flower;
  const FlowerLandingPage({super.key, required this.flower});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(flower.tag[0]),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text("Description"),
          const SizedBox(
            height: 10,
          ),
          Text(flower.description),
        ],
      ),
    );
  }
}
