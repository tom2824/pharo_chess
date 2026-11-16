Class {
	#name : 'MyNilPiece',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'testing' }
MyNilPiece >> isPiece [

	^ false
]

{ #category : 'rendering' }
MyNilPiece >> targetSquaresLegal: aBoolean [

	^ #(  )
]
