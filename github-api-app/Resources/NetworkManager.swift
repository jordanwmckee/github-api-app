import Foundation

func sendGetRequest<T: Decodable>(for type: T.Type, from endpoint: String) async throws -> T {
   guard let url = URL(string: endpoint) else {
      throw NetworkErrors.invalidUrl
   }
   
   let (data, response) = try await URLSession.shared.data(from: url)
   
   guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
      throw NetworkErrors.invalidResponse
   }
   
   do {
      return try JSONDecoder().decode(T.self, from: data)
   } catch {
      throw NetworkErrors.invalidData
   }
}

enum NetworkErrors: Error {
   case invalidUrl
   case invalidData
   case invalidResponse
}

