import SwiftUI

struct BasicInfoView: View {
   
   @ObservedObject var userViewModel: UserViewModel
   @Binding var safariOpen: Bool
   
   var body: some View {
      VStack(spacing: 20) {
         AsyncImage(url: URL(string: userViewModel.user?.avatar_url ?? "")) { image in
            image
               .resizable()
               .aspectRatio(contentMode: .fit)
               .frame(width: 120, height: 120)
               .clipShape(Circle())
         } placeholder: {
            ProgressView()
         }
         
         VStack(spacing: 5) {
            Text(userViewModel.user?.name ?? "")
               .bold()
               .font(.title2)
            
            SafariButton(
               text: "@\(userViewModel.user?.login ?? "")",
               url: URL(string: userViewModel.user?.html_url ?? "https://github.com")!,
               safariOpen: $safariOpen
            )
         }
         
         Text(userViewModel.user?.bio ?? "")
            .padding()
            .multilineTextAlignment(.center)
      }
   }
}
