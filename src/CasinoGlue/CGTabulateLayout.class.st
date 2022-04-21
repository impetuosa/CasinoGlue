Class {
	#name : #CGTabulateLayout,
	#superclass : #CSNLLayout,
	#category : #'CasinoGlue-Model'
}

{ #category : #visiting }
CGTabulateLayout >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNLTabulateLayout: self
]

{ #category : #'as yet unclassified' }
CGTabulateLayout >> getLayoutAttribute [
	^ {}
]

{ #category : #'as yet unclassified' }
CGTabulateLayout >> rows [
	| rows |
	" 
		The layouts in access are defined by the elements, there is not such a container feature. 
		In the case of tabulation, the important thing is the configuration: top and left. 
	"
	rows := (cell
		groupedBy:
			[ :c | (c widget attributes detect: [ :a | a name = #top ]) attributeValue ])
		associations.
	rows := (rows sort: [ :a :b | a key asNumber < b key asNumber ])
		collect: #value.
	^ rows
		collect: [ :r | 
			r
				sort: [ :a :b | 
					(a widget attributes detect: [ :d | d name = #left ]) attributeValue asNumber
						< (b widget attributes detect: [ :d | d name = #left ]) attributeValue  asNumber] ]
]

{ #category : #'as yet unclassified' }
CGTabulateLayout >> rowsDo: aBlockClosure [
	self rows do: aBlockClosure
]
