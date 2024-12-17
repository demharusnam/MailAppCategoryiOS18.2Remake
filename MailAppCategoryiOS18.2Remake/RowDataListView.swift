//
//  RowDataListView.swift
//  MailAppCategoryiOS18.2Remake
//
//  Created by Mansur Ahmed on 12/12/24.
//

import SwiftUI

struct RowDataListView: View {
  let rowData: [RowData]
  @Binding var selectedCaegory: Category?
  
  var body: some View {
    ForEach(filteredRowData) { data in
      RowDataView(data: data)
    }
  }
  
  private var filteredRowData: [RowData] {
    if let selectedCaegory {
      rowData
        .filter { selectedCaegory == $0.category }
    } else {
      rowData
    }
  }
}

#Preview {
  @Previewable @State var selectedCategory: Category? = nil
  
  RowDataListView(rowData: RowData.mockData, selectedCaegory: $selectedCategory)
}
