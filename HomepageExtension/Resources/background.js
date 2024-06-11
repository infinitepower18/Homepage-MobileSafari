chrome.action.onClicked.addListener((tab) => {
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
          if (items.homepage != "options.html") {
            chrome.storage.sync.clear();
          }
            chrome.tabs.update({
              url: response.url
            });
        } else {
          console.error("No URL received in the response.");
        }
      });
    });
});
