//
//  StudentListView.swift
//  e05
//
//  Created by Florian Weingartshofer on 21.01.23.
//

import SwiftUI

struct StudentListView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "lastname", ascending: true)],
        animation: nil
    )
    private var students: FetchedResults<Student>
    
    @State var showAddStudentView: Bool = false
    @State var searchText: String = ""

    
    var body: some View {
        NavigationStack {
            List(students.filter {
                searchText.isEmpty ?  true : "\($0.firstname!) \($0.lastname!)".contains(searchText)
            }) {
                 student in
                NavigationLink("\(student.firstname!) \(student.lastname!)") {
                    StudentDetailView(student: student)
                }
        
            }
            .navigationTitle("Students")
            .toolbar {
                ToolbarItem {
                    Button {
                        showAddStudentView = true
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddStudentView) { AddStudentView(showAddStudent: $showAddStudentView)
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Students")
        }
    }

}

struct StudentListView_Previews: PreviewProvider {
    static var previews: some View {
        StudentListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
