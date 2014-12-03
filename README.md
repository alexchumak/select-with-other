Select with "Other"
===================

Select tag using radio buttons, with provision for typing in custom "Other" value.

Example
-------

![select with other option example](https://raw.githubusercontent.com/alexchumak/select-with-other/master/example.png)

Requirements
------------

* jQuery
* Bootstrap 3.x
* Optional: The example also uses FontAwesome for the down caret icon.

Installation
------------

### HTML Markup

In the `HEAD` of your HTML document:

    <script src="src/select-with-other.min.js"></script>

Within a `FORM` use following frame and then modify / style to your liking. It might not break.

Change `phone_label` name attribute's value to the desired name in your form field.

    <div class="btn-group">
      <button aria-expanded="false" class="btn btn-default dropdown-toggle" data-toggle="dropdown" type="button">
        <span>[ Pick One ]</span>
        <span class="fa fa-caret-down fa-fw"></span>
      </button>

      <ul class="well well-sm dropdown-menu" role="menu">
        <div class="list-group">
          <div class="list-group-item">
            <label class="radio-inline">
              <input name="phone_label" type="radio" value="Cell">
              Cell
            </label>
          </div>

          <div class="list-group-item">
            <label class="radio-inline">
              <input name="phone_label" type="radio" value="Home">
              Home
            </label>
          </div>

          <div class="list-group-item">
            <label class="radio-inline">
              <input name="phone_label" type="radio" value="Office">
              Office
            </label>
          </div>
        </div>

        <div class="other-option">
          <div class="input-group">
            <div class="input-group-addon">
              <input checked="checked" name="phone_label" type="radio">
            </div>

            <input class="form-control" placeholder="Other" type="text">
          </div>
        </div>
      </ul>
    </div>

### Javascript

    $(function () { $('.btn-group').selectwithother(); })

Help
----

Create an issue if you need any assistance. Create pull requests to contribute. Please do.

License
-------

MIT
