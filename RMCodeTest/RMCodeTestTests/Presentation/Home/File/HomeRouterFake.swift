import Foundation
@testable import RMCodeTest

final class HomeRouterFake: HomeRouterProtocol {
    private(set) var goToDetailCalled: Bool = false

    func goToDetail(character: RMCodeTest.Character) {
        self.goToDetailCalled = true
    }
}
