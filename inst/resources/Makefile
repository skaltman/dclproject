# Search path
VPATH = data data-raw eda reports scripts
TESTING
# Processed data files
data =

# EDA studies
eda =

# Reports
reports =

# All targets
all : $(data) $(eda) $(reports)

# Data dependencies

# EDA study and report dependencies

# Pattern rules
%.rds : %.R
Rscript $<
  %.md : %.Rmd
Rscript -e \'rmarkdown::render(input = "$<", output_options = list(html_preview = FALSE))\'
