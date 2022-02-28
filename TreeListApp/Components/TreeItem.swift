//
//  TreeItem.swift
//  TreeListApp
//
//  Created by Didi on 28/02/2022.
//

import SwiftUI

struct TreeItem: View {
    let tree: Tree
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5){
                Text(tree.name!)
                Text(tree.species!)
            }
            .padding(.leading, 5)
            .frame(maxWidth: 150, alignment: .leading)
            
            Spacer()
            
            Text(tree.address!)
                .padding(.trailing, 5)
                .lineLimit(2)
                .frame(maxWidth: 150, alignment: .trailing)
        }
    }
}

struct TreeItem_Previews: PreviewProvider {
    static var previews: some View {
        let tree = Tree(placeId: "", name: "Tilleul", species: "Espece", height: 20, circumference: 100, address: "Une très longue adresse sur plus de 2 lignes car je veux tester")
        TreeItem(tree: tree)
            .previewLayout(.fixed(width: 500, height: 80))
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}
