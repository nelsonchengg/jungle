describe("Products Page", () => {

  it("should visit the home page", () => {
    cy.visit("/");
  });

  it('clicks on one of the products', () => {
    cy.get('.products article').first().click();
  });
});