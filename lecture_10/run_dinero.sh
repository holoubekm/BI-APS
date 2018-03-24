#! /bin/sh
export DINERO_PATH="/home/holoubekm/Skola/BI-APS/lecture_10/d4-7"
export CWD=`pwd`
echo Simulation started at `date`

echo Running CC1 traces
$DINERO_PATH/dineroIV -l1-usize 32k -l1-ubsize 128 -l1-uassoc 1 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_32_1.rpt
$DINERO_PATH/dineroIV -l1-usize 32k -l1-ubsize 128 -l1-uassoc 2 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_32_2.rpt
$DINERO_PATH/dineroIV -l1-usize 32k -l1-ubsize 128 -l1-uassoc 4 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_32_4.rpt
$DINERO_PATH/dineroIV -l1-usize 32k -l1-ubsize 128 -l1-uassoc 8 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_32_8.rpt
$DINERO_PATH/dineroIV -l1-usize 32k -l1-ubsize 128 -l1-uassoc 256 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_32_256.rpt

$DINERO_PATH/dineroIV -l1-usize 64k -l1-ubsize 128 -l1-uassoc 1 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_64_1.rpt
$DINERO_PATH/dineroIV -l1-usize 64k -l1-ubsize 128 -l1-uassoc 2 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_64_2.rpt
$DINERO_PATH/dineroIV -l1-usize 64k -l1-ubsize 128 -l1-uassoc 4 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_64_4.rpt
$DINERO_PATH/dineroIV -l1-usize 64k -l1-ubsize 128 -l1-uassoc 8 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_64_8.rpt
$DINERO_PATH/dineroIV -l1-usize 64k -l1-ubsize 128 -l1-uassoc 512 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_64_256.rpt

$DINERO_PATH/dineroIV -l1-usize 128k -l1-ubsize 128 -l1-uassoc 1 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_128_1.rpt
$DINERO_PATH/dineroIV -l1-usize 128k -l1-ubsize 128 -l1-uassoc 2 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_128_2.rpt
$DINERO_PATH/dineroIV -l1-usize 128k -l1-ubsize 128 -l1-uassoc 4 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_128_4.rpt
$DINERO_PATH/dineroIV -l1-usize 128k -l1-ubsize 128 -l1-uassoc 8 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_128_8.rpt
$DINERO_PATH/dineroIV -l1-usize 128k -l1-ubsize 128 -l1-uassoc 1024 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_128_256.rpt

$DINERO_PATH/dineroIV -l1-usize 256k -l1-ubsize 128 -l1-uassoc 1 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_256_1.rpt
$DINERO_PATH/dineroIV -l1-usize 256k -l1-ubsize 128 -l1-uassoc 2 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_256_2.rpt
$DINERO_PATH/dineroIV -l1-usize 256k -l1-ubsize 128 -l1-uassoc 4 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_256_4.rpt
$DINERO_PATH/dineroIV -l1-usize 256k -l1-ubsize 128 -l1-uassoc 8 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_256_8.rpt
$DINERO_PATH/dineroIV -l1-usize 256k -l1-ubsize 128 -l1-uassoc 2048 -l1-uccc -informat d <$DINERO_PATH/traces/cc1.din > cc_256_256.rpt
cd $CWD

echo Simulation finished at `date`
