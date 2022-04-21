Class {
	#name : #CGWidgetUsage,
	#superclass : #CSNWidget,
	#instVars : [
		'widgetName'
	],
	#category : #'CasinoGlue-Model'
}

{ #category : #accessing }
CGWidgetUsage >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitJinCasinoWidgetUsage: self
]

{ #category : #accessing }
CGWidgetUsage >> mooseModel [
	^ mooseModel
]

{ #category : #accessing }
CGWidgetUsage >> widgetName [
	^ widgetName
]

{ #category : #accessing }
CGWidgetUsage >> widgetName: anObject [
	widgetName := anObject
]
