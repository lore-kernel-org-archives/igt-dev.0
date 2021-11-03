Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773AE73E98
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Nov 2021 18:22:30 +0000 (UTC)
Message-ID: <75ba03a7-109d-7495-618d-c370832f8e15@intel.com>
Date: Wed, 3 Nov 2021 11:22:25 -0700
Content-Language: en-GB
References: <cover.1635895537.git.ashutosh.dixit@intel.com>
 <80835b2bb39219876667cc426266b7e829a07bfb.1635895537.git.ashutosh.dixit@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <80835b2bb39219876667cc426266b7e829a07bfb.1635895537.git.ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib/i915: Return actual submission
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
List-ID: <igt-dev@lists.freedesktop.org>

On 11/2/2021 16:30, Ashutosh Dixit wrote:
> gem_submission_method() purports to return the currently used submission
> method by the kernel, as evidenced by its callers. Therefore remove the
> GEM_SUBMISSION_EXECLISTS flag when GuC submission is detected.
>
> This also fixes gem_has_execlists() to match its description, previously
> gem_has_execlists() would return true even if GuC submission was actually
> being used in the driver.
>
> v2: Or gem_has_execlists call-sites with gem_has_guc_submission to make the
>      new code equivalent to the previous code.
> v3: Clarify that submission method is either guc (0x4), execlists (0x2) or
>      legacy without semaphores (0x0) or legacy with semaphores (0x1)
> v4: Submission methods are now clearly defined as one of guc (3),
>      execlists (2) or legacy ring buffer (1)
Not sure I would include the word 'legacy' here (or in the defines 
below, more importantly). How is ring buffer any more legacy than 
execlists? Latest hardware uses GuC so anything else is legacy. On the 
other hand, if you are on Gen6 then ring buf is the latest, greatest and 
only option.


>
> Reported-by: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   lib/i915/gem_submission.c   | 24 ++++++++++--------------
>   lib/i915/gem_submission.h   |  5 +++--
>   tests/i915/gem_ctx_shared.c |  2 +-
>   tests/i915/gem_watchdog.c   |  2 +-
>   4 files changed, 15 insertions(+), 18 deletions(-)
>
> diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
> index a84a5d3eda8..2ceb032a3df 100644
> --- a/lib/i915/gem_submission.c
> +++ b/lib/i915/gem_submission.c
> @@ -63,8 +63,7 @@
>   unsigned gem_submission_method(int fd)
>   {
>   	const int gen = intel_gen(intel_get_drm_devid(fd));
> -	unsigned flags = 0;
> -
> +	unsigned method = GEM_SUBMISSION_LEGACY_RING_BUF;
>   	int dir;
>   
>   	dir = igt_params_open(fd);
> @@ -72,16 +71,13 @@ unsigned gem_submission_method(int fd)
>   		return 0;
>   
>   	if (igt_sysfs_get_u32(dir, "enable_guc") & 1) {
> -		flags |= GEM_SUBMISSION_GUC | GEM_SUBMISSION_EXECLISTS;
> -		goto out;
> +		method = GEM_SUBMISSION_GUC;
> +	} else if (gen >= 8) {
> +		method = GEM_SUBMISSION_EXECLISTS;
>   	}
>   
> -	if (gen >= 8)
> -		flags |= GEM_SUBMISSION_EXECLISTS;
> -
> -out:
>   	close(dir);
> -	return flags;
> +	return method;
>   }
>   
>   /**
> @@ -92,19 +88,19 @@ out:
>    */
>   void gem_submission_print_method(int fd)
>   {
> -	const unsigned flags = gem_submission_method(fd);
> +	const unsigned method = gem_submission_method(fd);
>   	const struct intel_device_info *info;
>   
>   	info = intel_get_device_info(intel_get_drm_devid(fd));
>   	if (info)
>   		igt_info("Running on %s\n", info->codename);
>   
> -	if (flags & GEM_SUBMISSION_GUC) {
> +	if (method == GEM_SUBMISSION_GUC) {
>   		igt_info("Using GuC submission\n");
>   		return;
>   	}
>   
> -	if (flags & GEM_SUBMISSION_EXECLISTS) {
> +	if (method == GEM_SUBMISSION_EXECLISTS) {
>   		igt_info("Using Execlists submission\n");
>   		return;
>   	}
> @@ -121,7 +117,7 @@ void gem_submission_print_method(int fd)
>    */
>   bool gem_has_execlists(int fd)
>   {
> -	return gem_submission_method(fd) & GEM_SUBMISSION_EXECLISTS;
> +	return gem_submission_method(fd) == GEM_SUBMISSION_EXECLISTS;
>   }
>   
>   /**
> @@ -133,7 +129,7 @@ bool gem_has_execlists(int fd)
>    */
>   bool gem_has_guc_submission(int fd)
>   {
> -	return gem_submission_method(fd) & GEM_SUBMISSION_GUC;
> +	return gem_submission_method(fd) == GEM_SUBMISSION_GUC;
>   }
>   
>   static bool is_wedged(int i915)
> diff --git a/lib/i915/gem_submission.h b/lib/i915/gem_submission.h
> index 55bcfc09965..1c82e3c5ede 100644
> --- a/lib/i915/gem_submission.h
> +++ b/lib/i915/gem_submission.h
> @@ -28,8 +28,9 @@
>   
>   #include "intel_ctx.h"
>   
> -#define GEM_SUBMISSION_EXECLISTS	(1 << 1)
> -#define GEM_SUBMISSION_GUC		(1 << 2)
> +#define GEM_SUBMISSION_LEGACY_RING_BUF	1
As per comment above, I would just name this GEM_SUBMISSION_RINGBUF.

With that changed:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

John.

> +#define GEM_SUBMISSION_EXECLISTS	2
> +#define GEM_SUBMISSION_GUC		3
>   unsigned gem_submission_method(int fd);
>   void gem_submission_print_method(int fd);
>   bool gem_has_execlists(int fd);
> diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> index 3bf700fe669..a2959772d22 100644
> --- a/tests/i915/gem_ctx_shared.c
> +++ b/tests/i915/gem_ctx_shared.c
> @@ -159,7 +159,7 @@ static void disjoint_timelines(int i915, const intel_ctx_cfg_t *cfg)
>   	uint32_t plug;
>   	uint64_t ahnd;
>   
> -	igt_require(gem_has_execlists(i915));
> +	igt_require(gem_has_execlists(i915) || gem_has_guc_submission(i915));
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
