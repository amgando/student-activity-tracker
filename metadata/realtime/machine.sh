echo "machine: "

echo "  hostname: "     $(hostname)

echo "  uname: "
# -a Behave as though all of the options -mnrsv were specified.
echo "    raw: "        $(uname -a)
# -m print the machine hardware name.
echo "    hardware: "   $(uname -m)
# -n print the nodename (the nodename may be a name that the system is known by to a communications network).
echo "    nodename: "   $(uname -n)
# -p print the machine processor architecture name.
echo "    processor: "  $(uname -p)
echo "    os: "
# -r print the operating system release.
echo "      release: "  $(uname -r)
# -s print the operating system name.
echo "      name: "    $(uname -s)
# -v print the operating system version.
echo "      version: " $(uname -v)
