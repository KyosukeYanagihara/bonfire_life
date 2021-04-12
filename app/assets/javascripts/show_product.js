$(document).on('turbolinks:load', function() {
    $('.image_list').click(function () {
      var $src = $(this).attr('src');
      $('.main_image').attr('src', $src);
    });
  });