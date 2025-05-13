<template>
  <div>
    <h1 class="main-title">Bienvenue sur Bastien Testing Lab</h1>
    <NuxtRouteAnnouncer data-testid="nuxt-route-announcer" />
    <NuxtWelcome data-testid="nuxt-welcome" />
  </div>
</template>

<style scoped>
.main-title {
  font-size: 2.5rem;
  font-weight: bold;
  color: #2c3e50;
  text-align: center;
  margin: 2rem 0;
  padding: 1rem;
  border-bottom: 3px solid #42b883;
}
</style>
