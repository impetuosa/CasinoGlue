Class {
	#name : #CGDataBinding,
	#superclass : #CSNAttribute,
	#instVars : [
		'#attribute => FMProperty',
		'#restrictions => FMProperty'
	],
	#category : #'CasinoGlue-Model'
}

{ #category : #testing }
CGDataBinding >> isDataBinding [
	 ^ true
]
