Class {
	#name : #CGAngularTabulatingLayoutBrush,
	#superclass : #Object,
	#category : #'CasinoGlue-Brushes'
}

{ #category : #writing }
CGAngularTabulatingLayoutBrush >> write: aCSNLAbsolutePositionLayout into: aXMLWriter with: aFullBlockClosure [

	aXMLWriter tag: 'tbody' with: [ 
		aCSNLAbsolutePositionLayout rowsDo: [ :row | 
			aXMLWriter tag: 'tr' with: [ 
				row do: [ :cell | 
					aXMLWriter tag: 'td' with: [ aFullBlockClosure value: cell widget ] ] ] ] ]
]
