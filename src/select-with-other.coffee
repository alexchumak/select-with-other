jQuery.fn.selectwithother = ->
  $ = jQuery

  this.each(->
    select_with_other_container = $(this)

    processed_menu_filter = (index, element) ->
      not_processed = not $(element).prop('_selectwithother_processed')
      $(element).prop('_selectwithother_processed', true)
      not_processed

    $('.dropdown-menu', select_with_other_container).filter(processed_menu_filter).each(->
      dropdown = $(this)
      other_radio = $('.other-option input:radio', dropdown)
      other_text = $('.other-option input:text', dropdown)

      checked_button = ->
        $('input:radio:checked', select_with_other_container)

      toggle_button = ->
        $('.dropdown-toggle', select_with_other_container)

      update_text = ->
        checked_button().val(other_text.val()) if within_other_option()

        $('span:first', toggle_button()).text(checked_button().val())

      within_other_option = ->
        checked_button().closest('.other-option', select_with_other_container).length > 0

      within_standard_options = (ev) ->
        $(ev.target).is(':radio') and $(ev.target).closest('.list-group', select_with_other_container).length > 0

      dropdown.click((ev) -> ev.stopPropagation() unless $(ev.target).is(':radio') and within_standard_options(ev))

      select_with_other_container.on(
        'hidden.bs.dropdown',
        ->
          update_text()
      )

      other_text.focus(
        ->
          other_radio.prop('checked', true)
          update_text()

      ).keypress(
        (ev) ->
          return unless ev.which is 13

          ev.preventDefault()
          ev.stopPropagation()

          toggle_button().dropdown('toggle')

      ).keyup(
        ->
          update_text()

      )
    )
  )
