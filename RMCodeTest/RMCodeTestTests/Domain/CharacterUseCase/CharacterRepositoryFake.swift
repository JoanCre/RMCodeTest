import XCTest
@testable import RMCodeTest

final class CharacterRepositoryFake: CharacterRepositoryProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> RMCodeTest.Pagination {
        return  Pagination(dto: CharacterDTOMock.getListMock())
    }

    func getCharactersAndNextPageWhenSearch(this name: String, for page: Int) async throws -> RMCodeTest.Pagination {
        return Pagination(dto: CharacterDTOMock.getListMock())
    }
}
