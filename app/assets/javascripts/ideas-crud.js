$(document).ready(function() {
  createIdea();
  deleteIdea();
  likeIdea();
  dislikeIdea();
});

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
    + '<td class="searchable mdl-data-table__cell--non-numeric">'
    + idea.title
    + '</td>'
    + '<td class="searchable mdl-data-table__cell--non-numeric">'
    + idea.body
    + '</td>'
    + '<td class="idea-quality mdl-data-table__cell--non-numeric">'
    + idea.quality
    + '</td>'
    + '<td>'
    + '<a href="#" class="idea-like mdl-button mdl-js-button mdl-button--primary">Like</a>'
    + '</td>'
    + '<td>'
    + '<a href="#" class="idea-dislike mdl-button mdl-js-button mdl-button--primary">Dislike</a>'
    + '</td>'
    + '<td>'
    + '<a href="/ideas/' + idea.id + '/edit" class="mdl-button mdl-js-button mdl-button--primary">Edit</a>'
    + '</td>'
    + '<td>'
    + '<a href="#" class="idea-delete mdl-button mdl-js-button mdl-button--accent">Delete</a>'
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
    var $quality = $idea.children('.idea-quality').html();
    var patchParams = {
      _method: 'PATCH',
      idea: {
        quality: bumpQuality($quality, 'like')
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

function dislikeIdea() {
  // Must use delegate because like button may not exist yet.
  $('#ideas-all').delegate('.idea-dislike', 'click', function() {
    var $idea = $(this).closest('.idea');
    var $quality = $idea.children('.idea-quality').html();
    var patchParams = {
      _method: 'PATCH',
      idea: {
        quality: bumpQuality($quality, 'dislike')
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

function bumpQuality(current, action) {
  var quality = ['swill', 'plausible', 'genius'];
  var index = quality.indexOf(current);

  if (action === 'like') {
    index++;
  } else if (action === 'dislike') {
    index--;
  }

  if (index < 0) {
    index = 0;
  } else if (index > 2) {
    index = 2;
  }

  return quality[index];
}
