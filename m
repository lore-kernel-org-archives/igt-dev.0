Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA158112302
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 13:35:19 +0000 (UTC)
Date: Mon, 16 May 2022 15:35:14 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <20220516153514.1db43c59@maurocar-mobl2>
In-Reply-To: <YoJIUSEI0pkzqBku@intel.intel>
References: <20220506114829.2288273-1-mauro.chehab@linux.intel.com>
 <20220506114829.2288273-7-mauro.chehab@linux.intel.com>
 <YoJIUSEI0pkzqBku@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 6/6] lib/igt_kmod: properly handle
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

On Mon, 16 May 2022 14:49:21 +0200
Andi Shyti <andi.shyti@linux.intel.com> wrote:

> Hi Mauro,
> 
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
> no exit...
> 
> > +	}  
> 
> ... and waitchild().
> 
> Like in patch 1 :)

OK!

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
> 
> why do we need the sigterm? I guess here you need to modify
> kill_children so that it kills with a signal. Otherwise this
> SIGTERM is useless.

I guess we can just use kill_children() here, as either SIGKILL or
SIGTERM would do the job. There's no special reason why it would
need SIGTERM. I would prefer to let pw reserve to terminate normally,
but I can't see why SIGKILL won't equally work.

I'll run some tests to be sure.

> 
> >  /**
> >   * __igt_lsof_audio_and_kill_proc() - check if a given process is using an
> >   *	audio device. If so, stop or prevent them to use such devices.
> >   *
> >   * @proc_info: process struct, as returned by readproc()
> >   * @proc_path: path of the process under procfs
> > + * @pipewire_pulse_pid: PID of pipewire-pulse process
> >   *
> >   * No processes can be using an audio device by the time it gets removed.
> >   * This function checks if a process is using an audio device from /dev/snd.
> > @@ -1448,10 +1550,15 @@ static void pulseaudio_unload_module(proc_t *proc_info)
> >   * 	- if the process is pulseaudio, it can't be killed, as systemd will
> >   * 	  respawn it. So, instead, send a request for it to stop bind the
> >   * 	  audio devices.
> > + *	- if the process is pipewire-pulse, it can't be killed, as systemd will
> > + *	  respawn it. So, instead, the caller should call pw-reserve, remove
> > + *	  the kernel driver and then stop pw-reserve. On such case, this
> > + *	  function returns the PID of pipewire-pulse, but won't touch it.
> >   * If the check fails, it means that the process can simply be killed.
> >   */
> >  static int
> > -__igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path)
> > +__igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path,
> > +			       int *pipewire_pulse_pid)  
> 
> Still I think that this is becoming messy. We are carrying this
> pipewire_pulse_pid from function to function with a possible
> value of '0'.

we might store pipewire_pulse_pid on some static var, but I don't like
very much to use static vars. We could also re-check the PID, but storing
it saves us a couple of CPU cycles.

> 
> Anyway, I will not insist on this.
> 
> [...]
> 
> > +void igt_killchildren(int signal)
> > +{
> > +	igt_info("Timed out waiting for children\n");
> > +
> > +	kill_children();
> > +}  
> 
> As I said before, we don't really need for int signal. And I
> think this should in a different patch as this is a change in
> igt_core?

Heh, true. I guess I had a different implementation, that degraded
into this ;-)

I'll clean it up.

Regards,
Mauro
