describe('jungle app', () => {
  beforeEach(() => {
    cy.visit('http://0.0.0.0:3000');
  })
  it("Products should be in the cart when the add button is clicked", () => {
    cy.get('.nav-link').should('contain', ' My Cart (0) ');
    cy.get('.products').children('article').contains('Add').click({ force: true });
    cy.get('.nav-link').should('contain', ' My Cart (1) ');
  });
})
