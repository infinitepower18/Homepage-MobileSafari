chrome.action.onClicked.addListener((tab) => {
  chrome.storage.sync.get({
    homepage: "options.html",
  }, function(items) {
    chrome.tabs.update({
      url: items.homepage
    });
  });
});
