package jteam

class JTeamTagLib {
   def static namespace = "jteam"

   def hello = {attrs, body ->
      body().toString().eachWithIndex {it, idx ->
         out << ((idx % 2 == 0) ? it.toUpperCase() : it.toLowerCase())
      }
      if (attrs.happy == "true") {
         out << ' :)'
      }
   }

}
