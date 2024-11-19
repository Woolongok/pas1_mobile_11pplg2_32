import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg2_32/models/league.dart';

class DetailsTablet extends StatelessWidget {
  final Teams model;

  const DetailsTablet({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("User Details"),
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Profile Picture Column
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        model.picture,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "${model.name}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              const SizedBox(width: 24),

              // Details Column
            ])));
  }
}
