Class {
	#name : #CGWidgetExporter,
	#superclass : #Object,
	#instVars : [
		'writer',
		'serviceClassReference',
		'modelClassReference'
	],
	#category : #'CasinoGlue-GlueAPI'
}

{ #category : #actions }
CGWidgetExporter >> export: aCGPage [

	^ aCGPage acceptVisitor: self
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

{ #category : #'instance creation' }
CGWidgetExporter >> typeReferenceTo: aDeclaration using: aWriter [

	^ (aWriter typeReferenceNamed: aDeclaration name)
		  candidate: aDeclaration;
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
CGWidgetExporter >> visitCSNPage: aJinCasinoPage [

	| templateWriter behaviorWriter behavior return |
	return := writer writeAngularComponent: [ :component | 
		          component name: aJinCasinoPage name asLowercase.

		          behaviorWriter := MOAngularComponentBehaviorWriter new
			                            modelClassReference:
				                            self modelClassReference;
			                            serviceClassReference:
				                            self serviceClassReference.

		          behavior := behaviorWriter
			                      writeBehaviorFor: aJinCasinoPage
			                      into: component
			                      bindingTo: modelClassReference.

		          templateWriter := MOAngularComponentTemplateWriter new.

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
