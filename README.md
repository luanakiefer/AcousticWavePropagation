<br />
<p align="center">
  <a href="https://github.com/luanakiefer/AcousticWavePropagation">
    <img src="" alt="Logo" width="150" height="150">
  </a>

  <h3 align="center">Acoustic Wave Propagation</h3>

  <p align="center">
    Short description
    <br />
    <a href="https://github.com/luanakiefer/AcousticWavePropagation/issues">Report Bug</a>
    ·
    <a href="https://github.com/luanakiefer/AcousticWavePropagation/issues">Request Feature</a>
  </p>
</p>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li>
        <a href="#usage">Usage</a>
        <ul>
            <li><a href="#topic">Topic</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>

## About The Project

Summary

### Built With

* [MATLAB](https://matlab.mathworks.com)
* [FORTRAN](https://fortran-lang.org)

## Getting Started

Environment description

### Prerequistes

Install dependencies

```sh
```

## Usage

Clone this repository and create data and figures directories on root.

```sh
git clone https://github.com/luanakiefer/AcousticWavePropagation
cd AcousticWavePropagation

mkdir data
mkdir figures
```

At **downloadHycom.sh** define the date and the section of the measurement

```sh
# downloadHycom.sh

...

yyyy="YEAR"
mm="MONTH"
dd="DAY"

north="NORTHERNMOST LATITUDE"
south="SOUTHERNMOST LATITUDE"
east="EASTERNMOST LONGITUDE"
west="WESTNMOST LONGITUDE"

...
```

Guarantee that the choosen date matches the filename defined at **main.m**

```m
% main.m

clear all
close all
clc

fileName = "./data/hycom_YYYYMMDD.nc";

...
```

Add **m_map** package to MATLAB path

```m
% At MATLAB terminal

addpath("./m_map")
```

### Topics

Subroutine explanation

## Roadmap

See the [open issues](https://github.com/luanakiefer/AcousticWavePropagation/issues) for a list of proposed features (and known issues).

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Apply elixir's standart format (`mix format`)
4. Check your code quality (`mix credo`)
5. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
6. Push to the Branch (`git push origin feature/AmazingFeature`)
7. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Contact information

Project Link: [Acoustic Wave Propagation](https://github.com/luanakiefer/AcousticWavePropagation)

## Acknowledgements
* Mention 1
* Mention 2
