# Image from NASA API
* not commercial project

This is a little app for android on flutter. 

It consists of 2 screens:

 # 1. <add an image>
  I get an images from NASA api (https://api.nasa.gov/planetary/apod)  
  and form a List<Widget>: Column[
                          ElevatedButton (Image,
                                          Text,
                                          Text,),
                          Padding]
  next i form a Home page there shove a List:
    Scaffold => SliverList => SliverChildListDelegate => Container => 
    Column => List<Widget>
  
 # 2. <add an image>
  I passing on second screen parametrs : title, imageUrl
  and showing a preview image.
  Same way this screen have a downloal button, but now it not working =(.
