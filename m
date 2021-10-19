Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF54A6E845
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 18:19:43 +0000 (UTC)
References: <20211019031706.6992-1-ashutosh.dixit@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <fec8c8fb-aa9e-c657-4b16-2782487df71d@intel.com>
Date: Tue, 19 Oct 2021 11:19:36 -0700
In-Reply-To: <20211019031706.6992-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Return actual submission
 method from gem_submission_method
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 10/18/2021 20:17, Ashutosh Dixit wrote:
> gem_submission_method() purports to return the currently used submission
> method by the driver, as evidenced by its callers. Therefore remove the
> GEM_SUBMISSION_EXECLISTS flag when GuC submission is detected.
>
> This also fixes gem_has_execlists() to match its description, previously
> gem_has_execlists() would return true even if GuC submission was actually
> being used in the driver.
The thought occurs that while the behaviour might now match the 
description (and the naming of the underlying flag), the function name 
really matches the old behaviour. Maybe the function should also be 
renamed to gem_has_execlist_submission()? Maybe even rename both to 
gem_using_(execlist|guc)_submission() to be properly accurate?

Or is that just over polishing things?


>
> v2: Or gem_has_execlists call-sites with gem_has_guc_submission to make the
>      new code equivalent to the previous code.
>
> Reported-by: John Harrison <john.c.harrison@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   lib/i915/gem_submission.c   | 2 +-
>   tests/i915/gem_ctx_shared.c | 2 +-
>   tests/i915/gem_watchdog.c   | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
> index 2627b802cfb..b037d04cc4a 100644
> --- a/lib/i915/gem_submission.c
> +++ b/lib/i915/gem_submission.c
> @@ -86,7 +86,7 @@ unsigned gem_submission_method(int fd)
>   		return 0;
>   
>   	if (igt_sysfs_get_u32(dir, "enable_guc") & 1) {
> -		flags |= GEM_SUBMISSION_GUC | GEM_SUBMISSION_EXECLISTS;
> +		flags |= GEM_SUBMISSION_GUC;
>   		goto out;
>   	}
>   
> diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> index ea1b5dd1b8c..f50ef13263f 100644
> --- a/tests/i915/gem_ctx_shared.c
> +++ b/tests/i915/gem_ctx_shared.c
> @@ -159,7 +159,7 @@ static void disjoint_timelines(int i915, const intel_ctx_cfg_t *cfg)
>   	uint32_t plug;
>   	uint64_t ahnd;
>   
> -	igt_require(gem_has_execlists(i915));
> +	igt_require(gem_has_execlists(i915) || gem_has_guc_submission(i915));
I believe Tvrtko is suggesting this one should be a different test entirely:
 > Gem_ctx_shared/disjoint-timlines could perhaps use gem_uses_ppgtt() 
(for create vm)
 > and gem_scheduler_enabled() for context re-ordering

John.

>   
>   	/*
>   	 * Each context, although they share a vm, are expected to be
> diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
> index db562335a2a..21c7710a806 100644
> --- a/tests/i915/gem_watchdog.c
> +++ b/tests/i915/gem_watchdog.c
> @@ -222,7 +222,7 @@ static void virtual(int i915, const intel_ctx_cfg_t *base_cfg)
>   	const intel_ctx_t *ctx[num_engines];
>   	uint64_t ahnd;
>   
> -	igt_require(gem_has_execlists(i915));
> +	igt_require(gem_has_execlists(i915) || gem_has_guc_submission(i915));
>   
>   	igt_debug("%u virtual engines\n", num_engines);
>   	igt_require(num_engines);
