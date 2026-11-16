Class {
	#name : 'MyEnPassantTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyEnPassantTests >> testBoardHasNoEnPassantSquareInitially [

	| board |
	board := MyChessBoard empty.

	self assert: board enPassantSquare isNil
]

{ #category : 'tests' }
MyEnPassantTests >> testDoubleStepSetsEnPassantSquare [

	| board pawn |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).

	pawn moveTo: (board at: 'e4').

	self assert: board enPassantSquare equals: (board at: 'e3')
]

{ #category : 'tests' }
MyEnPassantTests >> testEnPassantSquareCanBeSet [

	| board |
	board := MyChessBoard empty.
	board enPassantSquare: (board at: 'e3').

	self assert: board enPassantSquare equals: (board at: 'e3')
]

{ #category : 'tests' }
MyEnPassantTests >> testOtherPieceMoveClearsEnPassantSquare [

	| board rook |
	board := MyChessBoard empty.
	board at: 'a1' put: (rook := MyRook white).
	board enPassantSquare: (board at: 'e3').

	rook moveTo: (board at: 'a4').

	self assert: board enPassantSquare isNil
]

{ #category : 'tests' }
MyEnPassantTests >> testSingleStepClearsEnPassantSquare [

	| board pawn |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).
	board enPassantSquare: (board at: 'a6').

	pawn moveTo: (board at: 'e3').

	self assert: board enPassantSquare isNil
]
