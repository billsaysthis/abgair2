export default Ember.Route.extend({
  model: function(params) {
    return this.store.find('user', params.user_id);
  },
  actions: {
    destroyRecord: function() {
      var model = this.get('controller.model');
      var _this = this;
      model.destroyRecord().then(function() {
        _this.transitionTo('users.index');
      });
    }
  }
});
