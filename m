Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C766211300E
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 10:34:57 +0000 (UTC)
Date: Tue, 17 May 2022 12:34:50 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <YoN6StkBiQcqIyGr@intel.intel>
References: <20220517072803.186989-1-mauro.chehab@linux.intel.com>
 <20220517072803.186989-9-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517072803.186989-9-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 8/9] lib/igt_kmod: properly handle
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
> +		/*
> +		 * pw-reserve will run in background. It will only exit when
> +		 * igt_kill_children() is called later on. So, it shouldn't
> +		 * call igt_waitchildren(). Instead, just exit with the return
> +		 * code from pw-reserve.
> +		 */
> +		exit(system("pw-reserve -n Audio0 -r"));

Thanks for the comment! And I also think think it's safe!

igt_fork() calls exit() anyway but you call it earlier, so that
the former will not have time to be called.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
