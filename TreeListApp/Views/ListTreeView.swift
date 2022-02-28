//
//  ContentView.swift
//  TreeListApp
//
//  Created by Didi on 25/02/2022.
//

import SwiftUI

struct ListTreeView: View {
    @ObservedObject var treeViewModel = TreeViewModel()
    
    var body: some View {
        NavigationView {
            if(!treeViewModel.dataLoaded) {
                ProgressView()
                    .onAppear(){
                        Task {
                            await treeViewModel.getTrees()
                        }
                    }
            }else{
                if(treeViewModel.trees.isEmpty){
                    // TODO make ErrorScreen
                    Text("Une erreur est surevenue")
                }else{
                    List(treeViewModel.trees, id: \.fields.placeId) { field in
                        NavigationLink(destination: TreeDetailsView(tree: field.fields)) {
                            TreeItem(tree: field.fields)
                        }
                    }
                    .navigationBarTitle(Text("TreeListTitle"))
                }
            }
        }
    }
}
