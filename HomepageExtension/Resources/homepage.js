function redirect() {
  chrome.storage.sync.get({
      homepage: "options.html",
    },
    function(items) {
      window.location.href = items.homepage;
    }
  );
}
document.addEventListener("DOMContentLoaded", redirect);
