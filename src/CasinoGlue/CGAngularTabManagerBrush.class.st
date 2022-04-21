Class {
	#name : #CGAngularTabManagerBrush,
	#superclass : #Object,
	#category : #'CasinoGlue-Brushes'
}

{ #category : #'as yet unclassified' }
CGAngularTabManagerBrush >> write: aCSNUITabManager into: aXMLWriter with: aBlockClosure [
	aXMLWriter tag: 'mat-tab-group' with: [ aBlockClosure value ]
]
