import 'package:kabar_harian/domain/entities/news.dart';
import 'package:kabar_harian/domain/entities/result.dart';

abstract interface class NewsRepository {
  Future<Result<List<News>>> getTopHeadlines();
  Future<Result<List<News>>> getAllNews();
}
