describe('jungle app', () => {
  beforeEach(() => {
    cy.visit('http://0.0.0.0:3000');
  })
  it("should go to the product page when the link is clicked", () => {
    cy.get('.products').children('article').first().click();
    cy.url().should('match', /http:\/\/0.0.0.0:3000\/products\/\d+/);
  });
})
