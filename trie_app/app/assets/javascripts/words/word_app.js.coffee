# app.js.coffee
# very trimmed down now
# modeled on angular_factories_resources app

angular.module("TrieApp", [
	"WordRouter",
	"WordCtrls"
	# ,
	# "WordFactories"
])

# Create an angular app and controller to save and display words using $http.