### How to setup

```sh-session
$ bundle install
```

### How to run the app

```sh-session
$ ruby main.rb
```

### How to run specs

```sh-session
$ bundle exec rake test
```

---

# Next Available Pickup Dates

## Introduction

Courier companies have specific cut-off times to pickup parcels. This allows them to plan for pickups and also make sure they don't overbook pickups on a specific day and risk not having the time to pickup all the parcels on that day.

For example, DHL might have a cut-off time of 2pm for pickups. This means that if a booking is made before that time for a same-day pickup, the parcel will be collected; otherwise, the pickup can only be scheduled for the next working day.

## Specification

Build a ruby class that, given a cut-off time, calculates what are the next 2 available working days for pickups. These 2 results will then be presented as options to the customer. Please note that we do not consider Saturdays, Sundays and English Bank Holidays as working days.

Here are some examples of possible cut-off times:

- "2pm"
- "14:00:00"
- "3:00"

The output should be an array of possibilities, where each possibility should have the following structure:

    { :date=>Tue, 16 Sep 2014, :description=>"Today" }

The elements in the hash should be:

- `date`, which is a ruby Date object representing the available working day
- `description`, which can be `Today`, `Tomorrow` or the day of the week.

More examples can be found below.

## Initial tests

Here are a few initial tests we are expecting from your class. The way the class is structured is up to you, but we expect the input and output to match the below:

1) Assuming it is Monday the 15th of September at 11am:

    > PickupService.perform("2pm")
    [
        {:date=>Mon, 15 Sep 2014, :description=>"Today"},
        {:date=>Tue, 16 Sep 2014, :description=>"Tomorrow"}
    ]

2) Assuming it is Monday the 15th of September at 3pm:

    > PickupService.perform("2pm")
    [
        {:date=>Tue, 16 Sep 2014, :description=>"Tomorrow"},
        {:date=>Wed, 17 Sep 2014, :description=>"Wednesday"}
    ]

3) Assuming it is Friday, the 22nd of August at 4pm (and the 25th is a Bank Holiday in England):

    > PickupService.perform("4pm")
    [
        {:date=>Tue, 26 Aug 2014, :description=>"Tuesday"},
        {:date=>Wed, 27 Aug 2014, :description=>"Wednesday"}
    ]

