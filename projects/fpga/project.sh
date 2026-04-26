#!/bin/bash
printf "##################################################################\n"
printf "##  FPGA Project Environment Setup\n"
printf "##################################################################\n"
function fPrepare()
{
    printf "##################################################################\n"
    printf "## Prepare Setup\n"
    printf "##################################################################\n"
}
function fFinalize()
{
    printf "##################################################################\n"
    printf "## Finalize Setup\n"
    printf "##################################################################\n"
}
function fLinux()
{
    printf "##################################################################\n"
    printf "## LINUX Setup\n"
    printf "##################################################################\n"
    apt-get install -y git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison
}
function fFpga()
{
    printf "##################################################################\n"
    printf "## FPGA Setup\n"
    printf "##################################################################\n"
    # nextpnr-git

    # for usb connect
    apt install -y libhidapi-dev libusb-1.0-0-dev

    # For fpga dev
    apt install -y fpga-icestorm yosys iverilog gcc-riscv64-unknown-elf arachne-pnr
    apt install -y nextpnr-generic nextpnr-ice40-qt
}
function fHelp()
{
    printf "FPGA Project Env\n"
    printf "[Options]\n"
    printf "    %s\t %s\n" "-h|--help"  "print help info, for docker help, do docker run --help"
    return 0
}
function fMain()
{
    echo "FPGA setup"
    while [[ ${#} > 0 ]]
    do
        case ${1} in
            -h|--help)
                fHelp
                exit 0
                ;;
            *)
                echo "Unknown Args"
                fHelp
                exit 1
                ;;
        esac
        shift 1
    done

    fPrepare
    fLinux
    fFpga
    fFinalize
}
fMain $@