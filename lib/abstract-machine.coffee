AbstractMachineView = require './abstract-machine-view'
{CompositeDisposable} = require 'atom'

module.exports = AbstractMachine =
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'abstract-machine:toggle': => @toggle()

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->
    abstractMachineViewState: @abstractMachineView.serialize()

  toggle: ->
    console.log 'AbstractMachine was toggled!'
