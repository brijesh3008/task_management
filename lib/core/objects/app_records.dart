import 'app_object.dart';

/// [LmgPageRecords] contains all the data of pagination of API
abstract class LmgPageRecords<T> extends LmgObject<T> {
  final dynamic totalRecords;
  final dynamic totalPages;
  final dynamic currentPage;
  final dynamic recordsPerPage;
  final dynamic recordsOnThisPage;

  LmgPageRecords({
    required this.totalRecords,
    required this.totalPages,
    required this.currentPage,
    required this.recordsPerPage,
    required this.recordsOnThisPage,
  });

  int get getTotalRecords {
    if (totalRecords is int) {
      return totalRecords as int;
    }

    return int.parse(totalRecords);
  }

  int get getTotalPages {
    if (totalPages is int) {
      return totalPages as int;
    }

    return int.parse(totalPages);
  }
}
