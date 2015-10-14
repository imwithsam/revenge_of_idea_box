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
      url:  '/api/v1/ideas/',
      data: postParams,
      success: function(idea) {
        renderIdea(idea);
      }
    });
  });
};

function renderIdea(idea) {
  $('#ideas-all').prepend(
    '<tr class="idea" data-id="' + idea.id + '">'
    + '<td>'
    + idea.title
    + '</td>'
    + '<td>'
    + idea.body
    + '</td>'
    + '<td class="idea-quality">'
    + idea.quality
    + '</td>'
    + '<td>'
    + '<a href="#" class="idea-like">Like</a>'
    + '</td>'
    + '<td>'
    + '<a href="#">Dislike</a>'
    + '</td>'
    + '<td>'
    + '<a href="#">Edit</a>'
    + '</td>'
    + '<td>'
    + '<a href="#" class="idea-delete">Delete</a>'
    + '</td>'
    + '</tr>'
  );
};

function deleteIdea() {
  // Must use delegate because delete button may not exist yet.
  $('#ideas-all').delegate('.idea-delete', 'click', function() {
    var $idea = $(this).closest('.idea');

    $.ajax({
      type: 'DELETE',
      url: '/api/v1/ideas/'
           + $idea.attr('data-id'),
      success: function() {
        $idea.remove();
      },
      error: function() {
        // Assume idea was already removed by another request
        $idea.remove();
      }
    });
  });
};

function likeIdea() {
  // Must use delegate because like button may not exist yet.
  $('#ideas-all').delegate('.idea-like', 'click', function() {
    var $idea = $(this).closest('.idea');
    var patchParams = {
      _method: 'PATCH',
      idea: {
        quality: 'plausible'
      }
    };

    $.ajax({
      type: 'POST',
      url: '/api/v1/ideas/'
           + $idea.attr('data-id'),
      data: patchParams,
      success: function(idea) {
        rerenderQuality.call($idea, idea);
      }
    });
  });
};

function rerenderQuality(idea) {
  $(this).children('.idea-quality').html(idea.quality);
};

$(document).ready(function() {
  createIdea();
  deleteIdea();
  likeIdea();
});
