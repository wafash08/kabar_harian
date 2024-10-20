import 'package:kabar_harian/data/news/news_api_respository.dart';
import 'package:kabar_harian/data/repositories/news_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_repository.g.dart';

@riverpod
NewsRepository newsRepository(NewsRepositoryRef ref) => NewsApiRespository();
