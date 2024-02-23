//
//  ContentView.swift
//  HBCUc2- Discovery Page
//
//  Created by JylenHaynes on 2/22/24.
//

import SwiftUI

struct ContentView: View {
    private var listOfUsers = UserList
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    HStack {
                        Text(user.capitalized)
                        Spacer()
                        Image(systemName: "figure.wave")
                            .foregroundColor(Color.blue)
                    }
                    .padding(25)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Discover")
        }
        
    }
    
    var users: [String] {
        let lcUsers = listOfUsers.map { $0.lowercased()}
        
        return searchText == "" ? lcUsers : lcUsers.filter {
            $0.contains(searchText.lowercased())
        }
    }
}
#Preview {
    ContentView()
}
