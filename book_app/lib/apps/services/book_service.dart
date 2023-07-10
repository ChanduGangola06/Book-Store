import 'package:book_app/apps/models/book_model.dart';
import 'package:book_app/apps/shared/constants.dart';
import 'package:book_app/apps/shared/utility.dart';
import 'package:dio/dio.dart';

class BookService {
  Constants api = Constants();
  Future<List<BookModel>> getBooks() async {
    try {
      api.sendRequest.options.headers['accept'] = 'application/json';
      Response response = await api.sendRequest.get('/books');
      List list = Utility.isNullEmptyOrFalse(response.data['data'])
          ? []
          : response.data['data'];
      List<BookModel> bookitem = [];
      for (var books in list) {
        bookitem.add(BookModel.fromJson(books));
      }
      return bookitem;
    } catch (e) {
      return [];
    }
  }
}
