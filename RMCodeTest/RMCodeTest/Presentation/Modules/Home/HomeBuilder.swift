import UIKit

final class HomeBuilder: HomeBuilderProtocol {
    static func build() -> HomeViewController {
        let viewController = HomeViewController()
        let router = HomeRouter(viewController: viewController)
        let characterRepository = CharacterRepository(cacheManager: CacheManager(),
                                                      localDatasource: CharacterLocalDatasource(cacheManager: CacheManager()),
                                                      networkDatasource: CharactersNetworkDatasource(networkManager: NetworkManager()))
        let characterUseCase = CharacterUseCase(repository: characterRepository)
        let viewModel = HomeViewModel(router: router, characterUseCase: characterUseCase)
        viewController.viewModel = viewModel
        return viewController
    }
}
