Class {
	#name : #CGDataBinding,
	#superclass : #CSNAttribute,
	#instVars : [
		'#source => FMProperty'
	],
	#category : #'CasinoGlue-Model'
}

{ #category : #testing }
CGDataBinding >> accept: aVisitor [

	^ aVisitor visitCGDataBinding: self
]

{ #category : #testing }
CGDataBinding >> isDataBinding [
	 ^ true
]
