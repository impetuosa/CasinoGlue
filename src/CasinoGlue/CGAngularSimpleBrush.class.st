Class {
	#name : #CGAngularSimpleBrush,
	#superclass : #Object,
	#instVars : [
		'tag',
		'extraAttributes'
	],
	#category : #'CasinoGlue-Brushes'
}

{ #category : #'as yet unclassified' }
CGAngularSimpleBrush >> bindingAttribute [
	self assert: self isInputBrush.
	^ '[(ngModule)]'
]

{ #category : #'as yet unclassified' }
CGAngularSimpleBrush >> computeAttributesFor: aCSNElement [
	| extractor |
	extractor := MOAngularAttributesExtractor new.
	extractor forBrush: self.
	aCSNElement attributes do: [ :a | a accept: extractor ].
	^ extraAttributes copy addAll: extractor result
]

{ #category : #writing }
CGAngularSimpleBrush >> initialize [
	super initialize.
	extraAttributes := Dictionary new
]

{ #category : #'as yet unclassified' }
CGAngularSimpleBrush >> isInputBrush [
	^ tag = 'input'
]

{ #category : #testing }
CGAngularSimpleBrush >> isParagraph [
	^ tag = 'p'
]

{ #category : #accessing }
CGAngularSimpleBrush >> tag: aString [ 
	tag := aString
]

{ #category : #'as yet unclassified' }
CGAngularSimpleBrush >> type: aString [
	extraAttributes at: #type put: aString
]

{ #category : #writing }
CGAngularSimpleBrush >> write: aCSNUIParagraph into: aXMLWriter [
	^ aXMLWriter
		tag: tag
		attributes: (self computeAttributesFor: aCSNUIParagraph)
		with: [ self writeBodyComplementsFor: aCSNUIParagraph into: aXMLWriter ]
]

{ #category : #writing }
CGAngularSimpleBrush >> write: aCSNUIPanel into: aXMLWriter with: aFullBlockClosure [
	^ aXMLWriter tag: tag with: [ aFullBlockClosure value ]
]

{ #category : #'as yet unclassified' }
CGAngularSimpleBrush >> writeBodyComplementsFor: aCSNUIElement into: aStream [
	| cowriter |
	cowriter := MOAngularHtmlBodyComplementsCoWriter new.
	cowriter brush: self stream: aStream.
	aCSNUIElement attributes do: [ :a | a accept: cowriter ]
]

{ #category : #'as yet unclassified' }
CGAngularSimpleBrush >> writesBindingInAttribute [
	^ self isInputBrush
]

{ #category : #'as yet unclassified' }
CGAngularSimpleBrush >> writesBindingInBody [
	^ self isInputBrush not
]
