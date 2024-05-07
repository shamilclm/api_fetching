import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message, {required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      margin: const EdgeInsets.all(24),
      behavior: SnackBarBehavior.floating,
      content: Text(message),
    ),
  );
}
// class AddFav {
//   final Box<FavsEntityModel> box = FavsObjectBoxStore.instance.favBox;

//   Future<void> addFavs(FavsEntityModel model, BuildContext context) async {
//     try {
//       box.put(model);
//       // state = box.getAll();
//       showSnackBar(context, 'Added to favs', color: Colors.green);
//     } catch (e) {
//       log(e.toString());
//       showSnackBar(context, 'An error occured, try again', color: Colors.red);
//     }
//   }

//   Future<void> removeFromFav(int id) async {
//     try {
//       box.remove(id);
//     } catch (e) {
//       log(e.toString());
//     }
//   }

//   List<FavsEntityModel>? build() {
//     final box = FavsObjectBoxStore.instance.favBox;
//     try {
//       return box.getAll().toSet().toList();
//     } catch (e) {
//       log(e.toString());
//     }
//     return null;
//   }
// }