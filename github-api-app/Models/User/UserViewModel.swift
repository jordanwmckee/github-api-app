import Foundation

final class UserViewModel: ObservableObject {
   @Published var user: User?
   
   func findUser(username: String) async {
      do {
         self.user = try await sendGetRequest(for: User.self, from: "https://api.github.com/users/\(username)")
      } catch {
         print("Unhandled error: \(error)") // Catch any other errors
      }
   }
}
