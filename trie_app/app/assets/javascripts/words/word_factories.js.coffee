# word_factories.js.coffee

WordFactories = angular.module("WordFactories", [])

## making a factory that wraps up the $http function so other parts of the probram can use it

WordFactories.factory("Word", ["$http", ($http)->

	return {
		all: ()->
			console.log("Getting all words using $http")
			$http.get("/words.json").success (data)->
				console.log (data)
		,
		create: (newWord)->
			console.log(newWord)
			$http.post("/words.json", {word: newWord})
	}
])


## older method for all one file, coffeescript
## WordFactories.factory("Word", ["$http", ($http)->

## javascritpt factory, from one-file version
# 	App.factory("WillyWonka", [function(){
#   return {
#     treats: ["Gobstoppers", "Snozberries"],
#     people: ["Willy", "Charlie", "Violet", "Augustus"],
#     removeTreat: function (index) {
#       this.treats.splice(index,1)
#     }
#   };
# }])
# ])