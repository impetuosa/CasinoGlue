Extension { #name : #CSNWidget }

{ #category : #'*CasinoGlue' }
CSNWidget >> dataBinding [
	^ self attributes detect: [ :a | a isDataBinding ] 

]

{ #category : #'*CasinoGlue' }
CSNWidget >> dataBinding: aDataBinding [

	self assert: self isBoundToData not.
	self attributes add: aDataBinding
]

{ #category : #'*CasinoGlue' }
CSNWidget >> isBoundToData [
	^ self attributes anySatisfy: [ :a | a isDataBinding ] 

]

{ #category : #'*CasinoGlue' }
CSNWidget >> realName [

	^ name
]
