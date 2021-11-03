Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F79B73EAA
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Nov 2021 18:23:16 +0000 (UTC)
Message-ID: <cac18788-b419-b4b5-db0f-c5754cc7ff1f@intel.com>
Date: Wed, 3 Nov 2021 11:23:10 -0700
Content-Language: en-GB
References: <cover.1635895537.git.ashutosh.dixit@intel.com>
 <3815944b09f81297829d667a6755f133812dc9cb.1635895538.git.ashutosh.dixit@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <3815944b09f81297829d667a6755f133812dc9cb.1635895538.git.ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/i915: Clarify gem_submission
 function names
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 11/2/2021 16:30, Ashutosh Dixit wrote:
> The function names gem_has_guc_submission and gem_has_execlists and
> gem_has_semaphores are ambiguous. After "lib/i915: Return actual submission
> method from gem_submission_method" these functions return which submission
> method the kernel is actually using, not merely one which is
> present (e.g. execlist submission is present on all kernels on which GuC
> submission is present).
>
> Therefore change the function names to clarify that they return the actual
> submission method being used, not merely one which is present.
>
> Suggested-by: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   lib/i915/gem_scheduler.c    | 2 +-
>   lib/i915/gem_submission.c   | 4 ++--
>   lib/i915/gem_submission.h   | 4 ++--
>   tests/i915/gem_ctx_shared.c | 2 +-
>   tests/i915/gem_exec_fair.c  | 2 +-
>   tests/i915/gem_watchdog.c   | 2 +-
>   6 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/lib/i915/gem_scheduler.c b/lib/i915/gem_scheduler.c
> index cdddf42ad2b..bec9f0cda2e 100644
> --- a/lib/i915/gem_scheduler.c
> +++ b/lib/i915/gem_scheduler.c
> @@ -145,7 +145,7 @@ bool gem_scheduler_has_timeslicing(int fd)
>   		 I915_SCHEDULER_CAP_SEMAPHORES)) ==
>   		(I915_SCHEDULER_CAP_PREEMPTION |
>   		I915_SCHEDULER_CAP_SEMAPHORES))
> -		|| gem_has_guc_submission(fd));
> +		|| gem_using_guc_submission(fd));
>   }
>   
>   /**
> diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
> index 2ceb032a3df..c2b076e0585 100644
> --- a/lib/i915/gem_submission.c
> +++ b/lib/i915/gem_submission.c
> @@ -115,7 +115,7 @@ void gem_submission_print_method(int fd)
>    * Feature test macro to query whether the driver is using execlists as a
>    * hardware submission method.
>    */
> -bool gem_has_execlists(int fd)
> +bool gem_using_execlists(int fd)
>   {
>   	return gem_submission_method(fd) == GEM_SUBMISSION_EXECLISTS;
>   }
> @@ -127,7 +127,7 @@ bool gem_has_execlists(int fd)
>    * Feature test macro to query whether the driver is using the GuC as a
>    * hardware submission method.
>    */
> -bool gem_has_guc_submission(int fd)
> +bool gem_using_guc_submission(int fd)
>   {
>   	return gem_submission_method(fd) == GEM_SUBMISSION_GUC;
>   }
> diff --git a/lib/i915/gem_submission.h b/lib/i915/gem_submission.h
> index 1c82e3c5ede..1b6effa2696 100644
> --- a/lib/i915/gem_submission.h
> +++ b/lib/i915/gem_submission.h
> @@ -33,8 +33,8 @@
>   #define GEM_SUBMISSION_GUC		3
>   unsigned gem_submission_method(int fd);
>   void gem_submission_print_method(int fd);
> -bool gem_has_execlists(int fd);
> -bool gem_has_guc_submission(int fd);
> +bool gem_using_execlists(int fd);
> +bool gem_using_guc_submission(int fd);
>   bool gem_engine_has_mutable_submission(int fd, unsigned int engine);
>   bool gem_class_has_mutable_submission(int fd, int class);
>   
> diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> index a2959772d22..7e3a2617b21 100644
> --- a/tests/i915/gem_ctx_shared.c
> +++ b/tests/i915/gem_ctx_shared.c
> @@ -159,7 +159,7 @@ static void disjoint_timelines(int i915, const intel_ctx_cfg_t *cfg)
>   	uint32_t plug;
>   	uint64_t ahnd;
>   
> -	igt_require(gem_has_execlists(i915) || gem_has_guc_submission(i915));
> +	igt_require(gem_using_execlists(i915) || gem_using_guc_submission(i915));
>   
>   	/*
>   	 * Each context, although they share a vm, are expected to be
> diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
> index 2aa2bdebed5..935f9c4a0bc 100644
> --- a/tests/i915/gem_exec_fair.c
> +++ b/tests/i915/gem_exec_fair.c
> @@ -1318,7 +1318,7 @@ igt_main
>   		 * These tests are for a specific scheduling model which is
>   		 * not currently implemented by GuC. So skip on GuC platforms.
>   		 */
> -		igt_require(!gem_has_guc_submission(i915));
> +		igt_require(!gem_using_guc_submission(i915));
>   
>   		cfg = intel_ctx_cfg_all_physical(i915);
>   
> diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
> index 21c7710a806..a9d7f9da7fe 100644
> --- a/tests/i915/gem_watchdog.c
> +++ b/tests/i915/gem_watchdog.c
> @@ -222,7 +222,7 @@ static void virtual(int i915, const intel_ctx_cfg_t *base_cfg)
>   	const intel_ctx_t *ctx[num_engines];
>   	uint64_t ahnd;
>   
> -	igt_require(gem_has_execlists(i915) || gem_has_guc_submission(i915));
> +	igt_require(gem_using_execlists(i915) || gem_using_guc_submission(i915));
>   
>   	igt_debug("%u virtual engines\n", num_engines);
>   	igt_require(num_engines);
