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
    
    
    @State var isProfileExpanded: Bool = true
    @State var isRecentlyCreatedExpanded: Bool = true
    @State var subviewHeight : CGFloat = 100

    
    
    var body: some View {
      
   
        
        List{
            
            
            Label("Profile", systemImage: "person.crop.circle")
            
            
            VStack(alignment: .leading) {
                 
                    
                    Label("Recently Created", systemImage: "arrow.circlepath")
                        .labelStyle(TitleAndIconLabelStyle())
                        .frame(width: 200, height: 20)
                        .padding()
                    HStack{
                        
                        Label("Password 1", image: "r.square.on.square.fill")
    
                       Spacer(minLength: 4)
                        
                        Label("1Password Account", systemImage: "key.viewfinder")
                        
                        Spacer(minLength: 4)
                        
                        Label("Mario", systemImage: "person.crop.square.filled.and.at.rectangle")
                    }
                }.background(GeometryReader {
                    Color.clear.preference(key: ViewHeightKey.self,
                                           value: $0.frame(in: .local).size.height)
                })
                .onPreferenceChange(ViewHeightKey.self) { subviewHeight = $0 }
                .frame(height: isRecentlyCreatedExpanded ? subviewHeight : 30, alignment: .top)
                .clipped()
                .frame(maxWidth: .infinity)
                        .transition(.move(edge: .bottom))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.5)) {
                                isRecentlyCreatedExpanded.toggle()
                            }
                        }
            
            
            
        }.navigationTitle("Home")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value + nextValue()
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
