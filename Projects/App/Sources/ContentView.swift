import SwiftUI
import BookStore

public struct ContentView: View {
    public init() {}

    public var body: some View {
        TabView {
            BookStoreView()
                .tabItem {
                    Label("bookstore", systemImage: "book")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
