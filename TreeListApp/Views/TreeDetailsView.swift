//
//  TreeDetailsView.swift
//  TreeListApp
//
//  Created by Didi on 28/02/2022.
//

import SwiftUI

struct TreeDetailsView: View {
    let tree: Tree
    var body: some View {
        VStack(spacing: 5){
            Text(tree.species!)
            Text("\(String(tree.height!))m")
            Text("\(String(tree.circumference!))cm")
            Text(tree.address!)
        }
        .navigationTitle(tree.name!)
    }
}
