Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE5210F50B
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 13:01:38 +0000 (UTC)
Date: Wed, 25 May 2022 15:59:20 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <Yo4oKKNKkFNoN47B@platvala-desk.ger.corp.intel.com>
References: <20220524120717.748348-1-mauro.chehab@linux.intel.com>
 <20220524120717.748348-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524120717.748348-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_aux: fix kselftest module
 unload
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 24, 2022 at 02:07:17PM +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Most of the time, i915 module unload happens inside a subtest.
> So, using igt_fork() is OK. However, on i915_selftest, this
> is called earlier, at igt_kselftest_begin. This causes an
> error on IGT:
> 
> 	forking is only allowed in subtests or igt_simple_main
> 	please refer to lib/igt_core documentation
> 
> As igt_fork() can only be used inside subtests. So, use
> igt_fork_helper() instead.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/igt_aux.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 751c8a29e514..9431960f2632 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -1465,11 +1465,12 @@ igt_lsof(const char *dpath)
>  
>  static void pulseaudio_unload_module(proc_t *proc_info)
>  {
> +	struct igt_helper_process pa_proc = {};
>  	char xdg_dir[PATH_MAX];
>  	const char *homedir;
>  	struct passwd *pw;
>  
> -	igt_fork(child, 1) {
> +	igt_fork_helper(&pa_proc) {
>  		pw = getpwuid(proc_info->euid);
>  		homedir = pw->pw_dir;
>  		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", proc_info->euid);
> @@ -1484,11 +1485,12 @@ static void pulseaudio_unload_module(proc_t *proc_info)
>  
>  		system("for i in $(pacmd list-sources|grep module:|cut -d : -f 2); do pactl unload-module $i; done");
>  	}
> -	igt_waitchildren();
> +	igt_wait_helper(&pa_proc);
>  }
>  
>  static int pipewire_pulse_pid = 0;
>  static int pipewire_pw_reserve_pid = 0;
> +static struct igt_helper_process pw_reserve_proc = {};
>  
>  static void pipewire_reserve_wait(void)
>  {
> @@ -1498,7 +1500,7 @@ static void pipewire_reserve_wait(void)
>  	proc_t *proc_info;
>  	PROCTAB *proc;
>  
> -	igt_fork(child, 1) {
> +	igt_fork_helper(&pw_reserve_proc) {
>  		igt_info("Preventing pipewire-pulse to use the audio drivers\n");
>  
>  		proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
> @@ -1592,7 +1594,7 @@ void pipewire_pulse_stop_reserve(void)
>  	if (!pipewire_pulse_pid)
>  		return;
>  
> -	igt_kill_children(SIGTERM);
> +	igt_stop_helper(&pw_reserve_proc);
>  }
>  
>  /**
> -- 
> 2.36.1
> 
