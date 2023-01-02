Class {
	#name : #CGWidgetActionsImporter,
	#superclass : #Object,
	#instVars : [
		'stack',
		'originalWidget'
	],
	#category : #'CasinoGlue-GlueAPI'
}

{ #category : #'as yet unclassified' }
CGWidgetActionsImporter >> importActionsIfNeeded: aCSNUISelect [

	| attr event |
	attr := originalWidget attributes detect: [ :a | 
		        a name = aCSNUISelect realName ].
	originalWidget methods
		select: [ :m | m selector beginsWith: aCSNUISelect realName , '_' ]
		thenDo: [ :m | 
			(aCSNUISelect actions
				 detect: [ :action | action name = ('_' split: m selector) second ]
				 ifNone: [ 
					 event := CGEvent new
						          eventName: ('_' split: m selector) second;
						          yourself.
					 aCSNUISelect addAction: event.
					 event ]) method: m ]
]

{ #category : #'as yet unclassified' }
CGWidgetActionsImporter >> importInto: aCGPage [

	aCGPage acceptVisitor: self
]

{ #category : #accessing }
CGWidgetActionsImporter >> originalWidget: aMOAlceForm [ 
	originalWidget := aMOAlceForm
]

{ #category : #visiting }
CGWidgetActionsImporter >> visitCSNLAbsolutePositionLayout: aCGAbsolutePositionLayout [

	^ self visitCollection: aCGAbsolutePositionLayout cell
]

{ #category : #visiting }
CGWidgetActionsImporter >> visitCSNLCell: aCSNLCell [

	^ aCSNLCell widget acceptVisitor: self
]

{ #category : #visiting }
CGWidgetActionsImporter >> visitCSNLVerticalLayout: aCSNLVerticalLayout [ 
	^ self visitCollection: aCSNLVerticalLayout cell
]

{ #category : #visiting }
CGWidgetActionsImporter >> visitCSNPage: aCGPage [

	aCGPage layout acceptVisitor: self
]

{ #category : #visiting }
CGWidgetActionsImporter >> visitCSNUIButton: aCSNUIButton [

	^ self importActionsIfNeeded: aCSNUIButton
]

{ #category : #visiting }
CGWidgetActionsImporter >> visitCSNUIImage: aCSNUIImage [

	^ self importActionsIfNeeded: aCSNUIImage
]

{ #category : #visiting }
CGWidgetActionsImporter >> visitCSNUIPanel: aCSNUIPanel [

	aCSNUIPanel widgets ifNotNil: [ 
		self visitCollection: aCSNUIPanel widgets ].
	aCSNUIPanel layout ifNotNil: [ 
		aCSNUIPanel layout acceptVisitor: self ]
]

{ #category : #visiting }
CGWidgetActionsImporter >> visitCSNUIParagraph: aCSNUIParagraph [

	^ self importActionsIfNeeded: aCSNUIParagraph
]

{ #category : #enumerating }
CGWidgetActionsImporter >> visitCSNUISelect: aCSNUISelect [

	^ self importActionsIfNeeded: aCSNUISelect
]

{ #category : #visiting }
CGWidgetActionsImporter >> visitCollection: aCollection [ 
^ aCollection collect: [ :each | each acceptVisitor: self  ]
]
