import SwiftUI

@main
struct test_appApp: App {
   var body: some Scene {
      WindowGroup {
         UserView()
      }
   }
}

// MARK: - Test

// example MVVM design
/*
 import SwiftUI
 
 // Model
 struct Item {
 let name: String
 let count: Int
 }
 
 // ViewModel
 class ItemViewModel: ObservableObject {
 @Published var items: [Item] = []
 
 func fetchItems() {
 // Simulate fetching data from a network or database
 items = [Item(name: "Item 1", count: 7), Item(name: "Item 2", count: 5)]
 }
 }
 
 // View
 struct ContentView: View {
 @ObservedObject var viewModel = ItemViewModel()
 
 var body: some View {
 VStack {
 Button("Fetch Items") {
 viewModel.fetchItems()
 }
 
 List(viewModel.items, id: \.name) { item in
 HStack {
 Text(item.name)
 Spacer()
 Text(String(item.count))
 }
 }
 }
 }
 }
 
 @main
 struct YourApp: App {
 var body: some Scene {
 WindowGroup {
 ContentView()
 }
 }
 }
 */
