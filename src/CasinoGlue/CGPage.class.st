Class {
	#name : #CGPage,
	#superclass : #CSNPage,
	#instVars : [
		'project',
		'kindOfPage'
	],
	#category : #'CasinoGlue-Model'
}

{ #category : #'as yet unclassified' }
CGPage >> attributeNamed: aString put: aMDDataRead [ 
	self attributeAt: aString put: aMDDataRead 
]

{ #category : #'as yet unclassified' }
CGPage >> bindings [

	^ self attributeAt: #bindings ifAbsentPut: [ OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
CGPage >> kindOfPage: aString [
	kindOfPage := aString asSymbol
]

{ #category : #'as yet unclassified' }
CGPage >> mainContainerWidgets [

	^ self layout
		  ifNil: [ {  } ]
		  ifNotNil: [ :l | l cell collect: [ :f | f widget ] ]
]

{ #category : #'as yet unclassified' }
CGPage >> project [
	^ project
]

{ #category : #accessing }
CGPage >> project: aJinCasinoProject [ 
	project := aJinCasinoProject.
	mooseModel := aJinCasinoProject model .
	aJinCasinoProject mooseModel add: self. 
]

{ #category : #'as yet unclassified' }
CGPage >> section: anInteger [

	| container |
	^ self mainContainerWidgets
		  detect: [ :c | 
			  c isContainer and: [ 
				  (c propertyNamed: 'SectionID') = anInteger asString ] ]
		  ifNone: [ 
			  container := CSNUIPanel new.
			  container propertyNamed: 'SectionID' put: anInteger asString.
			  self addWidget: container.
			  mooseModel add: container.
			  container ]
]
