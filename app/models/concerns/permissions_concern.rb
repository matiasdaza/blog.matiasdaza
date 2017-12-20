module PermissionsConcern
	extend ActiveSupport::Concern

	def is_normal_user? # El ? por convención es para devolver un true or false
		self.permission_level >= 1
	end

	def is_editor?
		self.permission_level >= 2
	end

	def is_admin?
		self.permission_level >= 3
	end
end
