import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

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
                self.tableView.reloadData()
            }
        }
        viewModel.errorHasOcurred = { error in
            print(error)
        }
    }

    // MARK: - Functions
    private func setupUI() {
        configure(this: tableView)
    }
}

// MARK: - TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    private func configure(this tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CharacterCell.identifier,bundle: nil),
                           forCellReuseIdentifier: CharacterCell.identifier)
        tableView.layer.masksToBounds = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.viewModel.loadMoreCharacter(currentItem: indexPath.row)
        if let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.identifier) as? CharacterCell {
            cell.character = viewModel.characters[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: - Go to detail
    }
}
