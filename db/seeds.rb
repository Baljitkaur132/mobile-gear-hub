# Provinces
provinces = [
  { name: "Alberta", code: "AB", gst: 5.0, pst: 0.0, hst: 0.0 },
  { name: "British Columbia", code: "BC", gst: 5.0, pst: 7.0, hst: 0.0 },
  { name: "Manitoba", code: "MB", gst: 5.0, pst: 7.0, hst: 0.0 },
  { name: "New Brunswick", code: "NB", gst: 0.0, pst: 0.0, hst: 15.0 },
  { name: "Newfoundland and Labrador", code: "NL", gst: 0.0, pst: 0.0, hst: 15.0 },
  { name: "Northwest Territories", code: "NT", gst: 5.0, pst: 0.0, hst: 0.0 },
  { name: "Nova Scotia", code: "NS", gst: 0.0, pst: 0.0, hst: 15.0 },
  { name: "Nunavut", code: "NU", gst: 5.0, pst: 0.0, hst: 0.0 },
  { name: "Ontario", code: "ON", gst: 0.0, pst: 0.0, hst: 13.0 },
  { name: "Prince Edward Island", code: "PE", gst: 0.0, pst: 0.0, hst: 15.0 },
  { name: "Quebec", code: "QC", gst: 5.0, pst: 9.975, hst: 0.0 },
  { name: "Saskatchewan", code: "SK", gst: 5.0, pst: 6.0, hst: 0.0 },
  { name: "Yukon", code: "YT", gst: 5.0, pst: 0.0, hst: 0.0 }
]
provinces.each do |p|
  Province.find_or_create_by(code: p[:code]) do |prov|
    prov.name = p[:name]
    prov.gst  = p[:gst]
    prov.pst  = p[:pst]
    prov.hst  = p[:hst]
  end
end
puts "Seeded #{Province.count} provinces"

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

phone_cases  = Category.find_by(name: "Phone Cases")
chargers     = Category.find_by(name: "Chargers & Cables")
audio        = Category.find_by(name: "Audio")
power        = Category.find_by(name: "Power Banks")
screen       = Category.find_by(name: "Screen Protection")

# 100 Products across 4+ categories
products = [
  # Phone Cases (25)
  { name: "iPhone 15 Silicone Case", description: "Premium silicone case for iPhone 15 with soft microfiber lining.", price: 29.99, stock_quantity: 50, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "iPhone 15 Pro Max Case", description: "Heavy duty protection case for iPhone 15 Pro Max with drop protection.", price: 34.99, stock_quantity: 40, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "Samsung Galaxy S24 Case", description: "Slim fit protective case for Samsung Galaxy S24 with raised edges.", price: 24.99, stock_quantity: 40, category: phone_cases, is_new: false, is_on_sale: true },
  { name: "Samsung Galaxy S24 Ultra Case", description: "Rugged armor case for Samsung Galaxy S24 Ultra with kickstand.", price: 39.99, stock_quantity: 30, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "Google Pixel 8 Case", description: "Slim fit case for Google Pixel 8 with carbon fiber texture.", price: 22.99, stock_quantity: 35, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "Google Pixel 8 Pro Case", description: "Leather wallet case for Google Pixel 8 Pro with card slots.", price: 44.99, stock_quantity: 25, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "iPhone 14 Clear Case", description: "Crystal clear case for iPhone 14 showing off original design.", price: 19.99, stock_quantity: 60, category: phone_cases, is_new: false, is_on_sale: true },
  { name: "Samsung A54 Case", description: "Colorful silicone case for Samsung Galaxy A54 with wrist strap.", price: 17.99, stock_quantity: 45, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "OnePlus 12 Case", description: "Matte finish hard case for OnePlus 12 with precise cutouts.", price: 21.99, stock_quantity: 30, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "iPhone 13 Leather Case", description: "Genuine leather case for iPhone 13 with card pocket.", price: 49.99, stock_quantity: 20, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "Universal Flip Case Small", description: "Universal magnetic flip case for phones up to 5.5 inches.", price: 14.99, stock_quantity: 55, category: phone_cases, is_new: false, is_on_sale: true },
  { name: "Universal Flip Case Large", description: "Universal magnetic flip case for phones up to 6.7 inches.", price: 16.99, stock_quantity: 50, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "Waterproof Phone Case", description: "IPX8 waterproof case for all phones up to 6.9 inches.", price: 29.99, stock_quantity: 35, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "Shockproof Bumper Case", description: "Military grade shockproof bumper case with 360 protection.", price: 27.99, stock_quantity: 40, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "Magnetic MagSafe Case", description: "MagSafe compatible magnetic case for iPhone 14 and 15 series.", price: 34.99, stock_quantity: 45, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "iPhone 15 Wallet Case", description: "Folio wallet case for iPhone 15 with three card slots.", price: 42.99, stock_quantity: 25, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "Samsung S23 Case", description: "Thin profile hard shell case for Samsung Galaxy S23.", price: 18.99, stock_quantity: 35, category: phone_cases, is_new: false, is_on_sale: true },
  { name: "Pixel 7 Case", description: "Dual layer protection case for Google Pixel 7.", price: 23.99, stock_quantity: 30, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "Glitter Phone Case", description: "Sparkly glitter case compatible with iPhone 13 14 15 series.", price: 15.99, stock_quantity: 50, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "Ring Holder Phone Case", description: "Case with 360 degree rotating ring holder for all Samsung models.", price: 22.99, stock_quantity: 40, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "iPhone 12 Case", description: "Basic protection case for iPhone 12 with anti-slip grip.", price: 14.99, stock_quantity: 45, category: phone_cases, is_new: false, is_on_sale: true },
  { name: "Biodegradable Phone Case", description: "Eco-friendly biodegradable case compatible with iPhone 13 15.", price: 26.99, stock_quantity: 30, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "Marble Pattern Case", description: "Stylish marble pattern hard case for Samsung Galaxy S24.", price: 19.99, stock_quantity: 35, category: phone_cases, is_new: false, is_on_sale: false },
  { name: "Carbon Fiber Case", description: "Lightweight carbon fiber texture case for iPhone 15 Pro.", price: 32.99, stock_quantity: 25, category: phone_cases, is_new: true, is_on_sale: false },
  { name: "Floral Print Case", description: "Pretty floral design soft case compatible with most iPhones.", price: 16.99, stock_quantity: 50, category: phone_cases, is_new: false, is_on_sale: false },

  # Chargers & Cables (25)
  { name: "USB-C Fast Charging Cable 1m", description: "1 metre USB-C cable supporting 60W fast charging.", price: 14.99, stock_quantity: 100, category: chargers, is_new: true, is_on_sale: false },
  { name: "USB-C Fast Charging Cable 2m", description: "2 metre USB-C cable supporting 60W fast charging.", price: 19.99, stock_quantity: 100, category: chargers, is_new: true, is_on_sale: false },
  { name: "Lightning Cable 1m", description: "MFi certified Lightning cable for iPhone charging.", price: 16.99, stock_quantity: 80, category: chargers, is_new: false, is_on_sale: false },
  { name: "Lightning Cable 2m", description: "2 metre MFi certified Lightning cable for iPhone charging.", price: 21.99, stock_quantity: 70, category: chargers, is_new: false, is_on_sale: true },
  { name: "20W USB-C Wall Adapter", description: "Compact 20W USB-C wall charger for fast charging iPhones.", price: 24.99, stock_quantity: 75, category: chargers, is_new: false, is_on_sale: false },
  { name: "65W GaN Wall Charger", description: "65W GaN technology dual port wall charger USB-C and USB-A.", price: 49.99, stock_quantity: 50, category: chargers, is_new: true, is_on_sale: false },
  { name: "100W GaN Wall Charger", description: "100W GaN 4-port wall charger for laptops and phones.", price: 79.99, stock_quantity: 30, category: chargers, is_new: true, is_on_sale: false },
  { name: "Wireless Charging Pad 10W", description: "10W Qi wireless charging pad compatible with all Qi devices.", price: 24.99, stock_quantity: 60, category: chargers, is_new: false, is_on_sale: true },
  { name: "Wireless Charging Pad 15W", description: "15W fast wireless charging pad with LED indicator.", price: 34.99, stock_quantity: 45, category: chargers, is_new: false, is_on_sale: false },
  { name: "3-in-1 Wireless Charger", description: "Charge iPhone Apple Watch and AirPods simultaneously.", price: 59.99, stock_quantity: 35, category: chargers, is_new: true, is_on_sale: false },
  { name: "MagSafe Charger", description: "Apple MagSafe compatible 15W magnetic wireless charger.", price: 44.99, stock_quantity: 40, category: chargers, is_new: true, is_on_sale: false },
  { name: "Car Charger Dual USB", description: "Dual USB car charger with 30W total output.", price: 19.99, stock_quantity: 55, category: chargers, is_new: false, is_on_sale: false },
  { name: "Car Charger USB-C PD", description: "45W USB-C PD car charger for fast charging on the go.", price: 29.99, stock_quantity: 45, category: chargers, is_new: false, is_on_sale: true },
  { name: "Braided USB-C Cable", description: "Durable braided nylon USB-C cable 1.8m with 100W support.", price: 22.99, stock_quantity: 65, category: chargers, is_new: false, is_on_sale: false },
  { name: "Retractable USB-C Cable", description: "Retractable USB-C cable with auto wind mechanism.", price: 17.99, stock_quantity: 50, category: chargers, is_new: true, is_on_sale: false },
  { name: "Multi Cable 3-in-1", description: "3-in-1 cable with USB-C Lightning and Micro-USB connectors.", price: 19.99, stock_quantity: 60, category: chargers, is_new: false, is_on_sale: false },
  { name: "USB-A to USB-C Adapter", description: "Pack of 3 USB-A to USB-C adapters for older chargers.", price: 12.99, stock_quantity: 80, category: chargers, is_new: false, is_on_sale: false },
  { name: "Wireless Car Charger Mount", description: "15W wireless charging car mount with auto-clamping.", price: 39.99, stock_quantity: 40, category: chargers, is_new: true, is_on_sale: false },
  { name: "Desktop Charging Station", description: "5-port desktop charging station with 60W total output.", price: 54.99, stock_quantity: 30, category: chargers, is_new: false, is_on_sale: false },
  { name: "Magnetic Charging Cable", description: "360 degree magnetic charging cable for USB-C and Lightning.", price: 24.99, stock_quantity: 45, category: chargers, is_new: true, is_on_sale: false },
  { name: "Solar Power Charger", description: "Foldable solar panel charger 21W for outdoor charging.", price: 69.99, stock_quantity: 20, category: chargers, is_new: true, is_on_sale: false },
  { name: "USB Hub with Charging", description: "7-in-1 USB-C hub with 100W PD charging pass-through.", price: 44.99, stock_quantity: 35, category: chargers, is_new: false, is_on_sale: true },
  { name: "Night Light Charger", description: "USB-C charger with built-in LED night light.", price: 22.99, stock_quantity: 40, category: chargers, is_new: false, is_on_sale: false },
  { name: "Travel Adapter with USB", description: "Universal travel adapter with 2 USB-C and 2 USB-A ports.", price: 34.99, stock_quantity: 45, category: chargers, is_new: false, is_on_sale: false },
  { name: "Wireless Charging Stand", description: "Adjustable wireless charging stand for phones and tablets.", price: 39.99, stock_quantity: 35, category: chargers, is_new: true, is_on_sale: false },

  # Audio (25)
  { name: "Bluetooth Earbuds Basic", description: "True wireless earbuds with 20hr total battery life.", price: 39.99, stock_quantity: 50, category: audio, is_new: false, is_on_sale: true },
  { name: "Bluetooth Earbuds Pro", description: "True wireless earbuds with active noise cancellation.", price: 89.99, stock_quantity: 35, category: audio, is_new: true, is_on_sale: false },
  { name: "Bluetooth Earbuds Sport", description: "Waterproof sport earbuds with ear hooks and 8hr battery.", price: 54.99, stock_quantity: 40, category: audio, is_new: false, is_on_sale: false },
  { name: "Over-Ear Headphones", description: "Foldable over-ear headphones with 30hr playtime.", price: 59.99, stock_quantity: 25, category: audio, is_new: false, is_on_sale: true },
  { name: "Over-Ear Noise Cancelling", description: "Premium ANC over-ear headphones with 40hr battery.", price: 129.99, stock_quantity: 20, category: audio, is_new: true, is_on_sale: false },
  { name: "On-Ear Headphones", description: "Lightweight on-ear headphones with foldable design.", price: 44.99, stock_quantity: 30, category: audio, is_new: false, is_on_sale: false },
  { name: "Wired Earbuds USB-C", description: "High quality wired earbuds with USB-C connector.", price: 24.99, stock_quantity: 55, category: audio, is_new: false, is_on_sale: false },
  { name: "Wired Earbuds 3.5mm", description: "Classic 3.5mm wired earbuds with inline microphone.", price: 14.99, stock_quantity: 70, category: audio, is_new: false, is_on_sale: true },
  { name: "Gaming Earbuds", description: "Low latency gaming earbuds with surround sound effect.", price: 49.99, stock_quantity: 30, category: audio, is_new: true, is_on_sale: false },
  { name: "Mini Bluetooth Speaker", description: "Compact Bluetooth speaker with 360 sound and 12hr battery.", price: 34.99, stock_quantity: 40, category: audio, is_new: false, is_on_sale: false },
  { name: "Waterproof Bluetooth Speaker", description: "IPX7 waterproof Bluetooth speaker for outdoor use.", price: 59.99, stock_quantity: 30, category: audio, is_new: true, is_on_sale: false },
  { name: "Party Bluetooth Speaker", description: "Large Bluetooth speaker with LED lights and 24hr battery.", price: 89.99, stock_quantity: 20, category: audio, is_new: false, is_on_sale: false },
  { name: "Bone Conduction Headphones", description: "Open ear bone conduction headphones for runners.", price: 74.99, stock_quantity: 25, category: audio, is_new: true, is_on_sale: false },
  { name: "Kids Headphones", description: "Volume limited kids headphones with colorful design.", price: 29.99, stock_quantity: 35, category: audio, is_new: false, is_on_sale: false },
  { name: "Sleep Earbuds", description: "Ultra thin sleep earbuds designed for side sleepers.", price: 64.99, stock_quantity: 25, category: audio, is_new: true, is_on_sale: false },
  { name: "ANC Earbuds Budget", description: "Active noise cancellation earbuds at budget price.", price: 49.99, stock_quantity: 40, category: audio, is_new: false, is_on_sale: true },
  { name: "Clip-On Bluetooth Earphones", description: "Lightweight clip-on Bluetooth earphones for sport.", price: 34.99, stock_quantity: 30, category: audio, is_new: false, is_on_sale: false },
  { name: "Translator Earbuds", description: "Real-time translation earbuds supporting 40 languages.", price: 99.99, stock_quantity: 15, category: audio, is_new: true, is_on_sale: false },
  { name: "Hearing Amplifier", description: "Personal sound amplifier earbuds for better hearing.", price: 79.99, stock_quantity: 20, category: audio, is_new: false, is_on_sale: false },
  { name: "Stereo Bluetooth Headset", description: "Over-ear Bluetooth headset with boom mic for calls.", price: 54.99, stock_quantity: 25, category: audio, is_new: false, is_on_sale: false },
  { name: "Neckband Earphones", description: "Magnetic neckband earphones with 10hr battery.", price: 32.99, stock_quantity: 35, category: audio, is_new: false, is_on_sale: true },
  { name: "USB Desk Speaker", description: "Compact USB powered desk speaker with clear sound.", price: 27.99, stock_quantity: 30, category: audio, is_new: false, is_on_sale: false },
  { name: "Conference Speaker", description: "360 degree conference Bluetooth speaker with mic.", price: 89.99, stock_quantity: 15, category: audio, is_new: true, is_on_sale: false },
  { name: "Retro Bluetooth Speaker", description: "Retro radio design Bluetooth speaker with FM tuner.", price: 49.99, stock_quantity: 25, category: audio, is_new: false, is_on_sale: false },
  { name: "Smart Speaker", description: "Smart Bluetooth speaker with voice assistant support.", price: 69.99, stock_quantity: 20, category: audio, is_new: true, is_on_sale: false },

  # Power Banks (15)
  { name: "5000mAh Power Bank", description: "Ultra slim 5000mAh power bank fits in any pocket.", price: 24.99, stock_quantity: 60, category: power, is_new: false, is_on_sale: false },
  { name: "10000mAh Power Bank", description: "Slim 10000mAh power bank with dual USB output.", price: 39.99, stock_quantity: 50, category: power, is_new: false, is_on_sale: true },
  { name: "20000mAh Power Bank", description: "High capacity 20000mAh power bank with 65W fast charging.", price: 64.99, stock_quantity: 35, category: power, is_new: true, is_on_sale: false },
  { name: "30000mAh Power Bank", description: "Extra large 30000mAh power bank for multiple devices.", price: 79.99, stock_quantity: 25, category: power, is_new: false, is_on_sale: false },
  { name: "MagSafe Power Bank", description: "5000mAh MagSafe compatible magnetic power bank for iPhone.", price: 54.99, stock_quantity: 40, category: power, is_new: true, is_on_sale: false },
  { name: "Solar Power Bank", description: "20000mAh solar power bank with dual solar panels.", price: 59.99, stock_quantity: 30, category: power, is_new: true, is_on_sale: false },
  { name: "Wireless Power Bank", description: "10000mAh power bank with built-in wireless charging pad.", price: 49.99, stock_quantity: 35, category: power, is_new: false, is_on_sale: true },
  { name: "Rugged Power Bank", description: "Waterproof rugged 20000mAh power bank for outdoors.", price: 69.99, stock_quantity: 20, category: power, is_new: false, is_on_sale: false },
  { name: "Credit Card Power Bank", description: "Ultra thin credit card sized 2500mAh emergency charger.", price: 19.99, stock_quantity: 50, category: power, is_new: false, is_on_sale: false },
  { name: "Power Bank with Cables", description: "10000mAh power bank with built-in USB-C and Lightning.", price: 44.99, stock_quantity: 40, category: power, is_new: true, is_on_sale: false },
  { name: "Laptop Power Bank", description: "26800mAh power bank with 65W USB-C for laptops.", price: 89.99, stock_quantity: 20, category: power, is_new: true, is_on_sale: false },
  { name: "Quick Charge Power Bank", description: "10000mAh Qualcomm Quick Charge 4.0 power bank.", price: 44.99, stock_quantity: 35, category: power, is_new: false, is_on_sale: false },
  { name: "Keychain Power Bank", description: "Tiny 1500mAh keychain emergency charger for phones.", price: 14.99, stock_quantity: 65, category: power, is_new: false, is_on_sale: true },
  { name: "Display Power Bank", description: "10000mAh power bank with digital battery display.", price: 34.99, stock_quantity: 45, category: power, is_new: false, is_on_sale: false },
  { name: "Dual Wireless Power Bank", description: "15000mAh power bank that charges two devices wirelessly.", price: 74.99, stock_quantity: 25, category: power, is_new: true, is_on_sale: false },

  # Screen Protection (10)
  { name: "iPhone 15 Screen Protector", description: "Tempered glass screen protector for iPhone 15 pack of 2.", price: 12.99, stock_quantity: 80, category: screen, is_new: false, is_on_sale: false },
  { name: "Samsung S24 Screen Protector", description: "Curved tempered glass protector for Samsung Galaxy S24.", price: 14.99, stock_quantity: 70, category: screen, is_new: false, is_on_sale: true },
  { name: "Privacy Screen Protector", description: "Anti-spy privacy screen protector for Samsung Galaxy.", price: 17.99, stock_quantity: 60, category: screen, is_new: false, is_on_sale: true },
  { name: "Matte Screen Protector", description: "Anti-glare matte screen protector for iPhone 14 15.", price: 13.99, stock_quantity: 65, category: screen, is_new: false, is_on_sale: false },
  { name: "Tempered Glass Pixel 8", description: "Full coverage tempered glass for Google Pixel 8.", price: 13.99, stock_quantity: 55, category: screen, is_new: false, is_on_sale: false },
  { name: "Camera Lens Protector", description: "Tempered glass camera lens protector for iPhone 15 Pro.", price: 9.99, stock_quantity: 75, category: screen, is_new: true, is_on_sale: false },
  { name: "Full Body Screen Protector", description: "Front and back full body film protector for Samsung S24.", price: 16.99, stock_quantity: 50, category: screen, is_new: false, is_on_sale: false },
  { name: "Liquid Screen Protector", description: "Nano liquid screen protector compatible with all devices.", price: 11.99, stock_quantity: 60, category: screen, is_new: false, is_on_sale: true },
  { name: "Screen Protector iPhone 14", description: "Easy apply tempered glass for iPhone 14 pack of 3.", price: 11.99, stock_quantity: 70, category: screen, is_new: false, is_on_sale: false },
  { name: "Universal Tablet Protector", description: "Universal screen protector for tablets up to 11 inches.", price: 15.99, stock_quantity: 40, category: screen, is_new: false, is_on_sale: false },
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
