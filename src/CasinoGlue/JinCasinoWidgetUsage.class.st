Class {
	#name : #JinCasinoWidgetUsage,
	#superclass : #CSNWidget,
	#instVars : [
		'widgetName'
	],
	#category : #CasinoGlue
}

{ #category : #accessing }
JinCasinoWidgetUsage >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitJinCasinoWidgetUsage: self
]

{ #category : #accessing }
JinCasinoWidgetUsage >> mooseModel [
	^ mooseModel
]

{ #category : #accessing }
JinCasinoWidgetUsage >> widgetName [
	^ widgetName
]

{ #category : #accessing }
JinCasinoWidgetUsage >> widgetName: anObject [
	widgetName := anObject
]
