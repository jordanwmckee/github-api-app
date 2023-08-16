//
//  UserView.swift
//  github-api-app
//
//  Created by Jordan McKee on 8/16/23.
//

import SwiftUI

struct UserView: View {
   @State private var usernameInput: String = ""
   @ObservedObject var vm = UserViewModel()
   
   var body: some View {
      NavigationView {
         VStack(spacing: 20) {
            if vm.user != nil {
               AsyncImage(url: URL(string: vm.user?.avatar_url ?? "")) { image in
                  image
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 120, height: 120)
                     .clipShape(Circle())
               } placeholder: {
                  Circle()
                     .frame(width: 120, height: 120)
                     .foregroundColor(.secondary)
               }
               
               VStack(spacing: 5) {
                  Text(vm.user?.name ?? "")
                     .bold()
                     .font(.title2)
                  
                  Text("@\(vm.user?.login ?? "")")
                     .foregroundColor(.secondary)
                     .font(.subheadline)
               }
               
               Text(vm.user?.bio ?? "")
                  .padding()
                  .multilineTextAlignment(.center)
            }
            Spacer()
            HStack {
               TextField("Enter a Github username", text: $usernameInput)
                  .autocapitalization(.none)
                  .padding()
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .onSubmit {
                     Task {
                        await vm.findUser(username: usernameInput)
                     }
                  }
            }
         }
         .padding()
         .navigationBarTitle("User Search", displayMode: .inline) // Set the title
         .navigationBarItems(leading:
                              NavigationLink(destination: ProfileView()) {
            Text("Profile")
         }
         )
      }
   }
}

struct GithubUserView_Previews: PreviewProvider {
   static var previews: some View {
      UserView()
   }
}

