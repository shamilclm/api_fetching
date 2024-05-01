import 'package:dio/dio.dart';
import 'package:singleapi_fetching/model/api_model.dart';

class ApiService {
  final dio = Dio();

  Future<List<Article>> fetchdata() async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&apiKey=8aa8f4f91bb5414cbe669cd59f08092a');
      if (response.statusCode == 200) {
        final data = response.data;
        final dat = <Article>[];
        for (final a in data['articles']) {
          dat.add(Article.fromJson(a));
        }
        return dat;
      } else {
        throw Exception('Failed to load customers');
      }
    } catch (error) {
      throw Exception('Failed to fetch customers: $error');
    }
  }
}
