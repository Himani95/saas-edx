PART 1: SORTING THE LIST OF ALL MOVIES

Enhance RP in the following way:

On the list of all movies page, the column headings for ‘Movie Title’ and ‘Release Date’ for a movie should be
clickable links. Clicking one of them should cause the list to be reloaded but sorted in ascending order on that
column. For example, clicking the ‘release date’ column heading should redisplay the list of movies with the
earliest-released movies first; clicking the ‘title’ field should list the movies alphabetically by title. (For movies
whose names begin with non-letters, the sort order should match the behavior of String#<=>.)

When the listing page is redisplayed with sorting-on-a-column enabled, the column header that was selected
for sorting should appear with a yellow background, as shown below. You should do this by setting controller
variables that are used to conditionally set the CSS class of the appropriate table heading to hilite, and
pasting this simple CSS into RottenPotatoes’ app/assets/stylesheets/application.css

PART 2: FILTER THE LIST OF MOVIES

Enhance RottenPotatoes as follows. At the top of the All Movies listing, add some checkboxes that allow the user to filter the list to show only movies with certain MPAA ratings:

When the Refresh button is pressed, the list of movies is redisplayed showing only those movies whose ratings were checked.

This will require a couple of pieces of code. We have provided the code that generates the checkboxes form, which you can include in the index.html.haml template:

haml
= form_tag movies_path, :method => :get do
  Include:
  - @all_ratings.each do |rating|
    = rating
    = check_box_tag "ratings[#{rating}]"
  = submit_tag 'Refresh'

BUT, you have to do a bit of work to use the above code: as you can see, it expects the variable @all_ratings to be an enumerable collection of all possible values of a movie rating, such as ['G','PG','PG-13','R']. The controller method needs to set up this variable. And since the possible values of movie ratings are really the responsibility of the Movie model, it’s best if the controller sets this variable by consulting the Model. Hence, you should create a class method of Movie that returns an appropriate value for this collection.

You will also need code that figures out (i) how to figure out which boxes the user checked and (ii) how to restrict the database query based on that result.

Regarding (i), try viewing the source of the movie listings with the checkbox form, and you’ll see that the checkboxes have field names like ratings[G], ratings[PG], etc. This trick will cause Rails to aggregate the values into a single hash called ratings, whose keys will be the names of the checked boxes only, and whose values will be the value attribute of the checkbox (which is “1” by default, since we didn’t specify another value when calling the check_box_tag helper). That is, if the user checks the ‘G’ and ‘R’ boxes, params will include as one if its values :ratings=>{"G"=>"1", "R"=>"1"}. Check out the Hash documentation for an easy way to grab just the keys of a hash, since we don’t care about the values in this case.

Regarding (ii), you’ll probably end up replacing Movie.all in the controller method with Movie.find, which has various options to help you restrict the database query.

PART 3: REMEMBER THE SORTING AND FILTERING SETTINGS

OK, so the user can now click on the “Movie Title” or “Release Date” headings and see movies sorted by those columns, and can additionally use the checkboxes to restrict the listing to movies with certain ratings only. And we have preserved RESTfulness, because the URI itself always contains the parameters that will control sorting and filtering.

The last step is to remember these settings. That is, if the user has selected any combination of column sorting and restrict-by-rating constraints, and then the user clicks to see the details of one of the movies (for example), when she clicks the Back to Movie List on the detail page, the movie listing should “remember” the user’s sorting and filtering settings from before.

(Clicking away from the list to see the details of a movie is only one example; the settings should be remembered regardless what actions the user takes, so that any time she visits the index page, the settings are correctly reinstated.)

The best way to do the “remembering” will be to use the session[] hash. The session is like the flash[], except that once you set something in the session[] it is remembered “forever” until you nuke the session with session.clear or selectively delete things from it with session.delete(:some_key). That way, in the index method, you can selectively apply the settings from the session[] even if the incoming URI doesn’t have the appropriate params[] set.