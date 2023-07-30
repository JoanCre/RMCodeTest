import Foundation
@testable import RMCodeTest

final class HomeUseCaseFake: CharacterUseCaseProtocol {

    var error: NetworkError?
    var isEmpty: Bool = false

    func getCharactersAndNextPage(for page: Int) async throws -> ([RMCodeTest.Character], Bool) {
        if let error = self.error {
            throw error
        }

        return isEmpty ? ([], false) : (CharacterMock.characrers, true)
    }

    func getCharactersAndNextPageWhenSearching(this name: String,
                                               for page: Int) async throws -> ([RMCodeTest.Character], Bool) {
        if let error = self.error {
            throw error
        }

        return isEmpty ? ([], false) : (CharacterMock.characrers, true)
    }
}
