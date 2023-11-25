import Foundation

struct UserNicknameDataModel: Codable {
    let isExist: Bool
    
    enum CodingKeys: CodingKey {
        case isExist
    }
}
