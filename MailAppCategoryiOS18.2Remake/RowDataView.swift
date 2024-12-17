//
//  RowDataView.swift
//  MailAppCategoryiOS18.2Remake
//
//  Created by Mansur Ahmed on 12/12/24.
//

import SwiftUI

public struct RowDataView: View {
  let data: RowData
  
  public var body: some View {
    HStack(alignment: .top, spacing: 8) {
      Image(systemName: data.displayImageTitle)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .foregroundStyle(data.category.color)
        .frame(height: 40)

      VStack(alignment: .leading, spacing: 4) {
        HStack(alignment: .center, spacing: 0) {
          Text(data.merchant)
            .font(.headline)
          
          Spacer()
          
          Text(data.timestamp)
            .font(.caption)
            .foregroundStyle(Color.secondary)
        }
        
        Text(data.subject)
          .font(.subheadline)
        
        Text(data.text)
          .font(.body)
          .foregroundStyle(Color.secondary)
          .lineLimit(2)
        
        Divider()
          .padding(.top, 4)
      }
      .fontDesign(.rounded)
      .truncationMode(.tail)
    }
    .padding(.vertical, 8)
  }
}

#Preview {
  RowDataView(data: .mockData.first!)
}
