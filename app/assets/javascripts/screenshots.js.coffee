# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "change", ".btn-file :file", ->
  console.log("file changed")
  input = $(this)
  numFiles = (if input.get(0).files then input.get(0).files.length else 1)
  label = input.val().replace(/\\/g, "/").replace(/.*\//, "")
  input = $(this).parents(".input-group").find(":text")
  log = (if numFiles > 1 then numFiles + " files selected" else label)
  if input.length
    input.val log
  else
    slert log if log
  return
