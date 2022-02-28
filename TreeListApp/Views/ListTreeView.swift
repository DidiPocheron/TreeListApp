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
        Text("Hello, world!")
            .padding()
            .onAppear(){
                Task {
                    await treeViewModel.getTrees()
                }
            }
    }
}
