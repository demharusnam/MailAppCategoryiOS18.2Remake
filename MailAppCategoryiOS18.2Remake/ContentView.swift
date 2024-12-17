//
//  ContentView.swift
//  MailAppCategoryiOS18.2Remake
//
//  Created by Mansur Ahmed on 12/12/24.
//

import SwiftUI

struct ContentView: View {
  @State private var selectedCategory: Category?
  private let rowData = RowData.mockData
  
  var body: some View {
    ScrollView {
      Group {
        CategorySelector(selectedCategory: $selectedCategory)
        
        Spacer(minLength: 24)
        
        RowDataListView(rowData: rowData, selectedCaegory: $selectedCategory)
      }
      .padding(.horizontal, 16)
    }
    .animation(.smooth, value: selectedCategory)
  }
}

#Preview {
  ContentView()
}
