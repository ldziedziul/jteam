class UrlMappings {

   static mappings = {
      "/$controller/$action?/$id?" {
         constraints {
            // apply constraints here
         }
      }

      "/"(controller: "author")
      "500"(view: '/error')
   }
}
