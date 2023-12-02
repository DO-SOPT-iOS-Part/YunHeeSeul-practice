import Foundation

class GetInfoService {
    static let shared = GetInfoService()
    private init() {}
    
    func makeRequest(userId: Int) -> URLRequest {
        let url = URL(string: "http://3.39.54.196/api/v1/members/\(userId)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    func GetRegisterData(userId: Int) async throws -> UserInfoDataModel? {
        do {
            let request = self.makeRequest(userId: userId)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            return parseUserInfoData(data: data)
        } catch {
            throw error
        }
        
    }
    
    
    private func parseUserInfoData(data: Data) -> UserInfoDataModel? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(UserInfoDataModel.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}
