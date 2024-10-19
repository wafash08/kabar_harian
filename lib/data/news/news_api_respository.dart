import 'package:dio/dio.dart';
import 'package:kabar_harian/data/repositories/news_repository.dart';
import 'package:kabar_harian/domain/entities/news.dart';
import 'package:kabar_harian/domain/entities/result.dart';

class NewsApiRespository implements NewsRepository {
  final Dio? _dio;
  final String _accessToken = '340327c1c11043f580b43ce089421205';

  NewsApiRespository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<List<News>>> getAllNews({query = ''}) async {
    try {
      final response = await _dio!.get(
          'https://newsapi.org/v2/everything?q=$query&apiKey=$_accessToken');
      final articles =
          List<Map<String, dynamic>>.from(response.data['articles']);

      return Result.success(articles
          .map(
            (e) => News.fromJson(e),
          )
          .toList());
    } on DioException catch (e) {
      return Result.failed(e.message ?? 'Failed to retrieve news');
    }
  }

  @override
  Future<Result<List<News>>> getTopHeadlinesNews() async {
    try {
      final response = await _dio!.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=$_accessToken');
      final articles =
          List<Map<String, dynamic>>.from(response.data['articles']);

      return Result.success(articles
          .map(
            (e) => News.fromJson(e),
          )
          .toList());
    } on DioException catch (e) {
      return Result.failed(
          e.message ?? 'Failed to retrieve top headlines news');
    }
  }
}
