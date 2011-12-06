package org.jteam

class BlogController {

   def index = { redirect(action: "list", params: params) }

   // the delete, save and update actions only accept POST requests
   static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

   def list = {
      params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
      [blogInstanceList: Blog.list(params), blogInstanceTotal: Blog.count()]
   }

   def create = {
      def blogInstance = new Blog()
      blogInstance.properties = params
      return [blogInstance: blogInstance]
   }

   def save = {
      def blogInstance = new Blog(params)
      if (!blogInstance.hasErrors() && blogInstance.save()) {
         flash.message = "blog.created"
         flash.args = [blogInstance.id]
         flash.defaultMessage = "Blog ${blogInstance.id} created"
         redirect(action: "show", id: blogInstance.id)
      }
      else {
         render(view: "create", model: [blogInstance: blogInstance])
      }
   }

   def show = {
      def blogInstance = Blog.get(params.id)
      if (!blogInstance) {
         flash.message = "blog.not.found"
         flash.args = [params.id]
         flash.defaultMessage = "Blog not found with id ${params.id}"
         redirect(action: "list")
      }
      else {
         return [blogInstance: blogInstance]
      }
   }

   def edit = {
      def blogInstance = Blog.get(params.id)
      if (!blogInstance) {
         flash.message = "blog.not.found"
         flash.args = [params.id]
         flash.defaultMessage = "Blog not found with id ${params.id}"
         redirect(action: "list")
      }
      else {
         return [blogInstance: blogInstance]
      }
   }

   def update = {
      def blogInstance = Blog.get(params.id)
      if (blogInstance) {
         if (params.version) {
            def version = params.version.toLong()
            if (blogInstance.version > version) {

               blogInstance.errors.rejectValue("version", "blog.optimistic.locking.failure", "Another user has updated this Blog while you were editing")
               render(view: "edit", model: [blogInstance: blogInstance])
               return
            }
         }
         blogInstance.properties = params
         if (!blogInstance.hasErrors() && blogInstance.save()) {
            flash.message = "blog.updated"
            flash.args = [params.id]
            flash.defaultMessage = "Blog ${params.id} updated"
            redirect(action: "show", id: blogInstance.id)
         }
         else {
            render(view: "edit", model: [blogInstance: blogInstance])
         }
      }
      else {
         flash.message = "blog.not.found"
         flash.args = [params.id]
         flash.defaultMessage = "Blog not found with id ${params.id}"
         redirect(action: "edit", id: params.id)
      }
   }

   def delete = {
      def blogInstance = Blog.get(params.id)
      if (blogInstance) {
         try {
            blogInstance.delete()
            flash.message = "blog.deleted"
            flash.args = [params.id]
            flash.defaultMessage = "Blog ${params.id} deleted"
            redirect(action: "list")
         }
         catch (org.springframework.dao.DataIntegrityViolationException e) {
            flash.message = "blog.not.deleted"
            flash.args = [params.id]
            flash.defaultMessage = "Blog ${params.id} could not be deleted"
            redirect(action: "show", id: params.id)
         }
      }
      else {
         flash.message = "blog.not.found"
         flash.args = [params.id]
         flash.defaultMessage = "Blog not found with id ${params.id}"
         redirect(action: "list")
      }
   }
}
