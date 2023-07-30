import Foundation

protocol CharacterRepositoryProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> Pagination
    func getCharactersAndNextPageWhenSearch(this name: String, for page: Int) async throws -> Pagination
}

final class CharacterRepository {
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
}

extension CharacterRepository: CharacterRepositoryProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> Pagination {
        guard let localPagination = try await localDatasource.getCharactersAndNextPage(for: page) else {
            let networkPagination = try await networkDatasource.getCharactersAndNextPage(for: page)
            cacheManager.set(networkPagination, forKey: "\(page)")
            return Pagination(dto: networkPagination!)
        }
        return Pagination(dto: localPagination)
    }

    func getCharactersAndNextPageWhenSearch(this name: String, for page: Int) async throws -> Pagination {
        guard let localPagination = try await localDatasource.getCharactersAndNextPageWhenSearching(this: name, for: page) else {
            let networkPagination = try await networkDatasource.getCharactersAndNextPageWhenSearching(this: name, for: page)
            cacheManager.set(networkPagination, forKey: "\(name) + \(page)")
            return Pagination(dto: networkPagination!)
        }
        return Pagination(dto: localPagination)
    }
}
