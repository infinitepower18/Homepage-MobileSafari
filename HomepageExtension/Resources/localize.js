// Function to load translations
function loadTranslations(lang) {
  fetch('translations.json')
    .then(response => response.json())
    .then(data => {
      document.getElementById('message').textContent = data[lang].message;
      document.getElementById('openApp').textContent = data[lang].openApp;
    })
    .catch(error => console.error('Error loading translations:', error));
}

// Function to get the user's language preference
function getUserLanguage() {
  return navigator.language || navigator.userLanguage;
}

// Load the translations when the page loads
document.addEventListener('DOMContentLoaded', () => {
  const userLang = getUserLanguage().slice(0, 2); // Use the first two letters of the language code
  loadTranslations(userLang);
});
