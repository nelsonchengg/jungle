describe("Add product to Cart", () => {

  it("should visit the home page", () => {
    cy.visit("/");
  });

  it('clicks on add button on one of the products', () => {
    cy.get('.btn').contains("Add").click({ force: true });
    cy.get(".nav-item").contains("My Cart (1)").should("be.visible");
  });
});