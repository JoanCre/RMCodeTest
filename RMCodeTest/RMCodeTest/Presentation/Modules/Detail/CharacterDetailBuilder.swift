import UIKit

final class CharacterDetailBuilder: CharacterDetailBuilderProtocol {
    static func build(character: Character) -> CharacterDetailViewController {
        let viewController = CharacterDetailViewController()
        let viewModel = CharacterDetailViewModel(character: character)
        viewController.viewModel = viewModel
        return viewController
    }
}
