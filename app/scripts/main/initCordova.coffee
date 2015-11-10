'use strict';

cordovaInit = ()->

	onDeviceReady = ()->
		receivedEvent('deviceready');


	receivedEvent = (event)->
		#console.log('Start event received, bootstrapping application setup.');
		angular.bootstrapping('html'), ['WissenSystem']);


	this.bindEvents = ()->
		document.addEventListener('deviceready', onDeviceReady, false);


	#if corova is present, wait for it to initialize otherwise just try to 
	#bootstrap the application.
	if(window.cordova != undefined)
		console.log('cordova found, wating for device.');
		this.bindEvents();
	else
		#console.log('cordova noy found, booting application');
		receivedEvent('manual')



$(()->
	new cordovaInit()
)