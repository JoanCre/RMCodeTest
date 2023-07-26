import Foundation

final class CharacterUseCase {
    let repository: CharacterRepositoryProtocol

    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
}

protocol CharacterUseCaseProtocol {
    func getCharactersAndNextPageWhenSearching(for page: Int) async throws -> ([Character], Bool)
}

extension CharacterUseCase: CharacterUseCaseProtocol {
    func getCharactersAndNextPageWhenSearching(for page: Int) async throws -> ([Character], Bool) {
        let pagination = try await repository.getCharactersAndNextPage(for: page)
        return (pagination.characters, pagination.hasNextPage)
    }
}
