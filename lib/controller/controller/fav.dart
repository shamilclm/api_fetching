import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:singleapi_fetching/core/objectbox/fav_objectbox.dart';
import 'package:singleapi_fetching/core/utils/snak_bar_utils.dart';
import 'package:singleapi_fetching/model/objectbox/fav_model.dart';
import 'package:singleapi_fetching/objectbox.g.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fav.g.dart';

@riverpod
class News extends _$News {
  late final Box<FavsEntityModel> box;
  @override
  List<FavsEntityModel>? build() {
    box = FavsObjectBoxStore.instance.favBox;
    try {
      return box.getAll().toList();
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> addFavs(FavsEntityModel model, BuildContext context) async {
    try {
      box.put(model);
      state = box.getAll();
      showSnackBar(context, 'Added to favs', color: Colors.green);
    } catch (e) {
      log(e.toString());
      showSnackBar(context, 'An error occured, try again', color: Colors.red);
    }
  }

  Future<void> removeFromFav(int? id, BuildContext context) async {
    try {
      box.remove(id!);
      state = box.getAll();
      Navigator.pop(context);
      showSnackBar(context, 'Removed from favs', color: Colors.red);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<bool> checkObjectboxExistance(
      Box<FavsEntityModel> box, String title) async {
    Query<FavsEntityModel> queries =
        box.query(FavsEntityModel_.title.equals(title)).build();

    int resultCount = queries.count();
    return resultCount > 0;
  }
}
