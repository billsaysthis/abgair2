var Router = Ember.Router.extend();

Router.map(function() {
  this.resource('users', function() {
    this.route('new');
    this.route('show', {path: ':user_id'});
    this.route('edit', {path: ':user_id/edit'});
  });
});

export default Router;
