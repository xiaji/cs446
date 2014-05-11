atom_feed do |feed|
	feed.title "All foster parents"
	feed.updated @latest.try(:updated_at)

	@foster_parents.each do |foster_parent|
		xhtml.p "Foster Parent"
		xhtml.table do
			xhtml.tr do
				xhtml.th 'Name'
				xhtml.th 'Address'
				xhtml.th 'Email'
				xhtml.th 'Pet Fostered'
			end
			xhtml.tr do
				xhtml.th foster_parent.name
				xhtml.th foster_parent.address
				xhtml.th foster_parent.email
				xhtml.th Pet.find(foster_parent.pet_id).name
			end
		end
	end
end