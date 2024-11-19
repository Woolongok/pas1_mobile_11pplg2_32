import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/api_controller.dart';

class FavoriteMobile extends StatelessWidget {
  final ApiController controller = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Friends")),
      body: Obx(() {
        if (controller.friends.isEmpty) {
          return Center(
            child: Text("No friends found!"),
          );
        }

        return ListView.builder(
          itemCount: controller.friends.length,
          itemBuilder: (context, index) {
            final friend = controller.friends[index];
            return ListTile(
              title: Text(friend['name']),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(friend['picture']),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () async {
                  await controller.deleteFriend(friend['id']);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
