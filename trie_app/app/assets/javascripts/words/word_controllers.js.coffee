# app_controllers.js.coffee
# note plural
WordCtrls = angular.module("WordCtrls", [])

class WordsCtrl 

	# instead of this.scope? this.word?
	constructor: (@scope, @Word)->
		@catchphrase = "WordCtrl is running, or just created?"
		@Word.all()
		return this

	addWord: (newWord)->
		@Word.create(newWord)
		.success (data)->
			console.log("Inside addWord: data:, ", data)

WordCtrls.controller("WordsCtrl", ["$scope", "Word", WordsCtrl])
