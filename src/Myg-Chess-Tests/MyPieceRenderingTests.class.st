Class {
	#name : 'MyPieceRenderingTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'asserting' }
MyPieceRenderingTests >> assertRender: aPieceClass whiteOnWhite: first whiteOnBlack: second blackOnWhite: third blackOnBlack: fourth [

	self assert: (self letterOf: aPieceClass white on: 'a2') equals: first.
	self assert: (self letterOf: aPieceClass white on: 'a1') equals: second.
	self assert: (self letterOf: aPieceClass black on: 'a2') equals: third.
	self assert: (self letterOf: aPieceClass black on: 'a1') equals: fourth
]

{ #category : 'asserting' }
MyPieceRenderingTests >> letterOf: aPiece on: aSquareName [

	| board |
	board := MyChessBoard empty.
	board at: aSquareName put: aPiece.
	^ aPiece renderPieceOn: (board at: aSquareName)
]

{ #category : 'asserting' }
MyPieceRenderingTests >> testBishopLetters [

	self
		assertRender: MyBishop
		whiteOnWhite: 'B'
		whiteOnBlack: 'b'
		blackOnWhite: 'V'
		blackOnBlack: 'v'
]

{ #category : 'asserting' }
MyPieceRenderingTests >> testEmptySquareLetters [

	| board |
	board := MyChessBoard empty.

	self assert: (MyNilPiece new renderPieceOn: (board at: 'a2')) equals: 'z'.
	self assert: (MyNilPiece new renderPieceOn: (board at: 'a1')) equals: 'x'
]

{ #category : 'asserting' }
MyPieceRenderingTests >> testKingLetters [

	self
		assertRender: MyKing
		whiteOnWhite: 'K'
		whiteOnBlack: 'k'
		blackOnWhite: 'L'
		blackOnBlack: 'l'
]

{ #category : 'asserting' }
MyPieceRenderingTests >> testKnightLetters [

	self
		assertRender: MyKnight
		whiteOnWhite: 'N'
		whiteOnBlack: 'n'
		blackOnWhite: 'M'
		blackOnBlack: 'm'
]

{ #category : 'asserting' }
MyPieceRenderingTests >> testPawnLetters [

	self
		assertRender: MyPawn
		whiteOnWhite: 'P'
		whiteOnBlack: 'p'
		blackOnWhite: 'O'
		blackOnBlack: 'o'
]

{ #category : 'asserting' }
MyPieceRenderingTests >> testQueenLetters [

	self
		assertRender: MyQueen
		whiteOnWhite: 'Q'
		whiteOnBlack: 'q'
		blackOnWhite: 'W'
		blackOnBlack: 'w'
]

{ #category : 'asserting' }
MyPieceRenderingTests >> testRookLetters [

	self
		assertRender: MyRook
		whiteOnWhite: 'R'
		whiteOnBlack: 'r'
		blackOnWhite: 'T'
		blackOnBlack: 't'
]
