document.addEventListener('DOMContentLoaded', function() {
    const likeLinks = document.querySelectorAll('.like-link');
    const unlikeLinks = document.querySelectorAll('.unlike-link');
  
    likeLinks.forEach(function(link) {
      link.addEventListener('click', function(event) {
        event.preventDefault(); // デフォルトのクリックイベントをキャンセル
  
        const shopId = this.dataset.shop_id;
        likeShop(shopId);
      });
    });
  
    unlikeLinks.forEach(function(link) {
      link.addEventListener('click', function(event) {
        event.preventDefault(); // デフォルトのクリックイベントをキャンセル
  
        const shopId = this.dataset.shop_id;
        unlikeShop(shopId);
      });
    });
  
    function likeShop(shopId) {
      fetch('/shops/' + shopId + '/likes', { method: 'POST' })
        .then(function(response) {
          if (response.ok) {
            // いいねが成功した場合の処理
            updateButtonState(shopId, true);
          } else {
            // いいねが失敗した場合の処理
            console.error('いいねが失敗しました');
          }
        })
        .catch(function(error) {
          console.error('通信エラー:', error);
        });
    }
  
    function unlikeShop(shopId) {
      fetch('/shops/' + shopId + '/likes', { method: 'DELETE' })
        .then(function(response) {
          if (response.ok) {
            // いいね解除が成功した場合の処理
            updateButtonState(shopId, false);
          } else {
            // いいね解除が失敗した場合の処理
            console.error('いいね解除が失敗しました');
          }
        })
        .catch(function(error) {
          console.error('通信エラー:', error);
        });
    }
  
    function updateButtonState(shopId, isLiked) {
      const likeButton = document.querySelector('.like-btn[data-shop_id="' + shopId + '"]');
  
      if (isLiked) {
        likeButton.innerHTML = '<a href="#" class="unlike-link" data-shop_id="' + shopId + '"><i class="fas fa-heart liked"></i> いいね解除</a>';
        likeButton.querySelector('.unlike-link').addEventListener('click', function(event) {
          event.preventDefault();
          unlikeShop(shopId);
        });
      } else {
        likeButton.innerHTML = '<a href="#" class="like-link" data-shop_id="' + shopId + '"><i class="far fa-heart"></i> いいね</a>';
        likeButton.querySelector('.like-link').addEventListener('click', function(event) {
          event.preventDefault();
          likeShop(shopId);
        });
      }
    }
  });
  