import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg2_32/local_database/localDBService.dart';
import 'package:pas1_mobile_11pplg2_32/models/league.dart';

class ApiController extends GetxController {
  final String baseUrl = "https://www.thesportsdb.com";
  final LocalDBService localDb = Get.find<LocalDBService>();

  var isLoading = true.obs;
  var list = <Teams>[].obs;
  var friends = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFriends();
    fetchPosts();
  }

  Future<void> loadFriends() async {
    try {
      final data = await localDb.getFriends();
      friends.value = data;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> saveFriend(String name, String picture) async {
    try {
      final isAlreadySaved = friends.any((friend) => friend['name'] == name);

      if (isAlreadySaved) {
        Get.snackbar("Info", "You already saved this friend.");
        return;
      }

      await localDb.addFriend(name, picture);
      await loadFriends();
      Get.snackbar("Success", "Friend saved locally!");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> deleteFriend(int id) async {
    try {
      await localDb.deleteFriend(id);

      friends.value = friends.where((friend) => friend['id'] != id).toList();

      Get.snackbar("Success", "Friend deleted successfully!");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future fetchData() async {
    final response = await http.get(Uri.parse(
        '$baseUrl/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League'));
    if (response.statusCode == 200) {
      return League.fromMap(json.decode(response.body));
    } else {
      throw Exception('Failed to load posts');
    }
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var model = await fetchData();
      list.assignAll(model.teams);
    } finally {
      isLoading(false);
    }
  }
}
