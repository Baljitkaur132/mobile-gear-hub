# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# 1 FeatureURL to demonstrate1.1★ Admin login127.0.0.1:3000/admin → login with admin@example.com / admin123

2. 1.2★ Add/edit products127.0.0.1:3000/admin/products → click Edit or New Product

1.3 Product images127.0.0.1:3000/admin/products → edit any product, show image

1.4 Edit about/contact127.0.0.1:3000/admin/site_settings → click Edit on about_content

1.5 Categories in admin127.0.0.1:3000/admin/categories

2.1★ Front page127.0.0.1:3000

2.2 Browse by category127.0.0.1:3000 → click Categories dropdown

2.3★ Product detail127.0.0.1:3000/products/1

2.4 Filters

127.0.0.1:3000 → click On Sale / New buttons

2.5 Pagination

127.0.0.1:3000 → scroll down, show page numbers

2.6 ★ Search

127.0.0.1:3000 → type in search box, select category, click Search

3.1.1 ★ Cart

127.0.0.1:3000/products/1 → click Add to Cart

3.1.2 Edit / Remove Cart

127.0.0.1:3000/cart → change quantity, click Remove

3.1.3 ★ Checkout + Taxes

127.0.0.1:3000/checkout → fill form, select Manitoba, show GST/PST

3.1.4 User Accounts

127.0.0.1:3000/users/sign_up → create account

3.1.5 Save Address

Sign up with address + province → show it saved

3.2.1 Order History

127.0.0.1:3000/orders → login first

3.2.2 Order Status

127.0.0.1:3000/admin/orders → change status to shipped

3.2.3 Province Taxes

127.0.0.1:3000/admin/provinces → show all 13 provinces with rates

3.3.2 Price Frozen

127.0.0.1:3000/orders → show unit_price saved on order items

4.1.3 Breadcrumbs

127.0.0.1:3000/products/1 → show Home / Category / Product

4.1.4 ★ View Partials

Show: app/views/products/_product_card.html.erb in VS Code

4.1.5 SCSS

Show: app/assets/stylesheets/application.bootstrap.scss in VS Code

4.1.6 Bootstrap

127.0.0.1:3000 → show navbar, grid, cards

4.2.1 ★ Validations

127.0.0.1:3000/admin/products/new → submit empty form → show errors

4.2.2 Relationships

Show schema.rb →

orders → order_items → products
products → tags
4.2.3 Flash + Session

Add to cart → show "added to cart" flash message

4.2.5 Many-to-Many Admin

127.0.0.1:3000/admin/tags → show tags managed without join table

5.1 ★ Git (32+ Commits)

git log --oneline → show 32+ commits and 3+ branches

5.2 ★ Active Storage

127.0.0.1:3000/admin/products → show image column






127.0.0.1:3000 — home page
127.0.0.1:3000/admin — login with admin@example.com / admin123
127.0.0.1:3000/users/sign_up — registration
127.0.0.1:3000/cart — shopping cart
127.0.0.1:3000/checkout — checkout with taxes
127.0.0.1:3000/orders — order history
127.0.0.1:3000/about — about page
github.com/Baljitkaur132/mobile-gear-hub —  commits and branches



cd mobile_gear_hub
rm -f tmp/pids/server.pid
kill -9 $(lsof -ti:3000)
bin/dev
```

---

**Step 2 — Open browser and follow this exact order:**

**1. Home page + filters (2.1, 2.4)**
```
Go to: 127.0.0.1:3000
Show: products listing, click "On Sale", click "New"
```

**2. Search (2.6)**
```
Type "case" in search box
Select "Phone Cases" from dropdown
Click Search
Show results filtered by category
```

**3. Category navigation (2.2)**
```
Click "Categories" in navbar
Click any category
Show products filtered
```

**4. Product detail page (2.3)**
```
Click "View Details" on any product
Show: breadcrumbs, price, Add to Cart button
```

**5. Cart (3.1.1, 3.1.2)**
```
Click Add to Cart
Go to: 127.0.0.1:3000/cart
Show: items in cart
Change quantity, click Update
Click Remove on one item
```

**6. Checkout with taxes (3.1.3)**
```
Go to: 127.0.0.1:3000/checkout
Fill in:
  Name: Test User
  Email: test@test.com
  Address: 123 Main St
  City: Winnipeg
  Postal Code: R3C 1A1
Select Province: Manitoba
Show GST and PST updating automatically
Click Place Order
Show order confirmation page
```

**7. User signup with address (3.1.4, 3.1.5)**
```
Go to: 127.0.0.1:3000/users/sign_up
Fill in name, email, password
Fill in address, city, postal code
Select province
Click Create Account
Show "signed up successfully" flash message
```

**8. Order history (3.2.1)**
```
Go to: 127.0.0.1:3000/orders
Show past orders with products, taxes, total
```

**9. About page (1.4)**
```
Go to: 127.0.0.1:3000/about
Go to: 127.0.0.1:3000/contact
```

**10. Admin login (1.1)**
```
Go to: 127.0.0.1:3000/admin
Email: admin@example.com
Password: admin123
```

**11. Admin products (1.2, 1.3)**
```
Click Products in admin navbar
Show all 10 products with categories
Click Edit on any product
Show image upload field
Show the uploaded phone image
```

**12. Admin categories (1.5)**
```
Click Categories in admin navbar
Show 5 categories with product counts
Click New Category - show you can create one
```

**13. Admin orders + status change (3.2.2)**
```
Click Orders in admin navbar
Show orders with customer details
Click Edit on an order
Change status to "shipped"
Click Update
```

**14. Admin provinces/taxes (3.2.3)**
```
Click Provinces in admin navbar
Show all 13 Canadian provinces
Show GST/PST/HST rates for each
```

**15. Admin site settings (1.4)**
```
Click Site Settings in admin navbar
Click Edit on about_content
Change the text
Click Update
Go to 127.0.0.1:3000/about
Show updated content
```

---

**Step 3 — Show code in VS Code:**

**Partials (4.1.4)**
```
Open: app/views/products/_product_card.html.erb
Open: app/views/shared/_flash_messages.html.erb
Open: app/views/shared/_breadcrumbs.html.erb
```

**SCSS (4.1.5)**
```
Open: app/assets/stylesheets/application.bootstrap.scss
Show: variables ($primary-color), nesting (.navbar .navbar-brand), inheritance
```

**Validations (4.2.1)**
```
Open: app/models/product.rb
Open: app/models/user.rb
Open: app/models/order.rb
Show validates lines in each
```

**Schema relationships (4.2.2, 3.3.2)**
```
Open: db/schema.rb
Show: orders table has user_id
Show: order_items table has unit_price and product_name (frozen at purchase)



git log --oneline | wc -l




2026-04-01

1. Poduct count 10 ( now i added Feature 1.6 - Seed 100 products (2%):)   127.0.0.1:3000/admin/products

2. 4.2.4 Image variants (2%):
Step 1 —  small thumbnail on listing page:
Go to: 127.0.0.1:3000
 product cards with small images (400x300 variant)
Step 2 —  large image on detail page:
Click "View Details" on iPhone 15 Silicone Case
 the LARGE image (800x600 variant) ← you are here now!
Step 3 —  VS Code code:
Open: app/views/products/_product_card.html.erb
Point to:
product.image.variant(resize_to_limit: [400, 300])

Open: app/views/products/show.html.erb  
Point to:
product.image.variant(resize_to_limit: [800, 600])

3. feature 4.2.5 working (2)
rails runner "
Tag.all.each do |t|
  puts t.name + ': ' + t.products.count.to_s + ' products'
end
"
```

**IN VS Code I MAKE CHANGES IN:**
```
: app/models/product.rb

  has_many :product_tags
  has_many :tags, through: :product_tags

 4.1.5             grep -n "spacing-unit\|@extend\|font-size.*\*\|navbar-brand" app/assets/stylesheets/application.bootstrap.scss
Step 1 —  VS Code and show the file:
 app/assets/stylesheets/application.bootstrap.scss
Step 2 — Point to each requirement one by one:
Variables — point to lines at top:
scss$primary-color: #0d6efd;
$dark-color: #212529;
$spacing-unit: 8px;
: "These are added SCSS variables — I define colors and spacing once and reuse them"
Nesting —  navbar section:
scss.navbar {
  .navbar-brand {        // nested inside .navbar
    font-weight: bold;
  }
  &:hover {             // & refers to parent
    background-color: darken(#ffc107, 10%);
  }
}
 "This is SCSS nesting — styles inside other styles"
Inheritance — point to placeholders:
scss%card-base {
  border-radius: $border-radius-custom;
  box-shadow: $card-shadow;
}

.card {
  @extend %card-base;  // inherits from %card-base
}

.checkout-card {
  @extend %card-base;  // also inherits
}
 "This is SCSS inheritance — multiple classes share the same base styles"
Operators — point to calculations:
scssfont-size: $font-size-base * 1.4;      // multiplication
transform: translateY(-($spacing-unit / 2));  // division
box-shadow: 0 ($spacing-unit * 2) ...;  // multiplication
```
 *"These are SCSS operators — math calculations using variables"*

**Then show it working in browser:**
```
Go to: 127.0.0.1:3000
Right-click any product card → Inspect
Show compiled CSS has the styles applied
Run this command to quickly open the file location:
bashcat app/assets/stylesheets/application.bootstrap.scss | head -60 4.1.5  Use the SCSS pre-processor for all styling rules instead of CSS.
       - Your SCSS must include the use of nesting, variables, 
         inheritance and operators.

For showing 3.1.4 
1.  127.0.0.1:3000/users/sign_up
   - Show signup form with name, email, password, address, province
   - Fill it in and create account
   - Show "Welcome! Signed up successfully" flash message

2. 127.0.0.1:3000/users/sign_in  
   - Login with the account you just created
   - Show you stay logged in (name appears in navbar)

3. Open VS Code - show Gemfile:
   grep "devise" Gemfile
   - Point to: gem "devise"

4.  passwords are hashed:   rails runner "puts User.first.encrypted_password"

Feature 3.1.5 — Save Address + Province (4%)

rails runner "
u = User.last
puts '========================'
puts 'Name:       ' + u.name.to_s
puts 'Email:      ' + u.email.to_s
puts 'Address:    ' + u.address.to_s
puts 'City:       ' + u.city.to_s
puts 'Postal:     ' + u.postal_code.to_s
puts 'Province ID:' + u.province_id.to_s
puts 'Province:   ' + u.province&.name.to_s
puts 'GST rate:   ' + u.province&.gst.to_s + '%'
puts 'PST rate:   ' + u.province&.pst.to_s + '%'
puts '========================'
"
```

**Step 3 — i need to show in admin:**
```
 127.0.0.1:3000/admin/users
next  View on Demo User
Show: Province = Manitoba

kill -9 $(lsof -ti:3000) && rm -f tmp/pids/server.pid && bin/dev


11/04/2025 

1) Feature 5.4 — Rubocop Zero Offenses (4%)
Result: 20 files inspected, no offenses detected ✓

 to show instructor:
Step 1 — Run Rubocop in terminal:
bashbundle exec rubocop app/controllers/ app/models/
Show output:
20 files inspected, no offenses detected
Step 2 — Show .rubocop.yml file in VS Code:
Open: .rubocop.yml
Say: " my Rubocop configuration file"
Step 3 — Show Gemfile has Rubocop:
bashgrep "rubocop" Gemfile
Shows:
gem "rubocop-rails-omakase", require: false
to instructor:
"I installed Rubocop gem and configured it to check my code style. After running it, I fixed all offenses. Now when I run Rubocop it shows zero offenses on all my controllers and models."

2) To show instructor — demo these pages in mobile view:
Step 1 — Home page (already done):
Show: products in 1 column
Show: hamburger menu top right
Click hamburger: show menu opens
Step 2 — Cart page:
Go to: 127.0.0.1:3000/cart
Show cart works on mobile
Step 3 — Checkout page:
Go to: 127.0.0.1:3000/checkout
Show form works on mobile
Step 4 — Show VS Code:
Open: app/views/layouts/application.html.erb
Point to: navbar-expand-lg
Point to: navbar-toggler

Open: app/views/products/index.html.erb
Point to: row-cols-1 row-cols-md-3
Say: "1 column mobile, 3 columns desktop"
Say to instructor:
"My site is fully responsive using Bootstrap grid system. On mobile it shows 1 column with hamburger menu. On desktop it shows 3 columns with full navbar."
Features confirmed:

4.1.2 Consistent look and feel = 4% ✓
4.1.7 Responsive design = 4% ✓
