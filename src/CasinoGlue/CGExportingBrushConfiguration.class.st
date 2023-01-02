Class {
	#name : #CGExportingBrushConfiguration,
	#superclass : #Object,
	#instVars : [
		'brush'
	],
	#category : #'CasinoGlue-Brushes'
}

{ #category : #accessing }
CGExportingBrushConfiguration class >> default [
	^ self new 
]

{ #category : #'as yet unclassified' }
CGExportingBrushConfiguration >> brushFor: aCSNUIPanel [ 
	
	aCSNUIPanel accept: self.
	^ brush 

]

{ #category : #'as yet unclassified' }
CGExportingBrushConfiguration >> newSimpleBrush [
	^ CGAngularSimpleBrush new
]

{ #category : #visiting }
CGExportingBrushConfiguration >> visitCSNLAbsolutePositionLayout: aCSNLAbsolutePositionLayout [

	brush := CGAngularTabulatingLayoutBrush new
]

{ #category : #visiting }
CGExportingBrushConfiguration >> visitCSNLTabulateLayout: aCSNLTabulateLayout [

	brush := CGAngularTabulatingLayoutBrush new
]

{ #category : #visiting }
CGExportingBrushConfiguration >> visitCSNPage: aCSNPage [

	brush := self newSimpleBrush
		         tag: 'form';
		         yourself
]

{ #category : #'as yet unclassified' }
CGExportingBrushConfiguration >> visitCSNUIButton: aCSNUIButton [
	brush := self newSimpleBrush
		tag: 'button';
		yourself
]

{ #category : #'as yet unclassified' }
CGExportingBrushConfiguration >> visitCSNUIFieldset: aCSNUIFieldset [
	brush := self newSimpleBrush
		tag: ' fieldset';
		yourself
]

{ #category : #'as yet unclassified' }
CGExportingBrushConfiguration >> visitCSNUIImage: aCSNUIImage [
	brush := self newSimpleBrush
		tag: 'img';
		yourself
]

{ #category : #'as yet unclassified' }
CGExportingBrushConfiguration >> visitCSNUIInputCheckbox: aCSNUIInputCheckbox [
	brush := self newSimpleBrush
		tag: 'input';
		type: 'checkbox';
		yourself
]

{ #category : #'as yet unclassified' }
CGExportingBrushConfiguration >> visitCSNUIInputFile: aCSNUIInputFile [
	brush := self newSimpleBrush
		tag: 'input';
		type: 'file';
		yourself
]

{ #category : #visiting }
CGExportingBrushConfiguration >> visitCSNUIInputText: aCSNUIInputText [
	brush := self newSimpleBrush
		tag: 'input';
		yourself
]

{ #category : #'as yet unclassified' }
CGExportingBrushConfiguration >> visitCSNUIOrderedList: aCSNUIOrderedList [
	brush := self newSimpleBrush
		tag: 'ol';
		yourself
]

{ #category : #visiting }
CGExportingBrushConfiguration >> visitCSNUIPanel: aCSNUIPanel [
	brush := self newSimpleBrush
		tag: 'div';
		yourself
]

{ #category : #visiting }
CGExportingBrushConfiguration >> visitCSNUIParagraph: aCSNUIParagraph [
	brush := self newSimpleBrush
		tag: 'p';
		yourself
]

{ #category : #'as yet unclassified' }
CGExportingBrushConfiguration >> visitCSNUISelect: aCSNUISelect [

	aCSNUISelect isBoundToData
		ifTrue: [ 
			brush := CGAngularDataBoundSelectBrush new
				         formControlName: aCSNUISelect realName;
				         boundedTo: aCSNUISelect dataBinding source;
				         yourself ]
		ifFalse: [ 
			brush := self newSimpleBrush
				         tag: 'select';
				         yourself ]
]

{ #category : #'as yet unclassified' }
CGExportingBrushConfiguration >> visitCSNUITab: aCSNUITab [
	brush := self newSimpleBrush
		tag: 'mat-tab';
		yourself
]

{ #category : #'as yet unclassified' }
CGExportingBrushConfiguration >> visitCSNUITabManager: aCSNUITabManager [
	brush := CGAngularTabManagerBrush new
]

{ #category : #'as yet unclassified' }
CGExportingBrushConfiguration >> visitJinCasinoWidgetUsage: aJinCasinoWidgetUsage [
	brush := self newSimpleBrush
		tag: aJinCasinoWidgetUsage widgetName asLowercase;
		yourself
]
