//
//  Category.swift
//  MailAppCategoryiOS18.2Remake
//
//  Created by Mansur Ahmed on 12/12/24.
//

import SwiftUI

enum Category: String, Identifiable, Equatable, CaseIterable {
  case primary = "Primary"
  case transactions = "Transactions"
  case updates = "Updates"
  case promotions = "Promotions"
  
  static let cornerRadius: CGFloat = 20
  
  var color: Color {
    switch self {
    case .primary:
      .blue
      
    case .transactions:
      .green
      
    case .updates:
      .purple
      
    case .promotions:
      .red
    }
  }
  
  private var zIndex: Double {
    switch self {
    case .primary:
      4
      
    case .transactions:
      3
      
    case .updates:
      2
      
    case .promotions:
      1
    }
  }
  
  private var unselectedImageTitle: String {
    switch self {
    case .primary:
      "person"
      
    case .transactions:
      "cart"
      
    case .updates:
      "bubble"
      
    case .promotions:
      "megaphone"
    }
  }
  
  private var selectedImageTitle: String {
    switch self {
    case .primary:
      "person.fill"
      
    case .transactions:
      "cart.fill"
      
    case .updates:
      "bubble.fill"
      
    case .promotions:
      "megaphone.fill"
    }
  }
  
  private func previewImage(isSelected: Bool) -> some View {
    Image(systemName: isSelected ? selectedImageTitle : unselectedImageTitle)
      .resizable()
      .bold()
      .aspectRatio(contentMode: .fit)
  }
  
  @ViewBuilder
  func view(selectedCategory: Category?, colorScheme: ColorScheme) -> some View {
    let isSelected = selectedCategory == self
    
    HStack(alignment: .center, spacing: 8) {
      previewImage(isSelected: isSelected)
        .frame(height: 16)
        .padding(.horizontal, isSelected ? 0 : 4)
        .animation(.none, value: isSelected)
      
      if isSelected {
        Text(rawValue)
          .fontDesign(.rounded)
          .font(.headline)
          .bold()
      }
    }
    .padding(.vertical, 8)
    .padding(.horizontal, 16)
    .frame(height: 56)
    .frame(maxWidth: isSelected ? .infinity : nil)
    .background(isSelected ? color : .secondarySystemBackground)
    .blendMode(.sourceAtop)
    .overlay(
      RoundedRectangle(cornerRadius: Category.cornerRadius)
        .stroke(
          colorScheme == .dark ? Color.black : Color.white,
          lineWidth: selectedCategory == nil ? 4 : 0
        )
    )
    .clipShape(RoundedRectangle(cornerRadius: Category.cornerRadius))
    .zIndex(zIndex)
    .animation(.smooth, value: isSelected)
  }
  
  var id: String { rawValue }
}

#Preview {
  @Previewable @Environment(\.colorScheme) var colorScheme
  
  Category.primary.view(selectedCategory: .primary, colorScheme: colorScheme)
}
