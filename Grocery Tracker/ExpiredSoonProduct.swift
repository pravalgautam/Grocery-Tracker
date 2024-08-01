//
//  ExpiredSoonProduct.swift
//  Grocery Tracker
//
//  Created by Praval Gautam on 01/08/24.
//

import SwiftUI


struct ExpiredSoonProduct: View {
    @State var itemCounts: [UUID: Int] = [:] //MARK: Expired Soon Count
    var body: some View {
        VStack {
            HStack {
                Text("Expired Soon Products")
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                Spacer()
            }
            ScrollView(showsIndicators: false) {
                ForEach(expiredSoonData,id: \.id) { item in
                    productExp(image: item.image, productName: item.itemName, id: item.id)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width - 20)
    }
// function for product that are going to expire soon
    private func productExp(image: String, productName: String, id: UUID) -> some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(productName)
                    .font(.system(size: 22))
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                Text("By Grocery Tracker")
                    .foregroundColor(.gray)
                HStack {
                    Button(action: {
                        if let count = itemCounts[id], count > 0 {
                            itemCounts[id] = count - 1
                        }
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.green)
                            .cornerRadius(10)
                            .clipShape(Circle())
                    }
                    Text("\(itemCounts[id, default: 0])")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                    Button(action: {
                        itemCounts[id, default: 0] += 1
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(4)
                            .background(Color.green)
                            .cornerRadius(10)
                            .clipShape(Circle())
                    }
                }
                Button(action: {
                    // TODO: Handle view details of each expired soon Product
                }) {
                    Text("Add to Cart")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.green)
                        .cornerRadius(20)
                }
            }
            Spacer()
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    ExpiredSoonProduct()
}
