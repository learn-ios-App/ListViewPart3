import SwiftUI

struct ContentView2: View {
    @State private var people = ["すずき", "さとう", "たなか"]
    var body: some View {
        VStack {
            List {
                ForEach(people, id: \.self) { person in
                    Text(person)
                }
                .onDelete(perform: delete)
            }
            Button(action: {
                print(people)
            }) {
                Text("解析")
            }
        }
    }
    func delete(offsets: IndexSet) {
        people.remove(atOffsets: offsets)
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
