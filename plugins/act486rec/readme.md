
act486rec will record a session for use with act486auto

kepresses will be output to stdout so you can transfer them into a lua script
for a system or software

this uses the keyboard_poller, you should expect to have to clean the results up
if you want to optimise automation.

if you need to change disks this will _currently_ track the ui keypresses as well
a good option here is to use the ui_modekey press event as a beginning and end
that you will eventually replace with `attach_` events in the final script

you can capture the stdout script by piping it to `tee` if required
