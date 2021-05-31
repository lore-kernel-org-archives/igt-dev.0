Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F025F6E8DE
 for <igt-dev@lists.freedesktop.org>; Mon, 31 May 2021 11:18:43 +0000 (UTC)
Date: Mon, 31 May 2021 14:20:23 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YLTGdyqQ1eiiCuBn@platvala-desk.ger.corp.intel.com>
References: <20210528055536.343744-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20210528055536.343744-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210528055536.343744-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [igt-dev] [i-g-t V2 1/2] lib/i915: find scheduler caps for
 timeslicing
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
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org, mahesh.meena@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 28, 2021 at 11:25:35AM +0530, Tejas Upadhyay wrote:
> Check scheduler capability for timeslicing in appropriate
> way, which requires wrappers to be created for IGT.
> 
> V2: has_timeslice = has_semaphore && has_preemption || has_guc_submission
> 
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>  lib/i915/gem_scheduler.c | 21 +++++++++++++++++++++
>  lib/i915/gem_scheduler.h |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/lib/i915/gem_scheduler.c b/lib/i915/gem_scheduler.c
> index 184da843..ddfba08b 100644
> --- a/lib/i915/gem_scheduler.c
> +++ b/lib/i915/gem_scheduler.c
> @@ -29,6 +29,7 @@
>  #include "ioctl_wrappers.h"
>  
>  #include "i915/gem_scheduler.h"
> +#include "i915/gem_submission.h"
>  
>  /**
>   * SECTION:gem_scheduler
> @@ -129,6 +130,22 @@ bool gem_scheduler_has_engine_busy_stats(int fd)
>  		I915_SCHEDULER_CAP_ENGINE_BUSY_STATS;
>  }
>  
> +/**
> + * gem_scheduler_has_timeslicing:
> + * @fd: open i915 drm file descriptor
> + *
> + * Feature test macro to query whether the driver supports using HW preemption
> + * to implement timeslicing of userspace batches. This allows userspace to
> + * implement micro-level scheduling within their own batches.
> + */
> +bool gem_scheduler_has_timeslicing(int fd)
> +{
> +	return gem_scheduler_capability(fd) &
> +	       ((I915_SCHEDULER_CAP_PREEMPTION
> +		 && I915_SCHEDULER_CAP_SEMAPHORES)
> +		|| gem_has_guc_submission(fd));

This mix of bitwise and logical and/ors looks incorrect.

-- 
Petri Latvala



> +}
> +
>  /**
>   * gem_scheduler_print_capability:
>   * @fd: open i915 drm file descriptor
> @@ -151,4 +168,8 @@ void gem_scheduler_print_capability(int fd)
>  		igt_info(" - With HW semaphores enabled\n");
>  	if (caps & I915_SCHEDULER_CAP_ENGINE_BUSY_STATS)
>  		igt_info(" - With engine busy statistics\n");
> +	if (caps & ((I915_SCHEDULER_CAP_PREEMPTION
> +		     && I915_SCHEDULER_CAP_SEMAPHORES)
> +		    || gem_has_guc_submission(fd)))
> +		igt_info(" - With user timeslicing enabled\n");
>  }
> diff --git a/lib/i915/gem_scheduler.h b/lib/i915/gem_scheduler.h
> index 14bd4cac..d43e84bd 100644
> --- a/lib/i915/gem_scheduler.h
> +++ b/lib/i915/gem_scheduler.h
> @@ -32,6 +32,7 @@ bool gem_scheduler_has_ctx_priority(int fd);
>  bool gem_scheduler_has_preemption(int fd);
>  bool gem_scheduler_has_semaphores(int fd);
>  bool gem_scheduler_has_engine_busy_stats(int fd);
> +bool gem_scheduler_has_timeslicing(int fd);
>  void gem_scheduler_print_capability(int fd);
>  
>  #endif /* GEM_SCHEDULER_H */
> -- 
> 2.31.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
