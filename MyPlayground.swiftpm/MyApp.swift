import SwiftUI

@main
struct MyApp: App {
    init() {
        print("Hello, World from MyApp!");
        let a = 7
        let b = 4
        print("Sonuc = \(a * b)")
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
