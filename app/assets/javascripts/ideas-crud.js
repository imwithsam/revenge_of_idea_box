function createIdea() {
  $('#idea-save').on('click', function() {
    var postParams = {
      idea: {
        title: $('#idea-title').val(),
        body: $('#idea-body').val()
      }
    };

    $.ajax({
      type: 'POST',
      url:  '/api/v1/ideas',
      data: postParams,
      success: function(idea) {
        renderIdea(idea);
      }
    });
  });
};

function renderIdea(idea) {
  $('#ideas-all').prepend(
    '<tr>'
    + '<td>'
    + idea.title
    + '</td>'
    + '<td>'
    + idea.body
    + '</td>'
    + '<td>'
    + idea.quality
    + '</td>'
    + '<td>'
    + '<a href="#">Like</a>'
    + '</td>'
    + '<td>'
    + '<a href="#">Dislike</a>'
    + '</td>'
    + '<td>'
    + '<a href="#">Edit</a>'
    + '</td>'
    + '<td>'
    + '<a href="#">Delete</a>'
    + '</td>'
    + '</tr>'
  );
};

$(document).ready(function() {
  createIdea();
});
