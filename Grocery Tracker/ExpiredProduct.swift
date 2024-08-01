//
//  ExpiredProduct.swift
//  Grocery Tracker
//
//  Created by Praval Gautam on 01/08/24.
//

import SwiftUI

struct ExpiredProduct: View {
    @State private var productCounts: [UUID: Int] = [:] //MARK: Expired Product Count
    var body: some View {
        VStack {
            HStack {
                Text("Expired Products")
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                Spacer()
            }
            ScrollView(showsIndicators: false) {
                ForEach(expiredProductData, id: \.id) { item in
                    productExp(image: item.image, ProductName: item.itemName, id: item.id)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width - 20)
    }
}
// function for expired  products view
extension ExpiredProduct {
    private func productExp(image: String, ProductName: String, id: UUID) -> some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(ProductName)
                    .font(.system(size: 22))
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                Text("By Grocery Tracker")
                    .foregroundColor(.gray)
                HStack {
                    Button(action: {
                        if let count = productCounts[id] {
                            productCounts[id] = max(count - 1, 0)
                        } else {
                            productCounts[id] = 0
                        }
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.green)
                            .cornerRadius(10)
                            .clipShape(Circle())
                    }
                    Text("\(productCounts[id, default: 0])")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                    Button(action: {
                        productCounts[id, default: 0] += 1
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(4)
                            .background(Color.green)
                            .clipShape(Circle())
                    }
                }
                Button {
                    // TODO: handle add to cart
                } label: {
                    Text("Add to Cart")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .padding(10)
                }
                .background(Color.green)
                .cornerRadius(20)
                Spacer()
            }
            Spacer()
        }
    }
}


#Preview {
    ExpiredProduct()
}
