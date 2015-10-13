function renderIdeas(payload) {
  var compiled = _.template(
    '<tr>' +
      '<td><%= title %></td>' +
      '<td><%= body %></td>' +
      '<td><%= quality %></td>' +
    '</tr>'
  );

  return compiled(payload);
};
