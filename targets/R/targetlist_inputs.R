inputs <- list(
  tar_target(hsu_dirs,
		   dir(here::here("vaccine-data"), pattern = "202[123]", full.names = TRUE)),
  tar_target(hsu_files,
		   system('find ../vaccine-data -name "hsu_population.csv" | grep -v latest | sort', intern = TRUE)),
  tar_target(hsu_data, read_hsu(hsu_files),
		   pattern   = map(hsu_files),
		   iteration = "list"
		   ),
  tar_target(hsu_data_wide, 
  		   dplyr::bind_rows(hsu_data) |>
  		   	pivot_wider(
				names_from  = Date,
				values_from = Population
  		   			)
		   ),
  tar_target(hsu_2022_05_04,
		   {
			ind <- grep("2022-05-04", hsu_files)
			read_hsu(hsu_files[ind])
		   }
			),
  tar_target(hsu_2022_09_28,
		   {
			ind <- grep("2022-09-28", hsu_files)
			read_hsu(hsu_files[ind])
		   }
		   )

  
)