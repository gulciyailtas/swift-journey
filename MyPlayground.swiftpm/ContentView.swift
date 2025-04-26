import SwiftUI

struct ContentView: View {
    var body: some View {
        let _ = print("Hello, World! from SwiftUI");
        
        let _ = print("Hello, World \(2 + 3) World")
        
        let x = 4
        let y = 5
        
        let _ = print("Toplam = \(x + y)")
        
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
    }
}
