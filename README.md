![Untitled presentation](https://github.com/koocimas/Desserve/assets/129230960/1647ad01-b822-4061-80b6-f1c588dc4858)
![Untitled presentation-2](https://github.com/koocimas/Desserve/assets/129230960/d86095bc-8f42-4590-bcab-e11946fc2439)

Desserve is a dessert application that provides users with a list of popular desserts recipes. This is a searchable list that narrows down by letters entered into the search bar.
When a dessert is selected, details are shown including the dessert name, photo, instructions, and a list of ingredients and measurements.

Code is arranged within Views, Models, and Services. 
The app utilizes Swift Modern Concurrency and runs on iOS 16 or later.
Errors are handled and provide alerts to users.
The app calls two endpoints from https://themealdb.com/api.php:
  https://themealdb.com/api/json/v1/1/filter.php?c=Dessert for fetching the list of meals in the Dessert category.
  https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID for fetching the meal details by its ID.
