import Foundation

protocol CharacterDatasourceProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> PaginationDTO?
}
