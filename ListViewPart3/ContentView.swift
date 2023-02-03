
import SwiftUI

struct PersonModel: Identifiable {
    let id = UUID()
    let name: String
}

class People: ObservableObject {
    @Published var people = [
        PersonModel(name: "さとう"),
        PersonModel(name: "すずき"),
        PersonModel(name: "たなか")
    ]
}

struct ContentView: View {
    @ObservedObject private var students = People()
    var body: some View {
        VStack {
            List {
                ForEach(students.people) { person in
                    Text(person.name)
                }
                .onDelete(perform: delete)
            }
            Button(action: {
                print(students.people)
            }) {
                Text("解析")
            }
        }
    }
    func delete(offsets: IndexSet) {
        students.people.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
