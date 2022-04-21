Class {
	#name : #MDColumnSet,
	#superclass : #MDDataContainer,
	#category : #'CasinoGlue-Model-Data'
}

{ #category : #'as yet unclassified' }
MDColumnSet >> compilableTypeIdentifier [
	^ (name copyReplaceAll: ' ' with: '') capitalized
]
