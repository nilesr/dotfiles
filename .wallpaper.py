import subprocess, queue, threading, random, select, os, time
wide = "file:///home/niles/Documents/mirror.jpg"
base = "/home/niles/Pictures/dnd-Backgrounds"
morning_base = "/home/niles/Pictures/Morning"
depth = 3
fifo = "/tmp/wallpaper"

q = queue.Queue()

def check():
    num_monitors = 0
    f = subprocess.check_output(["xrandr", "-q"]).decode("utf-8").split("\n")[:-1]
    for g in f:
        if " connected" in g:
            num_monitors += 1
    return num_monitors

multi_monitor = check() != 1

def getpic():
    if time.localtime().tm_hour > 6:
        current_base = base
    else:
        current_base = morning_base
    return "file://" + random.choice(subprocess.check_output(["find", current_base, "-maxdepth", str(depth), "-type", "f", "-iregex", '.*\(jpg\|jpeg\|gif\|png\|bmp\)$']).decode("utf-8").split("\n")[:-1])

def l1function(q):
    # stdbuf -i0 -o0 udevadm monitor -k --env|grep --line-buffered -i HOTPLUG|while read -r line
    p = subprocess.Popen(["stdbuf", "-i0", "-o0", "udevadm", "monitor", "-k", "--env"], stdout=subprocess.PIPE)
    while True:
        rlist, wlist, xlist = select.select([p.stdout], [], [])
        s = os.read(p.stdout.fileno(), 1024)
        if "HOTPLUG" in s.decode("utf-8"):
            q.put("hotplug event")

listener1 = threading.Thread(target=l1function, args=(q,))
listener1.setDaemon(True)
listener1.start()


def l2function(q):
    subprocess.call(["rm", fifo])
    subprocess.call(["mkfifo", fifo])
    p = subprocess.Popen(["tail", "-f", fifo], stdout=subprocess.PIPE)
    while True:
        rlist, wlist, xlist = select.select([p.stdout], [], [])
        s = os.read(p.stdout.fileno(), 2024)
        q.put("next wallpaper")

listener2 = threading.Thread(target=l2function, args=(q,))
listener2.setDaemon(True)
listener2.start()

x=0
while True:
    while not q.empty():
        pulled_value = q.get()
        if pulled_value == "hotplug event":
            time.sleep(5)
            if check() != 1:
                multi_monitor = True
            else:
                multi_monitor = False
        elif pulled_value == "next wallpaper":
            x = 61
        else:
            print("Unrecognized queue event")
    x += 1
    if x >= 60:
        if not multi_monitor:
            subprocess.call(["env", "DISPLAY=:0", "GSETTINGS_BACKEND=dconf", "gsettings", "set", "org.gnome.desktop.background", "picture-options", "scaled"])
            subprocess.call(["env", "DISPLAY=:0", "GSETTINGS_BACKEND=dconf", "gsettings", "set", "org.gnome.desktop.background", "picture-uri", getpic()])
        else:
            subprocess.call(["env", "DISPLAY=:0", "GSETTINGS_BACKEND=dconf", "gsettings", "set", "org.gnome.desktop.background", "picture-options", "spanned"])
            subprocess.call(["env", "DISPLAY=:0", "GSETTINGS_BACKEND=dconf", "gsettings", "set", "org.gnome.desktop.background", "picture-uri", wide])
        x = 0
    time.sleep(1)
