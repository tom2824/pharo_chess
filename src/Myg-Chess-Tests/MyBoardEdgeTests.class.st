"
I check that pieces near the edges of the board (and empty squares) behave correctly.
These tests protect the 'Remove nil checks' refactoring: they describe what the game must do, whatever the way we represent 'nothing here' or 'outside of the board'.
"
Class {
	#name : 'MyBoardEdgeTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'asserting' }
MyBoardEdgeTests >> assertSquares: squares areNamed: names [

	self
		assertCollection: (squares collect: #name) asSet
		hasSameElements: names asSet
]

{ #category : 'tests - bishop' }
MyBoardEdgeTests >> testBishopInCornerSlidesOnlyOnTheBoard [

	| board bishop |
	board := MyChessBoard empty.
	board at: 'a1' put: (bishop := MyBishop white).

	self
		assertSquares: bishop legalTargetSquares
		areNamed: #( 'b2' 'c3' 'd4' 'e5' 'f6' 'g7' 'h8' )
]

{ #category : 'tests - empty squares' }
MyBoardEdgeTests >> testEmptySquareContentsIsNotNil [

	| board |
	board := MyChessBoard empty.

	self deny: (board at: 'e4') contents isNil
]

{ #category : 'tests - empty squares' }
MyBoardEdgeTests >> testEmptySquareContentsIsNotAPiece [

	| board |
	board := MyChessBoard empty.

	self deny: (board at: 'e4') contents isPiece.
	self deny: (board at: 'e4') hasPiece
]

{ #category : 'tests - empty squares' }
MyBoardEdgeTests >> testEmptySquareContentsHasNoTarget [

	| board |
	board := MyChessBoard empty.

	self assert: (board at: 'e4') contents targetSquares isEmpty
]

{ #category : 'tests - empty squares' }
MyBoardEdgeTests >> testEmptyingASquareRemovesItsPiece [

	| board rook |
	board := MyChessBoard empty.
	board at: 'e4' put: (rook := MyRook white).

	(board at: 'e4') emptyContents.

	self deny: (board at: 'e4') hasPiece
]

{ #category : 'tests - king' }
MyBoardEdgeTests >> testKingInCornerMovesOnlyOnTheBoard [

	| board king |
	board := MyChessBoard empty.
	board at: 'a1' put: (king := MyKing white).

	self
		assertSquares: king legalTargetSquares
		areNamed: #( 'a2' 'b2' 'b1' )
]

{ #category : 'tests - king' }
MyBoardEdgeTests >> testKingOnTheOppositeCornerMovesOnlyOnTheBoard [

	| board king |
	board := MyChessBoard empty.
	board at: 'h8' put: (king := MyKing white).

	self
		assertSquares: king legalTargetSquares
		areNamed: #( 'g8' 'g7' 'h7' )
]

{ #category : 'tests - knight' }
MyBoardEdgeTests >> testKnightInCornerMovesOnlyOnTheBoard [

	| board knight |
	board := MyChessBoard empty.
	board at: 'a1' put: (knight := MyKnight white).

	self assertSquares: knight legalTargetSquares areNamed: #( 'b3' 'c2' )
]

{ #category : 'tests - knight' }
MyBoardEdgeTests >> testKnightOnTheSideMovesOnlyOnTheBoard [

	| board knight |
	board := MyChessBoard empty.
	board at: 'h4' put: (knight := MyKnight white).

	self
		assertSquares: knight legalTargetSquares
		areNamed: #( 'g6' 'g2' 'f5' 'f3' )
]

{ #category : 'tests - off board' }
MyBoardEdgeTests >> testNavigatingOutsideTheBoardNeverFails [

	| board outside |
	board := MyChessBoard empty.

	outside := (board at: 'a1') left.
	self deny: outside isOnBoard.

	"Outside of the board, we stay outside of the board"
	self deny: outside up isOnBoard.
	self deny: outside down left right isOnBoard.
	self deny: outside hasPiece
]

{ #category : 'tests - off board' }
MyBoardEdgeTests >> testSquaresOfTheBoardAreOnBoard [

	| board |
	board := MyChessBoard empty.

	self assert: (board at: 'e4') isOnBoard.
	self assert: (board at: 'e4') up isOnBoard.
	self deny: (board at: 'e8') up isOnBoard
]

{ #category : 'tests - board' }
MyBoardEdgeTests >> testPiecesOfTheBoardAreOnlyRealPieces [

	| board rook king |
	board := MyChessBoard empty.
	board at: 'a1' put: (rook := MyRook white).
	board at: 'h8' put: (king := MyKing black).

	self
		assertCollection: board pieces asSet
		hasSameElements: { rook. king } asSet
]

{ #category : 'tests - rook' }
MyBoardEdgeTests >> testRookInCornerSlidesOnlyOnTheBoard [

	| board rook |
	board := MyChessBoard empty.
	board at: 'h8' put: (rook := MyRook white).

	self assert: rook legalTargetSquares size equals: 14
]

{ #category : 'tests - rook' }
MyBoardEdgeTests >> testRookIsBlockedByAPieceAndCapturesOpponent [

	| board rook |
	board := MyChessBoard empty.
	board at: 'a1' put: (rook := MyRook white).
	board at: 'a3' put: MyPawn black.
	board at: 'c1' put: MyPawn white.

	self
		assertSquares: rook legalTargetSquares
		areNamed: #( 'a2' 'a3' 'b1' )
]
