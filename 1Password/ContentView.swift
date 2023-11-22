//
//  ContentView.swift
//  1Password
//
//  Created by Himanshu Kasera on 15/11/23.
//

import SwiftUI

struct Sidebar: View {
    
    @State var isTagsExpanded: Bool = true
    @State var isCategoriesExpanded: Bool = true
    @State var isVaultsExpanded: Bool = true
    
    var body: some View {
        
        List {
            
            
            
            Label("Home", systemImage: "house.fill")
            
            Label("Watchtower", systemImage: "rectangle.portrait.fill")
            
            Label("Search", systemImage: "magnifyingglass")
            
            Label("All Items", systemImage: "creditcard.fill")
            
            Section("Vaults", isExpanded: $isVaultsExpanded) {
                Label("Personal", systemImage: "steeringwheel.circle.fill")
                
                Label("New Vault", systemImage: "plus")
            }
            
            Section("Categories", isExpanded: $isCategoriesExpanded) {
                Label("Logins", systemImage: "key.horizontal.fill")
                
                Label("Identities", systemImage: "person.text.rectangle.fill")
            }
            
           
            Section("Tags", isExpanded: $isTagsExpanded ) {
                Label("Starter Kit", systemImage: "tag.fill")
                
                Label("Archive", systemImage: "archivebox.fill")
                
                Label("Recently Deleted", systemImage: "minus.circle.fill")
            }
            
            
            
            
            
            
        }
        .listStyle(.sidebar)
        
    }
}

struct PrimaryView: View {
    var body: some View {
        
        Label("Profile", systemImage: "person.crop.circle")
        
        Label("Recently Created", systemImage: "arrow.circlepath")
        
        
    }
}

struct Detailview: View {
    var body: some View {
        Text("Detail")
    }
}


struct ContentView: View {
    var body: some View {
        
        NavigationView {
            Sidebar()
            
            PrimaryView()
            
            
        }
        
        
    }
}




#Preview {
    ContentView()
}
