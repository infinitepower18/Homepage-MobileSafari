function redirect() {
  chrome.runtime.sendNativeMessage("application.id", { message: "get-homepage" }, function(response) {
    if (chrome.runtime.lastError) {
      console.error(chrome.runtime.lastError);
      return;
    }

    // Check if response contains the expected "url" key
    if (response && response.url) {
      window.location.replace(response.url);
    } else {
      console.error("No URL received in the response.");
    }
  });
}
document.addEventListener("DOMContentLoaded", redirect);
