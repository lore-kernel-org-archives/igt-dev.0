Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D0B10E82F
 for <igt-dev@lists.freedesktop.org>; Thu,  5 May 2022 15:58:30 +0000 (UTC)
Date: Thu, 5 May 2022 17:54:09 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <YnPzIYa/TRpBMoqZ@intel.intel>
References: <20220504095904.2145592-1-mauro.chehab@linux.intel.com>
 <20220504095904.2145592-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504095904.2145592-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/6] tests/core_hotunplug: properly
 finish processes using audio devices
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

[...]

> +static void pulseaudio_unload_module(proc_t *proc_info)
> +{
> +	char xdg_dir[PATH_MAX];
> +	const char *homedir;
> +	struct passwd *pw;
> +
> +	igt_fork(child, 1) {
> +		pw = getpwuid(proc_info->euid);
> +		homedir = pw->pw_dir;
> +		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", proc_info->euid);
> +
> +		igt_info("Ask pulseaudio to stop using audio device\n");
> +
> +		setgid(proc_info->egid);
> +		setuid(proc_info->euid);
> +		clearenv();
> +		setenv("HOME", homedir, 1);
> +		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
> +
> +		exit(system("for i in $(pacmd list-sources|grep module:|cut -d : -f 2); do pactl unload-module $i; done"));

you shouldn't need for the exit()

> +	}

do we need for igt_waitchildren() at the end?

> +}
> +
> +static int
> +__igt_lsof_kill_proc(proc_t *proc_info, char *proc_path)
> +{
> +	const char *audio_dev = "/dev/snd/";
> +	char path[PATH_MAX * 2];
> +	struct dirent *d;
> +	struct stat st;
> +	char *fd_lnk;
> +	int fail = 0;
> +	ssize_t read;

nitpick: shall we move some of the variables above inside the
while loop?

> +	DIR *dp = opendir(proc_path);
> +	igt_assert(dp);
> +
> +	while ((d = readdir(dp))) {
> +		if (*d->d_name == '.')
> +			continue;

do we need to consider ".." as well? "by-path"?

> +		memset(path, 0, sizeof(path));
> +		snprintf(path, sizeof(path), "%s/%s", proc_path, d->d_name);
> +
> +		if (lstat(path, &st) == -1)
> +			continue;

should this be treated as an unlikely error?

> +		fd_lnk = malloc(st.st_size + 1);
> +
> +		igt_assert((read = readlink(path, fd_lnk, st.st_size + 1)));
> +		fd_lnk[read] = '\0';

are we sure that in /dev/snd we have only links? In my PC I have
only character interfaces.

> +		if (strncmp(audio_dev, fd_lnk, strlen(audio_dev))) {
> +			free(fd_lnk);
> +			continue;
> +		}
> +
> +		free(fd_lnk);
> +
> +		/*
> +		 * In order to avoid racing against pa/systemd, ensure that
> +		 * pulseaudio will close all audio files. This should be
> +		 * enough to unbind audio modules and won't case race issues

/case/cause/

> +		 * with systemd trying to reload it.
> +		 */
> +		if (!strcmp(proc_info->cmd, "pulseaudio")) {
> +			pulseaudio_unload_module(proc_info);
> +			break;
> +		}
> +
> +		/*
> +		 * FIXME: terminating pipewire-pulse is not that easy, as
> +		 * pipewire there's no standard way up to pipewire version
> +		 * 0.3.49. Just trying to kill pipewire will start a race
> +		 * between IGT and systemd. If IGT wins, the audio driver
> +		 * will be unloaded before systemd tries to reload it, but
> +		 * if systemd wins, the audio device will be re-opened and
> +		 * used before IGT has a chance to remove the audio driver.
> +		 * Pipewire version 0.3.50 should bring a standard way:
> +		 *
> +		 * 1) start a thread running:
> +		 *	 pw-reserve -n Audio0 -r
> +		 * 2) unload/unbind the the audio driver(s);
> +		 * 3) stop the pw-reserve thread.
> +		 *
> +		 * We should add support for it once distros start shipping it.
> +		 */

thanks for the explanation!

> +		/* For all other processes, just kill them */
> +		igt_info("process %d (%s) is using audio device. Should be terminated.\n",
> +				proc_info->tid, proc_info->cmd);
> +
> +		if (kill(proc_info->tid, SIGTERM) < 0) {
> +			igt_info("Fail to terminate %s (pid: %d) with SIGTERM\n",
> +				proc_info->cmd, proc_info->tid);
> +			if (kill(proc_info->tid, SIGABRT) < 0) {
> +				fail++;
> +				igt_info("Fail to terminate %s (pid: %d) with SIGABRT\n",
> +					proc_info->cmd, proc_info->tid);
> +			}
> +		}
> +
> +		break;
> +	}
> +
> +	closedir(dp);
> +	return fail;
> +}
> +
> +/*
> + * This function identifies each process running on the machine that is
> + * opening an audio device and tries to stop it.
> + *
> + * Special care should be taken with pipewire and pipewire-pulse, as those
> + * daemons are respanned if they got killed.
> + */
> +int
> +igt_lsof_kill_audio_processes(void)
> +{
> +	char path[PATH_MAX];
> +	proc_t *proc_info;
> +	PROCTAB *proc;
> +	int fail = 0;
> +
> +	proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);

you could eventually make an igt_openproc() with the assert as
this is a pattern that it's repeated several times. Up to you.

> +	igt_assert(proc != NULL);
> +
> +	while ((proc_info = readproc(proc, NULL))) {
> +		if (snprintf(path, sizeof(path), "/proc/%d/fd", proc_info->tid) < 1) {
> +			fail++;

we are counting failures but using it more as a boolean. Is there
any use of fail?

> +		} else {
> +			fail += __igt_lsof_kill_proc(proc_info, path);
> +		}

brackets not needed here

> +		freeproc(proc_info);
> +	}
> +	closeproc(proc);
> +
> +	return fail;
> +}
> +
>  static struct igt_siglatency {
>  	timer_t timer;
>  	struct timespec target;
> diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> index 9f2588aeca90..bb96d1afb777 100644
> --- a/lib/igt_aux.h
> +++ b/lib/igt_aux.h
> @@ -306,6 +306,7 @@ bool igt_allow_unlimited_files(void);
>  int igt_is_process_running(const char *comm);
>  int igt_terminate_process(int sig, const char *comm);
>  void igt_lsof(const char *dpath);
> +int igt_lsof_kill_audio_processes(void);
>  
>  #define igt_hweight(x) \
>  	__builtin_choose_expr(sizeof(x) == 8, \
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index f252535d5a3a..87a59245f699 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -389,7 +389,7 @@ igt_i915_driver_load(const char *opts)
>  	return 0;
>  }
>  
> -int __igt_i915_driver_unload(const char **who)
> +int igt_audio_driver_unload(const char **who)
>  {
>  	int ret;
>  	const char *sound[] = {
> @@ -398,6 +398,27 @@ int __igt_i915_driver_unload(const char **who)
>  		NULL,
>  	};
>  
> +	for (const char **m = sound; *m; m++) {
> +		if (igt_kmod_is_loaded(*m)) {

little insignificant nit: with

	if (!igt_kmod_is_loaded(*m))
		continue;

you save one level of indentation.

> +			if (igt_lsof_kill_audio_processes())
> +				return 1;

mmhhh... I don't like the return 1 because makes this function a
hybrid boolean/error function and we can't rely anyomore on the
return value. Please identify a proper errno to return.

> +
> +			kick_snd_hda_intel();
> +			ret = igt_kmod_unload(*m, 0);
> +			if (ret) {
> +				if (who)
> +					*who = *m;
> +				return ret;
> +			}
> +		}
> +	}
> +	return 0;
> +}

[...]

> @@ -152,19 +152,14 @@ static void driver_unbind(struct hotunplug *priv, const char *prefix,
>  	 * safest and easiest way out.
>  	 */
>  	if (priv->snd_unload) {
> -		igt_terminate_process(SIGTERM, "alsactl");
> -
> -		/* unbind snd_hda_intel */
> -		kick_snd_hda_intel();
> -
> -		if (igt_kmod_unload("snd_hda_intel", 0)) {
> +		if (igt_audio_driver_unload(NULL)) {

why give NULL insteadd of a proper string? We can provide a
better log.

>  			priv->snd_unload = false;
> -			igt_warn("Could not unload snd_hda_intel\n");
> +			igt_warn("Could not unload audio driver\n");
>  			igt_kmod_list_loaded();
>  			igt_lsof("/dev/snd");
>  			igt_skip("Audio is in use, skipping\n");
>  		} else {
> -			igt_info("Preventively unloaded snd_hda_intel\n");
> +			igt_info("Preventively unloaded audio driver\n");
>  		}
>  	}

Andi
