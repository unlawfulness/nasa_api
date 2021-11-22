# Image from NASA API
* not commercial project

This is a little app for android on flutter. 

It consists of 2 screens:

 # 1. ![WtGrOMPkz9s](https://user-images.githubusercontent.com/60977945/142928221-65ce7e88-ddfb-4a73-b509-e139838ce5f9.jpg)
  I get an images from NASA api (https://api.nasa.gov/planetary/apod)  
  and form a List<Widget>: Column[
                          ElevatedButton (Image,
                                          Text,
                                          Text,),



                          Padding]
  next i form a Home page there shove a List:
    Scaffold => SliverList => SliverChildListDelegate => Container => 
    Column => List<Widget>
  
 # 2. ![ExlNHmlHgQM](https://user-images.githubusercontent.com/60977945/142928233-01489327-a0d4-405f-860b-653889822bf4.jpg)
  I passing on second screen parametrs : title, imageUrl
  and showing a preview image.
  Same way this screen have a downloal button.
