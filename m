Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC8011201F
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 06:32:11 +0000 (UTC)
Date: Fri, 6 May 2022 08:32:05 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <20220506083205.79cb6fcd@maurocar-mobl2>
In-Reply-To: <YnQVC3sDSt75xG7m@intel.intel>
References: <20220504095904.2145592-1-mauro.chehab@linux.intel.com>
 <20220504095904.2145592-7-mauro.chehab@linux.intel.com>
 <YnQVC3sDSt75xG7m@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 6/6] lib/igt_kmod: properly handle
 pipewire-pulse
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Petri Latvala <petri.latvala@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 5 May 2022 20:18:51 +0200
Andi Shyti <andi.shyti@linux.intel.com> wrote:

> Hi Mauro,
> 
> > Newer distributions like Fedora and openSUSE thumbweed are now
> > coming with pipewire-pulse instead of pulseaudio - either as
> > default or as an optional audio stack.
> > 
> > That adds a new requirement when unloading sound drivers,
> > which, in turn, is needed when the DRM driver is bound into
> > it.
> > 
> > Add the needed logic to work properly in case pipewire-pulse
> > is detected.  
> 
> stubborn processes that don't want to do what the user tells them
> to do :)

heh, yes!

> 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  lib/igt_aux.c  | 122 +++++++++++++++++++++++++++++++++++++++++++++----
> >  lib/igt_aux.h  |   4 +-
> >  lib/igt_core.c |   7 +++
> >  lib/igt_core.h |   1 +
> >  lib/igt_kmod.c |  17 ++++++-
> >  5 files changed, 140 insertions(+), 11 deletions(-)
> > 
> > diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> > index 15fe87839567..a0da1d042ab4 100644
> > --- a/lib/igt_aux.c
> > +++ b/lib/igt_aux.c
> > @@ -1434,8 +1434,109 @@ static void pulseaudio_unload_module(proc_t *proc_info)
> >  	}
> >  }
> >  
> > +static void pipewire_reserve_wait(int pipewire_pulse_pid)
> > +{
> > +	char xdg_dir[PATH_MAX];
> > +	const char *homedir;
> > +	struct passwd *pw;
> > +	proc_t *proc_info;
> > +	PROCTAB *proc;
> > +
> > +	igt_fork(child, 1) {
> > +		igt_info("Preventing pipewire-pulse to use the audio drivers\n");
> > +
> > +		proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
> > +		igt_assert(proc != NULL);
> > +
> > +		while ((proc_info = readproc(proc, NULL))) {
> > +			if (pipewire_pulse_pid == proc_info->tid)
> > +				break;
> > +			freeproc(proc_info);
> > +		}
> > +		closeproc(proc);
> > +
> > +		/* Sanity check: if it can't find the process, it means it has gone */
> > +		if (pipewire_pulse_pid != proc_info->tid)
> > +			exit(0);
> > +
> > +		pw = getpwuid(proc_info->euid);
> > +		homedir = pw->pw_dir;
> > +		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", proc_info->euid);
> > +		setgid(proc_info->egid);
> > +		setuid(proc_info->euid);
> > +		clearenv();
> > +		setenv("HOME", homedir, 1);
> > +		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
> > +		freeproc(proc_info);
> > +
> > +		exit(system("pw-reserve -n Audio0 -r"));  
> 
> no need for exit
> 
> > +	}  
> 
> we need waitchild, I guess.

I guess not. Assuming that there's just the *pulse* process running,
this is what happens:

1) for pulseaudio:

We need to call some pa-specific processes and wait for their exit.
After the proccess exit, remove the alsa device.

2) for pipewire-pulse:

We need to call pw-reserve, wait for it to send a pipewire-specific
signaling via DBUS and, while pw-reserve is still running, remove
the alsa device, as, at the moment pw-reserve exits, it will send
another message via DBUS that will make pipewire to re-bind at the
audio devices.

So, in this particular case, what the logic is doing is waiting for
the pa-reserve process to appear, then give some time for the DBUS
message to arrive pipewire-pulse.

> 
> > +}
> > +
> > +static int pipewire_pw_reserve_pid = 0;
> > +
> > +/* Maximum time waiting for pw-reserve to start running */
> > +#define PIPEWIRE_RESERVE_MAX_TIME 1000 /* milisseconds */
> > +
> > +int pipewire_pulse_start_reserve(int pipewire_pulse_pid)
> > +{
> > +	bool is_pw_reserve_running = false;
> > +	proc_t *proc_info;
> > +	int attempts = 0;
> > +	PROCTAB *proc;
> > +
> > +	if (!pipewire_pulse_pid)
> > +		return 0;
> > +
> > +	pipewire_reserve_wait(pipewire_pulse_pid);
> > +
> > +	/*
> > +	 * Note: using pw-reserve to stop using audio only works with
> > +	 * pipewire version 0.3.50 or upper.
> > +	 */
> > +	for (attempts = 0; attempts < PIPEWIRE_RESERVE_MAX_TIME; attempts++) {
> > +		usleep(1000);
> > +		proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
> > +		igt_assert(proc != NULL);
> > +
> > +		while ((proc_info = readproc(proc, NULL))) {
> > +			if (!strcmp(proc_info->cmd, "pw-reserve")) {
> > +				is_pw_reserve_running = true;
> > +				pipewire_pw_reserve_pid = proc_info->tid;
> > +				freeproc(proc_info);
> > +				break;
> > +			}
> > +			freeproc(proc_info);
> > +		}
> > +		closeproc(proc);
> > +		if (is_pw_reserve_running)
> > +			break;
> > +	}
> > +	if (!is_pw_reserve_running) {
> > +		igt_warn("Failed to remove audio drivers from pipewire\n");
> > +		return 1;
> > +	}
> > +	/* Let's grant some time for pw_reserve to notify pipewire via D-BUS */
> > +	usleep(50000);
> > +
> > +	/*
> > +	 * pw-reserve is running, and should have stopped using the audio
> > +	 * drivers. We can now remove the driver.
> > +	 */
> > +
> > +	return 0;
> > +}
> > +
> > +void pipewire_pulse_stop_reserve(int pipewire_pulse_pid)
> > +{
> > +	if (!pipewire_pulse_pid)
> > +		return;
> > +
> > +	igt_killchildren(SIGTERM);
> > +}
> > +
> >  static int
> > -__igt_lsof_kill_proc(proc_t *proc_info, char *proc_path)
> > +__igt_lsof_kill_proc(proc_t *proc_info, char *proc_path, int *pipewire_pulse_pid)  
> 
> here we lose some clarity as in 6 patches these functions are
> slightly changing their meaning.
> 
> __igt_lsof_kill_proc() by the name is supposed to kill a process
> using a resource. But in the meantime, cunningly, is also telling
> if the process killed is pipewire. But this meaning is intrinsic
> in the parameter.

Yeah, the function name is not precise. it should be something like
__igt_lsof_audio_helper_and_kill_proc().

Perhaps I could add some documentation before it explaining what
this is supposed to do.

Originally, it was designed to kill audio processes and stop pulseaudio
to bind audio devices, but this doesn't work with pipewire-pulse.

As explained earlier, pipewire-pulse requires something similar to
this bash script snippet:

	pw-reserve -n Audio0 -r &
	child_pid=$!
	usleep 100000 		# give some time for the process to start, send a DBUS msg and wait for pipewire-pulse to handle the msg
	rmmod snd_hda_audio
	kill $child_pid

(instead of usleep, we could run lsof on a loop waiting for it to
unbind from /dev/snd, until some timeout, but this would increase
complexity and could still fail, so I opted to just use usleep on
this series, as this should likely be enough for IGT)

> It would be nicer to have a better understanding of the function
> in a first glance. I dare a new person, who doesn't really know
> what's going on, to understand the meaning of the "int
> *pipewire_pulse_pid".
> 
> Perhaps, for the sake of clarity, we can add some extra function
> that tells immediately if the sound user is pipewire or others.

I guess a proper description of the function should be enough.
What do we use on IGT? kerneldoc?

Regards,
Mauro
