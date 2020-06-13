<link href="style-colors.css" rel="stylesheet" type="text/css">
<link href="style-element-modals.css" rel="stylesheet" type="text/css">
<div id="complete-modal" class="modal-rem">
	<div class="modal-content-rem">
		<span class="close">&times;</span>
		<form id="complete-form"
			onsubmit="event.preventDefault(); return completeReminder();">
			<br>
			<h1>Complete This Reminder?</h1>
			<p>Cannot return to incomplete.</p>
			<br> <input type="submit" class="popup-buttons confirm"
				value="Confirm"> <input type="reset"
				class="popup-buttons cancel" value="Cancel">
		</form>
	</div>
</div>

<div id="delete-modal" class="modal-rem">
	<div class="modal-content-rem">
		<span class="close">&times;</span>
		<form id="delete-form"
			onsubmit="event.preventDefault(); return deleteElement();">
			<br>
			<h1>Are you sure?</h1>
			<p>Once deleted, it will be gone forever.</p>
			<br> <input type="submit" class="popup-buttons confirm"
				value="Confirm"> <input type="reset"
				class="popup-buttons cancel" value="Cancel">
		</form>
	</div>
</div>
