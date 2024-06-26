function redirect() {
  chrome.storage.sync.get({
    homepage: "options.html",
  }, function(items) {
    chrome.runtime.sendNativeMessage("application.id", { message: items.homepage }, function(response) {
      if (chrome.runtime.lastError) {
        console.error(chrome.runtime.lastError);
        return;
      }

      // Check if response contains the expected "url" key
      if (response && response.url) {
        // Clear once migrated to UserDefaults
        if (items.homepage != "options.html") {
          chrome.storage.sync.clear();
        }
        window.location.replace(response.url);
      } else {
        console.error("No URL received in the response.");
      }
    });
  });
}
document.addEventListener("DOMContentLoaded", redirect);
