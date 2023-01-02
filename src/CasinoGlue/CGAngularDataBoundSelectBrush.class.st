Class {
	#name : #CGAngularDataBoundSelectBrush,
	#superclass : #Object,
	#instVars : [
		'tag',
		'extraAttributes',
		'formControlName',
		'boundedTo'
	],
	#category : #'CasinoGlue-Brushes'
}

{ #category : #'as yet unclassified' }
CGAngularDataBoundSelectBrush >> boundedTo: aFylgjaSQLSource [

	boundedTo := aFylgjaSQLSource
]

{ #category : #'as yet unclassified' }
CGAngularDataBoundSelectBrush >> computeAttributesFor: aCSNElement [

	| extractor |
	extractor := MOAngularAttributesExtractor new.
	extractor forBrush: self.
	aCSNElement attributes do: [ :a | a accept: extractor ].
	aCSNElement actions do: [ :a | a accept: extractor ].
	^ self extraAttributes copy
		  addAll: extractor result;
		  yourself
]

{ #category : #accessing }
CGAngularDataBoundSelectBrush >> extraAttributes [

	^ extraAttributes ifNil: [ extraAttributes := Dictionary new ]
]

{ #category : #accessing }
CGAngularDataBoundSelectBrush >> formControlName [
	^ formControlName
]

{ #category : #'as yet unclassified' }
CGAngularDataBoundSelectBrush >> formControlName: aString [

	formControlName := aString.
	self extraAttributes at: #formControlName put: aString.
	self extraAttributes at: #class put: #'form-control'
]

{ #category : #accessing }
CGAngularDataBoundSelectBrush >> tag: aString [ 
	tag := aString
]

{ #category : #writing }
CGAngularDataBoundSelectBrush >> write: aCSNUISelect into: aXMLWriter [

	^ aXMLWriter
		  tag: #select
		  attributes: (self computeAttributesFor: aCSNUISelect)
		  with: [ 
			  aXMLWriter
				  tag: #option
				  attributes: { 
						  ('*ngFor' -> ('let {1} of this.{2}' format: { 
								    boundedTo singleEntityName.
								    boundedTo daoAccessSelectorName })).
						  ('value'
						   ->
							   ('{ this.' , self formControlName , 'ToIdentifier('
							    , boundedTo singleEntityName , ')}}')) } asDictionary
				  with: [ 
					  aXMLWriter string:
						  '{{ this.' , formControlName , 'ToDisplay('
						  , boundedTo singleEntityName , ')}}' ] ]
]
