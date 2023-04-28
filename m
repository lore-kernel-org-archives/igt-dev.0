Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043F210ECE9
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 11:28:13 +0000 (UTC)
Date: Fri, 28 Apr 2023 13:28:08 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230428132808.38b4c452@maurocar-mobl2>
In-Reply-To: <20230425083554.smv7oaml4g7e7fd5@kamilkon-desk1>
References: <20230424162642.116013-1-kamil.konieczny@linux.intel.com>
 <20230424162642.116013-2-kamil.konieczny@linux.intel.com>
 <20230425083554.smv7oaml4g7e7fd5@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] Use the new procps library libproc2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Craig Small <csmall@dropbear.xyz>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 25 Apr 2023 10:35:54 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi,
> 
> I forgot that there is one place which possibly
> need a rework, see below.
> 
> On 2023-04-24 at 18:26:42 +0200, Kamil Konieczny wrote:
> > From: Craig Small <csmall@dropbear.xyz>
> > 
> > Added support for new libproc2.
> > 
> > [Corrected some errors pointed by checkpatch.pl,
> >  add linux includes in #ifdef __linux__ section,
> >  use #elif HAVE_LIBPROC2 for new libproc2 code - Kamil]
> > Signed-off-by: Craig Small <csmall@dropbear.xyz>
> > ---
> >  lib/igt_aux.c   | 243 ++++++++++++++++++++++++++++++++++++++++--------
> >  lib/meson.build |   7 +-
> >  meson.build     |  10 +-
> >  3 files changed, 218 insertions(+), 42 deletions(-)
> > 
> > diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> > index 672d7d4b0..db6c4da93 100644
> > --- a/lib/igt_aux.c
> > +++ b/lib/igt_aux.c
> > @@ -52,8 +52,19 @@
> >  #include <assert.h>
> >  #include <grp.h>
> >  
> > +
> >  #include <proc/readproc.h>
> > +#elif HAVE_LIBPROC2
> > +#include <libproc2/pids.h>
> > +#endif

As IGT needs either one or the other, I would do, instead:

#ifdef HAVE_LIBPROCPS
#  include <proc/readproc.h>
#else
#  include <libproc2/pids.h>
#endif

Same applies to the other similar checks. 

The rationale is that, if something goes wrong at meson.build setting,
we want build to crash due to the lack of procps-ng.

> > +
> > +#include <dirent.h>
> > +#ifdef __linux__
> >  #include <libudev.h>
> > +#include <linux/limits.h>
> > +#else
> > +#include <limits.h>
> > +#endif

At least part of the changes here seem to be unrelated.

> >  
> >  #include "drmtest.h"
> >  #include "i915_drm.h"
> > @@ -1217,6 +1228,7 @@ void igt_unlock_mem(void)
> >   */
> >  int igt_is_process_running(const char *comm)
> >  {
> > +#if HAVE_LIBPROCPS
> >  	PROCTAB *proc;
> >  	proc_t *proc_info;
> >  	bool found = false;
> > @@ -1235,6 +1247,26 @@ int igt_is_process_running(const char *comm)
> >  
> >  	closeproc(proc);
> >  	return found;
> > +#elif HAVE_LIBPROC2
> > +	enum pids_item Item[] = { PIDS_CMD };
> > +	struct pids_info *info = NULL;
> > +	struct pids_stack *stack;
> > +	char *pid_comm;
> > +	bool found = false;
> > +
> > +	if (procps_pids_new(&info, Item, 1) < 0)
> > +		return false;
> > +	while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
> > +		pid_comm = PIDS_VAL(0, str, stack, info);
> > +		if (!strncasecmp(pid_comm, comm, strlen(pid_comm))) {
> > +			found = true;
> > +			break;
> > +		}
> > +	}
> > +
> > +	procps_pids_unref(&info);
> > +	return found;
> > +#endif
> >  }
> >  
> >  /**
> > @@ -1251,6 +1283,7 @@ int igt_is_process_running(const char *comm)
> >   */
> >  int igt_terminate_process(int sig, const char *comm)
> >  {
> > +#if HAVE_LIBPROCPS
> >  	PROCTAB *proc;
> >  	proc_t *proc_info;
> >  	int err = 0;
> > @@ -1272,6 +1305,28 @@ int igt_terminate_process(int sig, const char *comm)
> >  
> >  	closeproc(proc);
> >  	return err;
> > +#elif HAVE_LIBPROC2
> > +	enum pids_item Items[] = { PIDS_ID_PID, PIDS_CMD };
> > +	struct pids_info *info = NULL;
> > +	struct pids_stack *stack;
> > +	char *pid_comm;
> > +	int pid;
> > +	int err = 0;
> > +
> > +	if (procps_pids_new(&info, Items, 2) < 0)
> > +		return -errno;
> > +	while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
> > +		pid = PIDS_VAL(0, s_int, stack, info);
> > +		pid_comm = PIDS_VAL(1, str, stack, info);
> > +		if (!strncasecmp(pid_comm, comm, strlen(pid_comm))) {
> > +			if (kill(pid, sig) < 0)
> > +				err = -errno;
> > +			break;
> > +		}
> > +	}
> > +	procps_pids_unref(&info);
> > +	return err;
> > +#endif
> >  }
> >  
> >  struct pinfo {
> > @@ -1341,9 +1396,9 @@ igt_show_stat_header(void)
> >  }
> >  
> >  static void
> > -igt_show_stat(proc_t *info, int *state, const char *fn)
> > +igt_show_stat(const pid_t tid, const char *cmd, int *state, const char *fn)
> >  {
> > -	struct pinfo p = { .pid = info->tid, .comm = info->cmd, .fn = fn };
> > +	struct pinfo p = { .pid = tid, .comm = cmd, .fn = fn };
> >  
> >  	if (!*state)
> >  		igt_show_stat_header();
> > @@ -1353,7 +1408,7 @@ igt_show_stat(proc_t *info, int *state, const char *fn)
> >  }
> >  
> >  static void
> > -__igt_lsof_fds(proc_t *proc_info, int *state, char *proc_path, const char *dir)
> > +__igt_lsof_fds(const pid_t tid, const char *cmd, int *state, char *proc_path, const char *dir)
> >  {
> >  	struct dirent *d;
> >  	struct stat st;
> > @@ -1400,7 +1455,7 @@ again:
> >  		dirn = dirname(copy_fd_lnk);
> >  
> >  		if (!strncmp(dir, dirn, strlen(dir)))
> > -			igt_show_stat(proc_info, state, fd_lnk);
> > +			igt_show_stat(tid, cmd, state, fd_lnk);
> >  
> >  		free(copy_fd_lnk);
> >  		free(fd_lnk);
> > @@ -1416,13 +1471,13 @@ again:
> >  static void
> >  __igt_lsof(const char *dir)
> >  {
> > -	PROCTAB *proc;
> > -	proc_t *proc_info;
> > -
> >  	char path[30];
> >  	char *name_lnk;
> >  	struct stat st;
> >  	int state = 0;
> > +#ifdef HAVE_LIBPROCPS
> > +	PROCTAB *proc;
> > +	proc_t *proc_info;
> >  
> >  	proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
> >  	igt_assert(proc != NULL);
> > @@ -1443,19 +1498,56 @@ __igt_lsof(const char *dir)
> >  		name_lnk[read] = '\0';
> >  
> >  		if (!strncmp(dir, name_lnk, strlen(dir)))
> > -			igt_show_stat(proc_info, &state, name_lnk);
> > +			igt_show_stat(proc_info->tid, proc_info->cmd, &state, name_lnk);
> >  
> >  		/* check also fd, seems that lsof(8) doesn't look here */
> >  		memset(path, 0, sizeof(path));
> >  		snprintf(path, sizeof(path), "/proc/%d/fd", proc_info->tid);
> >  
> > -		__igt_lsof_fds(proc_info, &state, path, dir);
> > +		__igt_lsof_fds(proc_info->tid, proc_info->cmd, &state, path, dir);
> >  
> >  		free(name_lnk);
> >  		freeproc(proc_info);
> >  	}
> >  
> >  	closeproc(proc);
> > +#elif HAVE_LIBPROC2
> > +	enum pids_item Items[] = { PIDS_ID_PID, PIDS_CMD };
> > +	struct pids_info *info = NULL;
> > +	struct pids_stack *stack;
> > +
> > +	if (procps_pids_new(&info, Items, 2) < 0)
> > +		return;
> > +	while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
> > +		ssize_t read;
> > +		int tid = PIDS_VAL(0, s_int, stack, info);
> > +		char *pid_comm = PIDS_VAL(1, str, stack, info);
> > +
> > +		/* check current working directory */
> > +		memset(path, 0, sizeof(path));
> > +		snprintf(path, sizeof(path), "/proc/%d/cwd", tid);
> > +
> > +		if (stat(path, &st) == -1)
> > +			continue;
> > +
> > +		name_lnk = malloc(st.st_size + 1);
> > +
> > +		igt_assert((read = readlink(path, name_lnk, st.st_size + 1)));
> > +		name_lnk[read] = '\0';
> > +
> > +		if (!strncmp(dir, name_lnk, strlen(dir)))
> > +			igt_show_stat(tid, pid_comm, &state, name_lnk);
> > +
> > +		/* check also fd, seems that lsof(8) doesn't look here */
> > +		memset(path, 0, sizeof(path));
> > +		snprintf(path, sizeof(path), "/proc/%d/fd", tid);
> > +
> > +		__igt_lsof_fds(tid, pid_comm, &state, path, dir);
> > +
> > +		free(name_lnk);
> > +	}
> > +	procps_pids_unref(&info);
> > +#endif
> >  }
> >  
> >  /**
> > @@ -1490,7 +1582,7 @@ igt_lsof(const char *dpath)
> >  	free(sanitized);
> >  }
> >  
> > -static void pulseaudio_unload_module(proc_t *proc_info)
> > +static void pulseaudio_unload_module(const uid_t euid, const gid_t egid)
> >  {
> >  	struct igt_helper_process pa_proc = {};
> >  	char xdg_dir[PATH_MAX];
> > @@ -1498,14 +1590,14 @@ static void pulseaudio_unload_module(proc_t *proc_info)
> >  	struct passwd *pw;
> >  
> >  	igt_fork_helper(&pa_proc) {
> > -		pw = getpwuid(proc_info->euid);
> > +		pw = getpwuid(euid);
> >  		homedir = pw->pw_dir;
> > -		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", proc_info->euid);
> > +		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", euid);
> >  
> >  		igt_info("Request pulseaudio to stop using audio device\n");
> >  
> > -		setgid(proc_info->egid);
> > -		setuid(proc_info->euid);
> > +		setgid(egid);
> > +		setuid(euid);
> >  		clearenv();
> >  		setenv("HOME", homedir, 1);
> >  		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
> > @@ -1524,10 +1616,13 @@ static void pipewire_reserve_wait(void)
> >  	char xdg_dir[PATH_MAX];
> >  	const char *homedir;
> >  	struct passwd *pw;
> > -	proc_t *proc_info;
> > -	PROCTAB *proc;
> > +	int tid = 0, euid, egid;
> >  
> > +#ifdef HAVE_LIBPROCPS
> >  	igt_fork_helper(&pw_reserve_proc) {  
> ------- ^
> See below for libproc2 code.
> 
> > +		proc_t *proc_info;
> > +		PROCTAB *proc;
> > +
> >  		igt_info("Preventing pipewire-pulse to use the audio drivers\n");
> >  
> >  		proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
> > @@ -1540,19 +1635,43 @@ static void pipewire_reserve_wait(void)
> >  		}
> >  		closeproc(proc);
> >  
> > +		tid = proc_info->tid;
> > +		euid = proc_info->euid;
> > +		egid = proc_info->egid;
> > +		freeproc(proc_info);
> > +#elif HAVE_LIBPROC2
> > +	igt_fork(child, 1) {  
> ------- ^
> These are not the same constructs, +cc Petri.

I'm almost sure you need to use igt_fork_helper() here too. There are
some restrictions with igt_fork() that may affect the code to run on
some situations:

        internal_assert(!test_with_subtests || in_subtest,
                        "forking is only allowed in subtests or igt_simple_main\n");
        internal_assert(!test_child,
                        "forking is not allowed from already forked children\n");

Such restrictions don't apply to igt_fork_helper().

> 
> Regards,
> Kamil
> 
> > +		enum pids_item Items[] = { PIDS_ID_PID, PIDS_ID_EUID, PIDS_ID_EGID };
> > +		enum rel_items { EU_PID, EU_EUID, EU_EGID };
> > +		struct pids_info *info = NULL;
> > +		struct pids_stack *stack;
> > +
> > +		igt_info("Preventing pipewire-pulse to use the audio drivers\n");
> > +
> > +		if (procps_pids_new(&info, Items, 3) < 0)
> > +			return;
> > +		while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
> > +			tid = PIDS_VAL(EU_PID, s_int, stack, info);
> > +			if (pipewire_pulse_pid == tid)
> > +				break;
> > +		}
> > +		euid = PIDS_VAL(EU_EUID, s_int, stack, info);
> > +		egid = PIDS_VAL(EU_EGID, s_int, stack, info);
> > +		procps_pids_unref(&info);
> > +#endif

I would try to confine the procps-ng version check to the helper functions,
keeping here a logic that would be generic enough to be used with either
versions, probably using some abstraction, like placing version-specific
structs like:

	#ifdef HAVE_LIBPROCPS
		struct igt_process {
			struct pids_info *info = NULL;
			struct pids_stack *stack;
		};
	#else
		struct igt_process {
			proc_t *proc_info;
			PROCTAB *proc;
		};
	#endif

And adding a helper functions to handle open/close and ID retrieve logic,
e.g. changing the code to something similar to:

	struct igt_process proc;

	...
	igt_info("Preventing pipewire-pulse to use the audio drivers\n");
	open_process(&proc);
	while (get_process_ids(proc, &tid, &euid, &egid)) {
		if (pipewire_pulse_pid == tid)
			break;
	}
	close_proccess(proc);

This would make easier to maintain, as newer versions of procps-ng
may use different implementations too, and the business logic will
be split from the procps API internal details.

> > +
> >  		/* Sanity check: if it can't find the process, it means it has gone */
> > -		if (pipewire_pulse_pid != proc_info->tid)
> > +		if (pipewire_pulse_pid != tid)
> >  			exit(0);
> >  
> > -		pw = getpwuid(proc_info->euid);
> > +		pw = getpwuid(euid);
> >  		homedir = pw->pw_dir;
> > -		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", proc_info->euid);
> > -		setgid(proc_info->egid);
> > -		setuid(proc_info->euid);
> > +		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", euid);
> > +		setgid(egid);
> > +		setuid(euid);
> >  		clearenv();
> >  		setenv("HOME", homedir, 1);
> >  		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
> > -		freeproc(proc_info);
> >  
> >  		/*
> >  		 * pw-reserve will run in background. It will only exit when
> > @@ -1570,9 +1689,7 @@ static void pipewire_reserve_wait(void)
> >  int pipewire_pulse_start_reserve(void)
> >  {
> >  	bool is_pw_reserve_running = false;
> > -	proc_t *proc_info;
> >  	int attempts = 0;
> > -	PROCTAB *proc;
> >  
> >  	if (!pipewire_pulse_pid)
> >  		return 0;
> > @@ -1584,6 +1701,10 @@ int pipewire_pulse_start_reserve(void)
> >  	 * pipewire version 0.3.50 or upper.
> >  	 */
> >  	for (attempts = 0; attempts < PIPEWIRE_RESERVE_MAX_TIME; attempts++) {
> > +#ifdef HAVE_LIBPROCPS
> > +		PROCTAB *proc;
> > +		proc_t *proc_info;
> > +
> >  		usleep(1000);
> >  		proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
> >  		igt_assert(proc != NULL);
> > @@ -1598,6 +1719,24 @@ int pipewire_pulse_start_reserve(void)
> >  			freeproc(proc_info);
> >  		}
> >  		closeproc(proc);
> > +#elif HAVE_LIBPROC2
> > +		enum pids_item Items[] = { PIDS_ID_PID, PIDS_CMD };
> > +		struct pids_info *info = NULL;
> > +		struct pids_stack *stack;
> > +
> > +		usleep(1000);
> > +
> > +		if (procps_pids_new(&info, Items, 2) < 0)
> > +			return 1;
> > +		while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
> > +			if (!strcmp(PIDS_VAL(1, str, stack, info), "pw-reserve")) {
> > +				is_pw_reserve_running = true;
> > +				pipewire_pw_reserve_pid = PIDS_VAL(0, s_int, stack, info);
> > +				break;
> > +			}
> > +		}
> > +		procps_pids_unref(&info);
> > +#endif

Same comment as above: better to abstract API differences into a set
of open, close and get ID functions.

> >  		if (is_pw_reserve_running)
> >  			break;
> >  	}
> > @@ -1645,7 +1784,7 @@ void pipewire_pulse_stop_reserve(void)
> >   * If the check fails, it means that the process can simply be killed.
> >   */
> >  static int
> > -__igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path)
> > +__igt_lsof_audio_and_kill_proc(const pid_t tid, const char *cmd, const uid_t euid, const gid_t egid, char *proc_path)
> >  {
> >  	const char *audio_dev = "/dev/snd/";
> >  	char path[PATH_MAX * 2];
> > @@ -1670,10 +1809,10 @@ __igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path)
> >  	 * 2) unload/unbind the the audio driver(s);
> >  	 * 3) stop the pw-reserve thread.
> >  	 */
> > -	if (!strcmp(proc_info->cmd, "pipewire-pulse")) {
> > +	if (!strcmp(cmd, "pipewire-pulse")) {
> >  		igt_info("process %d (%s) is using audio device. Should be requested to stop using them.\n",
> > -			 proc_info->tid, proc_info->cmd);
> > -		pipewire_pulse_pid = proc_info->tid;
> > +			 tid, cmd);
> > +		pipewire_pulse_pid = tid;
> >  		return 0;
> >  	}
> >  	/*
> > @@ -1685,9 +1824,9 @@ __igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path)
> >  	 * will respawn them. So, just ignore here, they'll honor pw-reserve,
> >  	 * when the time comes.
> >  	 */
> > -	if (!strcmp(proc_info->cmd, "pipewire-media-session"))
> > +	if (!strcmp(cmd, "pipewire-media-session"))
> >  		return 0;
> > -	if (!strcmp(proc_info->cmd, "wireplumber"))
> > +	if (!strcmp(cmd, "wireplumber"))
> >  		return 0;
> >  
> >  	dp = opendir(proc_path);
> > @@ -1723,22 +1862,22 @@ __igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path)
> >  		 * enough to unbind audio modules and won't cause race issues
> >  		 * with systemd trying to reload it.
> >  		 */
> > -		if (!strcmp(proc_info->cmd, "pulseaudio")) {
> > -			pulseaudio_unload_module(proc_info);
> > +		if (!strcmp(cmd, "pulseaudio")) {
> > +			pulseaudio_unload_module(euid, egid);
> >  			break;
> >  		}
> >  
> >  		/* For all other processes, just kill them */
> >  		igt_info("process %d (%s) is using audio device. Should be terminated.\n",
> > -				proc_info->tid, proc_info->cmd);
> > +				tid, cmd);
> >  
> > -		if (kill(proc_info->tid, SIGTERM) < 0) {
> > +		if (kill(tid, SIGTERM) < 0) {
> >  			igt_info("Fail to terminate %s (pid: %d) with SIGTERM\n",
> > -				proc_info->cmd, proc_info->tid);
> > -			if (kill(proc_info->tid, SIGABRT) < 0) {
> > +				cmd, tid);
> > +			if (kill(tid, SIGABRT) < 0) {
> >  				fail++;
> >  				igt_info("Fail to terminate %s (pid: %d) with SIGABRT\n",
> > -					proc_info->cmd, proc_info->tid);
> > +					cmd, tid);
> >  			}
> >  		}
> >  
> > @@ -1760,23 +1899,47 @@ int
> >  igt_lsof_kill_audio_processes(void)
> >  {
> >  	char path[PATH_MAX];
> > +	int fail = 0;
> > +
> > +#ifdef HAVE_LIBPROCPS
> >  	proc_t *proc_info;
> >  	PROCTAB *proc;
> > -	int fail = 0;
> >  
> >  	proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
> >  	igt_assert(proc != NULL);
> >  	pipewire_pulse_pid = 0;
> > -
> >  	while ((proc_info = readproc(proc, NULL))) {
> >  		if (snprintf(path, sizeof(path), "/proc/%d/fd", proc_info->tid) < 1)
> >  			fail++;
> >  		else
> > -			fail += __igt_lsof_audio_and_kill_proc(proc_info, path);
> > +			fail += __igt_lsof_audio_and_kill_proc(proc_info->tid, proc_info->cmd, proc_info->euid, proc_info->egid, path);
> >  
> >  		freeproc(proc_info);
> >  	}
> >  	closeproc(proc);
> > +#elif HAVE_LIBPROC2
> > +	enum pids_item Items[] = { PIDS_ID_PID, PIDS_CMD, PIDS_ID_EUID, PIDS_ID_EGID };
> > +	enum rel_items { EU_PID, EU_CMD, EU_EUID, EU_EGID };
> > +	struct pids_info *info = NULL;
> > +	struct pids_stack *stack;
> > +	pid_t tid;
> > +
> > +	if (procps_pids_new(&info, Items, 4) < 0)
> > +		return 1;
> > +	while ((stack = procps_pids_get(info, PIDS_FETCH_TASKS_ONLY))) {
> > +		tid = PIDS_VAL(EU_PID, s_int, stack, info);
> > +
> > +		if (snprintf(path, sizeof(path), "/proc/%d/fd", tid) < 1)
> > +			fail++;
> > +		else
> > +			fail += __igt_lsof_audio_and_kill_proc(tid,
> > +				PIDS_VAL(EU_CMD, str, stack, info),
> > +				PIDS_VAL(EU_EUID, s_int, stack, info),
> > +				PIDS_VAL(EU_EGID, s_int, stack, info),
> > +				path);
> > +	}
> > +	procps_pids_unref(&info);
> > +#endif

Same here: better to use API-abstract functions.

> >  
> >  	return fail;
> >  }
> > diff --git a/lib/meson.build b/lib/meson.build
> > index b21c252b5..48a27a612 100644
> > --- a/lib/meson.build
> > +++ b/lib/meson.build
> > @@ -113,7 +113,6 @@ lib_deps = [
> >  	libdrm,
> >  	libdw,
> >  	libkmod,
> > -	libprocps,
> >  	libudev,
> >  	math,
> >  	pciaccess,
> > @@ -177,6 +176,12 @@ if chamelium.found()
> >  	lib_sources += 'monitor_edids/monitor_edids_helper.c'
> >  endif
> >  
> > +if libprocps.found()
> > +	lib_deps += libprocps
> > +else
> > +	lib_deps += libproc2
> > +endif
> > +
> >  if get_option('srcdir') != ''
> >      srcdir = join_paths(get_option('srcdir'), 'tests')
> >  else
> > diff --git a/meson.build b/meson.build
> > index 036217844..98acc8daf 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -124,7 +124,15 @@ build_info += 'With libdrm: ' + ','.join(libdrm_info)
> >  
> >  pciaccess = dependency('pciaccess', version : '>=0.10')
> >  libkmod = dependency('libkmod')
> > -libprocps = dependency('libprocps', required : true)
> > +libprocps = dependency('libprocps', required : false)
> > +libproc2 = dependency('libproc2', required : false)
> > +if libprocps.found()
> > +  config.set('HAVE_LIBPROCPS', 1)
> > +elif libproc2.found()
> > +  config.set('HAVE_LIBPROC2', 1)
> > +else
> > +  error('Either libprocps or libproc2 is required')
> > +endif
> >  
> >  libunwind = dependency('libunwind', required : get_option('libunwind'))
> >  build_info += 'With libunwind: @0@'.format(libunwind.found())
> > -- 
> > 2.37.2
> >   
