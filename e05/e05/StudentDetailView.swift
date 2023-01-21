//
//  StudentDetailView.swift
//  e05
//
//  Created by Florian Weingartshofer on 21.01.23.
//

import SwiftUI

struct StudentDetailView: View {
    @State var student: Student
    
    var body: some View {
            VStack {
                Text("Student Details").font(.headline)
                Text("Firstname: \(student.firstname!)")
                Text("Lastname: \(student.lastname!)")
                Text("Age: \(student.age)")
            }
        
    }
}
