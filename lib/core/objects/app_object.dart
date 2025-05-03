/// [LmgObject] abstract class for extends objects which requires
///
/// [fromMap] and [toMap] methods
abstract class LmgObject<T> {
  int key = 0;

  T fromMap(dynamic dynamicData);

  Map<String, dynamic> toMap(T object);
  //
  // List<T> fromMapList(List<dynamic> dynamicDataList);
  //
  // List<Map<String, dynamic>> toMapList(List<T> objectList);
}
