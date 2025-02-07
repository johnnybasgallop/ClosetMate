import SwiftUI

struct CategorySelectionView: View {
    @Binding var selectedCategory: ItemCategory
    var numberOfItems: Int
    
    var body: some View {
        HStack {
            Menu {
                ForEach(ItemCategory.groupedCategories.keys.sorted(), id: \.self) { group in
                    Section(header: Text(group)) {
                        ForEach(ItemCategory.groupedCategories[group] ?? [], id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                Text(category.rawValue)
                            }
                        }
                    }
                }
            } label: {
                Text(selectedCategory.rawValue)
                    .font(.footnote)
                    .foregroundColor(.brandPrimary)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 5).stroke(.brandPrimary, lineWidth: 1))
            }
            
            Spacer()
            
            Text("(\(numberOfItems))")
                .font(.caption2)
                .foregroundStyle(.brandAccent)
        }
        .padding(.horizontal)
    }
}
