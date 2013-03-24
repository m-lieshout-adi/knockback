/*
  knockback-triggering.js 0.17.0
  (c) 2011, 2012 Kevin Malakoff - http://kmalakoff.github.com/knockback/
  License: MIT (http://www.opensource.org/licenses/mit-license.php)
  Dependencies: Knockout.js, Backbone.js, and Underscore.js.
*/
(function() {
  return (function(factory) {
    // AMD
    if (typeof define === 'function' && define.amd) {
      return define('knockback-triggering', ['underscore', 'backbone', 'knockout', 'knockback'], factory);
    }
    // CommonJS/NodeJS or No Loader
    else {
      return factory.call(this);
    }
  })(function() {// Generated by CoffeeScript 1.6.2
var Collection, Model, kb, ko, _, _unwrapObservable;

kb = !this.kb && (typeof require !== 'undefined') ? require('knockback') : this.kb;

_ = kb._;

Model = kb.Model;

Collection = kb.Collection;

ko = kb.ko;

this.Knockback = this.kb = kb;

if (typeof exports !== 'undefined') {
  module.exports = kb;
}

_unwrapObservable = ko.utils.unwrapObservable;

/*
  knockback-triggered-observable.js 0.17.0
  (c) 2011, 2012 Kevin Malakoff.
  Knockback.Observable is freely distributable under the MIT license.
  See the following for full license details:
    https://github.com/kmalakoff/knockback/blob/master/LICENSE
*/


kb.TriggeredObservable = (function() {
  function TriggeredObservable(emitter, event_selector) {
    var observable,
      _this = this;

    this.event_selector = event_selector;
    emitter || _throwMissing(this, 'emitter');
    this.event_selector || _throwMissing(this, 'event_selector');
    this.vo = ko.observable();
    observable = kb.utils.wrappedObservable(this, ko.dependentObservable(function() {
      return _this.vo();
    }));
    observable.destroy = _.bind(this.destroy, this);
    kb.utils.wrappedEventWatcher(this, new kb.EventWatcher(emitter, this, {
      emitter: _.bind(this.emitter, this),
      update: _.bind(this.update, this),
      event_selector: this.event_selector
    }));
    return observable;
  }

  TriggeredObservable.prototype.destroy = function() {
    return kb.utils.wrappedDestroy(this);
  };

  TriggeredObservable.prototype.emitter = function(new_emitter) {
    if ((arguments.length === 0) || (this.ee === new_emitter)) {
      return this.ee;
    }
    if ((this.ee = new_emitter)) {
      return this.update();
    }
  };

  TriggeredObservable.prototype.update = function() {
    if (!this.ee) {
      return;
    }
    if (this.vo() !== this.ee) {
      return this.vo(this.ee);
    } else {
      return this.vo.valueHasMutated();
    }
  };

  return TriggeredObservable;

})();

kb.triggeredObservable = function(emitter, event_selector) {
  return new kb.TriggeredObservable(emitter, event_selector);
};
; return kb;});
}).call(this);