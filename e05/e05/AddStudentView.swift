//
//  AddStudentView.swift
//  e05
//
//  Created by Florian Weingartshofer on 21.01.23.
//

import SwiftUI

struct AddStudentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var firstname: String = ""
    @State var lastname: String = ""
    @State var age: Int16 = 0
    @Binding var showAddStudent: Bool
    
    var body: some View {
        NavigationView {
            Form() {
                TextField("Firstname", text: $firstname)
                TextField("Lastname", text: $lastname)
                Picker("Age", selection: $age) {
                    ForEach(1 ..< 100) {
                        Text("\($0) Years Old")
                    }
                }
            }
            .navigationBarTitle("Add a new Student", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        saveAndClose()
                    }) {
                        Text("Done").bold()
                    } .disabled(isInvalid())
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        showAddStudent = false
                    }) {
                        Text("Cancel").bold()
                    }
                }
            }
        }

    }
    
    private func isInvalid() -> Bool {
        return firstname.isEmpty || lastname.isEmpty
    }
    
    private func saveAndClose() {
        let student = Student(context: viewContext)
        student.id = UUID()
        student.firstname = firstname
        student.lastname = lastname
        student.age = age
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
        showAddStudent = false
    }
}

struct AddStudentView_Previews: PreviewProvider {
    static var previews: some View {
        AddStudentView(showAddStudent: .constant(true))
    }
}
