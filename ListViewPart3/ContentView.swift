
import SwiftUI

struct PersonModel: Identifiable {
    let id = UUID()
    let name: String
    var check: Bool
}

class People: ObservableObject {
    @Published var people = [
        PersonModel(name: "さとう", check: true),
        PersonModel(name: "すずき", check: false),
        PersonModel(name: "たなか", check: true)
    ]
    func delete(offsets: IndexSet) {
        self.people.remove(atOffsets: offsets)
    }
}

struct ContentView: View {
    @ObservedObject private var students = People()
    var body: some View {
        VStack {
            List {
                ForEach(students.people) { person in
                    ListRaw(person: person)
                }
                .onDelete(perform: students.delete)
            }
            Button(action: {
                print(students.people)
            }) {
                Text("解析する")
            }
        }
    }
}

struct ListRaw: View {
    @State var person: PersonModel
    var body: some View {
        VStack {
            Button(action: {
                person.check.toggle()
            }) {
                if person.check {
                    Text(person.name)
                        .foregroundColor(.red)
                }
                else {
                    Text(person.name)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
