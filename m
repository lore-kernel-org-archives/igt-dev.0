Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B68A10E02E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 May 2022 18:18:58 +0000 (UTC)
Date: Thu, 5 May 2022 20:18:51 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <YnQVC3sDSt75xG7m@intel.intel>
References: <20220504095904.2145592-1-mauro.chehab@linux.intel.com>
 <20220504095904.2145592-7-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504095904.2145592-7-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 6/6] lib/igt_kmod: properly handle
 pipewire-pulse
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Ch Sai Gowtham <sai.gowtham.ch@intel.com>, Petri Latvala <petri.latvala@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

> Newer distributions like Fedora and openSUSE thumbweed are now
> coming with pipewire-pulse instead of pulseaudio - either as
> default or as an optional audio stack.
> 
> That adds a new requirement when unloading sound drivers,
> which, in turn, is needed when the DRM driver is bound into
> it.
> 
> Add the needed logic to work properly in case pipewire-pulse
> is detected.

stubborn processes that don't want to do what the user tells them
to do :)

> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  lib/igt_aux.c  | 122 +++++++++++++++++++++++++++++++++++++++++++++----
>  lib/igt_aux.h  |   4 +-
>  lib/igt_core.c |   7 +++
>  lib/igt_core.h |   1 +
>  lib/igt_kmod.c |  17 ++++++-
>  5 files changed, 140 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 15fe87839567..a0da1d042ab4 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -1434,8 +1434,109 @@ static void pulseaudio_unload_module(proc_t *proc_info)
>  	}
>  }
>  
> +static void pipewire_reserve_wait(int pipewire_pulse_pid)
> +{
> +	char xdg_dir[PATH_MAX];
> +	const char *homedir;
> +	struct passwd *pw;
> +	proc_t *proc_info;
> +	PROCTAB *proc;
> +
> +	igt_fork(child, 1) {
> +		igt_info("Preventing pipewire-pulse to use the audio drivers\n");
> +
> +		proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
> +		igt_assert(proc != NULL);
> +
> +		while ((proc_info = readproc(proc, NULL))) {
> +			if (pipewire_pulse_pid == proc_info->tid)
> +				break;
> +			freeproc(proc_info);
> +		}
> +		closeproc(proc);
> +
> +		/* Sanity check: if it can't find the process, it means it has gone */
> +		if (pipewire_pulse_pid != proc_info->tid)
> +			exit(0);
> +
> +		pw = getpwuid(proc_info->euid);
> +		homedir = pw->pw_dir;
> +		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", proc_info->euid);
> +		setgid(proc_info->egid);
> +		setuid(proc_info->euid);
> +		clearenv();
> +		setenv("HOME", homedir, 1);
> +		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
> +		freeproc(proc_info);
> +
> +		exit(system("pw-reserve -n Audio0 -r"));

no need for exit

> +	}

we need waitchild, I guess.

> +}
> +
> +static int pipewire_pw_reserve_pid = 0;
> +
> +/* Maximum time waiting for pw-reserve to start running */
> +#define PIPEWIRE_RESERVE_MAX_TIME 1000 /* milisseconds */
> +
> +int pipewire_pulse_start_reserve(int pipewire_pulse_pid)
> +{
> +	bool is_pw_reserve_running = false;
> +	proc_t *proc_info;
> +	int attempts = 0;
> +	PROCTAB *proc;
> +
> +	if (!pipewire_pulse_pid)
> +		return 0;
> +
> +	pipewire_reserve_wait(pipewire_pulse_pid);
> +
> +	/*
> +	 * Note: using pw-reserve to stop using audio only works with
> +	 * pipewire version 0.3.50 or upper.
> +	 */
> +	for (attempts = 0; attempts < PIPEWIRE_RESERVE_MAX_TIME; attempts++) {
> +		usleep(1000);
> +		proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
> +		igt_assert(proc != NULL);
> +
> +		while ((proc_info = readproc(proc, NULL))) {
> +			if (!strcmp(proc_info->cmd, "pw-reserve")) {
> +				is_pw_reserve_running = true;
> +				pipewire_pw_reserve_pid = proc_info->tid;
> +				freeproc(proc_info);
> +				break;
> +			}
> +			freeproc(proc_info);
> +		}
> +		closeproc(proc);
> +		if (is_pw_reserve_running)
> +			break;
> +	}
> +	if (!is_pw_reserve_running) {
> +		igt_warn("Failed to remove audio drivers from pipewire\n");
> +		return 1;
> +	}
> +	/* Let's grant some time for pw_reserve to notify pipewire via D-BUS */
> +	usleep(50000);
> +
> +	/*
> +	 * pw-reserve is running, and should have stopped using the audio
> +	 * drivers. We can now remove the driver.
> +	 */
> +
> +	return 0;
> +}
> +
> +void pipewire_pulse_stop_reserve(int pipewire_pulse_pid)
> +{
> +	if (!pipewire_pulse_pid)
> +		return;
> +
> +	igt_killchildren(SIGTERM);
> +}
> +
>  static int
> -__igt_lsof_kill_proc(proc_t *proc_info, char *proc_path)
> +__igt_lsof_kill_proc(proc_t *proc_info, char *proc_path, int *pipewire_pulse_pid)

here we lose some clarity as in 6 patches these functions are
slightly changing their meaning.

__igt_lsof_kill_proc() by the name is supposed to kill a process
using a resource. But in the meantime, cunningly, is also telling
if the process killed is pipewire. But this meaning is intrinsic
in the parameter.

It would be nicer to have a better understanding of the function
in a first glance. I dare a new person, who doesn't really know
what's going on, to understand the meaning of the "int
*pipewire_pulse_pid".

Perhaps, for the sake of clarity, we can add some extra function
that tells immediately if the sound user is pipewire or others.

[...]

Andi
