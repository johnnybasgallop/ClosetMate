import SwiftUI

struct TopCategoriesGrid: View {
    var topCategories: [(category: ItemCategory, count: Int)]
    var clothingItems: [ClothingItem]  // The full list of clothing items

    // Define a two-column grid layout
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Top Categories")
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
            }

            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(topCategories, id: \.category) { category, count in
                    // Find one item from the current category
                    if let item = clothingItems.first(where: { $0.itemCategory == category }) {
                        CategoryCard(category: category, count: count, frontImage: item.frontImage)
                    }
                }
            }
        }
        .padding()
        .cornerRadius(15)
        .padding(.vertical, 10)
    }
}

// MARK: - Individual Category Card
struct CategoryCard: View {
    var category: ItemCategory
    var count: Int
    var frontImage: UIImage?  // New property for the image

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.brandLightGray)
                .frame(width: (screenWidth - 75) / 2, height: 150)

            VStack(spacing: 0) {
                // Show the front image if available, otherwise show a placeholder
                if let image = frontImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 110)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                        .foregroundColor(.gray)
                }

                Text(category.rawValue.last == "s" ? category.rawValue : "\(category.rawValue)s")
                    .foregroundStyle(.brandAccent)
                    .font(.system(size: 16, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity)  // Make sure text fits within the card
            }
            .padding()
        }
    }
}


//    // Dummy clothing items for testing
//    let sampleItems = [
//        ClothingItem(frontImageData: UIImage(systemName: "tshirt")?.pngData(), backImageData: nil, itemName: "Hoodie 1", itemCategory: .hoodie, itemColor: .red, itemBoughtFor: 20, itemCurrentValue: 15),
//        ClothingItem(frontImageData: UIImage(systemName: "tshirt")?.pngData(), backImageData: nil, itemName: "Blazer 1", itemCategory: .blazer, itemColor: .black, itemBoughtFor: 50, itemCurrentValue: 45),
//        ClothingItem(frontImageData: UIImage(systemName: "tshirt")?.pngData(), backImageData: nil, itemName: "Jeans 1", itemCategory: .jeans, itemColor: .blue, itemBoughtFor: 30, itemCurrentValue: 25),
//        ClothingItem(frontImageData: UIImage(systemName: "tshirt")?.pngData(), backImageData: nil, itemName: "Trouser 1", itemCategory: .trousers, itemColor: .gray, itemBoughtFor: 40, itemCurrentValue: 35)
//    ]

    

