$(function(){


  //（１）ページの概念・初期ページを設定
  var page=0;
  
  //（２）イメージの数を最後のページ数として変数化
  var lastPage =parseInt($(".slide_img").length-1);
  
  //（３）最初に全部のイメージを一旦非表示にします
       $(".slide_img").css("display","none");
  
  //（４）初期ページを表示
            $(".slide_img").eq(page).css("display","block");
  
  //（５）ページ切換用、自作関数作成
  function changePage(){
                           $(".slide_img").fadeOut(1000);
                           $(".slide_img").eq(page).fadeIn(1000);
  };
  
  //（６）～秒間隔でイメージ切換の発火設定
  var Timer;
  function startTimer(){
  Timer =setInterval(function(){
            if(page === lastPage){
                           page = 0;
                           changePage();
                 }else{
                           page ++;
                           changePage();
            };
       },5000);
  }
  //（７）～秒間隔でイメージ切換の停止設定
  function stopTimer(){
  clearInterval(Timer);
  }
  
  //（８）タイマースタート
  startTimer(3);
  
  /*オプションを足す場合はここへ記載*/
  
  });