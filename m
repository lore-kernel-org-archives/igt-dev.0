Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055CBF53D87
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 19:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB84D10E118;
	Mon, 16 Mar 2026 19:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mc5Sxmq5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C068910E118
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 19:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773688647; x=1805224647;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EBSFUfVaP0//WSyUwNGH0N++Tw8clVE95iLeAdx/RJA=;
 b=Mc5Sxmq5SVoit+Mc5JjCmc0h4/ozCZ9I5uztQvfB9zrWyeeOo4Fumwk9
 uBqkDEh41+KyyZ5huQbUZ3khV101/d/DSesZbAMjgxsK54XFgbiknyTdx
 xPSsXdIQrEetKEeKok59x9gqFnFegXs9chp0os4hkWmZ4WPuBecDM5zO+
 DXaIYEQ0GNOXjeYEBCnD6qdDwK4MVg5pRxaa0+5QggxGJI9aUfFs8n8T+
 05zmztjcyjqurZOHNeHweAkEI6pvvwIxSJ5iELickJkDpL9dnx1irk3lH
 AFl1FdJpxvExLfzsPTgmFqK5z7kPEJQ5OGaBc80HatMyJEjdV+Q8UsW91 w==;
X-CSE-ConnectionGUID: 0eiMUxcWQCWpgJO8okh1sA==
X-CSE-MsgGUID: 0LAsrPDbSVWBUunXv38NNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74830628"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74830628"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 12:17:27 -0700
X-CSE-ConnectionGUID: hlsfepeCTI+lyuuShRFHTQ==
X-CSE-MsgGUID: Vizo9AamTe21TySJHcSYpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226700305"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 12:17:26 -0700
Date: Mon, 16 Mar 2026 20:17:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Gemini CLI <gemini-cli@google.com>
Subject: Re: [PATCH] lib: implement systemic timeout scaling via
 IGT_TIMEOUT_MULTIPLIER
Message-ID: <20260316191724.kgxcroy5kj7lj3sf@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jim Cromie <jim.cromie@gmail.com>, igt-dev@lists.freedesktop.org,
 Gemini CLI <gemini-cli@google.com>
References: <20260219185227.1278271-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260219185227.1278271-1-jim.cromie@gmail.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Jim,
On 2026-02-19 at 11:52:27 -0700, Jim Cromie wrote:
> IGT contains numerous hardcoded timing assertions and poll timeouts
> (e.g., 150ms in kms_sysfs_edid_timing and 1s in prime_busy) that
> appear to be tuned for bare-metal execution.
> 
> Specifically, DRM-CI testing of DRM_USE_DYNAMIC_DEBUG=y patchset
> triggers spurious timeouts, because toggling the static-keys under
> numerous drm_*dbg() callsites takes far longer than just changing the
> single word under /sys/module/drm/parameters/debug.
> 
> So this patch introduces a "Time Dilator" system to globally scale the
> suite's sensitivity, making it adjustable to varying environments.  It
> adds a global igt_timeout_multiplier, automatically initialized from
> the IGT_TIMEOUT_MULTIPLIER environment variable via a library
> constructor in lib/igt_poll.c.
> 
> The system scales timing in two directions:
> 
> 1. Clock Dilation: igt_nsec_elapsed() is patched to divide actual
>    elapsed time by the multiplier. This makes internal test logic
>    perceive time as moving slower, allowing existing assertions to
>    pass even when wall-clock duration is longer.
> 
> 2. Wait Scaling: Standard poll() and ppoll() calls are intercepted via
>    variadic macros and redirected to wrappers that multiply the
>    requested timeout duration.
> 
> I considered 2 different "dilations" for these, to allow separate
> tailoring of the 2 timeout flavors, but had no strong basis to do so,
> and it felt like "too many knobs".  That said, it might be appropriate
> to dilate *only* for drm.debug (/sys/module/drm/parameters/debug)
> adjustments.
> 
> This should allow at least IGT tests to be adjusted for environmental
> variations and kernel configurations, without requiring manual source
> modifications for every hardcoded constant.

+cc Ashutosh and Karthik
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Could you also give a link to a problem you trying to solve?

> 
> Assisted-by: Gemini CLI <gemini-cli@google.com>
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  lib/igt_core.c  |  7 +++++--
>  lib/igt_core.h  |  8 ++++++++
>  lib/igt_poll.c  | 50 +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/meson.build |  6 ++++--
>  4 files changed, 67 insertions(+), 4 deletions(-)
>  create mode 100644 lib/igt_poll.c
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 3ee670a41..8a1a07ff6 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -748,6 +748,7 @@ error:
>  uint64_t igt_nsec_elapsed(struct timespec *start)
>  {
>  	struct timespec now;
> +	uint64_t elapsed;
>  
>  	igt_gettime(&now);
>  	if ((start->tv_sec | start->tv_nsec) == 0) {
> @@ -755,8 +756,10 @@ uint64_t igt_nsec_elapsed(struct timespec *start)
>  		return 0;
>  	}
>  
> -	return ((now.tv_nsec - start->tv_nsec) +
> -		(uint64_t)NSEC_PER_SEC*(now.tv_sec - start->tv_sec));
> +	elapsed = ((now.tv_nsec - start->tv_nsec) +
> +		   (uint64_t)NSEC_PER_SEC*(now.tv_sec - start->tv_sec));
> +
> +	return elapsed / igt_timeout_multiplier;
>  }
>  
>  void __igt_assert_in_outer_scope(void)
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 6845f853c..4538375ff 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -44,6 +44,7 @@
>  #include <stdarg.h>
>  #include <getopt.h>
>  #include <unistd.h>
> +#include <poll.h>
>  
>  #ifdef __FreeBSD__
>  #include "igt_freebsd.h"
> @@ -53,6 +54,13 @@
>  #define IGT_LOG_DOMAIN (NULL)
>  #endif
>  
> +extern double igt_timeout_multiplier;
> +int igt_poll(struct pollfd *fds, nfds_t nfds, int timeout);
> +int igt_ppoll(struct pollfd *fds, nfds_t nfds,
> +              const struct timespec *tmo_p, const sigset_t *sigmask);

Above look ok.

> +#define poll(...) igt_poll(__VA_ARGS__)
> +#define ppoll(...) igt_ppoll(__VA_ARGS__)

Please avoid such defines, they are good for short-term or RFC
but not in long term. This will mean there will be more changes
in tests but imho that is better to have a clear view what is
going on.

> +

Remove this empty line.

Regards,
Kamil

>  
>  #ifndef STATIC_ANALYSIS_BUILD
>  #if defined(__clang_analyzer__) || defined(__COVERITY__) || defined(__KLOCWORK__)
> diff --git a/lib/igt_poll.c b/lib/igt_poll.c
> new file mode 100644
> index 000000000..d94fc902d
> --- /dev/null
> +++ b/lib/igt_poll.c
> @@ -0,0 +1,50 @@
> +#include <poll.h>
> +#include <time.h>
> +#include <stdint.h>
> +#include <stdlib.h>
> +#include "igt_core.h"
> +
> +#undef poll
> +#undef ppoll
> +
> +double igt_timeout_multiplier = 1.0;
> +
> +static void igt_timeout_multiplier_init(void) __attribute__((constructor));
> +static void igt_timeout_multiplier_init(void)
> +{
> +	const char *env = getenv("IGT_TIMEOUT_MULTIPLIER");
> +	if (env) {
> +		igt_timeout_multiplier = atof(env);
> +		if (igt_timeout_multiplier <= 0.0)
> +			igt_timeout_multiplier = 1.0;
> +	}
> +}
> +
> +int igt_poll(struct pollfd *fds, nfds_t nfds, int timeout)
> +{
> +	int old_timeout = timeout;
> +
> +	if (timeout > 0)
> +		timeout = (int)(timeout * igt_timeout_multiplier);
> +
> +	if (igt_timeout_multiplier != 1.0 && old_timeout > 0)
> +		igt_debug("igt_poll: scaling timeout %dms -> %dms\n", old_timeout, timeout);
> +
> +	return poll(fds, nfds, timeout);
> +}
> +
> +int igt_ppoll(struct pollfd *fds, nfds_t nfds,
> +	      const struct timespec *tmo_p, const sigset_t *sigmask)
> +{
> +	struct timespec scaled_tmo;
> +
> +	if (tmo_p) {
> +		uint64_t nsec = (uint64_t)tmo_p->tv_sec * NSEC_PER_SEC + tmo_p->tv_nsec;
> +		nsec *= igt_timeout_multiplier;
> +		scaled_tmo.tv_sec = nsec / NSEC_PER_SEC;
> +		scaled_tmo.tv_nsec = nsec % NSEC_PER_SEC;
> +		tmo_p = &scaled_tmo;
> +	}
> +
> +	return ppoll(fds, nfds, tmo_p, sigmask);
> +}
> diff --git a/lib/meson.build b/lib/meson.build
> index ea721ecf7..fb7e83543 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -97,6 +97,7 @@ lib_sources = [
>  	'igt_core.c',
>  	'igt_dir.c',
>  	'igt_draw.c',
> +	'igt_poll.c',
>  	'igt_list.c',
>  	'igt_map.c',
>  	'igt_panel.c',
> @@ -328,7 +329,7 @@ lib_igt_chipset = declare_dependency(link_with : lin_igt_chipset_build,
>                                       include_directories : inc)
>  
>  lib_igt_perf_build = static_library('igt_perf',
> -	['igt_perf.c'],
> +	['igt_perf.c', 'igt_poll.c'],
>  	include_directories : inc)
>  
>  lib_igt_perf = declare_dependency(link_with : lib_igt_perf_build,
> @@ -347,6 +348,7 @@ lib_igt_device_scan_build = static_library('igt_device_scan',
>  	'igt_tools_stub.c',
>  	'intel_device_info.c',
>  	'intel_cmds_info.c',
> +	'igt_poll.c',
>  	],
>  	dependencies : scan_dep,
>  	include_directories : inc)
> @@ -362,7 +364,7 @@ lib_igt_drm_clients = declare_dependency(link_with : lib_igt_drm_clients_build,
>  				         include_directories : inc)
>  
>  lib_igt_drm_fdinfo_build = static_library('igt_drm_fdinfo',
> -	['igt_drm_fdinfo.c'],
> +	['igt_drm_fdinfo.c', 'igt_poll.c'],
>  	include_directories : inc)
>  
>  lib_igt_drm_fdinfo = declare_dependency(link_with : lib_igt_drm_fdinfo_build,
> -- 
> 2.53.0
> 
