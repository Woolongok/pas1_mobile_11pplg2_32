import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_32/controllers/api_controller.dart';
import 'package:pas1_mobile_11pplg2_32/pages/menus/detail.dart';
import 'package:pas1_mobile_11pplg2_32/pages/menus/mobile_layout/details_mobile.dart';

class NormalMobile extends StatelessWidget {
  final ApiController apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (apiController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: apiController.list.length,
          itemBuilder: (context, index) {
            final model = apiController.list[index];
            return Card(
              child: ListTile(
                title: Text(model.name),
                leading: Image.network(model.picture),
                trailing: IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    apiController.saveFriend(
                      model.name,
                      model.picture,
                    );
                  },
                ),
                onTap: () {
                  Get.to(() => Detail(model: model));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
