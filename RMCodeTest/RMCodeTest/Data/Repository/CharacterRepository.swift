import Foundation

protocol CharacterRepositoryProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> Pagination
}

final class CharacterRepository: CharacterRepositoryProtocol {
    let cacheManager: CacheManagerProtocol
    let localDatasource: CharacterDatasourceProtocol
    let networkDatasource: CharacterDatasourceProtocol

    init(cacheManager: CacheManagerProtocol,
         localDatasource: CharacterDatasourceProtocol,
         networkDatasource: CharacterDatasourceProtocol) {
        self.cacheManager = cacheManager
        self.localDatasource = localDatasource
        self.networkDatasource = networkDatasource
    }

    func getCharactersAndNextPage(for page: Int) async throws -> Pagination {
        guard let localPagination = try await localDatasource.getCharactersAndNextPage(for: page) else {
            let networkPagination = try await networkDatasource.getCharactersAndNextPage(for: page)
            cacheManager.set(networkPagination, forKey: "\(page)")
            return Pagination(dto: networkPagination!)
        }
        return Pagination(dto: localPagination)
    }
}
