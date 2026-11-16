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
MyEnPassantTests >> testEnPassantSquareCanBeSet [

	| board |
	board := MyChessBoard empty.
	board enPassantSquare: (board at: 'e3').

	self assert: board enPassantSquare equals: (board at: 'e3')
]
