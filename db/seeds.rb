# Create categories
categories = [
  { name: "Phone Cases", description: "Protective cases for all phone models" },
  { name: "Chargers & Cables", description: "Charging cables and wall adapters" },
  { name: "Audio", description: "Bluetooth earbuds and headphones" },
  { name: "Power Banks", description: "Portable power banks and wireless chargers" },
  { name: "Screen Protection", description: "Screen protectors and phone protection" }
]

categories.each do |cat|
  Category.find_or_create_by!(name: cat[:name]) do |c|
    c.description = cat[:description]
  end
end

# Create products
products = [
  { name: "iPhone 15 Silicone Case", description: "Premium silicone case for iPhone 15 with soft microfiber lining.", price: 29.99, stock_quantity: 50, category: "Phone Cases", is_on_sale: false, is_new: true },
  { name: "Samsung Galaxy S24 Case", description: "Slim fit protective case for Samsung Galaxy S24.", price: 24.99, stock_quantity: 40, category: "Phone Cases", is_on_sale: true, is_new: false },
  { name: "USB-C Fast Charging Cable", description: "6ft USB-C cable supporting 60W fast charging.", price: 19.99, stock_quantity: 100, category: "Chargers & Cables", is_on_sale: false, is_new: true },
  { name: "65W Wall Adapter", description: "Compact 65W GaN wall adapter with dual USB-C ports.", price: 39.99, stock_quantity: 60, category: "Chargers & Cables", is_on_sale: false, is_new: true },
  { name: "Wireless Charging Pad", description: "15W Qi2 wireless charging pad compatible with all Qi devices.", price: 34.99, stock_quantity: 45, category: "Power Banks", is_on_sale: true, is_new: false },
  { name: "20000mAh Power Bank", description: "High capacity power bank with 65W PD fast charging.", price: 59.99, stock_quantity: 30, category: "Power Banks", is_on_sale: false, is_new: true },
  { name: "Bluetooth Earbuds Pro", description: "True wireless earbuds with active noise cancellation and 30hr battery.", price: 89.99, stock_quantity: 25, category: "Audio", is_on_sale: true, is_new: false },
  { name: "Over-Ear Headphones", description: "Premium over-ear headphones with Hi-Fi sound and foldable design.", price: 129.99, stock_quantity: 20, category: "Audio", is_on_sale: false, is_new: true },
  { name: "Tempered Glass Screen Protector", description: "9H hardness tempered glass screen protector for iPhone 15.", price: 14.99, stock_quantity: 80, category: "Screen Protection", is_on_sale: false, is_new: false },
  { name: "Privacy Screen Protector", description: "Anti-spy privacy screen protector compatible with Samsung Galaxy.", price: 17.99, stock_quantity: 60, category: "Screen Protection", is_on_sale: true, is_new: false }
]

products.each do |prod|
  category = Category.find_by(name: prod[:category])
  Product.find_or_create_by!(name: prod[:name]) do |p|
    p.description = prod[:description]
    p.price = prod[:price]
    p.stock_quantity = prod[:stock_quantity]
    p.category = category
    p.is_on_sale = prod[:is_on_sale]
    p.is_new = prod[:is_new]
  end
end

puts "Created #{Category.count} categories and #{Product.count} products!"