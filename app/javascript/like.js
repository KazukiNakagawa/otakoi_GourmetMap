// app/assets/javascripts/likes.js

document.addEventListener("DOMContentLoaded", function() {
  // いいねボタンの非同期処理
  const likeButtons = document.querySelectorAll(".like-link");
  likeButtons.forEach(button => {
    button.addEventListener("click", function(event) {
      event.preventDefault();
      const url = this.getAttribute("href");

      fetch(url, { method: "POST" })
        .then(response => response.json())
        .then(data => {
          // 成功時の処理
          alert(data.message); // いいねメッセージの表示など
          // 任意の追加処理を行う場合はここに記述
        })
        .catch(error => console.error(error));
    });
  });

  // いいね解除ボタンの非同期処理
  const unlikeButtons = document.querySelectorAll(".unlike-link");
  unlikeButtons.forEach(button => {
    button.addEventListener("click", function(event) {
      event.preventDefault();
      const url = this.getAttribute("href");

      fetch(url, { method: "DELETE" })
        .then(response => response.json())
        .then(data => {
          // 成功時の処理
          alert(data.message); // いいね解除メッセージの表示など
          // 任意の追加処理を行う場合はここに記述
        })
        .catch(error => console.error(error));
    });
  });
});
