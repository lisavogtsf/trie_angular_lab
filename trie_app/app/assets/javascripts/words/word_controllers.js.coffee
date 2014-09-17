## app_controllers.js.coffee

WordCtrls = angular.module("WordCtrls", [])

class WordsCtrl 
	# where Word is a reference to a factory that returns all words
	# where/how does it return all words?
	# instead of this.scope? this.word?
	constructor: (@scope, @http, @Word)->
		@catchphrase = "WordCtrl controller/constructor is running"
		@Word.all()
			.success (data) =>
				@words = data
		# where this below is an instance of WordsCtrl
		# return this

	addWord: (newWord)->
		@Trie.learn newWord.name
		@Word.create(newWord)
		.success (data)=>
			@words.push data
			# console.log("Inside addWord: data= ", data)
			# console.log ("this, " this)
		# 	console.log("in success, that ", that)
		# console.log("after cuscces, that", that)
		# # how to clear out the form??
		# console.log("trying to clear form, newWord= ", newWord)
		# console.log("trying to clear form, newWord.name= ", newWord.name)
		# WordsCtrl.newWord = {}

WordCtrls.controller("WordsCtrl", ["$scope", "$http", "Word", "Trie", WordsCtrl])

#######################
## for doing all in one file, part of app.js.coffee
#TrieApp.controller "WordCtrls", ["$scope", "$http", ($scope, $http) ->
	## or WordsCtrl??
## trying to adapt old method with outer modular wrapper
# WordCtrls = angular.module("WordCtrls", ["$scope", "$http", ($scope, $http) ->


# 	# Old way of including https directly in controller
# 	$scope.words = []

# 	# READ/SHOW
# 	$scope.showWords = ->
# 	# make a GET request to /words.json
# 		$http.get("/words.json").success (data) ->
# 			# console.log("data from http get call, ", data)
# 			$scope.words = data

# 	$scope.showWords()

# 	# CREATE/NEW -- non-functional
# 	$scope.addTask = ->
# 		console.log("newWord parameters, ", $scope.newWord)
# 		# worry about injection? validation?
# 		# internal api call to rails controller, using json format
# 		# rails controller creates new task in database, returns object as success
# 		$http.post("/words.json", $scope.newWord).success (data) ->
# 			# clear out the add task form
# 			$scope.newWord ={}
# 			# add new task database object to words array
# 			# console.log(data)
# 			$scope.words.push(data)
# 			#console.log(task)
# 			# console.log(words)

# ])


