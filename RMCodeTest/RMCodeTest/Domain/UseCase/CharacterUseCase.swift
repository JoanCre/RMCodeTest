import Foundation

final class CharacterUseCase {
    let repository: CharacterRepositoryProtocol

    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
}

protocol CharacterUseCaseProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> ([Character], Bool)
    func getCharactersAndNextPageWhenSearching(this name: String, for page: Int) async throws -> ([Character], Bool)
}

extension CharacterUseCase: CharacterUseCaseProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> ([Character], Bool) {
        let pagination = try await repository.getCharactersAndNextPage(for: page)
        return (pagination.characters, pagination.hasNextPage)
    }
    
    func getCharactersAndNextPageWhenSearching(this name: String, for page: Int) async throws -> ([Character], Bool) {
        let pagination = try await repository.getCharactersAndNextPageWhenSearch(this: name, for: page)
        return (pagination.characters, pagination.hasNextPage)
    }
}
