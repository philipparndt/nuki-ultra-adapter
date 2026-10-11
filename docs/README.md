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

## Keso 8000 Adapter

- Status: `Prototype in use`, final version `ordered`
- OpenSCAD: [../keso-gear-adapter.scad](keso-gear-adapter.scad)
- STL: [../keso-gear-adapter.stl](keso-gear-adapter.stl)

![Keso Adapter 1](./img/keso-gear-adapter.png)
![Keso Adapter 1](./img/keso-gear-adapter-2.png)

## Abus Adapter

You have to add `2.5mm` extra space to the Base Plate for the Asus adapter.

**Currently in development / Untested**

- OpenSCAD: [../abus-gear-adapter.scad](keso-gear-adapter.scad)
- STL: [../abus-gear-adapter.stl](keso-gear-adapter.stl)

![Abus Adapter 1](./img/abus-gear-adapter.png)
![Abus Adapter 1](./img/abus-gear-adapter-2.png)

## Mul-T-Lock / Israeli Knob Cylinder Adapter

For doors where the Nuki Universal Cylinder that ships with the Ultra doesn't fit, e.g. Israeli doors that
need a geared Mul-T-Lock style cylinder. The adapter replaces the yellow Nuki gear and sits on the existing
cylinder's knob shaft, held by the knob's own set screw. Mount the Nuki with Nuki's
`Mounting plate A Europrofile Smart Lock Pro` instead of the base plate above.

- Status: `In use`
- Guide: [MTL.md](MTL.md)
- OpenSCAD: [../mtl-gear-adapter.scad](../mtl-gear-adapter.scad)
- STL (FDM): [../mtl-gear-adapter-fdm.stl](../mtl-gear-adapter-fdm.stl)
- STL (SLA / SLS / MJF): [../mtl-gear-adapter.stl](../mtl-gear-adapter.stl)

![MTL Adapter](./img/mtl-gear-adapter.png)

## Development

[DEVELOPMENT](DEVELOPMENT.md)
