---
title: "water boiler"
date: 2022-10-15T12:21:22-07:00
---

I wanted to be able to boil water while camping to make simple meals like
instant noodles or rehydrate meal packs. Many people like to use small propane
stoves, but for the few times that I go camping I don't think it is worth the
trouble.

I am a fan of Ryobi tools and have a few of their batteries/flashlights. I
decided to assemble a water boiler setup from a [12/24V kettle](https://www.amazon.com/gp/product/B081172ZZ7)
and some cables. No propane refills here. Just a simple recharge and a
portable kettle that can be used anywhere.

{{< image src="images/projects/ryobi/water-boiler-setup.jpg"
    alt="DIY Ryobi water boiler setup" >}}

## Performance Stats

Here are the performance numbers for this setup. For each test, I charged the
batteries to full, boiled 500mL of water until the auto-shutoff kicked in, then
let the batteries rest for 10 minutes before measuring the terminal voltage. I
rinsed the pot with cold water between tests.

I measured energy consumption with this [inline power meter](https://www.amazon.com/gp/product/B07GB71YSB/).

{{< image src="images/projects/ryobi/water-boiler-power-meter.jpg"
    alt="Inline power meter" >}}

As demonstrated below, boil time decreases significantly with increase in
battery capacity. This is due to a more efficient discharge for each battery
and longer sustained higher voltage. Putting two packs in parallel would yield
even better performnace.

| Battery Model | Total Capacity | Starting Voltage | Terminal Voltage | Boil Time | Energy Used |
|---------------|----------------|------------------|------------------|-----------|-------------|
| PBP004        | 4Ah/72Wh       | 20.7V            | 17.55V           | 12m10s    | 31.4Wh      |
| PBP007        | 6Ah/108Wh      | 20.4V            | 18.1V            | 11m23s    | 29.7Wh      |
| P194          | 9Ah/162Wh      | 20.8V            | 19.55V           | 9m15s     | 23.5Wh      |

## Kettle

I picked up a 12V kettle from Amazon. I am sure that it goes by many model
names/numbers.

{{< image src="images/projects/ryobi/water-boiler-kettle.jpg"
    alt="Kettle to modify" >}}

These kettles offer a few nice features: 12/24V compatibility, automatic
shutoff and a 1L capacity. These are features not seen on less-expensive
options. The downside of this model is the cheap power cord. It is far too thin
and will heat up under load significantly. This not only wastes energy but also
slows the boiling process.

{{< image src="images/projects/ryobi/water-boiler-kettle-upgraded.jpg"
    alt="Kettle with upgraded wiring" >}}

I opted to replace the cord with 12AWG silicon wire, commonly used for RC cars
and drones. This is a high-temperature wire which makes it suitable for use next
to the hot heating elements. I also replaced the 12V automotive power plug with
an XT60 connector. I upgraded the 12V automotive power socket to use 12AWG cable
and mating XT60 connector so that the kettle can still be used in the car.

{{< image src="images/projects/ryobi/water-boiler-tea-mug.jpg"
    alt="Tea made with Ryobi-boiled water" >}}

### Conclusion

This setup works great. The larger packs should be able to boil 1-2L of water
without depleting their charge and then continue to have energy left for
low-power tools like a flashlight. Overall, this mission was a success.

Never fear about wasted water. I made plenty of tea for everyone with this setup.
