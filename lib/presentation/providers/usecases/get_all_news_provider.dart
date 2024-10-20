import 'package:kabar_harian/domain/usecases/get_all_news.dart';
import 'package:kabar_harian/presentation/providers/repositories/news_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_news_provider.g.dart';

@riverpod
GetAllNews getAllNews(GetAllNewsRef ref) =>
    GetAllNews(newsRepository: ref.watch(newsRepositoryProvider));
