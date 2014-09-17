
WordRouter = angular.module("WordRouter",  [
	"ngRoute"
])

class Router

	#lots of stuff here, new format since it's now a class
	constructor: (@routeProvider, @locationProvider) ->
		console.log("Initialized Router")
		console.log("Setting Up")
		@routeProvider
			.when "/",
				# can change this if I decide to nest templates in a words folder
				templateUrl: "/word_templates",
				controller: "WordsCtrl as words"	

		@locationProvider.html5Mode(true)	

WordRouter.config(["$routeProvider", "$locationProvider", Router])

WordRouter.config ["$httpProvider", ($httpProvider) ->
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]