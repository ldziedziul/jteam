package org.jteam

class Author {
   String firstname
   String lastname
   String nip
   int age

   def static transients = ['fullName']

   static constraints = {
      firstname(nullable: false, blank: false)
      lastname(nullable: false, blank: false)
      nip(nullable: false, blank: false, unique: true)
      age(min: 0, max: 200)
   }

   String getFullName(){
      return "$firstname $lastname"
   }
}
