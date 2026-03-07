import 'package:dartz/dartz.dart';
import 'package:flip/core/error/error/failures.dart';
import 'package:flip/core/entities/track.dart';
import 'package:flip/features/search/data/models/search/search.dart';

abstract class SearchRepository {
  /// Search tracks across sources.
  Future<Either<Failure, SearchResultModel>> searchTracks(
    String query, {
    SourceType? source,
    int limit = 20,
    int offset = 0,
  });

  /// Get search suggestions.
  Future<Either<Failure, List<String>>> getSuggestions(String query);
}
