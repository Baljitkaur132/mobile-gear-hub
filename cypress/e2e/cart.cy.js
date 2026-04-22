describe('Shopping Cart and Checkout', () => {

  it('allows adding a product to the cart', () => {
    cy.visit('/products/2')
    cy.contains('Add to Cart').click()
    cy.contains(/added|cart/i).should('be.visible')
  })

  it('allows changing quantity in cart', () => {
    cy.visit('/products/2')
    cy.contains('Add to Cart').click()
    cy.visit('/cart')
    cy.get('input[name*="quantity"]').first().clear().type('3')
    cy.contains(/update/i).click()
    cy.get('input[name*="quantity"]').first().should('have.value', '3')
  })

  it('allows removing an item from the cart', () => {
    cy.visit('/products/2')
    cy.contains('Add to Cart').click()
    cy.visit('/cart')
    cy.contains(/remove/i).first().click()
    cy.contains(/empty|no items/i).should('be.visible')
  })

  it('shows checkout form with tax fields', () => {
    cy.visit('/products/2')
    cy.contains('Add to Cart').click()
    cy.visit('/checkout')
    cy.get('select[name*="province"]').select('Manitoba')
    cy.contains('GST').should('be.visible')
    cy.contains('PST').should('be.visible')
  })

  it('redirects away from checkout when cart is empty', () => {
    cy.clearCookies()
    cy.visit('/checkout')
    cy.url().should('not.include', '/checkout')
  })

})
