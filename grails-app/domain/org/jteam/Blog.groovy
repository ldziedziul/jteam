package org.jteam

class Blog {
   String topic
   Date dateCreated
   Author author

   def static belongsTo = [Author]

   static constraints = {
      topic(nullable: false, blank:false,maxSize: 1024)
      dateCreated(nullable: false)
      author(nullable: false)
   }
}
