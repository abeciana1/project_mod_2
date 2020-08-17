# README

# project_mod_2
        main_url = RestClient.get("http://apps.des.qld.gov.au/species/?op=getclassnames&kingdom=animals")
        animals_data = JSON.parse(main_url)
        animal_link = animals_data["Class"]