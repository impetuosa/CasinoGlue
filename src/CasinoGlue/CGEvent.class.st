Class {
	#name : #CGEvent,
	#superclass : #CSNAction,
	#instVars : [
		'#eventName => FMProperty',
		'#method => FMProperty'
	],
	#category : #'CasinoGlue-Model'
}

{ #category : #accessing }
CGEvent >> accept: aCSNModelVisitor [
	<generated>
	^ aCSNModelVisitor visitCGEvent: self
]

{ #category : #'as yet unclassified' }
CGEvent >> beAddedInto: aCSNUIButton [

	^ aCSNUIButton addAction: self
]

{ #category : #accessing }
CGEvent >> eventName [
	^ eventName
]

{ #category : #accessing }
CGEvent >> eventName: aString [ 
	eventName := aString
]

{ #category : #accessing }
CGEvent >> method [
	^ method
]

{ #category : #accessing }
CGEvent >> method: aMOClassProcedure [

	method := aMOClassProcedure
]

{ #category : #accessing }
CGEvent >> printOn: aStream [

	aStream
		nextPutAll: 'Event: ';
		nextPutAll: eventName;
		nextPutAll: ' ';
		print: method
]
