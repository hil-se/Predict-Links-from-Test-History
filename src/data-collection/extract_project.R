require(data.table)

fread("travistorrent_8_2_2017.csv", sep = ",", header = TRUE) -> pre
head(pre)

extract_data = pre[, c("tr_build_id", "git_trigger_commit", "git_all_built_commits", "gh_build_started_at", "gh_project_name", "gh_diff_files_modified", "tr_log_bool_tests_ran", "tr_log_num_tests_ok", "tr_log_num_tests_failed", "tr_log_tests_failed")]

extract_data_new = extract_data[ gh_project_name == "middleman/middleman" ]
#extract_data = extract_data[ !is.na(extract_data$tr_log_num_tests_run) ]
#extract_data = extract_data[ extract_data$tr_log_tests_failed != "" ]

write.csv(extract_data_new, "middleman_original.csv", row.names = FALSE)

