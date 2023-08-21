import SwiftUI

struct ContentView: View {
   
   var body: some View {
      TabView {
         SearchUserView()
            .tabItem() {
               Image(systemName: "magnifyingglass")
               Text("Search")
            }
         ProfileView()
            .tabItem() {
               Image(systemName: "person.crop.circle.fill")
               Text("Profile")
            }
      }
   }
}
