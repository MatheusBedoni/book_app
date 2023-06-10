
import 'package:book_app/core/models/volume.dart';
import 'package:book_app/repository/books/book_repository.dart';
import 'package:book_app/repository/data_source/remote/book_remote_data.dart';


class BookRepositoryImpl implements BookRepository {
  final BookRemoteData remote = BookRemoteData();




  @override
  Future? getVolumes({String? volume})async {
    final remoteData = await remote.getVolumes(volume: volume);
    final List<Volume> volumes = List<Volume>.from(remoteData!.map((model) => Volume.fromJson(model)));
    return volumes;
  }
}
