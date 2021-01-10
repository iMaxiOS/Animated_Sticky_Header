//
//  Home.swift
//  Animated_Sticky_Header
//
//  Created by Maxim Granchenko on 10.01.2021.
//

import SwiftUI

struct Home: View {
    
    @StateObject var homeModel = HomeViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders], content: {
                
                GeometryReader { reader -> AnyView in
                    let offset = reader.frame(in: .global).minY
                    
                    if -offset >= 0 {
                        DispatchQueue.main.async {
                            self.homeModel.offset = -offset
                        }
                    }
                    return AnyView(
                        Image("choclates")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 250 + (offset > 0 ? offset : 0))
                            .cornerRadius(2)
                            .offset(y: offset > 0 ? -offset : 0)
                    )
                }
                .frame(height: 250)
                
                Section(header: HeaderView()) {
                    ForEach(tabsItems) { tab in
                        VStack(alignment: .leading, spacing: 15, content: {
                            Text(tab.tab)
                                .font(.title2)
                                .bold()
                                .padding(.bottom)
                                .padding(.leading)
                            
                            ForEach(tab.foods) { food in
                                CardView(food: food)
                            }
                            
                            Divider()
                                .padding(.top)
                        })
                    }
                }
            })
        }
        .overlay(
            Color(.systemBackground)
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                .ignoresSafeArea(.all, edges: .top)
                .opacity(self.homeModel.offset > 250 ? 1 : 0),
            alignment: .top
        )
        .environmentObject(homeModel)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
