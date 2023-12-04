import Foundation

class RegisterService {
    static let shared = RegisterService()
    private init() {}
    
    func makeRequestBody(usreName: String,
                         password: String,
                         nickName: String) -> Data? {
        do {
            let data = RegisterRequestBody(username: usreName,
                                           password: password,
                                           nickname: nickName)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: "http://3.39.54.196/api/v1/members")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let body = body {
            request.httpBody = body
        }
        
        return request
    }
    
    func PostRegisterData(usreName: String,
                          password: String,
                          nickName: String) async throws -> Int {
        do {
            guard let body = makeRequestBody(usreName: usreName,
                                             password: password,
                                             nickName: nickName)
            else { throw NetworkError.requstEncodingError }
            
            let request = self.makeRequest(body: body)
            let (_, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            return httpResponse.statusCode
        } catch {
            throw error
        }
        
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}
