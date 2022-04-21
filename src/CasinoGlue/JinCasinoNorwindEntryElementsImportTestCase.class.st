Class {
	#name : #JinCasinoNorwindEntryElementsImportTestCase,
	#superclass : #JinCasinoNorwindAbstractImportTestCase,
	#category : #'CasinoGlue-Test'
}

{ #category : #tests }
JinCasinoNorwindEntryElementsImportTestCase >> setUp [
	super setUp.
	factory := CGUIModelStatelessFactory  new
]

{ #category : #tests }
JinCasinoNorwindEntryElementsImportTestCase >> testAfterJinFormIsImportedIsBoundedToTheProject [
	self importAnyForm.
	self assert: importedForm project equals: importedProject.
	self assert: importedProject pages size equals: 1.
	self assert: importedProject pages anyOne equals: importedForm
]

{ #category : #tests }
JinCasinoNorwindEntryElementsImportTestCase >> testImportedFormGeneratesOnlyOneBusinessPage [
	self importAnyForm.
	self assert: importedForm businessPage size equals: 1.
]

{ #category : #tests }
JinCasinoNorwindEntryElementsImportTestCase >> testImportedGeneratedBusinessPageHasTheSameNameAsTheForm [
	self importAnyForm.
	self assert: importedForm businessPage first name equals: form nameWithoutSpaces.
]

{ #category : #tests }
JinCasinoNorwindEntryElementsImportTestCase >> testJinFormImportsIntoJinPage [
	self importAnyForm.
	self assert: importedForm class equals: CGPage 
	
]

{ #category : #tests }
JinCasinoNorwindEntryElementsImportTestCase >> testJinFormImportsTheNameAndNoneWidgets [
	self importAnyForm.
	self assert: importedForm name equals: form nameWithoutSpaces.
	self assert: importedForm realClassName equals: #JinForm.
	self assert: importedForm widgets isEmpty
]

{ #category : #tests }
JinCasinoNorwindEntryElementsImportTestCase >> testJinProjectImportsIntoJinCasinoProject [
	self importProject.
	self assert: importedProject class equals: CGImportingContext
]

{ #category : #tests }
JinCasinoNorwindEntryElementsImportTestCase >> testJinProjectImportsTheNameAndNonWidgets [
	self importProject.
	self assert: importedProject name equals: project name.
	self assert: importedProject pages isEmpty
]
