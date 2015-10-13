//= require jquery
//= require lodash
//= require render

describe('renderIdeas()', function() {
  it('generates HTML for an idea', function() {
    var json = {
      'title':   'Title 1',
      'body':    'Body 1',
      'quality': 'swill'
    };
    var output = renderIdeas(json);

    expect(output).toContain('Title 1');
    expect(output).toContain('Body 1');
    expect(output).toContain('swill');
    // expect(true).toBe(true);
    // expect(jQuery).toBeDefined();
  });
});
