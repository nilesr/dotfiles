#!/usr/bin/env python3
import subprocess, queue, threading, random, select, os, time, glob
wide = "file:///home/niles/Documents/mirror.jpg"
widebase = "/home/niles/Pictures/dnd-Backgrounds/wide"
base = "/home/niles/Pictures/dnd-Backgrounds"
#morning_base = "/home/niles/Pictures/Morning"
morning_base = base
depth = 3
fifo = "/tmp/wallpaper"
time_between_changes = 300 # seconds

q = queue.Queue()
os.chdir("/tmp")

def setpic(pic):
    #for monitor in ["HDMI1", "eDP1", "DP1"]:
    for monitor in range(0,3):
        for workspace in range(0, 3):
            try:
                print(subprocess.check_output(["env", "DISPLAY=:0", "xfconf-query", "-c", "xfce4-desktop", "-p", "/backdrop/screen0/monitor" + str(monitor) + "/workspace" + str(workspace) + "/last-image", "-s", pic]))
            except:
                pass
    """
    if not multi_monitor:
        subprocess.call(["env", "DISPLAY=:0", "GSETTINGS_BACKEND=dconf", "gsettings", "set", "org.gnome.desktop.background", "picture-options", "scaled"])
        subprocess.call(["env", "DISPLAY=:0", "GSETTINGS_BACKEND=dconf", "gsettings", "set", "org.gnome.desktop.background", "picture-uri", getpic()])
    else:
        subprocess.call(["env", "DISPLAY=:0", "GSETTINGS_BACKEND=dconf", "gsettings", "set", "org.gnome.desktop.background", "picture-options", "spanned"])
        subprocess.call(["env", "DISPLAY=:0", "GSETTINGS_BACKEND=dconf", "gsettings", "set", "org.gnome.desktop.background", "picture-uri", wide])
    """

def check():
    num_monitors = 0
    f = subprocess.check_output(["xrandr", "-q"]).decode("utf-8")
    types = glob.glob("/home/niles/.initial/configurations/*")
    for type in types:
        s = open(type, "r").read().split("\n")
        script = s[0]
        for initial in s[1:]:
            if initial == "":
                continue
            if f == open("/home/niles/.initial/initials/"+initial, "r").read():
                subprocess.call(["/home/niles/.initial/bin/" + script])
    for g in f.split("\n")[:-1]:
        if " connected" in g: # Need leading space because other monitors are listed as "disconnected"
            num_monitors += 1
    return num_monitors


def getpic(passed_base = False):
    if not passed_base:
        if time.localtime().tm_hour >= 6:
            current_base = base
        else:
            current_base = morning_base
    else:
        current_base = passed_base
    subprocess.call(["touch","-d", "-3 days", "/tmp/.wp-show"])
    choices = subprocess.check_output(["find", current_base, "-maxdepth", str(depth), "-type", "f", "-iregex", '.*\.\(jpg\|jpeg\|gif\|png\|bmp\)$', '-newer', '/tmp/.wp-show']).decode("utf-8").split("\n")[:-1]
    if len(choices) == 0:
        choices = subprocess.check_output(["find", current_base, "-maxdepth", str(depth), "-type", "f", "-iregex", '.*\.\(jpg\|jpeg\|gif\|png\|bmp\)$']).decode("utf-8").split("\n")[:-1]
    return random.choice(choices)

def l1function(q):
    # stdbuf -i0 -o0 udevadm monitor -k --env|grep --line-buffered -i HOTPLUG|while read -r line
    p = subprocess.Popen(["stdbuf", "-i0", "-o0", "udevadm", "monitor", "-k", "--env"], stdout=subprocess.PIPE)
    while True:
        rlist, wlist, xlist = select.select([p.stdout], [], [])
        s = os.read(p.stdout.fileno(), 1024)
        if "HOTPLUG" in s.decode("utf-8"):
            q.put(["hotplug event"])

listener1 = threading.Thread(target=l1function, args=(q,))
listener1.setDaemon(True)
listener1.start()


def l2function(q):
    subprocess.call(["rm", fifo])
    subprocess.call(["mkfifo", fifo])
    p = subprocess.Popen(["tail", "-F", fifo], stdout=subprocess.PIPE)
    while True:
        select.select([p.stdout], [], []) # sleeps until tail outputs something, I think
        s = os.read(p.stdout.fileno(), 2048)
        path = False
        if os.path.isfile(s.strip()):
            path = s.strip()
        q.put(["next wallpaper", path])


listener2 = threading.Thread(target=l2function, args=(q,))
listener2.setDaemon(True)
listener2.start()

x=0
multi_monitor = check() != 1
currentpic = False
while True:
    while not q.empty():
        pulled_value = q.get()
        if pulled_value[0] == "hotplug event":
            time.sleep(3)
            multi_monitor = not check() == 1
        elif pulled_value[0] == "next wallpaper":
            if pulled_value[1] == False:
                x = time_between_changes
            else:
                x = 0
                setpic(pulled_value[1])
        else:
            print("Unrecognized queue event")
    x += 1
    if x >= time_between_changes:
        if not multi_monitor or True: # the or True is temporary
            #setpic(getpic())
            newpic = getpic()
            k = 0
            while newpic == currentpic and k < 20:
                k += 1 # to prevent infinite loops if there is only one possible picture
                newpic = getpic()
            currentpic = newpic
            setpic(newpic)
        else:
            subprocess.call(["python3", '/home/niles/Documents/projects/Python/wide/wide.py', getpic(widebase), "middle"])
        x = 0
    time.sleep(1)
