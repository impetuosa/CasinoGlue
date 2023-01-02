Class {
	#name : #CGWidgetImporter,
	#superclass : #Object,
	#instVars : [
		'stack',
		'importedProject',
		'mapper',
		'factory',
		'importingIntoThisModel',
		'errors',
		'widgetInstance',
		'state'
	],
	#category : #'CasinoGlue-GlueAPI'
}

{ #category : #'as yet unclassified' }
CGWidgetImporter >> bindDataReadAccess: aJinForm [
"
	| dataEntity |
	(widgetInstance state at: #RecordSource) ifNotNil: [ :entity | 
		
		dataEntity := self importDataEntity: entity.
		dataEntity read allowEdits: (widgetInstance state at: #AllowEdits).
		dataEntity read allowDeletions: (widgetInstance state at: #AllowDeletions).
		dataEntity read allowAdditions: (widgetInstance state at: #AllowAdditions).
		dataEntity read allowFilters:(widgetInstance state at: #AllowFilters).
		stack top dataBinding: dataEntity read.
		dataEntity read addReader: stack top 
		
		]"
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> errors [
	^ errors
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> factory [
	^ factory ifNil: [ CGUIModelStatelessFactory new ]
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> formGroupAttribute [

	^ CSNAttribute new
		  name: '[formGroup]';
		  attributeValue: 'formValueHolder'
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> import: anEntity [

	importedProject := self importingContextNamed: anEntity name.
	self
		pushInStack: importedProject
		during: [ anEntity acceptVisitor: self ].
	^ importedProject mooseModelMappedTo: anEntity
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> importAccessProperty: aProperty value: aValue [

	| casinoModel |
	casinoModel := self factory
		               importAccessProperty: aProperty
		               state: aValue
		               inTheContextOf: stack top.
	importedProject map: aProperty to: casinoModel.
	^ casinoModel
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> importDataEntity: aJinDataEntity [
	^ aJinDataEntity acceptVisitor: self 
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> importForm: aForm [

	| casinoModel |
	casinoModel := self factory
		               importForm: aForm
		               widgetInstance: widgetInstance
		               inTheContextOf: stack top.
	importedProject map: aForm to: casinoModel.
	^ casinoModel
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> importFormControl: aControl [

	| casinoModel parent context |
	parent := aControl parent.
	context := parent isWidget
		           ifTrue: [ stack top ]
		           ifFalse: [ self nearestContainerTo: parent ].
	context isContainer ifFalse: [ context := stack top ].
	casinoModel := self factory
		               importControl: aControl
		               widgetState: state
		               inTheContextOf: context.
	importedProject map: aControl to: casinoModel.
	^ casinoModel
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> importTable: aTable [
	^ self factory
		importTableEntity: aTable
		inTheContextOf: importingIntoThisModel
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> importedProject [
	^ importedProject
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> importingContextNamed: aName [

	^ self factory importingContext: aName model:  importingIntoThisModel
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> initialize [
	super initialize.
	stack := Stack new.
	errors := Dictionary  new.
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> nearestContainerTo: parent [
	| context |
	parent isAccessForm
		ifTrue: [ ^ stack top ].
	context := importedProject
		mappedModelFor: parent
		ifNone: [ self importFormControl: parent ].
	^ context isContainer
		ifTrue: [ context ]
		ifFalse: [ self nearestContainerTo: parent parentObject ]
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> pushInStack: anObject during: aBlock [
	stack push: anObject.
	aBlock
		ensure: [ ^ stack pop ]
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> useModel: aModel [
	importingIntoThisModel := aModel
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> useState: aMOObject during: aFullBlockClosure [

	| prev |
	prev := state.
	state := aMOObject.
	^ aFullBlockClosure ensure: [ state := prev ]
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> visitAccessProperty: aJinAccessProperty [
	^ self importAccessProperty: aJinAccessProperty
]

{ #category : #visiting }
CGWidgetImporter >> visitAttribute: aMOAttribute [

	^ self
		  pushInStack: (self importFormControl: aMOAttribute)
		  during: [ 
		  stack top ifNotNil: [ self visitProperties: aMOAttribute ] ]
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> visitControlSource: aSource [
	(stack second dataBinding isNotNil and: [ aSource value isNotEmpty ])
		ifTrue:
			[ stack top dataBinding: (stack second dataBinding readsColumn: aSource value) ]
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> visitCustomControl: aJinControlGeneric [ 
	^ self
		pushInStack: (self importFormControl: aJinControlGeneric)
		during: [ stack top ifNotNil: [self visitCollection: aJinControlGeneric properties ]]
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> visitForm: aJinForm [

	| formWidget |
	formWidget := self
		              pushInStack: (self importForm: aJinForm)
		              during: [ 
			              self bindDataReadAccess: aJinForm.
			              aJinForm allContainments
				              select: [ :c | c isVariable ]
				              thenDo: [ :a | 
					              self
						              useState: (widgetInstance at: a sanitizedName)
						              during: [ a acceptVisitor: self ] ] ].
	
	
	formWidget addAttribute: self formGroupAttribute. 
	
	CGWidgetActionsImporter new
		originalWidget: aJinForm;
		importInto: formWidget.

	^ formWidget
]

{ #category : #visiting }
CGWidgetImporter >> visitProperties: aMOAttribute [

	state state associationsDo: [ :a | 
		self importAccessProperty: a key value: a value ]
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> visitQuery: aQuery [
	| importedQuery |
	importedQuery := self factory
		importQueryEntity: aQuery
		inTheContextOf: importingIntoThisModel.
	aQuery ensureUnload.
	^ importedQuery
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> visitSubForm: aJinControlSubForm [
	^ self factory importSubform: aJinControlSubForm inTheContextOf: stack top
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> visitTable: aTable [
	^ self
		pushInStack: (self importTable: aTable)
		during: [ super visitTable: aTable.
			aTable ensureUnload ]
]

{ #category : #'as yet unclassified' }
CGWidgetImporter >> widgetInstance: aMOObject [

	widgetInstance := aMOObject
]
