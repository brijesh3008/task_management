import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// [DbHelper] manage local Database
class DbHelper {

  late Box box;
  late Box prefBox;

  Future<void> initHive() async {
    final document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);
    box = await Hive.openBox('EIPL_BOX');
    prefBox = await Hive.openBox('PREF_BOX');
  }
}
