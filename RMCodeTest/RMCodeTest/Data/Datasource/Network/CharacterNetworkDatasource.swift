import Foundation

final class CharactersNetworkDatasource: CharacterDatasourceProtocol {
    let networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func getCharactersAndNextPage(for page: Int) async throws -> PaginationDTO? {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)") else {
            throw NetworkError.invalidURL
        }
        return try await networkManager.fetchData(from: url, responseType: PaginationDTO.self)
    }
}
