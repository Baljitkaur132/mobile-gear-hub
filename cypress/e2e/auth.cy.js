describe('User Authentication', () => {

  it('allows a new user to sign up', () => {
    cy.visit('/users/sign_up')
    cy.get('input[name="user[name]"]').type('Test User')
    cy.get('input[name="user[email]"]').type('testuser' + Date.now() + '@example.com')
    cy.get('input[name="user[password]"]').type('password123')
    cy.get('input[name="user[password_confirmation]"]').type('password123')
    cy.contains('button', 'Create Account').click()
    cy.contains('Welcome').should('be.visible')
  })

  it('allows an existing user to log in', () => {
    cy.visit('/users/sign_in')
    cy.get('input[name="user[email]"]').type('student@test.com')
    cy.get('input[name="user[password]"]').type('password123')
    cy.contains('button', 'Login').click()
    cy.url().should('eq', 'http://127.0.0.1:3000/')
  })

  it('shows error for invalid credentials', () => {
    cy.visit('/users/sign_in')
    cy.get('input[name="user[email]"]').type('student@test.com')
    cy.get('input[name="user[password]"]').type('wrongpassword')
    cy.contains('button', 'Login').click()
    cy.contains('Invalid').should('be.visible')
  })

  it('shows errors when signup fields are empty', () => {
    cy.visit('/users/sign_up')
    cy.contains('button', 'Create Account').click()
    cy.get('input:invalid').should('exist')
  })

  it('shows error when passwords do not match', () => {
    cy.visit('/users/sign_up')
    cy.get('input[name="user[name]"]').type('Test User')
    cy.get('input[name="user[email]"]').type('mismatch@example.com')
    cy.get('input[name="user[password]"]').type('password123')
    cy.get('input[name="user[password_confirmation]"]').type('different123')
    cy.contains('button', 'Create Account').click()
    cy.url().should('include', '/users')
  })

})
