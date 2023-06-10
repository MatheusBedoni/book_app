import 'package:book_app/core/models/volume.dart';
import 'package:book_app/repository/books/book_repository.dart';
import 'package:book_app/repository/books/books_repository_impl.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
    BookRepository bookRepository = BookRepositoryImpl();
    List<Volume> listVolume = [];
    bool loading = false;

    setSearchVolume(String volume){
       getVolumes(volume: volume);
    }


    getVolumes({String? volume})async{
      loading = true;
      listVolume = await bookRepository.getVolumes(volume: volume!);
      print(listVolume.first.volumeInfo!.title);
      loading = false;
      update();
    }
}