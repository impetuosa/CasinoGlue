Class {
	#name : #MDRelationalView,
	#superclass : #MDColumnSet,
	#instVars : [
		'sql'
	],
	#category : #'CasinoGlue-Model-Data'
}

{ #category : #'as yet unclassified' }
MDRelationalView >> accept: aVisitor [
	aVisitor visitRelationalView: self
]

{ #category : #'as yet unclassified' }
MDRelationalView >> sql: aString [
	sql := aString
]
