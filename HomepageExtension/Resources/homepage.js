function redirect() {
  chrome.storage.sync.get({
      homepage: "https://google.com",
    },
    function(items) {
      window.location.href = items.homepage;
    }
  );
}
document.addEventListener("DOMContentLoaded", redirect);
