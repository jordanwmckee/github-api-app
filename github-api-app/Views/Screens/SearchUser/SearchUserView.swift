//
//  UserView.swift
//  github-api-app
//
//  Created by Jordan McKee on 8/16/23.
//

import SwiftUI
import SafariServices

struct SearchUserView: View {
   @State private var usernameInput: String = ""
   @ObservedObject var vm = UserViewModel()
   @State private var safariOpen = false
   
   var body: some View {
      NavigationView {
         VStack(spacing: 15) {
            if vm.user != nil {
               BasicInfoView(userViewModel: vm, safariOpen: $safariOpen)
               FollowersView(userViewModel: vm, safariOpen: $safariOpen)
            }
            Spacer()
            TextField("Enter a Github username", text: $usernameInput)
               .autocapitalization(.none)
               .padding()
               .textFieldStyle(RoundedBorderTextFieldStyle())
               .onSubmit {
                  Task {
                     vm.user = await vm.fetchUser(username: usernameInput)
                     if vm.user != nil {
                        vm.followers = await vm.fetchFollowers(username: vm.user!.login)
                     }
                  }
               }
         }
         .padding()
         .navigationBarTitle("Find Users", displayMode: .inline)
//         .navigationBarItems(leading:
//            NavigationLink(destination: ProfileView()) {
//               Text("Profile")
//            }
//         )
      }
   }
}

struct GithubUserView_Previews: PreviewProvider {
   static var previews: some View {
      SearchUserView()
   }
}

