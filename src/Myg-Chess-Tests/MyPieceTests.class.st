Class {
	#name : 'MyPieceTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPieceTests >> testCanMoveToLegalSquare [

	| board rook |
	board := MyChessBoard empty.
	board at: 'a1' put: (rook := MyRook white).

	self assert: (rook canMoveTo: (board at: 'a4'))
]

{ #category : 'tests' }
MyPieceTests >> testCannotMoveToIllegalSquare [

	| board rook |
	board := MyChessBoard empty.
	board at: 'a1' put: (rook := MyRook white).

	self deny: (rook canMoveTo: (board at: 'b2'))
]

{ #category : 'tests' }
MyPieceTests >> testMoveToIllegalSquareDoesNothing [

	| board rook |
	board := MyChessBoard empty.
	board at: 'a1' put: (rook := MyRook white).

	rook moveTo: (board at: 'b2').

	self assert: rook square equals: (board at: 'a1').
	self deny: (board at: 'b2') hasPiece
]
