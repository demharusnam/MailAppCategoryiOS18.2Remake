//
//  CategorySelector.swift
//  MailAppCategoryiOS18.2Remake
//
//  Created by Mansur Ahmed on 12/12/24.
//

import SwiftUI

struct CategorySelector: View {
  @Binding var selectedCategory: Category?
  @Environment(\.colorScheme) var colorScheme
  
  private var categoryAlignment: Alignment {
    guard let selectedCategory else { return .trailing }
    
    switch selectedCategory {
    case .primary:
      return .leading
      
    case .transactions, .updates:
      return .center
      
    case .promotions:
      return .trailing
    }
  }
  
  var body: some View {
    HStack(alignment: .center, spacing: 8) {
      categoriesView
      
      allMessagesButton
        .frame(maxWidth: selectedCategory == nil ? .infinity : 0)
        .opacity(selectedCategory != nil ? 0 : 1)
        .disabled(selectedCategory != nil)
        .animation(selectedCategory == nil ? .smooth : nil, value: selectedCategory == nil)
    }
    .frame(maxWidth: .infinity)
    .animation(.smooth, value: selectedCategory)
    .sensoryFeedback(.selection, trigger: selectedCategory)
  }
  
  private var categoriesView: some View {
    HStack(alignment: .center, spacing: selectedCategory == nil ? -12 : 8) {
      ForEach(Category.allCases) { category in
        category.view(selectedCategory: selectedCategory, colorScheme: colorScheme)
          .frame(maxWidth: selectedCategory == category ? .infinity : nil, alignment: categoryAlignment)
          .onTapGesture {
            if selectedCategory == category {
              selectedCategory = nil
            } else {
              selectedCategory = category
            }
          }
      }
    }
  }
  
  private var allMessagesButton: some View {
    Button(action: { selectedCategory = .primary }) {
      let labelTitle = "All Mail"
      
      HStack(alignment: .center, spacing: 8) {
        Image(systemName: "tray.fill")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(height: 16)
          .animation(nil, value: selectedCategory == nil)
        
        Text(labelTitle)
          .font(.headline)
          .bold()
      }
      .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
      .padding(16)
      .frame(maxWidth: .infinity)
      .frame(height: 56)
      .background(colorScheme == .dark ? Color.white : Color.black)
      .clipShape(RoundedRectangle(cornerRadius: 24))
    }
  }
}

#Preview {
  @Previewable @State var selectedCategory: Category? = .primary
  
  CategorySelector(selectedCategory: $selectedCategory)
}
