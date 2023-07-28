import Foundation

final class CharacterLocalDatasource  {
    let cacheManager: CacheManagerProtocol
    
    init(cacheManager: CacheManagerProtocol) {
        self.cacheManager = cacheManager
    }
}

extension CharacterLocalDatasource: CharacterDatasourceProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> PaginationDTO? {
        return cacheManager.get(PaginationDTO.self, forKey: "\(page)")
    }
    
    func getCharactersAndNextPageWhenSearching(this name: String, for page: Int) async throws -> PaginationDTO? {
        return cacheManager.get(PaginationDTO.self, forKey: "\(name) + \(page)")
    }
}
