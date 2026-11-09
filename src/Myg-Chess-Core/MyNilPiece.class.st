"
I am the content of an empty square (Null Object pattern).

I answer the same messages as a real piece, so nobody has to check if a square contains nil: asking an empty square for its targets simply answers nothing.
"
Class {
	#name : 'MyNilPiece',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'testing' }
MyNilPiece >> isPiece [
	"There is no piece on an empty square"

	^ false
]

{ #category : 'rendering' }
MyNilPiece >> renderPieceOn: aSquare [
	"An empty square knows which letter draws it"

	^ aSquare emptyLetter
]

{ #category : 'rendering' }
MyNilPiece >> targetSquaresLegal: aBoolean [
	"An empty square cannot move anywhere"

	^ #()
]
