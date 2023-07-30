import Foundation

final class CharactersNetworkDatasource  {
    let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}

extension CharactersNetworkDatasource: CharacterDatasourceProtocol {

    func getCharactersAndNextPage(for page: Int) async throws -> PaginationDTO? {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)") else {
            throw NetworkError.invalidURL
        }
        return try await networkManager.fetchData(from: url, responseType: PaginationDTO.self)
    }

    func getCharactersAndNextPageWhenSearching(this name: String, for page: Int) async throws -> PaginationDTO? {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?name=\(name)&page=\(page)") else {
            throw NetworkError.invalidURL
        }
        return try await networkManager.fetchData(from: url, responseType: PaginationDTO.self)
    }
}
