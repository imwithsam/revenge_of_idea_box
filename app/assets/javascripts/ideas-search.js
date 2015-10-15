$(document).ready(function() {
  searchIdeas();
});

function searchIdeas() {
  $('#idea-search').on('input', function() {
    var $ideas = $('.idea');
    var $search = $(this).val();

    $('.searchable:not(:contains(' + $search + '))').parent().hide();
    $('.searchable:contains(' + $search + ')').parent().show();
  });
};
