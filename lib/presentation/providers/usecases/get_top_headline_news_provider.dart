import 'package:kabar_harian/domain/usecases/get_top_headlines_news.dart';
import 'package:kabar_harian/presentation/providers/repositories/news_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_top_headline_news_provider.g.dart';

@riverpod
GetTopHeadlinesNews getTopHeadlinesNews(GetTopHeadlinesNewsRef ref) =>
    GetTopHeadlinesNews(newsRepository: ref.watch(newsRepositoryProvider));
