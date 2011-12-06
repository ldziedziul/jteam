package org.jteam

class AuthorService {

    static transactional = true

    def save(Author author) {
       author.save(flush: true)
    }
}
