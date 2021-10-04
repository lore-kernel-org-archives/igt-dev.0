Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E7F6E20B
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 23:24:52 +0000 (UTC)
References: <20210916180301.6791-1-matthew.brost@intel.com>
 <20210916180301.6791-2-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ca7e91eb-d22b-4958-bfee-94b27e9f02e1@intel.com>
Date: Mon, 4 Oct 2021 16:24:43 -0700
In-Reply-To: <20210916180301.6791-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] i915/gem_exec_schedule: Make
 gem_exec_schedule understand static priority mapping
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Brost <matthew.brost@intel.com>, igt-dev@lists.freedesktop.org
Cc: john.c.harrison@intel.com
List-ID: <igt-dev@lists.freedesktop.org>



On 9/16/2021 11:02 AM, Matthew Brost wrote:
> The i915 currently has 2k visible priority levels which are currently
> unique. This is changing to statically map these 2k levels into 3
> buckets:
>
> low: < 0
> mid: 0
> high: > 0
>
> Update gem_exec_schedule to understand this. This entails updating
> promotion test to use 3 levels that will map into different buckets and
> also add bit of delay after releasing a cork beforing completing the
> spinners to give time to the i915 schedule to process the fence and
> release and queue the requests.
>
> Also skip any tests that rely on having more than 3 priority levels.
>
> v2: Add a delay between starting releasing spinner and cork in
> promotion, add local define for static mapping engine info
> v3:
>   (Daniele)
>    - Update commit message explaining why delay is needed,
>      unconditionally add delay
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   lib/i915/gem_scheduler.c       | 14 +++++++++++
>   lib/i915/gem_scheduler.h       |  1 +
>   lib/i915/i915_drm_local.h      | 10 ++++++++
>   tests/i915/gem_exec_schedule.c | 43 ++++++++++++++++++++++------------
>   4 files changed, 53 insertions(+), 15 deletions(-)
>
> diff --git a/lib/i915/gem_scheduler.c b/lib/i915/gem_scheduler.c
> index cdddf42ad..d006b8676 100644
> --- a/lib/i915/gem_scheduler.c
> +++ b/lib/i915/gem_scheduler.c
> @@ -28,6 +28,7 @@
>   #include "igt_core.h"
>   #include "ioctl_wrappers.h"
>   
> +#include "i915/i915_drm_local.h"
>   #include "i915/gem_scheduler.h"
>   #include "i915/gem_submission.h"
>   
> @@ -90,6 +91,19 @@ bool gem_scheduler_has_ctx_priority(int fd)
>   		I915_SCHEDULER_CAP_PRIORITY;
>   }
>   
> +/**
> + * gem_scheduler_has_static_priority:
> + * @fd: open i915 drm file descriptor
> + *
> + * Feature test macro to query whether the driver supports priority assigned
> + * from user space are statically mapping into 3 buckets.
> + */
> +bool gem_scheduler_has_static_priority(int fd)
> +{
> +	return gem_scheduler_capability(fd) &
> +		I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP;
> +}
> +
>   /**
>    * gem_scheduler_has_preemption:
>    * @fd: open i915 drm file descriptor
> diff --git a/lib/i915/gem_scheduler.h b/lib/i915/gem_scheduler.h
> index d43e84bd2..b00804f70 100644
> --- a/lib/i915/gem_scheduler.h
> +++ b/lib/i915/gem_scheduler.h
> @@ -29,6 +29,7 @@
>   unsigned gem_scheduler_capability(int fd);
>   bool gem_scheduler_enabled(int fd);
>   bool gem_scheduler_has_ctx_priority(int fd);
> +bool gem_scheduler_has_static_priority(int fd);
>   bool gem_scheduler_has_preemption(int fd);
>   bool gem_scheduler_has_semaphores(int fd);
>   bool gem_scheduler_has_engine_busy_stats(int fd);
> diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
> index dd646aedf..a1527ff21 100644
> --- a/lib/i915/i915_drm_local.h
> +++ b/lib/i915/i915_drm_local.h
> @@ -20,6 +20,16 @@ extern "C" {
>    * clean these up when kernel uapi headers are sync'd.
>    */
>   
> +/*
> + * Indicates the 2k user priority levels are statically mapped into 3 buckets as
> + * follows:
> + *
> + * -1k to -1	Low priority
> + * 0		Normal priority
> + * 1 to 1k	Highest priority
> + */
> +#define   I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP	(1ul << 5)
> +
>   #if defined(__cplusplus)
>   }
>   #endif
> diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> index 1f6f71db0..191eb558f 100644
> --- a/tests/i915/gem_exec_schedule.c
> +++ b/tests/i915/gem_exec_schedule.c
> @@ -247,6 +247,7 @@ static void unplug_show_queue(int fd, struct igt_cork *c,
>   
>   	igt_cork_unplug(c); /* batches will now be queued on the engine */
>   	igt_debugfs_dump(fd, "i915_engine_info");
> +	usleep(250000);

I'd add a comment here to track why the sleep is needed, something like:

/* give time to the kernel to complete the queueing */

with that:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   
>   	for (int n = 0; n < max; n++) {
>   		uint64_t ahnd = spin[n]->ahnd;
> @@ -1469,10 +1470,10 @@ static void promotion(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
>   	gem_context_set_priority(fd, ctx[LO]->id, MIN_PRIO);
>   
>   	ctx[HI] = intel_ctx_create(fd, cfg);
> -	gem_context_set_priority(fd, ctx[HI]->id, 0);
> +	gem_context_set_priority(fd, ctx[HI]->id, MAX_PRIO);
>   
>   	ctx[NOISE] = intel_ctx_create(fd, cfg);
> -	gem_context_set_priority(fd, ctx[NOISE]->id, MIN_PRIO/2);
> +	gem_context_set_priority(fd, ctx[NOISE]->id, 0);
>   
>   	result = gem_create(fd, 4096);
>   	result_offset = get_offset(ahnd, result, 4096, 0);
> @@ -3246,19 +3247,25 @@ igt_main
>   			test_each_engine_store("preempt-other-chain", fd, ctx, e)
>   				preempt_other(fd, &ctx->cfg, e->flags, CHAIN);
>   
> -			test_each_engine_store("preempt-queue", fd, ctx, e)
> -				preempt_queue(fd, &ctx->cfg, e->flags, 0);
> +			test_each_engine_store("preempt-engines", fd, ctx, e)
> +				preempt_engines(fd, e, 0);
>   
> -			test_each_engine_store("preempt-queue-chain", fd, ctx, e)
> -				preempt_queue(fd, &ctx->cfg, e->flags, CHAIN);
> -			test_each_engine_store("preempt-queue-contexts", fd, ctx, e)
> -				preempt_queue(fd, &ctx->cfg, e->flags, CONTEXTS);
> +			igt_subtest_group {
> +				igt_fixture {
> +					igt_require(!gem_scheduler_has_static_priority(fd));
> +				}
>   
> -			test_each_engine_store("preempt-queue-contexts-chain", fd, ctx, e)
> -				preempt_queue(fd, &ctx->cfg, e->flags, CONTEXTS | CHAIN);
> +				test_each_engine_store("preempt-queue", fd, ctx, e)
> +					preempt_queue(fd, &ctx->cfg, e->flags, 0);
>   
> -			test_each_engine_store("preempt-engines", fd, ctx, e)
> -				preempt_engines(fd, e, 0);
> +				test_each_engine_store("preempt-queue-chain", fd, ctx, e)
> +					preempt_queue(fd, &ctx->cfg, e->flags, CHAIN);
> +				test_each_engine_store("preempt-queue-contexts", fd, ctx, e)
> +					preempt_queue(fd, &ctx->cfg, e->flags, CONTEXTS);
> +
> +				test_each_engine_store("preempt-queue-contexts-chain", fd, ctx, e)
> +					preempt_queue(fd, &ctx->cfg, e->flags, CONTEXTS | CHAIN);
> +			}
>   
>   			igt_subtest_group {
>   				igt_hang_t hang;
> @@ -3300,11 +3307,17 @@ igt_main
>   		test_each_engine_store("wide", fd, ctx, e)
>   			wide(fd, &ctx->cfg, e->flags);
>   
> -		test_each_engine_store("reorder-wide", fd, ctx, e)
> -			reorder_wide(fd, &ctx->cfg, e->flags);
> -
>   		test_each_engine_store("smoketest", fd, ctx, e)
>   			smoketest(fd, &ctx->cfg, e->flags, 5);
> +
> +		igt_subtest_group {
> +			igt_fixture {
> +				igt_require(!gem_scheduler_has_static_priority(fd));
> +			}
> +
> +			test_each_engine_store("reorder-wide", fd, ctx, e)
> +				reorder_wide(fd, &ctx->cfg, e->flags);
> +		}
>   	}
>   
>   	igt_subtest_group {
