// GroupName : TechCraft
// ProjectName: AutoByteCare
// DatabaseName:autobytecare
// Members :  Shree Dhar Acharya : 8899288
//            Rishab Abbhi : 8874858
//            Rohit Rana : 8874589
$(document).ready(function () {
  let fontSize = 16; // Initial font size

  // Function to set font size based on dropdown selection
  $(".font-size-option").click(function () {
    const selectedSize = $(this).data("size");
    switch (selectedSize) {
      case "small":
        fontSize = 14;
        break;
      case "medium":
        fontSize = 16;
        break;
      case "large":
        fontSize = 18;
        break;
      case "extra-large":
        fontSize = 20;
        break;
      default:
        fontSize = 16;
    }
    // Target all elements within the <html> tag and change font size
    $("html").css("font-size", fontSize + "px");
  });

  // Function to increase font size
  $("#increase-font").click(function () {
    fontSize += Math.round(fontSize * 0.1); // Increase by 10% of current size
    $("html").css("font-size", fontSize + "px");
  });

  // Function to decrease font size
  $("#decrease-font").click(function () {
    fontSize -= Math.round(fontSize * 0.1); // Decrease by 10% of current size
    $("html").css("font-size", fontSize + "px");
  });

  // Smooth scrolling for navigation links
  $(".navbar-nav .nav-link").on("click", function (event) {
    if (this.hash !== "") {
      event.preventDefault();

      const hash = this.hash;
      $("html, body").animate(
        {
          scrollTop: $(hash).offset().top - 80,
        },
        800
      );
    }
  });

  $(".report-button").click(function (event) {
    event.preventDefault();

    var apiURL = $(this).data("api-url");

    // Open the PDF in a new window/tab
    window.open(apiURL);
  });

  // Toggle navbar on small screens
  $(".navbar-toggler").on("click", function () {
    $(".navbar-collapse").toggleClass("show");
  });

  // Highlight active navigation link while scrolling
  $(window).scroll(function () {
    $(".section").each(function () {
      const top = $(window).scrollTop();
      const offset = $(this).offset().top - 100;
      const id = $(this).attr("id");

      if (top >= offset) {
        $(".navbar-nav .nav-link").removeClass("active");
        $(".navbar-nav").find(`[href="#${id}"]`).addClass("active");
      }
    });
  });
});
