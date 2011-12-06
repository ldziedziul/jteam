import org.jteam.Author

class BootStrap {

   def init = { servletContext ->
      new Author(firstname: "Adam", lastname: "Mickiewicz", age: 123, nip: 1231432).save()
      new Author(firstname: "Henryk", lastname: "Sienkiewicz", age: 123, nip: 1234312).save()
      new Author(firstname: "Julian", lastname: "Słowacki", age: 123, nip: 132121).save()
      new Author(firstname: "Sławomir", lastname: "Słowik", age: 123, nip: 122312).save()
   }
   def destroy = {
   }
}
