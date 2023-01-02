Class {
	#name : #CGWidgetExporter,
	#superclass : #Object,
	#instVars : [
		'writer',
		'serviceClassReference',
		'modelClassReference',
		'cssName',
		'templateName',
		'fylgja',
		'croppingWith',
		'lookUp'
	],
	#category : #'CasinoGlue-GlueAPI'
}

{ #category : #accessing }
CGWidgetExporter >> croppingWith: aBlock [

	croppingWith := aBlock
]

{ #category : #'as yet unclassified' }
CGWidgetExporter >> cssName: aString [

	cssName := aString
]

{ #category : #actions }
CGWidgetExporter >> export: aCGPage [

	^ aCGPage acceptVisitor: self
]

{ #category : #accessing }
CGWidgetExporter >> fylgja: aFylgjaDerivativeModel [

	fylgja := aFylgjaDerivativeModel
]

{ #category : #'instance creation' }
CGWidgetExporter >> lookUp: aFylgjaLookUpContext [

	lookUp := aFylgjaLookUpContext
]

{ #category : #visiting }
CGWidgetExporter >> modelClassReference [

	^ modelClassReference ifNil: [ 
		  self error: ' model class reference is compulsory ' ]
]

{ #category : #accessing }
CGWidgetExporter >> modelClassReference: aMOTypeReference [ 
	modelClassReference := aMOTypeReference
]

{ #category : #visiting }
CGWidgetExporter >> serviceClassReference [

	^ serviceClassReference ifNil: [ 
		  self error: ' model class reference is compulsory ' ]
]

{ #category : #accessing }
CGWidgetExporter >> serviceClassReference: aMOTypeReference [ 
	serviceClassReference := aMOTypeReference
]

{ #category : #'as yet unclassified' }
CGWidgetExporter >> templateName: aString [

	templateName := aString
]

{ #category : #'instance creation' }
CGWidgetExporter >> typeReferenceTo: aDeclaration using: aWriter [

	^ (aWriter typeReferenceNamed: aDeclaration name)
		  referee: aDeclaration;
		  yourself
]

{ #category : #accessing }
CGWidgetExporter >> use: aWriter during: aBlock [

	| prev |
	prev := writer.
	writer := aWriter.
	^ aBlock ensure: [ writer := prev ]
]

{ #category : #visiting }
CGWidgetExporter >> visitCSNAttribute: aCSNAttribute [

	" nothing to do "

	
]

{ #category : #visiting }
CGWidgetExporter >> visitCSNPage: aJinCasinoPage [

	| templateWriter behaviorWriter behavior return |
	return := writer writeAngularComponent: [ :component | 
		          component name: aJinCasinoPage name asLowercase.

		          behaviorWriter := MOAngularComponentBehaviorWriter new
			                            fylgja: fylgja;
			                            croppingWith: croppingWith;
			                            lookUp: lookUp;
			                            modelClassReference:
				                            self modelClassReference;
			                            serviceClassReference:
				                            self serviceClassReference;
			                            cssName: cssName;
			                            templateName: templateName;
			                            yourself.

		          behavior := behaviorWriter
			                      writeBehaviorFor: aJinCasinoPage
			                      into: component
			                      bindingTo: self modelClassReference.

		          templateWriter := MOAngularComponentTemplateWriter new
			                            cssName: cssName;
			                            templateName: templateName;
			                            yourself.

		          templateWriter
			          modelClassReference: self modelClassReference;
			          behaviorClassReference:
				          (self
					           typeReferenceTo: behavior types first
					           using: component);
			          writeHtmlFor: aJinCasinoPage into: component.


		          self
			          use: component
			          during: [ 
			          aJinCasinoPage attributes do: [ :a | a accept: self ] ] ].
	^ return
]

{ #category : #accessing }
CGWidgetExporter >> writer: aMOAngularModuleWriter [ 
	writer := aMOAngularModuleWriter
]
