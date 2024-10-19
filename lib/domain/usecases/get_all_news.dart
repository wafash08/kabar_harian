import 'package:kabar_harian/data/repositories/news_repository.dart';
import 'package:kabar_harian/domain/entities/news.dart';
import 'package:kabar_harian/domain/entities/result.dart';
import 'package:kabar_harian/domain/usecases/usecase.dart';

class GetAllNews implements UseCase<Result<List<News>>, GetAllNewsParam> {
  final NewsRepository _newsRepository;

  GetAllNews({required NewsRepository newsRepository})
      : _newsRepository = newsRepository;

  @override
  Future<Result<List<News>>> call(GetAllNewsParam params) async {
    var topHeadlinesNewsResult =
        await _newsRepository.getAllNews(query: params.query);

    if (topHeadlinesNewsResult.isSuccess) {
      return Result.success(topHeadlinesNewsResult.resultValue!);
    } else {
      return Result.failed(topHeadlinesNewsResult.errorMessage!);
    }
  }
}

class GetAllNewsParam {
  final String query;

  GetAllNewsParam({this.query = ''});
}
