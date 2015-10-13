function renderIdeas(payload) {
  var compiled = _.template(
    '<h1><%= title %></h1><p><%= body %></p><p><%= quality %></p>'
  );
  return compiled(payload);
};
