Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2B111B39F
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Aug 2022 09:28:22 +0000 (UTC)
Date: Wed, 3 Aug 2022 12:27:01 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Adrian Larumbe <adrian.larumbe@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Message-ID: <Yuo/ZbZwC01pFDw1@platvala-desk.ger.corp.intel.com>
References: <20220516205000.2960491-1-adrian.larumbe@collabora.com>
 <20220516205000.2960491-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516205000.2960491-2-adrian.larumbe@collabora.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] i915/gem_ctx_isolation:: change
 semantics of ctx isolation uAPI
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, bob.beckett@collabora.com, daniel@ffwll.ch
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 16, 2022 at 09:50:00PM +0100, Adrian Larumbe wrote:
> ioctl I915_PARAM_HAS_CONTEXT_ISOLATION param is meant to report whether all
> the engines in the system support context isolation, but the way the return
> value was being used did not respect the contract on the uAPI.
> 
> Skip all engine tests for which context isolation is not supported. Also skip
> tests that involve an engine reset if both RCS and CCS engines are present in
> the system. This is because they belong to the same reset domain.
> 
> Signed-Off-By: Adrian Larumbe <adrian.larumbe@collabora.com>
> ---
>  include/drm-uapi/i915_drm.h    |   6 +-
>  tests/i915/gem_ctx_isolation.c | 101 +++++++++++++++++++++++----------
>  2 files changed, 72 insertions(+), 35 deletions(-)
> 
> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
> index f0067d26123e..327465ac3eb1 100644
> --- a/include/drm-uapi/i915_drm.h
> +++ b/include/drm-uapi/i915_drm.h
> @@ -678,11 +678,7 @@ typedef struct drm_i915_irq_wait {
>   * rather than default HW values. If true, it also ensures (insofar as HW
>   * supports) that all state set by this context will not leak to any other
>   * context.
> - *
> - * As not every engine across every gen support contexts, the returned
> - * value reports the support of context isolation for individual engines by
> - * returning a bitmask of each engine class set to true if that class supports
> - * isolation.
> + * 
>   */

Is this chunk here accidentally? Modifications to files in
include/drm-uapi/* should only be done by directly copying from the
kernel.

>  #define I915_PARAM_HAS_CONTEXT_ISOLATION 50
>  
> diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
> index 4233ea5784dc..ddfae493bc2c 100644
> --- a/tests/i915/gem_ctx_isolation.c
> +++ b/tests/i915/gem_ctx_isolation.c
> @@ -45,6 +45,7 @@ enum {
>  	VCS2 = ENGINE(I915_ENGINE_CLASS_VIDEO, 2),
>  	VCS3 = ENGINE(I915_ENGINE_CLASS_VIDEO, 3),
>  	VECS0 = ENGINE(I915_ENGINE_CLASS_VIDEO_ENHANCE, 0),
> +	CCS0 = ENGINE(I915_ENGINE_CLASS_COMPUTE, 0),
>  };
>  
>  #define ALL ~0u
> @@ -627,9 +628,40 @@ static void compare_regs(int fd, const struct intel_execution_engine2 *e,
>  		     num_errors, who);
>  }
>  
> +static bool
> +engine_has_context_isolation(const struct intel_execution_engine2 *e,
> +			     int gen)
> +{
> +	if (gen > 8)
> +		return true;
> +
> +	if (gen >= 6 && gen <= 8 && e->class == I915_ENGINE_CLASS_RENDER)
> +		return true;
> +
> +	return false;
> +}
> +
> +static bool
> +has_engine_class(const intel_ctx_cfg_t *cfg, unsigned int class)
> +{
> +	const struct i915_engine_class_instance *eci;
> +	unsigned int i;
> +
> +	igt_require(class <= I915_ENGINE_CLASS_COMPUTE);
> +
> +	for (i = 0; i < cfg->num_engines; i++) {
> +		eci = &cfg->engines[i];
> +		if (eci->engine_class == class)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
>  		    const struct intel_execution_engine2 *e,
> -		    unsigned int flags)
> +		    unsigned int flags,
> +		    int gen)
>  {
>  	static const uint32_t values[] = {
>  		0x0,
> @@ -646,7 +678,7 @@ static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
>  	unsigned int num_values = ARRAY_SIZE(values);
>  
>  	/* Sigh -- hsw: we need cmdparser access to our own registers! */
> -	igt_skip_on(intel_gen(intel_get_drm_devid(fd)) < 8);
> +	igt_skip_on(!engine_has_context_isolation(e, gen));

The comment explains that hsw (among others) needs to have this test
skipped, but this allows execution on hsw. Did the reasoning change?
Either way the comment and the skip line tell different things, one
needs changing.

Also, avoid unnecessary negation. igt_skip_on(!f) is equivalent to
igt_require(f).

>  
>  	gem_quiescent_gpu(fd);
>  
> @@ -729,7 +761,8 @@ static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
>  
>  static void isolation(int fd, const intel_ctx_cfg_t *cfg,
>  		      const struct intel_execution_engine2 *e,
> -		      unsigned int flags)
> +		      unsigned int flags,
> +		      int gen)
>  {
>  	static const uint32_t values[] = {
>  		0x0,
> @@ -743,6 +776,8 @@ static void isolation(int fd, const intel_ctx_cfg_t *cfg,
>  	unsigned int num_values =
>  		flags & (DIRTY1 | DIRTY2) ? ARRAY_SIZE(values) : 1;
>  
> +	igt_skip_on(!engine_has_context_isolation(e, gen));

Avoid negation, igt_require instead.

> +
>  	gem_quiescent_gpu(fd);
>  
>  	for (int v = 0; v < num_values; v++) {
> @@ -865,7 +900,8 @@ static void inject_reset_context(int fd, const intel_ctx_cfg_t *cfg,
>  
>  static void preservation(int fd, const intel_ctx_cfg_t *cfg,
>  			 const struct intel_execution_engine2 *e,
> -			 unsigned int flags)
> +			 unsigned int flags,
> +			 int gen)
>  {
>  	static const uint32_t values[] = {
>  		0x0,
> @@ -882,6 +918,8 @@ static void preservation(int fd, const intel_ctx_cfg_t *cfg,
>  	uint64_t ahnd[num_values + 1];
>  	igt_spin_t *spin;
>  
> +	igt_skip_on(!engine_has_context_isolation(e, gen));

Avoid negation.

> +
>  	gem_quiescent_gpu(fd);
>  
>  	ctx[num_values] = intel_ctx_create(fd, cfg);
> @@ -902,8 +940,12 @@ static void preservation(int fd, const intel_ctx_cfg_t *cfg,
>  	gem_close(fd, read_regs(fd, ahnd[num_values], ctx[num_values], e, flags));
>  	igt_spin_free(fd, spin);
>  
> -	if (flags & RESET)
> +	if (flags & RESET) {
> +		igt_skip_on(has_engine_class(cfg, I915_ENGINE_CLASS_RENDER) &&
> +			    has_engine_class(cfg, I915_ENGINE_CLASS_COMPUTE));
> +
>  		inject_reset_context(fd, cfg, e);
> +	}

This and the other bits of this patch do what it says on the commit
message, but I'm unable to judge whether that's correct to do so. Can
a gem dev take a look at this? Tvrtko maybe (random selection)?


-- 
Petri Latvala


>  
>  	switch (flags & SLEEP_MASK) {
>  	case NOSLEEP:
> @@ -962,7 +1004,7 @@ static unsigned int __has_context_isolation(int fd)
>  	int value = 0;
>  
>  	memset(&gp, 0, sizeof(gp));
> -	gp.param = 50; /* I915_PARAM_HAS_CONTEXT_ISOLATION */
> +	gp.param = I915_PARAM_HAS_CONTEXT_ISOLATION;
>  	gp.value = &value;
>  
>  	igt_ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp);
> @@ -971,21 +1013,19 @@ static unsigned int __has_context_isolation(int fd)
>  	return value;
>  }
>  
> -#define test_each_engine(e, i915, cfg, mask) \
> +#define test_each_engine(e, i915, cfg)	  \
>  	for_each_ctx_cfg_engine(i915, cfg, e) \
> -		for_each_if(mask & (1 << (e)->class)) \
> -			igt_dynamic_f("%s", (e)->name)
> +		igt_dynamic_f("%s", (e)->name)
>  
>  igt_main
>  {
> -	unsigned int has_context_isolation = 0;
> +	bool has_context_isolation = 0;
>  	const struct intel_execution_engine2 *e;
>  	intel_ctx_cfg_t cfg;
>  	int i915 = -1;
> +	int gen;
>  
>  	igt_fixture {
> -		int gen;
> -
>  		i915 = drm_open_driver(DRIVER_INTEL);
>  		igt_require_gem(i915);
>  		igt_require(gem_has_contexts(i915));
> @@ -995,6 +1035,7 @@ igt_main
>  		igt_require(has_context_isolation);
>  
>  		gen = intel_gen(intel_get_drm_devid(i915));
> +		igt_require(gen >= 2);
>  
>  		igt_warn_on_f(gen > LAST_KNOWN_GEN,
>  			      "GEN not recognized! Test needs to be updated to run.\n");
> @@ -1006,43 +1047,43 @@ igt_main
>  	}
>  
>  	igt_subtest_with_dynamic("nonpriv") {
> -		test_each_engine(e, i915, &cfg, has_context_isolation)
> -			nonpriv(i915, &cfg, e, 0);
> +		test_each_engine(e, i915, &cfg)
> +			nonpriv(i915, &cfg, e, 0, gen);
>  	}
>  
>  	igt_subtest_with_dynamic("nonpriv-switch") {
> -		test_each_engine(e, i915, &cfg, has_context_isolation)
> -			nonpriv(i915, &cfg, e, DIRTY2);
> +		test_each_engine(e, i915, &cfg)
> +			nonpriv(i915, &cfg, e, DIRTY2, gen);
>  	}
>  
>  	igt_subtest_with_dynamic("clean") {
> -		test_each_engine(e, i915, &cfg, has_context_isolation)
> -			isolation(i915, &cfg, e, 0);
> +		test_each_engine(e, i915, &cfg)
> +			isolation(i915, &cfg, e, 0, gen);
>  	}
>  
>  	igt_subtest_with_dynamic("dirty-create") {
> -		test_each_engine(e, i915, &cfg, has_context_isolation)
> -			isolation(i915, &cfg, e, DIRTY1);
> +		test_each_engine(e, i915, &cfg)
> +			isolation(i915, &cfg, e, DIRTY1, gen);
>  	}
>  
>  	igt_subtest_with_dynamic("dirty-switch") {
> -		test_each_engine(e, i915, &cfg, has_context_isolation)
> -			isolation(i915, &cfg, e, DIRTY2);
> +		test_each_engine(e, i915, &cfg)
> +			isolation(i915, &cfg, e, DIRTY2, gen);
>  	}
>  
>  	igt_subtest_with_dynamic("preservation") {
> -		test_each_engine(e, i915, &cfg, has_context_isolation)
> -			preservation(i915, &cfg, e, 0);
> +		test_each_engine(e, i915, &cfg)
> +			preservation(i915, &cfg, e, 0, gen);
>  	}
>  
>  	igt_subtest_with_dynamic("preservation-S3") {
> -		test_each_engine(e, i915, &cfg, has_context_isolation)
> -			preservation(i915, &cfg, e, S3);
> +		test_each_engine(e, i915, &cfg)
> +			preservation(i915, &cfg, e, S3, gen);
>  	}
>  
>  	igt_subtest_with_dynamic("preservation-S4") {
> -		test_each_engine(e, i915, &cfg, has_context_isolation)
> -			preservation(i915, &cfg, e, S4);
> +		test_each_engine(e, i915, &cfg)
> +			preservation(i915, &cfg, e, S4, gen);
>  	}
>  
>  	igt_fixture {
> @@ -1052,8 +1093,8 @@ igt_main
>  	igt_subtest_with_dynamic("preservation-reset") {
>  		igt_hang_t hang = igt_allow_hang(i915, 0, 0);
>  
> -		test_each_engine(e, i915, &cfg, has_context_isolation)
> -			preservation(i915, &cfg, e, RESET);
> +		test_each_engine(e, i915, &cfg)
> +			preservation(i915, &cfg, e, RESET, gen);
>  
>  		igt_disallow_hang(i915, hang);
>  	}
> -- 
> 2.35.1
> 
