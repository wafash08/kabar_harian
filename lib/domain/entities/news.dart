import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kabar_harian/domain/entities/source.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class News with _$News {
  const factory News({
    required Source source,
    required String author,
    required String title,
    required String description,
    required String url,
    String? urlToImage,
    required String publishedAt,
    required String content,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
