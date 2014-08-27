$ ->
  checked_all = ->
    checkbox = $("#checked_all")
    checkboxes = $(".table input")
    checkbox.on "click", ->
      checkboxes.prop "checked", checkbox.prop("checked")
      return

    return
  checked_all()
  return



$ ->
  $(".del").click ->
    current_task_tr = $(this).parents("tr")[0]
    if confirm("Are you sure?")
      $.ajax
        url: "/tasks/" + $(current_task_tr).data("task_id")
        method: "DELETE"

        success: (result) ->
          $(current_task_tr).fadeOut 200
          console.log result
          return

    return

  return
