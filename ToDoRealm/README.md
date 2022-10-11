Take-Home Project: Swift (Associate Level)

General Requirements
1. Use third party libraries only if really necessary
2. Follow the SOLID architecture principles
3. Follow DRY, KISS and YAGNI principles
4. BONUS: Usage of Realm database would be a huge advantage

Main Screen (TODO App)
1. Display a list of TODO items sorted by the date of update
2. Have an item description limited to three lines, creation date or update date if item has been updated after creation
3. Swiping item to the left completes it and removes from the list
4. In a top right corner display a plus button which will lead to an Add TODO item screen
5. BONUS: Display two lists separated by either tabs or segmented control, one list for upcoming TODO items and another one for completed, showing completion date below each item.

Add a TODO Item Screen
1. Display a fullscreen textview (keyboard should not overlap it when opened)
2. In a top right corner display a “Save” button which saves the item and navigates back to the list
3. When new item is being created set creation and update date to a current time
4. In a top left corner display a back button which navigates back to the list and ignores all the changes

TODO Item Details Screen
1. Display a fullscreen scrollable read-only textview with the content of the item
2. In a top right corner display an “Edit” button which makes textview editable and “Complete” button which completes the item and returns back to the list
3. When item is being updated set update date to a current time
4. In a top left corner display a back button which navigates back to the list
