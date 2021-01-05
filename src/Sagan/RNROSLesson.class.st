Class {
	#name : #RNROSLesson,
	#superclass : #Object,
	#category : #'Sagan-RobotsDuNordROS'
}

{ #category : #'as yet unclassified' }
RNROSLesson >> filesystem [

	^ 'pharo-local/iceberg/sbragagnolo/sagan/contents' asFileReference
]

{ #category : #accessing }
RNROSLesson >> lesson [ 
	self subclassResponsibility 
]

{ #category : #accessing }
RNROSLesson >> objectives [

	^ SaMarkdownContent new
		  title: 'Objectives';
		  content: (self filesystem / 'objectives.md') readStream upToEnd;
		  yourself
]

{ #category : #accessing }
RNROSLesson >> summary [
	^ SaFinish new
		title: 'Summary';
		content: (self filesystem / 'summary.md') readStream upToEnd;
		yourself
]