import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - IBOutlets
    //TODO: - Add Outlets

    // MARK: - Properties
    var viewModel: HomeViewModelProtocol!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupUI()
        viewModel?.viewDidLoad()
    }

    private func setupBindings() {
        viewModel.listCharactersUpdated = {
            DispatchQueue.main.async {
                // Table view reload data
            }
        }
        viewModel.errorHasOcurred = { error in
            print(error)
        }
    }

    // MARK: - Functions
    private func setupUI() {
        // TODO: - Setup table
    }
}
