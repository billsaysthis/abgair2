export default Ember.Route.extend({
  model: function(params) {
    return this.store.find('user', params.user_id);
  },
  deactivate: function() {
    var model = this.get('controller.model');
    model.rollback();
  },
  actions: {
    save: function() {
      var model = this.get('controller.model');
      var _this = this;
      model.save().then(function() {
        _this.transitionTo('users.show', model);
      });
    },
    cancel: function() {
      var model = this.get('controller.model');
      this.transitionTo('users.show', model);
    }
  }
});
