Class {
	#name : #MDColumn,
	#superclass : #MDDataResource,
	#instVars : [
		'type'
	],
	#category : #'CasinoGlue-Model-Data'
}

{ #category : #'as yet unclassified' }
MDColumn >> accept: aVisitor [
	aVisitor visitColumn: self
]

{ #category : #'as yet unclassified' }
MDColumn >> type [
	^ type 
]

{ #category : #'as yet unclassified' }
MDColumn >> type: aString [ 
	type := aString
]
