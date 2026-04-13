require 'csv'

# Provinces - loaded from CSV file
puts "Seeding provinces from CSV..."
CSV.foreach(Rails.root.join('db/provinces.csv'), headers: true) do |row|
  Province.find_or_create_by(code: row['code']) do |prov|
    prov.name = row['name']
    prov.gst  = row['gst'].to_f
    prov.pst  = row['pst'].to_f
    prov.hst  = row['hst'].to_f
  end
end
puts "Seeded #{Province.count} provinces from CSV"

# Categories
categories_data = [
  { name: "Phone Cases", description: "Protective cases for all phone models" },
  { name: "Chargers & Cables", description: "Charging cables and wall adapters" },
  { name: "Audio", description: "Bluetooth earbuds, headphones and speakers" },
  { name: "Power Banks", description: "Portable battery packs and wireless chargers" },
  { name: "Screen Protection", description: "Screen protectors and phone protection accessories" }
]
categories_data.each do |c|
  Category.find_or_create_by(name: c[:name]) { |cat| cat.description = c[:description] }
end
phone_cases = Category.find_by(name: "Phone Cases")
chargers    = Category.find_by(name: "Chargers & Cables")
audio       = Category.find_by(name: "Audio")
power       = Category.find_by(name: "Power Banks")
screen      = Category.find_by(name: "Screen Protection")
puts "Seeded #{Category.count} categories"

# 100 Products across 4+ categories
products = [
  # Phone Cases (25)
  { name: "iPhone 15 Silicone Case", description: "Premium silicone case for iPhone 15 with soft microfiber lining.", price: 29.99, stock_quantity: 50, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "iPhone 15 Pro Max Case", description: "Heavy duty protection case for iPhone 15 Pro Max with drop protection.", price: 34.99, stock_quantity: 40, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "Samsung Galaxy S24 Case", description: "Slim fit protective case for Samsung Galaxy S24 with raised edges.", price: 24.99, stock_quantity: 40, category: phone_cases, is_new: false, is_on_sale: true },
  { name: "Google Pixel 8 Case", description: "Soft TPU case for Google Pixel 8 with precise cutouts.", price: 19.99, stock_quantity: 35, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "iPhone 14 Leather Case", description: "Genuine leather case for iPhone 14 with card slot.", price: 39.99, stock_quantity: 30, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "Samsung S23 Ultra Case", description: "Rugged armor case for Samsung S23 Ultra with S-pen holder.", price: 27.99, stock_quantity: 45, category: phone_cases, is_new: false, is_on_sale: true },
  { name: "iPhone 13 Clear Case", description: "Crystal clear case for iPhone 13 showing original color.", price: 15.99, stock_quantity: 60, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "OnePlus 12 Case", description: "Slim carbon fiber texture case for OnePlus 12.", price: 22.99, stock_quantity: 25, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "Pixel 7 Pro Case", description: "Military grade drop protection case for Google Pixel 7 Pro.", price: 26.99, stock_quantity: 30, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "iPhone 15 MagSafe Case", description: "MagSafe compatible silicone case for iPhone 15.", price: 44.99, stock_quantity: 35, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "Samsung A54 Case", description: "Colorful TPU case for Samsung Galaxy A54.", price: 14.99, stock_quantity: 50, category: phone_cases, is_new: false, is_on_sale: true },
  { name: "iPhone 12 Wallet Case", description: "Leather wallet case for iPhone 12 with 3 card slots.", price: 32.99, stock_quantity: 20, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "Motorola Edge Case", description: "Protective case for Motorola Edge with shock absorption.", price: 18.99, stock_quantity: 30, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "Samsung Fold 5 Case", description: "Specialized protective case for Samsung Galaxy Z Fold 5.", price: 49.99, stock_quantity: 20, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "iPhone SE Case", description: "Slim protective case for iPhone SE 2022.", price: 12.99, stock_quantity: 45, category: phone_cases, is_new: false, is_on_sale: true },
  { name: "Nokia G22 Case", description: "Basic protection case for Nokia G22.", price: 11.99, stock_quantity: 25, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "Xiaomi 13 Case", description: "Frosted matte case for Xiaomi 13 with grip texture.", price: 17.99, stock_quantity: 30, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "iPhone 15 Plus Case", description: "Shockproof bumper case for iPhone 15 Plus.", price: 31.99, stock_quantity: 35, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "Samsung A34 Case", description: "Dual layer protection case for Samsung Galaxy A34.", price: 16.99, stock_quantity: 40, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "Google Pixel 8 Pro Case", description: "Premium leather case for Google Pixel 8 Pro.", price: 38.99, stock_quantity: 25, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "iPhone 14 Pro Case", description: "Titanium finish case for iPhone 14 Pro with camera guard.", price: 36.99, stock_quantity: 30, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "Samsung S22 Case", description: "Slim fit case for Samsung Galaxy S22 with matte finish.", price: 19.99, stock_quantity: 35, category: phone_cases, is_new: false, is_on_sale: true },
  { name: "Oppo Find X6 Case", description: "Protective TPU case for Oppo Find X6.", price: 21.99, stock_quantity: 20, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "iPhone 15 Ultra Case", description: "Ultra thin 0.3mm case for iPhone 15.", price: 13.99, stock_quantity: 55, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "Samsung Flip 5 Case", description: "Hinge protection case for Samsung Galaxy Z Flip 5.", price: 42.99, stock_quantity: 20, category: phone_cases, is_new: true, is_on_sale: false },
  # Chargers & Cables (25)
  { name: "USB-C Fast Charging Cable", description: "6ft USB-C cable supporting 60W fast charging.", price: 19.99, stock_quantity: 100, category: chargers, is_new: true, is_on_sale: false },
  { name: "65W GaN Wall Charger", description: "Compact GaN charger with dual USB-C ports and 65W output.", price: 44.99, stock_quantity: 40, category: chargers, is_new: true, is_on_sale: false },
  { name: "MagSafe Wireless Charger", description: "Apple MagSafe compatible 15W wireless charger.", price: 39.99, stock_quantity: 35, category: chargers, is_new: false, is_on_sale: false },
  { name: "Wireless Charging Pad", description: "10W Qi wireless charging pad compatible with all Qi devices.", price: 34.99, stock_quantity: 45, category: chargers, is_new: false, is_on_sale: false },
  { name: "20W USB-C Power Adapter", description: "Apple 20W USB-C power adapter for fast charging.", price: 24.99, stock_quantity: 50, category: chargers, is_new: false, is_on_sale: true },
  { name: "3-in-1 Charging Cable", description: "Multi-tip cable supporting USB-C, Lightning and Micro-USB.", price: 17.99, stock_quantity: 60, category: chargers, is_new: false, is_on_sale: false },
  { name: "100W USB-C Cable", description: "Premium braided 100W USB-C to USB-C cable.", price: 22.99, stock_quantity: 55, category: chargers, is_new: true, is_on_sale: false },
  { name: "Car Charger Dual USB", description: "Dual port car charger with 36W fast charging.", price: 19.99, stock_quantity: 45, category: chargers, is_new: false, is_on_sale: false },
  { name: "Apple Lightning Cable", description: "MFi certified Lightning cable for iPhone and iPad.", price: 16.99, stock_quantity: 70, category: chargers, is_new: false, is_on_sale: true },
  { name: "45W Samsung Charger", description: "Official Samsung 45W Super Fast Charging adapter.", price: 34.99, stock_quantity: 35, category: chargers, is_new: false, is_on_sale: false },
  { name: "Wireless Car Charger", description: "15W wireless car mount charger with auto-clamp.", price: 42.99, stock_quantity: 30, category: chargers, is_new: true, is_on_sale: false },
  { name: "USB-A to USB-C Cable", description: "Durable nylon braided USB-A to USB-C cable 3ft.", price: 12.99, stock_quantity: 80, category: chargers, is_new: false, is_on_sale: false },
  { name: "120W Hyper Charger", description: "Xiaomi 120W HyperCharge adapter with safety protection.", price: 49.99, stock_quantity: 25, category: chargers, is_new: true, is_on_sale: false },
  { name: "Retractable USB-C Cable", description: "Compact retractable USB-C cable for travel.", price: 14.99, stock_quantity: 50, category: chargers, is_new: false, is_on_sale: true },
  { name: "4-Port USB Hub Charger", description: "Desktop 4-port USB charging hub with 40W total output.", price: 29.99, stock_quantity: 30, category: chargers, is_new: false, is_on_sale: false },
  { name: "Magnetic Charging Cable", description: "360 degree magnetic USB-C charging cable.", price: 18.99, stock_quantity: 40, category: chargers, is_new: true, is_on_sale: false },
  { name: "25W Fast Charge Adapter", description: "Samsung 25W USB-C fast charge wall adapter.", price: 27.99, stock_quantity: 45, category: chargers, is_new: false, is_on_sale: false },
  { name: "Solar Charging Panel", description: "Portable 10W solar charging panel for outdoor use.", price: 54.99, stock_quantity: 20, category: chargers, is_new: true, is_on_sale: false },
  { name: "Desk Charging Station", description: "5-device desktop charging station with cable management.", price: 64.99, stock_quantity: 15, category: chargers, is_new: false, is_on_sale: false },
  { name: "USB-C to HDMI Cable", description: "USB-C to HDMI 4K cable for screen mirroring.", price: 23.99, stock_quantity: 35, category: chargers, is_new: false, is_on_sale: false },
  { name: "Night Stand Charger", description: "Bedside 3-in-1 charger for phone watch and earbuds.", price: 47.99, stock_quantity: 25, category: chargers, is_new: true, is_on_sale: false },
  { name: "Micro USB Cable Pack", description: "Pack of 3 Micro USB cables in different lengths.", price: 13.99, stock_quantity: 60, category: chargers, is_new: false, is_on_sale: true },
  { name: "GaN 100W Travel Charger", description: "Foldable GaN 100W travel charger with dual USB-C.", price: 59.99, stock_quantity: 20, category: chargers, is_new: true, is_on_sale: false },
  { name: "Wireless Charging Stand", description: "Adjustable 15W wireless charging stand for phones.", price: 37.99, stock_quantity: 30, category: chargers, is_new: false, is_on_sale: false },
  { name: "USB-C Multiport Adapter", description: "7-in-1 USB-C hub with HDMI SD card and USB ports.", price: 44.99, stock_quantity: 25, category: chargers, is_new: false, is_on_sale: false },
  # Audio (25)
  { name: "Bluetooth Earbuds Pro", description: "True wireless earbuds with active noise cancellation and 30hr battery.", price: 79.99, stock_quantity: 30, category: audio, is_new: true, is_on_sale: false },
  { name: "Over-Ear Headphones", description: "Premium over-ear headphones with 40mm drivers and foldable design.", price: 89.99, stock_quantity: 25, category: audio, is_new: false, is_on_sale: false },
  { name: "Sport Earbuds", description: "Sweat resistant sport earbuds with ear hooks and 8hr battery.", price: 49.99, stock_quantity: 40, category: audio, is_new: false, is_on_sale: true },
  { name: "Mini Bluetooth Speaker", description: "Portable waterproof Bluetooth speaker with 360 sound.", price: 44.99, stock_quantity: 35, category: audio, is_new: false, is_on_sale: false },
  { name: "Noise Cancelling Buds", description: "Advanced ANC earbuds with transparency mode and 24hr case.", price: 99.99, stock_quantity: 20, category: audio, is_new: true, is_on_sale: false },
  { name: "Kids Headphones", description: "Volume limited headphones for kids with colorful design.", price: 24.99, stock_quantity: 45, category: audio, is_new: false, is_on_sale: false },
  { name: "Gaming Headset", description: "7.1 surround sound gaming headset with detachable mic.", price: 69.99, stock_quantity: 25, category: audio, is_new: true, is_on_sale: false },
  { name: "Open Ear Headphones", description: "Bone conduction open ear headphones for safe outdoor use.", price: 84.99, stock_quantity: 20, category: audio, is_new: false, is_on_sale: false },
  { name: "Party Speaker", description: "Large portable party speaker with LED lights and 20hr battery.", price: 119.99, stock_quantity: 15, category: audio, is_new: false, is_on_sale: true },
  { name: "Earbuds with Tips Pack", description: "Wireless earbuds with 6 pairs of ear tips for perfect fit.", price: 54.99, stock_quantity: 30, category: audio, is_new: true, is_on_sale: false },
  { name: "USB-C Earphones", description: "Wired USB-C earphones with inline microphone.", price: 19.99, stock_quantity: 55, category: audio, is_new: false, is_on_sale: false },
  { name: "Clip On Earphones", description: "Lightweight clip on earphones for exercise.", price: 29.99, stock_quantity: 40, category: audio, is_new: false, is_on_sale: true },
  { name: "Smart Speaker", description: "Voice controlled smart speaker with built-in assistant.", price: 74.99, stock_quantity: 25, category: audio, is_new: true, is_on_sale: false },
  { name: "Shower Speaker", description: "Waterproof Bluetooth shower speaker with suction mount.", price: 34.99, stock_quantity: 35, category: audio, is_new: false, is_on_sale: false },
  { name: "Soundbar Mini", description: "Compact soundbar for phone and tablet audio enhancement.", price: 59.99, stock_quantity: 20, category: audio, is_new: false, is_on_sale: false },
  { name: "True Wireless Buds", description: "Affordable true wireless earbuds with 20hr total battery.", price: 39.99, stock_quantity: 45, category: audio, is_new: false, is_on_sale: true },
  { name: "Hi-Fi Earphones", description: "Wired hi-fi earphones with balanced armature drivers.", price: 64.99, stock_quantity: 20, category: audio, is_new: true, is_on_sale: false },
  { name: "Workout Earbuds", description: "IPX7 waterproof earbuds designed for intense workouts.", price: 44.99, stock_quantity: 35, category: audio, is_new: false, is_on_sale: false },
  { name: "Desktop Speaker Set", description: "2.0 stereo desktop speaker set with bass reflex.", price: 79.99, stock_quantity: 20, category: audio, is_new: false, is_on_sale: false },
  { name: "Retro Headphones", description: "Vintage style on-ear headphones with modern Bluetooth.", price: 54.99, stock_quantity: 25, category: audio, is_new: true, is_on_sale: false },
  { name: "Sleep Earbuds", description: "Ultra flat sleep earbuds for side sleepers.", price: 47.99, stock_quantity: 30, category: audio, is_new: false, is_on_sale: false },
  { name: "Conference Speaker", description: "360 degree conference speaker with echo cancellation.", price: 89.99, stock_quantity: 15, category: audio, is_new: false, is_on_sale: false },
  { name: "Bass Boost Earbuds", description: "Extra bass wireless earbuds with 10mm drivers.", price: 34.99, stock_quantity: 40, category: audio, is_new: true, is_on_sale: false },
  { name: "Karaoke Microphone", description: "Bluetooth karaoke microphone with built-in speaker.", price: 42.99, stock_quantity: 25, category: audio, is_new: false, is_on_sale: true },
  { name: "Premium ANC Headphones", description: "Studio quality ANC headphones with LDAC support.", price: 149.99, stock_quantity: 10, category: audio, is_new: true, is_on_sale: false },
  # Power Banks (15)
  { name: "10000mAh Power Bank", description: "Slim 10000mAh power bank with dual USB output.", price: 29.99, stock_quantity: 50, category: power, is_new: false, is_on_sale: false },
  { name: "20000mAh Fast Charge Bank", description: "High capacity 20000mAh power bank with 65W PD output.", price: 54.99, stock_quantity: 30, category: power, is_new: true, is_on_sale: false },
  { name: "Wireless Power Bank", description: "10000mAh wireless charging power bank with Qi pad.", price: 44.99, stock_quantity: 35, category: power, is_new: false, is_on_sale: false },
  { name: "Solar Power Bank", description: "20000mAh solar power bank for outdoor adventures.", price: 49.99, stock_quantity: 25, category: power, is_new: true, is_on_sale: false },
  { name: "Mini Power Bank", description: "5000mAh ultra compact power bank fits in pocket.", price: 19.99, stock_quantity: 60, category: power, is_new: false, is_on_sale: true },
  { name: "MagSafe Power Bank", description: "5000mAh MagSafe compatible wireless power bank for iPhone.", price: 59.99, stock_quantity: 25, category: power, is_new: true, is_on_sale: false },
  { name: "Power Bank with Display", description: "10000mAh power bank with LED percentage display.", price: 34.99, stock_quantity: 40, category: power, is_new: false, is_on_sale: false },
  { name: "Rugged Power Bank", description: "IP67 waterproof 20000mAh power bank for outdoors.", price: 64.99, stock_quantity: 20, category: power, is_new: false, is_on_sale: false },
  { name: "Slim Card Power Bank", description: "Credit card sized 3000mAh emergency power bank.", price: 24.99, stock_quantity: 45, category: power, is_new: true, is_on_sale: false },
  { name: "Laptop Power Bank", description: "40000mAh power bank capable of charging laptops.", price: 89.99, stock_quantity: 15, category: power, is_new: false, is_on_sale: false },
  { name: "2-in-1 Wireless Bank", description: "Power bank and wireless charger combo with stand.", price: 47.99, stock_quantity: 25, category: power, is_new: true, is_on_sale: false },
  { name: "Watch Charger Bank", description: "Power bank with integrated Apple Watch charging puck.", price: 54.99, stock_quantity: 20, category: power, is_new: false, is_on_sale: false },
  { name: "Fast Charge 30W Bank", description: "10000mAh power bank with 30W USB-C fast charging.", price: 39.99, stock_quantity: 35, category: power, is_new: false, is_on_sale: true },
  { name: "Desktop Power Station", description: "100W desktop power station with AC outlet and USB ports.", price: 129.99, stock_quantity: 10, category: power, is_new: true, is_on_sale: false },
  { name: "Keychain Power Bank", description: "1500mAh keychain power bank for emergency top ups.", price: 14.99, stock_quantity: 70, category: power, is_new: false, is_on_sale: true },
  # Screen Protection (10)
  { name: "iPhone 15 Screen Protector", description: "Tempered glass screen protector for iPhone 15 with easy install kit.", price: 14.99, stock_quantity: 80, category: screen, is_new: true, is_on_sale: false },
  { name: "Samsung S24 Glass Protector", description: "9H hardness tempered glass for Samsung Galaxy S24.", price: 12.99, stock_quantity: 70, category: screen, is_new: false, is_on_sale: false },
  { name: "Privacy Screen Protector", description: "Anti-spy privacy tempered glass for iPhone 15 Pro.", price: 19.99, stock_quantity: 50, category: screen, is_new: false, is_on_sale: false },
  { name: "Matte Anti-Glare Protector", description: "Matte finish anti-glare screen protector for outdoor use.", price: 16.99, stock_quantity: 55, category: screen, is_new: true, is_on_sale: false },
  { name: "Full Coverage Protector", description: "Edge to edge full coverage tempered glass for Samsung S23.", price: 15.99, stock_quantity: 60, category: screen, is_new: false, is_on_sale: true },
  { name: "Camera Lens Protector", description: "Tempered glass camera lens protector for iPhone 15 Pro.", price: 11.99, stock_quantity: 75, category: screen, is_new: true, is_on_sale: false },
  { name: "Pixel 8 Screen Guard", description: "Ultra clear screen protector for Google Pixel 8.", price: 13.99, stock_quantity: 65, category: screen, is_new: false, is_on_sale: false },
  { name: "Anti-Blue Light Protector", description: "Blue light filtering screen protector for eye protection.", price: 18.99, stock_quantity: 50, category: screen, is_new: false, is_on_sale: false },
  { name: "3-Pack Screen Protector", description: "Value pack of 3 tempered glass protectors for iPhone 14.", price: 17.99, stock_quantity: 60, category: screen, is_new: false, is_on_sale: true },
  { name: "Liquid Screen Protector", description: "Nano liquid screen protector compatible with all phones.", price: 22.99, stock_quantity: 40, category: screen, is_new: true, is_on_sale: false }
]

products.each do |p|
  Product.find_or_create_by(name: p[:name]) do |prod|
    prod.description    = p[:description]
    prod.price          = p[:price]
    prod.stock_quantity = p[:stock_quantity]
    prod.category       = p[:category]
    prod.is_new         = p[:is_new]
    prod.is_on_sale     = p[:is_on_sale]
  end
end
puts "Seeded #{Product.count} products"
