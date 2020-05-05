Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EEF6E260
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 14:04:43 +0000 (UTC)
Date: Tue, 5 May 2020 17:04:39 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200505140439.sskwgfoocljh2rrs@ahiler-desk1.fi.intel.com>
References: <20200428202255.31309-1-juhapekka.heikkila@gmail.com>
 <20200428202255.31309-3-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428202255.31309-3-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/7] lib/params: start renaming
 functions igt_params_*
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 28, 2020 at 11:22:50PM +0300, Juha-Pekka Heikkila wrote:
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> ---
>  lib/drmtest.c                         |  2 +-
>  lib/i915/gem_submission.c             |  2 +-
>  lib/igt_aux.c                         |  3 +--
>  lib/igt_gt.c                          |  2 +-
>  lib/igt_params.c                      | 12 +++++-------
>  lib/igt_params.h                      |  5 ++---
>  tests/i915/gem_ctx_exec.c             |  2 +-
>  tests/i915/gem_ctx_persistence.c      |  9 ++++-----
>  tests/i915/gem_mmap_gtt.c             |  2 +-
>  tests/i915/gem_reset_stats.c          |  6 ++----
>  tests/i915/sysfs_heartbeat_interval.c |  3 ++-
>  tests/i915/sysfs_preempt_timeout.c    |  3 ++-
>  tests/i915/sysfs_timeslice_duration.c |  3 ++-
>  13 files changed, 25 insertions(+), 29 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 1fc39925..17067843 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -393,7 +393,7 @@ static void __cancel_work_at_exit(int fd)
>  {
>  	igt_terminate_spins(); /* for older kernels */
>  
> -	igt_sysfs_set_parameter(fd, "reset", "%x", -1u /* any method */);
> +	igt_params_set(fd, "reset", "%x", -1u /* any method */);

With #define MODULE_PARAM_DIR "/sys/module/i915/parameters/"
and the debugfs interface everything here is i915-specific.

i915_param_ prefix would be better as it both suggests that we are
dealing with i915 module parameters instead of some elusive IGT
framework params and doesn't create illusion that this is
driver-agnostic.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
