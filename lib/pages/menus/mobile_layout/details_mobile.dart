import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg2_32/models/league.dart';

class DetailsMobile extends StatelessWidget {
  DetailsMobile({super.key, required this.model});

  Teams model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("League Details"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(model.picture),
              ),
            ),
            SizedBox(height: 20),

            _buildSectionTitle("Basic Info"),
            _buildInfoRow("Name", "${model?.name}"),
            _buildInfoRow("Description",
                "${model?.description}"), // Replace with user.gender

            // Tax File Number
          ],
        ),
      ),
    );
  }

  // Helper widget for section title
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.teal,
      ),
    );
  }

  // Helper widget for displaying key-value pairs
  Widget _buildInfoRow(String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            key,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
