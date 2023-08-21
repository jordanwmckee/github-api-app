import Foundation

final class UserViewModel: ObservableObject {
   @Published var user: User?
   @Published var followers: [User]?
   
   func fetchUser(username: String) async -> User? {
      do {
         return try await sendGetRequest(
            for: User.self,
            from: "https://api.github.com/users/\(username)"
         )
      } catch {
         print("Error fetching user: \(error)")
         return nil
      }
   }
   
   func fetchFollowers(username: String) async -> [User]? {
      do {
         return try await sendGetRequest(
            for: [User].self,
            from: "https://api.github.com/users/\(username)/followers"
         )
      } catch {
         print("Error fetching user: \(error)")
         return nil
      }
   }
}
