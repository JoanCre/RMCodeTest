import Foundation

final class CharacterDetailViewModel: CharacterDetailViewModelProtocol {

    // MARK: - Properties
    var character: Character
    var characterUpdated: (() -> Void)?

    init(character: Character) {
        self.character = character
    }
}

    // MARK: - Functions
extension CharacterDetailViewModel {
    func viewDidLoad() {
    }

    func viewDidAppear() {
    }

    func viewDidDisappear() {
    }
}
