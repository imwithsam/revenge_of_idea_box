//= require jquery
//= require lodash
//= require ideas-crud

// TODO: Get this test to work or delete.
xdescribe('renderIdea()', function() {
  it('prepends a table row for a new idea', function() {
    var payload = {
      'title':   'Title 1',
      'body':    'Body 1',
      'quality': 'swill'
    };
    var ideasBody = document.createElement('table');
    ideasBody.id = 'ideas-all';

    output = renderIdea(payload);

    expect($('#ideas-all').html()).toContain('Title 1');
    expect($('#ideas-all').html()).toContain('Body 1');
    expect($('#ideas-all').html()).toContain('swill');
  });
});
