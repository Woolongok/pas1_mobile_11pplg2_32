import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/api_controller.dart';
import '../../menus/detail.dart';

class NormalTablet extends StatelessWidget {
  final ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (apiController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          padding: const EdgeInsets.all(10.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 10.0, // Space between columns
            mainAxisSpacing: 10.0, // Space between rows
            childAspectRatio: 0.75, // Adjust for grid item size
          ),
          itemCount: apiController.list.length,
          itemBuilder: (context, index) {
            final model = apiController.list[index];
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      model.picture,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      model.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.save),
                    onPressed: () {
                      apiController.saveFriend(
                        model.name,
                        model.picture,
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
      backgroundColor:
          Colors.green[50], // Light green background for the entire screen
    );
  }
}
