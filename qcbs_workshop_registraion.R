
library(RCurl)

qcbs_r_registration <- function(workshop=NULL,location=NULL,cancel=NULL,noshow=NULL,reregister=NULL)
  # Get list of registrants for QCBS R workshop series
  #
  # Parameters:
  #
  # workshop = workshop number (e.g. 6), from 1-8
  #
  # location = Shortname for workshop location. One of "McGill", "UdeM", "Sherbrooke", "Laval", "UQAR", "UQAM", "Concordia".
  #
  # cancel, noshow, reregister= specify registration id to cancel a registration (cancel), indicate a person who didn't cancel
  #                         	and didn't attend (noshow), or someone who cancelled and then decided to re-register (reregister)
  #                         	for example: cancel=51 will cancel registration id 51. To obtain the id of a specific registration,
#                         	run the function with the workshop id and location name and look at the registration_id column.
#
# Output:
# Data frame with list of participants, or message if cancel, noshow or reregister where specified.
#
# Author:: Guillaume Larocque, 2015 (glaroc@gmail.com)

{
  if(!is.null(cancel) | !is.null(noshow) | !is.null(reregister)){
    if(!is.null(cancel)){
      cancelnoshow=1
      regid=cancel
      status="cancel"
    }else if(!is.null(noshow)){
      cancelnoshow=2
      regid=noshow
      status="no_show"
    }else if(!is.null(reregister)){
      cancelnoshow="rereg"
      regid=reregister
      status="registered/present"
    }
    file<-postForm('http://qcbs.ca/qcbs-database/r-registration-csv.php',cancelnoshow=cancelnoshow,regid=regid,key='9HJS975LKM4FPST48SNMLE12l')
    print(paste('Registration ',regid,' changed to: ',status,sep=""))
  }else{
    file<-postForm('http://qcbs.ca/qcbs-database/r-registration-csv.php',workshop=workshop,location=location,key='9HJS975LKM4FPST48SNMLE12l')
    read.csv(textConnection(file))
  }
}

list <- qcbs_r_registration(3, "McGill")

# to unregister Angelly, ID 1843
qcbs_r_registration(3, "McGill", cancel = 1843)
# to unregister Guang, ID 1854
qcbs_r_registration(3, "McGill", cancel = 1854)
# to unregister Joel, ID 1896
qcbs_r_registration(3, "McGill", cancel = 1896)

list <- qcbs_r_registration(3, "McGill")

# Workshop 5
list <- qcbs_r_registration(5, "McGill")
# think about ice-breaker-y things to get things ready at the beginning, 
# facillitate the atmosphere. 

# name game (introductory hand movements?).
# or- 1 sentence on why they're taking the workshop
