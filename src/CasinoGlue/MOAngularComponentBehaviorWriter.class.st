Class {
	#name : #MOAngularComponentBehaviorWriter,
	#superclass : #Object,
	#instVars : [
		'behavior',
		'writer',
		'ongoingRule',
		'modelClassReference',
		'serviceClassReference',
		'cssName',
		'templateName'
	],
	#category : #'CasinoGlue-Moxing-Writer'
}

{ #category : #accessing }
MOAngularComponentBehaviorWriter >> behavior [
	^ behavior
]

{ #category : #'as yet unclassified' }
MOAngularComponentBehaviorWriter >> componentName: aString [

	^ aString asLowercase
]

{ #category : #'as yet unclassified' }
MOAngularComponentBehaviorWriter >> cssName: aString [

	cssName := aString
]

{ #category : #accessing }
MOAngularComponentBehaviorWriter >> modelClassReference: aMOTypeReference [ 
	modelClassReference := aMOTypeReference
]

{ #category : #accessing }
MOAngularComponentBehaviorWriter >> serviceClassReference: aMOTypeReference [ 
	serviceClassReference := aMOTypeReference
]

{ #category : #'as yet unclassified' }
MOAngularComponentBehaviorWriter >> templateName: aString [

	templateName := aString
]

{ #category : #evaluating }
MOAngularComponentBehaviorWriter >> use: aWriter during: aBlock [

	| prev |
	prev := writer.
	writer := aWriter.
	^ aBlock ensure: [ writer := prev ]
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNLAbsolutePositionLayout: aCGAbsolutePositionLayout [

	^self visitCSNLayout: aCGAbsolutePositionLayout
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNLCell: aCSNLCell [

	^ aCSNLCell widget acceptVisitor: self
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNLTabulateLayout: aCGTabulateLayout [

	^ self visitCSNLayout: aCGTabulateLayout
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNLVerticalLayout: aCSNLVerticalLayout [

	^self visitCSNLayout:aCSNLVerticalLayout
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNLayout: aCGAbsolutePositionLayout [

	^ self visitCollection: aCGAbsolutePositionLayout cell
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNPage: aCGPage [

	^ FylgjaAngularAddComponentSimpleBehavior new
		  name: (self componentName: aCGPage name);
		  modelClassReference: modelClassReference;
		  serviceClassReference: serviceClassReference;
		  cssName: cssName;
		  templateName: templateName;
		  withinTheClass: [ :rule | 
			  ongoingRule := rule.
			  aCGPage layout acceptVisitor: self ];
		  applyOn: writer
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNUIButton: aCSNUIButton [ 
	self visitWidget: aCSNUIButton 
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNUIFieldset: aCSNUIFieldset [

	self assert: aCSNUIFieldset widgets isEmpty.
	self visitWidget: aCSNUIFieldset
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNUIImage: aCSNUIImage [

	^ self visitWidget: aCSNUIImage
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNUIInputFile: aCSNUIInputFile [

	self visitWidget: aCSNUIInputFile
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNUIInputText: aCSNUIInputText [

	^ self visitWidget: aCSNUIInputText
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNUIPanel: aCSNUIPanel [

	aCSNUIPanel widgets ifNotNil: [ 
		self visitCollection: aCSNUIPanel widgets ].
	aCSNUIPanel layout ifNotNil: [ 
		aCSNUIPanel layout acceptVisitor: self ]
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNUIParagraph: aCSNUIParagraph [

	self visitWidget: aCSNUIParagraph
]

{ #category : #enumerating }
MOAngularComponentBehaviorWriter >> visitCSNUISelect: aCSNUISelect [

	self visitWidget: aCSNUISelect
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNUITab: aCSNUITab [

	self visitWidget: aCSNUITab.
	self assert: aCSNUITab widgets isEmpty
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCSNUITabManager: aCSNUITabManager [

	self visitWidget: aCSNUITabManager.
	self assert: aCSNUITabManager widgets isEmpty
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitCollection: aCollection [

	^ aCollection collect: [ :element | element acceptVisitor: self ]
]

{ #category : #visiting }
MOAngularComponentBehaviorWriter >> visitWidget: aWidget [ 
	ongoingRule informUsageOf: aWidget. 
	
]

{ #category : #writing }
MOAngularComponentBehaviorWriter >> writeBehaviorFor: aJinCasinoPage into: component bindingTo: aModel [
	modelClassReference := aModel.
	writer := component.
	^ aJinCasinoPage accept: self
]
