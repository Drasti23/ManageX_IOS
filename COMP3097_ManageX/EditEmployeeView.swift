//
//  EditEmployeeView.swift
//  ManageX
//
//  Created by Drasti Parikh on 2025-02-28.
//

import SwiftUI

struct EditEmployeeView: View {
    @State private var employeeName: String
    @State private var employeeRole: String
    
    var employee: Employee
    var onSave: (Employee) -> Void
    
    init(employee: Employee, onSave: @escaping (Employee) -> Void) {
        _employeeName = State(initialValue: employee.name)
        _employeeRole = State(initialValue: employee.role)
        self.employee = employee
        self.onSave = onSave
    }
    
    var body: some View {
        VStack {
            Text("Edit Employee")
                .font(.title)
                .padding()

            TextField("Employee Name", text: $employeeName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Employee Role", text: $employeeRole)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                let updatedEmployee = Employee(id: employee.id, name: employeeName, role: employeeRole)
                onSave(updatedEmployee)
            }) {
                Text("Save Changes")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    EditEmployeeView(employee: Employee(id: "1", name: "John Doe", role: "Manager"), onSave: { _ in })
}
