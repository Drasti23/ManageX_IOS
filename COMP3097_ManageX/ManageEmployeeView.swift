//
//  ManageEmployeeView.swift
//  ManageX
//
//  Created by Drasti Parikh on 2025-02-28.
//

import SwiftUI

struct ManageEmployeeView: View {
    @State private var employees: [Employee] = [
            Employee(id: "1", name: "John Doe", role: "Manager"),
            Employee(id: "2", name: "Jane Smith", role: "Cashier")
        ]
        
    @State private var showAlert = false
    @State private var newEmployeeAdded = false
    
    // Load employees from UserDefaults when the view appears
    init() {
        _employees = State(initialValue: EmployeeManager.loadEmployees())
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(employees) { employee in
                    HStack {
                        Text(employee.name)
                            .font(.headline)
                        Spacer()
                        NavigationLink(destination: EditEmployeeView(employee: employee, onSave: { updatedEmployee in
                            if let index = employees.firstIndex(where: { $0.id == updatedEmployee.id }) {
                                employees[index] = updatedEmployee
                                EmployeeManager.saveEmployees(employees) // Save updated list to UserDefaults
                            }
                        })) {
                            Text("Edit")
                                .foregroundColor(.blue)
                        }
                    }
                }
                
                NavigationLink(destination: AddEmployeeView(onSave: { newEmployee in
                    employees.append(newEmployee)
                    EmployeeManager.saveEmployees(employees) // Save updated list to UserDefaults
                    showAlert = true
                    newEmployeeAdded = true // Trigger navigation after the employee is added
                }), isActive: $newEmployeeAdded) {
                    Text("Add Employee")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                }
                .padding()
            }
            .navigationTitle("Manage Employees")
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Success"),
                    message: Text("Employee added successfully."),
                    dismissButton: .default(Text("OK"), action: {
                        // Optionally reset newEmployeeAdded if needed
                        newEmployeeAdded = false
                    })
                )
            }
        }
        .onDisappear {
            // Save employees to UserDefaults when the view disappears (just in case)
            EmployeeManager.saveEmployees(employees)
        }
    }
}

#Preview {
    ManageEmployeeView()
}
