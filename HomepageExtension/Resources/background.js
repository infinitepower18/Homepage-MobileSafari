browser.browserAction.onClicked.addListener((tab) => {
  chrome.storage.sync.get({
    homepage: "https://google.com",
  }, function(items) {
    chrome.tabs.update({
      url: items.homepage
    });
  });
});
