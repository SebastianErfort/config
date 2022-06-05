#!/bin/bash
function task1() {
    echo "Running task1..."
    sleep 5
    echo "Done task1"
}
function task2() {
    echo "Running task2..."
    sleep 2
    echo "Done task2"
}
task1 &
task2 &
wait
echo "All done!"
