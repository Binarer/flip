import 'package:dartz/dartz.dart';
import 'package:flip/core/error/failures.dart';
import 'package:flip/features/library/data/models/library/library.dart';

import 'package:flip/features/library/domain/repositories/library_repository.dart';

class GetUserLibrary {
  final LibraryRepository repository;

  GetUserLibrary(this.repository);

  Future<Either<Failure, UserLibraryModel>> call() {
    return repository.getUserLibrary();
  }
}
