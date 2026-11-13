#'
#' Read hsu population files
#'
read_hsu <- function(x, debug = FALSE) {

	x_df <- read.csv(x)

	## Capture date in x path
	date_string <- regmatches(x, regexpr("\\d{4}[-_]\\d{2}[-_]\\d{2}", x))
	## Fix malformed date
	if(grepl("_", date_string)) {
	  x_df$Date <- as.Date(date_string, format = "%Y_%m_%d")
	} else {
	  x_df$Date <- as.Date(date_string)
	}

	if(any(grep(" to ", x_df$Age.group))) {
		x_df$Age.group <- gsub(" to ", "-", x_df$Age.group)
		## Original
		age_levels <- c("0 to 4", "5 to 9", "10 to 14", "15 to 19", "20 to 24",
						"25 to 29", "30 to 34",  "35 to 39", "40 to 44", "45 to 49",
						"50 to 54", "55 to 59",  "60 to 64", "65 to 69", "70 to 74",
						"75 to 79", "80 to 84", "85 to 89",  "90+")
		## Updated
		age_levels <- gsub(" to ", "-", age_levels)

		## Recode
	 x_df$age_recoded <- car::recode(
     x_df$Age.group,
		"c('0-4', '5-9', '10-14', '15-19', '20-24',
     '25-29', '30-34', '35-39', '40-44', '45-49', 
     '50-54', '55-59') = '0-59';
   c('60-64', '65-69') = '60-69';
   c('70-74', '75-79') = '70-79';
   c('80-84', '85-89') = '80-89';
   '90+' = '90+'"
		)
	} else {
		## Original
		age_levels <- c("0-11", "12-15", "16-19", "20-24", "25-29", "30-34", "35-39",  "40-44", "45-49", "50-54", "55-59", "60-64", "65+", "Various" )

		x_df$age_recoded <-	car::recode(
			x_df$Age.group,
			"c('0-11', '12-15', '16-19', '20-24', '25-29', '30-34',
     '35-39', '40-44', '45-49', '50-54', '55-59') = '0-59';
   c('60-64', '65+') = '60+';
   'Various' = 'Various'"
		)
	}

	if(is.character(x_df$Population) & any(grep(",", x_df$Population))) {
	    x_df$Population <- as.integer(gsub("\\s|,", "", x_df$Population))
	}
	
	x_df$Age.group <- factor(x_df$Age.group, levels = age_levels)

	x_sum <- aggregate(
		Population ~  Date + age_recoded + Age.group,
		data = x_df,
		FUN = sum,
		na.rm = TRUE
	)
	
	if(debug) {
	  cat("[", x, "]\n")
	  print(head(x_sum))
	}
	
	return(x_sum)
}