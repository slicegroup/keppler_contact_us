var myDropzone = new Dropzone(".dropzone", {
  url: "/"
});

$(".dropzone").dropzone({
  url: "/"
});

// "myAwesomeDropzone" is the camelized version of the HTML element's ID
Dropzone.options.myAwesomeDropzone = {
  paramName: "file", // The name that will be used to transfer the file
  maxFilesize: 2, // MB
  accept: function (file, done) {
    if (file.name == "justinbieber.jpg") {
      done("Naha, you don't.");
    } else {
      done();
    }
  }
};

// Prevent Dropzone from auto discovering this element:
Dropzone.options.myAwesomeDropzone = false;
// This is useful when you want to create the
// Dropzone programmatically later

// Disable auto discover for all elements:
Dropzone.autoDiscover = false;