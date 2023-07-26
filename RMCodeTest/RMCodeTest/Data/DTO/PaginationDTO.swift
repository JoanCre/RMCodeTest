import Foundation

struct PaginationDTO: Codable {
  var info: InfoDTO?
  var results: [CharacterDTO]?
}

struct InfoDTO: Codable {
  var count: Int?
  var pages: Int?
  var next: String?
}
