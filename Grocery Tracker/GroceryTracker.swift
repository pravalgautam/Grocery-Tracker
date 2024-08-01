//
//  GroceryTracker.swift
//  Grocery Tracker
//
//  Created by Praval Gautam on 01/08/24.
//

import SwiftUI

struct GroceryTracker: View {

    var body: some View {
        ZStack{
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            ScrollView(.vertical,showsIndicators: false){
                VStack {
                    // App name
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width: 35)
                                .foregroundColor(Color.green)
                            Image(systemName: "ellipsis.viewfinder")
                                .foregroundColor(Color.white)
                        }
                        Text("Grocery Tracker")
                            .fontWeight(.semibold)
                        Spacer()
                        Button {
                            // TODO: Handle Subscribe here
                        } label: {
                            HStack {
                                Image(systemName: "crown.fill")
                                    .foregroundColor(Color.white)
                                Text("Subscribe")
                                    .foregroundColor(Color.white)
                                    .font(.headline)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.green)
                            .cornerRadius(50)
                        }
                    }   .frame(width: UIScreen.main.bounds.width - 16)
                    
                    // Recommendation and Offer Section
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            recommendation(image: "recom2", title: "Just for you!", subTitle: "Claim your offer")
                            recommendation(image: "e5", title: "Just for you!", subTitle: "Claim your  offer")
                            
                            
                        } .padding(.leading,10)
                        
                    }
                    
                    // Grocery Budget in Euro
                    
                    HStack{
                        Text("Grocery budget")
                            .fontWeight(.bold)
                        Spacer()
                    } .frame(width: UIScreen.main.bounds.width - 25)
                    
                    groceryBudget()
                    
                    // Expired Products
                    
                    HStack{
                        Text("Expired Products")
                            .fontWeight(.bold)
                        Spacer()
                        
                    } .frame(width: UIScreen.main.bounds.width - 25)
                    VStack{
                        HStack{
                            Text("Total Products")
                                .fontWeight(.bold)
                                .padding(.leading,16)
                            ZStack {
                                Text("\(expiredProductData.count)")
                                    .padding(2)
                                    .foregroundColor(Color.black)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.gray.opacity(0.5))
                                            .frame(width: 35)
                                    )
                            }.padding(.leading,16)
                            Spacer()
                            NavigationLink(destination: ExpiredProduct()) {
                                Text("View all")
                                    .foregroundStyle(.green)
                            }.padding(.trailing,16)
                        }
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(expiredProductData,id: \.id){ item in
                                    totalProducts(image: item.image, productName: item.itemName)
                                }
                            }
                        }
                        
                    }.padding(.vertical,10)
                        .frame(width: UIScreen.main.bounds.width - 16)
                        .background(.white)
                        .cornerRadius(20)
                    
                    // Expired Soon Product

                    HStack{
                        Text("Expired Soon")
                            .fontWeight(.bold)
                        Spacer()
                        
                    } .frame(width: UIScreen.main.bounds.width - 25)
                    VStack{
                        HStack{
                            Text("Total Products")
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            ZStack {
                                Text("\(expiredSoonData.count)")
                                    .padding(2)
                                    .foregroundColor(Color.white)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white.opacity(0.5), lineWidth: 1)
                                            .frame(width: 35)
                                    )
                            }.padding(.leading,16)
                        
                            Spacer()
                            NavigationLink(destination: ExpiredSoonProduct()) {
                                Text("View all")
                                    .foregroundStyle(Color.white)
                            }
                        }
                        ForEach(expiredSoonData.prefix(3),id: \.id){ item in
                            expireSoonProducts(image: item.image, productName: item.itemName, expiryDate: item.date)
                        }
                        
                    }.padding(.vertical,10)
                        .padding(.horizontal,18)
                        .frame(width: UIScreen.main.bounds.width - 16)
                        .background(Color.green)
                        .cornerRadius(20)
                    
                    // Total Family Members
                    
                    VStack{
                        HStack{
                            ZStack {
                                Circle()
                                    .frame(width: 35)
                                    .foregroundColor(Color.green)
                                Image(systemName: "ellipsis.viewfinder")
                                    .foregroundColor(Color.white)
                            }
                            Text("Total family Members")
                                .fontWeight(.bold)
                            ZStack {
                                Text("4")
                                    .padding(2)
                                    .foregroundColor(Color.black)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                            .frame(width: 35)
                                    )
                            } .padding(.leading,16)
                            Spacer()
                        }
                        familyMembers(adults: 1, children: 2)
                        Button {
                            // TODO: Handle Subscribe here
                        } label: {
                            HStack {
                                Image(systemName: "crown.fill")
                                    .foregroundColor(Color.white)
                                Text("View")
                                    .foregroundColor(Color.green)
                                    .font(.headline)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical,18)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .frame(width: UIScreen.main.bounds.width - 40,height: 40)
                            )
                        }
                    }.padding(.vertical,10)
                        .padding(.horizontal,18)
                        .frame(width: UIScreen.main.bounds.width - 16)
                        .background(Color.white)
                        .cornerRadius(20)
                }
                .padding(.bottom,90)
            }
           
        }
      
        
    }
}
// Extension
extension GroceryTracker{
    private func recommendation(image: String,title: String,subTitle:String)->some View{
        ZStack{
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 340,height: 140)
            HStack{
                VStack(alignment:.leading){
                    Text(title)
                        .font(.system(size: 25))
                        .foregroundStyle(.black)
                        .padding(.leading,200)
                    Text(subTitle)
                        .font(.system(size: 15))
                        .foregroundStyle(.gray)
                        .padding(.leading,220)
                }
            }
        }
        .cornerRadius(20)
    }
    // function for expired products in the Grocery trackerView
    private func totalProducts(image: String,productName: String)->some View{
        VStack{
            Image(image)
                .resizable()
                .frame(width: 70,height: 80)
                .clipShape(Circle())
  
                Text(productName)
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
        }
        .frame(width: 100)
        
    }
    // function for expire Soon products
    private func expireSoonProducts(image: String,productName: String,expiryDate: String)->some View{
        HStack{
            VStack{
                HStack{
                    HStack(spacing:20){
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 110,height: 110)
                            .clipShape(Rectangle())
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading){
                            Text(productName)
                                .foregroundStyle(Color.white)
                                .fontWeight(.semibold)
                            Text("Expiry date: \(expiryDate)")
                                .foregroundStyle(Color.white)
                                .fontWeight(.regular)
                            Button {
                                // TODO: Handle view details of each expired soon Products
                            } label: {
                                Text("View Details")
                                    .foregroundStyle(.white)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.white, lineWidth: 1)
                                    .frame(width: 130,height: 40)
                            )
                            .padding(.leading,20)
                            .padding(.vertical,10)
                        }
                        Spacer()
                    }.padding(.leading,20)
                        .cornerRadius(20)
                }
                
            } .frame(width: UIScreen.main.bounds.width - 16)
        }
    }
    // function for Grocery Budget
    private func groceryBudget()->some View{
        HStack{
            ZStack{
                Circle()
                    .frame(width: 55)
                    .foregroundColor(Color.white)
                Image(systemName: "bag")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .foregroundColor(Color.green)
                
            }.padding(.leading,20)
            VStack(alignment:.leading){
                Text("\u{20AC}39")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Text("Your monthly budget")
                    .foregroundStyle(.white)
            }
            Spacer()
            ZStack{
                Circle()
                    .frame(width: 30)
                    .foregroundColor(Color.white)
                    .opacity(0.6)
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10)
                    .foregroundColor(Color.white)
            }
            .padding(.trailing,10)
            
        }.frame(width: UIScreen.main.bounds.width - 16)
        
            .padding(.vertical)
            .background(.green)
            .cornerRadius(20)
        
    }
    // function for family person count
    private func familyMembers(adults: Int , children: Int)->some View{
        ZStack{
            Color.gray.opacity(0.2)
            HStack(spacing:40){
                VStack{
                    Text("Adults")
                        .foregroundColor(.green)
                        .fontWeight(.semibold)
                    Text("\(adults)")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
                Rectangle()
                    .foregroundColor(.gray).opacity(0.5)
                    .frame(width: 1,height: 30)
                VStack{
                    Text("Children")
                        .foregroundColor(.green)
                        .fontWeight(.semibold)
                    Text("\(adults)")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
            }
        }.frame(width: 340,height: 100)
            .cornerRadius(20)
    }
}
#Preview {
    GroceryTracker()
}
