browser.browserAction.onClicked.addListener((tab) => {
  chrome.storage.sync.get({
    homepage: "https://google.com",
  }, function(items) {
    chrome.tabs.create({
      url: items.homepage
    });
  });
});
