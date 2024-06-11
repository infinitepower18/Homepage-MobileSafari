function redirect() {
  chrome.storage.sync.get({
      homepage: "options.html",
    },
    function(items) {
      chrome.runtime.sendNativeMessage("application.id", {message: items.homepage}, function(response) {
          if items.homepage != "options.html" {
              chrome.storage.sync.clear();
          }
          window.location.replace(response["url"]);
      });
    }
  );
}
document.addEventListener("DOMContentLoaded", redirect);
