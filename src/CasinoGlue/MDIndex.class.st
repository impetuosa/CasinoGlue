Class {
	#name : #MDIndex,
	#superclass : #MDDataContainer,
	#instVars : [
		'kind'
	],
	#category : #'CasinoGlue-Model-Data'
}

{ #category : #accessing }
MDIndex >> accept: aVisitor [
	aVisitor visitIndex: self
]

{ #category : #accessing }
MDIndex >> addElement: anElement [
	self halt: ' Maybe is not a good idea. super addElement changes the parent. here we add columns, that belong to a table and not to the index '
]

{ #category : #accessing }
MDIndex >> elements: columns [
	elements := columns
]

{ #category : #'as yet unclassified' }
MDIndex >> kind [
	^ kind
]

{ #category : #'as yet unclassified' }
MDIndex >> kind: aString [ 
	kind := aString
]
