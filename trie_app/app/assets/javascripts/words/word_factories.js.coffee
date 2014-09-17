# word_factories.js.coffee

WordFactories = angular.module("WordFactories", [])

## making a factory that wraps up the $http function so other parts of the probram can use itx
# WordFactories.factory ("Word", ["$http", ($http)->
# 	return 
# 		all: ()->
# 			console.log("Getting all words using $http")
# 			$http.get("/words.json").success (data)=>
# 				@words = data
# 				console.log (data)
# 		,
# 		create: (newWord)->
# 			console.log(newWord)
# 			$http.post("/words.json", word: newWord
# 	# ])

## Coffeescript class notation vs function
class Word
	constructor: (@http)->

	all: () ->
		@http.get("/words.json")

	create: (newWord)->
		@http.post("/words.json", {word: newWord})

WordFactories.factory("Word", ["$http", ($http)->
	new Word($http)])

# adding in Trie
# word_factories.js.coffee

WordFactories = angular.module("WordFactories", [])

# adding in Trie

class Trie
	constructor: ()->
		this.characters = {}

	learn:(word, index) ->
		index = index || 0
		if(index == word.length)
			this.isWord = true
		else if(index < word.length)
			char = word[index]
			subTrie = this.characters[char] || new Trie()
			subTrie.learn(word, index+1)
			this.characters[char] = subTrie
		
		return this

	getWords:(words, currentWord)->

		currentWord = currentWord || ""
		words = words || []

		if(this.isWord)
			words.push(currentWord)
			for char in this.characters
				nextWord = currentWord + char
				this.characters[char].getWords(words,nextWord)
			return words

	find:(word, index)->
		index = index || 0
		char = word[index]
		if(index < word.length - 1 && this.characters[char])
			index += 1
			return this.characters[char].find(word, index) 
		else 
			return this.characters[char]
		
	autoComplete:(prefix)->
		subTrie = this.find(prefix)
		if(subTrie)
			return subTrie.getWords([], prefix)
		else
			return []
		WordFactories.service("Trie", [Trie])