Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154136E35F
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2020 08:28:21 +0000 (UTC)
Date: Wed, 22 Apr 2020 11:28:18 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200422082818.GD9497@platvala-desk.ger.corp.intel.com>
References: <20200421161725.12249-1-juhapekka.heikkila@gmail.com>
 <20200421161725.12249-3-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421161725.12249-3-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/8] lib/params: start renaming
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
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 07:17:19PM +0300, Juha-Pekka Heikkila wrote:
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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


Hmm. Now that we're renaming anyway, we have a good chance to consider
if the name is good.

igt_module_params_set()? No, the point of this series is to make the
params not module-specific. igt_device_params_set()?

I don't have a strong opinion on this and I can live with
igt_params_set() as well. Just calling out for opinions! Arek?

As for the patch, whatever the name, straight up renames all around.
Reviewed-by: Petri Latvala <petri.latvala@intel.com>


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
