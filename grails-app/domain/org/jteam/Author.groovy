package org.jteam

class Author {
   String firstname
   String lastname
   String nip
   int age


   static constraints = {
      firstname(nullable: false, blank: false)
      lastname(nullable: false, blank: false)
      nip(nullable: false, blank: false, unique: true)
      age(min: 0, max: 200)
   }
}
