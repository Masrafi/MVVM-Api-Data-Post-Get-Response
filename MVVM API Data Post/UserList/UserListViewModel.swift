//
//  UserListViewModel.swift
//  MVVM API Data Fetch
//
//  Created by Masrafi Anam on 28/7/24.
//

import Foundation

@MainActor
final class UserListViewModel: ObservableObject {
    
    @Published var users: [UserModel]?
    @Published var userError: UserError?
    @Published var shouldShowAlert = false
    @Published var isLoading = false
    
    func getUsers(name : String, id : String, email : String) async {
        print(name)
        print(id)
        print(email)
        isLoading = true
        do {
            self.users = try await WebService.getUsersData(name: name, id: id, email: email)
            self.isLoading = false
        } catch(let error) {
            userError = UserError.custom(error: error)
            shouldShowAlert = true
            isLoading = false
        }
    }
}
