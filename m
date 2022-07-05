Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0E810E949
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jul 2022 13:20:57 +0000 (UTC)
Date: Tue, 5 Jul 2022 18:52:39 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <20220705132238.GA21210@intel.com>
References: <20220704125008.150389-1-riana.tauro@intel.com>
 <20220704125008.150389-2-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220704125008.150389-2-riana.tauro@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/i915/i915_pm_rc6_residency:
 Use the correct context in rc6-idle
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-07-04 at 18:20:08 +0530, Riana Tauro wrote:
> Use the correct context id in execbuf of rc6-idle test
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Looks good to me.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

> ---
>  tests/i915/i915_pm_rc6_residency.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
> index e377e70c..67d25918 100644
> --- a/tests/i915/i915_pm_rc6_residency.c
> +++ b/tests/i915/i915_pm_rc6_residency.c
> @@ -292,7 +292,7 @@ static void sighandler(int sig)
>  {
>  }
>  
> -static void bg_load(int i915, uint64_t engine_flags, unsigned int flags, unsigned long *ctl)
> +static void bg_load(int i915, uint32_t ctx_id, uint64_t engine_flags, unsigned int flags, unsigned long *ctl)
>  {
>  	const bool has_execlists = intel_gen(intel_get_drm_devid(i915)) >= 8;
>  	struct drm_i915_gem_exec_object2 obj = {
> @@ -302,6 +302,7 @@ static void bg_load(int i915, uint64_t engine_flags, unsigned int flags, unsigne
>  		.buffers_ptr = to_user_pointer(&obj),
>  		.buffer_count = 1,
>  		.flags = engine_flags,
> +		.rsvd1 = ctx_id,
>  	};
>  	struct sigaction act = {
>  		.sa_handler = sighandler
> @@ -359,7 +360,7 @@ static void kill_children(int sig)
>  	signal(sig, old);
>  }
>  
> -static void rc6_idle(int i915, uint64_t flags)
> +static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags)
>  {
>  	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
>  	const int tolerance = 20; /* Some RC6 is better than none! */
> @@ -405,7 +406,7 @@ static void rc6_idle(int i915, uint64_t flags)
>  	for (int p = 0; p < ARRAY_SIZE(phases); p++) {
>  		memset(done, 0, 2 * sizeof(*done));
>  		igt_fork(child, 1) /* Setup up a very light load */
> -			bg_load(i915, flags, phases[p].flags, done);
> +			bg_load(i915, ctx_id, flags, phases[p].flags, done);
>  
>  		rapl_read(&rapl, &sample[0]);
>  		cycles = -READ_ONCE(done[1]);
> @@ -549,7 +550,7 @@ igt_main
>  		for_each_ctx_engine(i915, ctx, e) {
>  			if (e->instance == 0) {
>  				igt_dynamic_f("%s", e->name)
> -					rc6_idle(i915, e->flags);
> +					rc6_idle(i915, ctx->id, e->flags);
>  			}
>  		}
>  	}
> -- 
> 2.25.1
> 
