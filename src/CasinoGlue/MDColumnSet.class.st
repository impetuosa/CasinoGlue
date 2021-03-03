Class {
	#name : #MDColumnSet,
	#superclass : #MDDataContainer,
	#category : #CasinoGlue
}

{ #category : #'as yet unclassified' }
MDColumnSet >> compilableTypeIdentifier [
	^ (name copyReplaceAll: ' ' with: '') capitalized
]
