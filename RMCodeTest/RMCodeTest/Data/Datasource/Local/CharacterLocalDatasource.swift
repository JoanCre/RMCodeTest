import Foundation

final class CharacterLocalDatasource: CharacterDatasourceProtocol {
    let cacheManager: CacheManagerProtocol

    init(cacheManager: CacheManagerProtocol) {
        self.cacheManager = cacheManager
    }

    func getCharactersAndNextPage(for page: Int) async throws -> PaginationDTO? {
        return cacheManager.get(PaginationDTO.self, forKey: "\(page)")
    }
}
