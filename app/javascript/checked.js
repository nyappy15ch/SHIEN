function check() {
  const NotiPosts = document.querySelectorAll(".noti_post");
  NotiPosts.forEach(function (NotiPost) {
    if (NotiPost.getAttribute("data-load") != null) {
      return null;
    }
    NotiPost.setAttribute("data-load", "true");
    if (NotiPost.getAttribute("data-check") === true) {
      return null;
    } else {
      NotiPost.addEventListener("click", () => {
        const NotiPostId = NotiPost.getAttribute("data-id");
        const XHR = new XMLHttpRequest();
        XHR.open("GET", `/notifications/${NotiPostId}`, true);
        XHR.responseType = "json";
        XHR.send();
        XHR.onload = () => {
          if (XHR.status != 200) {
            alert(`Error ${XHR.status}: ${XHR.statusText}`);
            return null;          
          }
          const response = XHR.response.notification;
          if (response.checked === true){
            NotiPost.setAttribute("data-check", "true");
          }
        };
      });
    }
  });
}

setInterval(check, 1000);