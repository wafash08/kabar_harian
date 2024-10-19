import 'package:kabar_harian/domain/entities/news.dart';
import 'package:kabar_harian/domain/entities/result.dart';

abstract interface class NewsRepository {
  Future<Result<List<News>>> getTopHeadlinesNews();
  Future<Result<List<News>>> getAllNews({String query = ''});
}
