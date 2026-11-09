Class {
	#name : 'MyKnight',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyKnight >> blackLetter [
	"The letter drawing a black knight in the chess font"

	^ 'M'
]

{ #category : 'accessing' }
MyKnight >> id [
	
	^ 'N'
]

{ #category : 'rendering' }
MyKnight >> targetSquaresLegal: aBoolean [

	^ {
		  square right right up.
		  square right right down.
		  square left left up.
		  square left left down.
		  square up up left.
		  square up up right.
		  square down down left.
		  square down down right }
		  select: [ :s |
			  s isOnBoard and: [ s hasPiece not or: [ s contents color ~= color ] ] ]
]
