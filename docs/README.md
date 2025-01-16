# nuki-ultra-adapter

The goal of this project is to create adapters for the smart lock ultra.

I use a `Keso 8000` Lock, that I like to use with the Nuki Ultra.

Use the models at your own risk. I am not responsible for any damage or harm caused by using the models.

## Prototype

### Base Plate

with `nukiSize=true` you will get a long version, that covers only space for the Nuki lock.
This will also be a little bigger, to perfectly match the Nuki lock.

![base-plate-small-variant](./img/base-plate-nuki-size.png)

with `nukiSize=false` you will get a long version, that covers the Base Plate of a classic lock, as well as the 
extra space for the Nuki lock.  

![base back](./img/base-back.png)
![base front](./img/base-front.png)

Printed with `JLC Black Resin`

#### Settings

##### Lock distance

To print your own Base Plate, you need to measure and update the `LockDistance` variable in [base-plate.scad](../base-plate.scad)

![LockDistance](./img/lock-distance.png)

##### Guides

Guides can be enabled using `guides=true;`. I have not tested this yet.

##### Cheaper Print

Set `cheaperPrint=true;` to remove some material. I have not tested this yet.

### Keso Adapter
![Keso Adapter 1](./img/keso-gear-adapter.png)
![Keso Adapter 1](./img/keso-gear-adapter-2.png)

## Nuki Ultra Parts

### Gear

- 32 Tooth

![Gear 1](./img/nuki-gear-1.png)
![Gear 2](./img/nuki-gear-2.png)
![Gear 2](./img/nuki-gear-3.png)


#### Self-made Gear

This is a test image to see if the shape of the self-made gear fits the original gear.
It is almost perfect.

![gear-test](./img/gear-test.png)

Printed with `LEDO 6060 Resin`

## Keso 8000 Adapter

- Status: `Prototype in use`, final version `ordered`
- OpenSCAD: [../keso-gear-adapter.scad](keso-gear-adapter.scad)
- STL: [../keso-gear-adapter.stl](keso-gear-adapter.stl)
