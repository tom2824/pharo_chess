Class {
	#name : 'MyPawnTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTests >> testPawnCannotCaptureSameColor [

	| pawn board |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'd5' put: MyPawn white.

	self
		assertCollection: pawn targetSquares
		hasSameElements: { board at: 'e5' }
]

{ #category : 'tests' }
MyPawnTests >> testPawnCannotMoveDiagonallyToEmptySquare [

	| pawn board |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).

	self
		assertCollection: pawn targetSquares
		hasSameElements: { board at: 'e5' }
]

{ #category : 'tests' }
MyPawnTests >> testWhitePawnCanCaptureDiagonally [

	| pawn board |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'd5' put: MyPawn black.
	board at: 'f5' put: MyRook black.

	self
		assertCollection: pawn targetSquares
		hasSameElements: {
				(board at: 'e5').
				(board at: 'd5').
				(board at: 'f5') }
]

{ #category : 'tests' }
MyPawnTests >> testWhitePawnCanMoveTwoSquaresFromInitialRank [

	| pawn board |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).

	self
		assertCollection: pawn targetSquares
		hasSameElements: { board at: 'e3'. board at: 'e4' }
]

{ #category : 'tests' }
MyPawnTests >> testWhitePawnMovesOneSquare [

	| pawn board |
	board := MyChessBoard empty.
	board at: 'e3' put: (pawn := MyPawn white).

	self
		assertCollection: pawn targetSquares
		hasSameElements: { board at: 'e4' }
]
