# Requirements:
# jsonscheme2md installed
# referrals-api pulled to latest master next to slate project

echo "(Re)generating documentation"
jsonschema2md -e json -d ../referrals-api/src/utils/referral/flights/schemas -o ../referrals-api/src/utils/referral/flights/docs
jsonschema2md -e json -d ../referrals-api/src/utils/referral/hotels/schemas -o ../referrals-api/src/utils/referral/hotels/docs
jsonschema2md -e json -d ../referrals-api/src/utils/referral/cars/schemas -o ../referrals-api/src/utils/referral/cars/docs

echo "Parsing ..."
sed s/^#/##/g ../referrals-api/src/utils/referral/flights/docs/dayView.md > source/includes/_flights_dayView.md
sed s/^#/##/g ../referrals-api/src/utils/referral/flights/docs/browseView.md > source/includes/_flights_browseView.md
sed s/^#/##/g ../referrals-api/src/utils/referral/flights/docs/calendarMonthView.md > source/includes/_flights_calendarMonthView.md
sed s/^#/##/g ../referrals-api/src/utils/referral/flights/docs/multiCity.md > source/includes/_flights_multiCity.md
sed s/^#/##/g ../referrals-api/src/utils/referral/hotels/docs/dayView.md > source/includes/_hotels_dayView.md
sed s/^#/##/g ../referrals-api/src/utils/referral/cars/docs/dayView.md > source/includes/_cars_dayView.md
