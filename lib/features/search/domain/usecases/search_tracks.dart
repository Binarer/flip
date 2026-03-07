import 'package:dartz/dartz.dart';
import 'package:flip/core/error/failures.dart';
import 'package:flip/core/entities/track.dart';
import 'package:flip/features/search/data/models/search/search.dart';
import 'package:flip/features/search/domain/repositories/search_repository.dart';

class SearchTracksUseCase {
  final SearchRepository repository;

  SearchTracksUseCase(this.repository);

  Future<Either<Failure, SearchResultModel>> call(
    String query, {
    SourceType? source,
    int limit = 20,
    int offset = 0,
  }) async {
    if (query.trim().isEmpty) {
      return Left(const ValidationFailure(message: 'Search query cannot be empty'));
    }
    return repository.searchTracks(query, source: source, limit: limit, offset: offset);
  }
}
