;

class VKLoginUseCase {
  final VKAuthRepository repository;
  
  VKLoginUseCase(this.repository);
  
  Future<Either<Failure, VKToken>> call(String code) async {
    return await repository.login(code);
  }
}
