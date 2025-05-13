describe('Page d\'accueil Nuxt', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it('devrait afficher les composants Nuxt de base', () => {
    // Vérifie que la page est chargée
    cy.get('div').should('exist')

    // Vérifie la présence du NuxtWelcome
    cy.get('[data-testid="nuxt-welcome"]').should('exist')

    // Vérifie que le NuxtRouteAnnouncer est présent dans le DOM
    cy.get('[data-testid="nuxt-route-announcer"]').should('exist')
  })
})
