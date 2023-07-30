import XCTest
@testable import RMCodeTest

final class CharacterDTOMock {
    static func getListMock() -> PaginationDTO {
        let info = InfoDTO(count: 1,
                           pages: 20)

        let character = [CharacterDTO(image: "urlImage",
                                      name: "Dummy",
                                      status: "Dead",
                                      species: "species",
                                      type: "type",
                                      gender: "gender",
                                      location: CharacterPlaceDTO(name: "location", url: ""),
                                      origin: CharacterPlaceDTO(name: "origin", url: ""))]

        return PaginationDTO(info: info,
                             results: character)
    }
}
