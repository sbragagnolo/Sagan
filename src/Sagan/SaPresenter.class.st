"
I am here to add some convenient conveniences for the project. 
"
Class {
	#name : #SaPresenter,
	#superclass : #SpPresenter,
	#category : #'Sagan-UI'
}

{ #category : #'instance creation' }
SaPresenter >> finishRendering [
]

{ #category : #'instance creation' }
SaPresenter >> newLessonEntryTable [

	| table |
	table := self newTable.

	table
		sortingBlock: [ :a :b | a order < b order ];
		addColumn:
			((SpStringTableColumn
				  title: '#'
				  evaluated: [ :item | item order ])
				 beSortable;
				width: 20;
				 yourself);
		addColumn:
			((SpStringTableColumn
				  title: 'Title'
				  evaluated: [ :item | item title ])
				 beSortable;
				 yourself);
		whenSelectionChangedDo: [ :selection | 
		self setLesson: selection selectedItem ];
		beResizable.
	^ table
]

{ #category : #'instance creation' }
SaPresenter >> newLessonViewer [
	^ self instantiate: SaLessonViewer
]

{ #category : #'instance creation' }
SaPresenter >> newNotebookPageWith: aProvider and: aTitle [

	^ self newNotebookPage
		  title: aTitle;
		  icon: (self iconNamed: #nautilusIcon);
		  presenterProvider: aProvider;
		  yourself
]
