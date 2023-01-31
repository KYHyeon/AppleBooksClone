import SwiftUI

public struct BookStoreView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            ScrollView {
                GradationView()
            }
            .navigationTitle("북스토어")
        }
    }
}

struct GradationView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("소설 및 문학")
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<30) { i in
                        AsyncImage(
                            url: URL(string: "https://picsum.photos/seed/books\(i)/150/200"),
                            content: { $0.resizable() },
                            placeholder: { ProgressView() }
                        )
                        .frame(width: 150, height: 200)
                    }
                }
            }
            Button("모두 보기") {}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BookStoreView()
    }
}
