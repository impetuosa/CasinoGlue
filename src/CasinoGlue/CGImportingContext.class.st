Class {
	#name : #CGImportingContext,
	#superclass : #Object,
	#instVars : [
		'name',
		'pages',
		'model',
		'mapping'
	],
	#category : #'CasinoGlue-GlueAPI'
}

{ #category : #accessing }
CGImportingContext >> initialize [
	super initialize.
	pages := Set new.
	mapping := OrderedCollection new.
]

{ #category : #accessing }
CGImportingContext >> map: aJinDaoElement to: aCasinoElement [
	(aJinDaoElement isNotNil and: [ aCasinoElement isNotNil ])
		ifTrue: [ mapping
				add:
					{aJinDaoElement.
					aCasinoElement} ]
]

{ #category : #'as yet unclassified' }
CGImportingContext >> mappedModelFor: aJinTabControl [
	^ (mapping detect: [ :a | a first = aJinTabControl ]) second
]

{ #category : #'as yet unclassified' }
CGImportingContext >> mappedModelFor: aJinTabControl ifNone: aBlockClosure [
	^ mapping
		detect: [ :a | a first = aJinTabControl ]
		ifFound: [ :v | v second ]
		ifNone: [ aBlockClosure value ]
]

{ #category : #'as yet unclassified' }
CGImportingContext >> model [
	^ model
]

{ #category : #'as yet unclassified' }
CGImportingContext >> model: aModel [ 
	^ model := aModel 
]

{ #category : #'as yet unclassified' }
CGImportingContext >> mooseModel [
	^ model
]

{ #category : #'as yet unclassified' }
CGImportingContext >> mooseModelMappedTo: aJinForm [ 
	^ (mapping detect: [ : m | m includes: aJinForm  ]) second 
]

{ #category : #'as yet unclassified' }
CGImportingContext >> name [
	^ name
]

{ #category : #accessing }
CGImportingContext >> name: aString [ 
	name := aString
]

{ #category : #accessing }
CGImportingContext >> pages [
	^ pages 
]
