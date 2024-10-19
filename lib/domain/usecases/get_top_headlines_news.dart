import 'package:kabar_harian/data/repositories/news_repository.dart';
import 'package:kabar_harian/domain/entities/news.dart';
import 'package:kabar_harian/domain/entities/result.dart';
import 'package:kabar_harian/domain/usecases/usecase.dart';

class GetTopHeadlinesNews implements UseCase<Result<List<News>>, void> {
  final NewsRepository _newsRepository;

  GetTopHeadlinesNews({required NewsRepository newsRepository})
      : _newsRepository = newsRepository;

  @override
  Future<Result<List<News>>> call(void _) async {
    var topHeadlinesNewsResult = await _newsRepository.getTopHeadlinesNews();

    if (topHeadlinesNewsResult.isSuccess) {
      return Result.success(topHeadlinesNewsResult.resultValue!);
    } else {
      return Result.failed(topHeadlinesNewsResult.errorMessage!);
    }
  }
}
