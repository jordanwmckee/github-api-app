import SwiftUI

struct SafariButton: View {
   var text: String
   var url: URL
   
   @Binding var safariOpen: Bool
   
   var body: some View {
      Button(text) {
         safariOpen.toggle()
      }
      .sheet(isPresented: $safariOpen) {
         SafariView(url: url)
      }
   }
}
