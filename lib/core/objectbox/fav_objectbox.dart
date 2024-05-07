import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:singleapi_fetching/model/objectbox/fav_model.dart';
import 'package:singleapi_fetching/objectbox.g.dart';

class FavsObjectBoxStore {
  static FavsObjectBoxStore? _instance;
  final Store store;
  late final Box<FavsEntityModel> favBox;

  FavsObjectBoxStore._create(this.store) {
    favBox = store.box<FavsEntityModel>();
  }

  static FavsObjectBoxStore get instance {
    return _instance!;
  }

  static Future<void> create() async {
    if (_instance == null) {
      final docsDir = await getApplicationDocumentsDirectory();
      final store = await openStore(
        directory: path.join(docsDir.path, 'favs'),
      );
      _instance = FavsObjectBoxStore._create(store);
    }
  }
}
