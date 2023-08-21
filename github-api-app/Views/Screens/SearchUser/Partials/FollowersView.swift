import SwiftUI

struct FollowersView: View {
   
   @ObservedObject var userViewModel: UserViewModel
   @Binding var safariOpen: Bool
   
   var body: some View {
      VStack {
         Text("Followers")
            .font(.title3)
            .bold()
         
         List {
            if let followers = userViewModel.followers {
               ForEach(followers) { follower in
                  
                  HStack {
                     AsyncImage(url: URL(string: follower.avatar_url)) { image in
                        image
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 50)
                           .clipShape(Circle())
                     } placeholder: {
                        Circle()
                           .frame(width: 50)
                           .foregroundColor(.secondary)
                     }
                     
                     Text(follower.login)
                        .font(.headline)
                  }
                  .swipeActions(edge: .trailing) {
                     Button(action: {
                        // Perform action for the first swipe action
                     }) {
                        Label("Action 1", systemImage: "heart")
                     }
                     .tint(.green)
                     
                     Button(action: {
                        // Perform action for the second swipe action
                     }) {
                        Label("Action 2", systemImage: "message")
                     }
                     .tint(.blue)
                  }
               }
            }
         }
         .cornerRadius(10)
         .listStyle(PlainListStyle())
      }
   }
}
