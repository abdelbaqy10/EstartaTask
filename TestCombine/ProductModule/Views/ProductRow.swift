//
//  ProductRow.swift
//  TestCombine
//
//  Created by abdelbaqy yassin on 22/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductRow: View {
    
    var model: Product
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 9) {
            AnimatedImage(url: URL(string: model.imageUrlsThumbnails?.first ?? ""))
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                
            VStack(alignment: .leading) {
                Text(model.name ?? "Not Found")
                    .font(.headline)
                HStack {
                    Text("Price: ")
                        .foregroundColor(Color.gray)
                    Text(model.price ?? "Not Found")
                    Spacer(minLength: 4)
                    navigationLink()
                }
            }
        }
                .shadow(color: .gray, radius: 10, x: 1, y: 4)

    }
    
    fileprivate func navigationLink() -> some View {
        
        return NavigationLink(destination:
                                Text("Detail")
        ) {
            Text("")
                .foregroundColor(.blue)
                .font(Font.system(size: 17))
        }
    }

}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProductRow(model: Product(createdAt: "", price: "45 AED", name: " product name", id: "", imageIDS: [], imageUrls: [], imageUrlsThumbnails: []))
        }
        .previewLayout(.sizeThatFits)
    }
}
