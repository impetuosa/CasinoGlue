Class {
	#name : #MDDataResource,
	#superclass : #MDDataEntity,
	#instVars : [
		'name',
		'readBindingEndpoint'
	],
	#category : #'CasinoGlue-Model-Data'
}

{ #category : #'as yet unclassified' }
MDDataResource >> compilableIdentifier [
	^ (((name uncapitalized copyReplaceAll: ' ' with: '')
		copyReplaceAll: '/'
		with: '') copyReplaceAll: '\' with: '') copyReplaceAll: '-' with: ''
]

{ #category : #'as yet unclassified' }
MDDataResource >> name [
 	^ name 
]

{ #category : #'as yet unclassified' }
MDDataResource >> name: aString [ 
	name := aString 
]

{ #category : #'as yet unclassified' }
MDDataResource >> read [
	^ readBindingEndpoint
		ifNil: [ readBindingEndpoint := MDDataRead new.
			readBindingEndpoint entity: self ]
]
