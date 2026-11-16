Class {
	#name : 'MyPawnTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

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
