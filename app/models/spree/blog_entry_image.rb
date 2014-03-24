class Spree::BlogEntryImage < Spree::Image
  has_attached_file :attachment, 
   :styles => { :big => "500>", :medium => "300x300>"},
   s3_credentials: {
		  access_key_id: ENV["S3_KEY"],
		  secret_access_key: ENV["S3_SECRET"],
		  bucket: "rungazella-dev",
		},
	storage: :s3,
	s3_headers:     { "Cache-Control" => "max-age=31557600" },
	s3_protocol:    "https",
	bucket:         "rungazella-dev",
    path: "/:class/:attachment/:id/:style/:basename.:extension",
	default_url:   "/:class/:attachment/:id/:style/:basename.:extension",
	default_style: "medium"
end
