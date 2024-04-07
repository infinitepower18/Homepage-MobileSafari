function save_options() {
  var homepage = document.getElementById("homepage").value;
  chrome.storage.sync.set({
      homepage: homepage,
    },
    function() {
      var status = document.getElementById("status");
      status.textContent = "Homepage saved. Your homepage will be loaded the next time you open a new tab.";
      setTimeout(function() {
        status.textContent = "";
      }, 5000);
    }
  );
}

function validateForm() {
  const urlInput = document.getElementById("homepage");
  const url = urlInput.value;

  const pattern =
    /^(https?:\/\/)(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$/;

  if (pattern.test(url)) {
    save_options();
  } else {
    document.getElementById("status").textContent =
      "Please enter a valid URL starting with http:// or https://";
    urlInput.focus();
  }
}

function restore_options() {
  chrome.storage.sync.get({
      homepage: "",
    },
    function(items) {
      document.getElementById("homepage").value = items.homepage;
    }
  );
}
document.addEventListener("DOMContentLoaded", restore_options);
document.getElementById("save").addEventListener("click", validateForm);
