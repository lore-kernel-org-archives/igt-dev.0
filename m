Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0822510E257
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 14:05:59 +0000 (UTC)
Date: Wed, 19 Oct 2022 15:05:55 +0100
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Message-ID: <20221019140555.u4ftearhpk4rf3id@sobremesa>
References: <20220912181552.2224231-1-adrian.larumbe@collabora.com>
 <20220912181552.2224231-2-adrian.larumbe@collabora.com>
 <YyIxXMm22n7QQa1X@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YyIxXMm22n7QQa1X@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t v6 2/2] i915/gem_ctx_isolation:: change
 semantics of ctx isolation uAPI
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kamil,

Sorry about the belated reply, but I was quite caught up with a plethora of other stuff.

I was about to put together v7 of the patch series when I realised I've another question.

On 14.09.2022 21:54, Kamil Konieczny wrote:
> Hi Adrian,
> 
> On 2022-09-12 at 19:15:52 +0100, Adrian Larumbe wrote:
> > ioctl I915_PARAM_HAS_CONTEXT_ISOLATION param is meant to report whether all
> > the engines in the system support context isolation, but the way the return
> > value was being used did not respect the contract on the uAPI.
> 
> May you point (maybe in cover letter ?) to discussion on this
> topic ? From I t found, the uAPI description was long, started
> with boolean meaning, but then added that this is a bitflag.
> It is a little confusing, so the question is: is it really
> all users take it as boolean ?

According to Dan Vetter, the only user the uAPI has to take into account is
Mesa, because no specific uAPI is provided for IGT tests. Because the Iris Mesa
backend deals with the return value of this param request as though it were a
boolean, then this IGT test has to change so that deciding whether an engine has
context isolation support must be done in UM instead.

There's a parallel kernel patch that changes the driver semantics of this param
ioctl return value so that it fits into what Iris expects, but they asked for
the relevant IGT test to be ready before going further into review.

> > 
> > Skip all engine tests for which context isolation is not supported. Also
> > skip tests that involve an engine reset if both RCS and CCS engines are
> > present in the system. This is because they belong to the same reset
> > domain.
> 
> This should be another patch itself as it is only for DG2, or
> am I missing something ?
> 
> > 
> > Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  tests/i915/gem_ctx_isolation.c | 109 ++++++++++++++++++++++++---------
> >  1 file changed, 80 insertions(+), 29 deletions(-)
> > 
> > diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
> > index 95d13969fa61..36afbaf74b64 100644
> > --- a/tests/i915/gem_ctx_isolation.c
> > +++ b/tests/i915/gem_ctx_isolation.c
> > @@ -45,6 +45,7 @@ enum {
> >  	VCS2 = ENGINE(I915_ENGINE_CLASS_VIDEO, 2),
> >  	VCS3 = ENGINE(I915_ENGINE_CLASS_VIDEO, 3),
> >  	VECS0 = ENGINE(I915_ENGINE_CLASS_VIDEO_ENHANCE, 0),
> > +	CCS0 = ENGINE(I915_ENGINE_CLASS_COMPUTE, 0),
> >  };
> >  
> >  #define ALL ~0u
> > @@ -164,6 +165,8 @@ static const struct named_register {
> >  
> >  	{ "xCS_GPR", GEN9, ALL, 0x600, 32, .relative = true },
> >  
> > +	/* TODO: add CCS0 registers */
> > +
> >  	{}
> >  }, ignore_registers[] = {
> >  	{ "RCS timestamp", GEN6, ~0u, 0x2358 },
> > @@ -625,9 +628,40 @@ static void compare_regs(int fd, const struct intel_execution_engine2 *e,
> >  		     num_errors, who);
> >  }
> >  
> > +static bool
> > +engine_has_context_isolation(const struct intel_execution_engine2 *e,
> > +			     int gen)
> > +{
> > +	if (gen > 8)
> > +		return true;
> > +
> > +	if (gen >= 6 && gen <= 8 && e->class == I915_ENGINE_CLASS_RENDER)
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> > +static bool
> > +has_engine_class(const intel_ctx_cfg_t *cfg, unsigned int class)
> > +{
> > +	const struct i915_engine_class_instance *eci;
> > +	unsigned int i;
> > +
> > +	igt_require(class <= I915_ENGINE_CLASS_COMPUTE);
> > +
> > +	for (i = 0; i < cfg->num_engines; i++) {
> > +		eci = &cfg->engines[i];
> > +		if (eci->engine_class == class)
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> >  static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
> >  		    const struct intel_execution_engine2 *e,
> > -		    unsigned int flags)
> > +		    unsigned int flags,
> > +		    int gen)
> 
> Please drop this change, use fd for obtaining gen.

I did this because I was recalculating the gen value inside every single subtest
function, but I've done as you suggested in the latest revision.

> >  {
> >  	static const uint32_t values[] = {
> >  		0x0,
> > @@ -645,6 +679,7 @@ static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
> >  
> >  	/* Sigh -- hsw: we need cmdparser access to our own registers! */
> >  	igt_skip_on(intel_gen(intel_get_drm_devid(fd)) < 8);
> > +	igt_require(engine_has_context_isolation(e, gen));
> --------------------------------------------------- ^
> Use fd here for getting gen.
> 
> >  
> >  	gem_quiescent_gpu(fd);
> >  
> > @@ -727,7 +762,8 @@ static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
> >  
> >  static void isolation(int fd, const intel_ctx_cfg_t *cfg,
> >  		      const struct intel_execution_engine2 *e,
> > -		      unsigned int flags)
> > +		      unsigned int flags,
> > +		      int gen)
> >  {
> >  	static const uint32_t values[] = {
> >  		0x0,
> > @@ -741,6 +777,8 @@ static void isolation(int fd, const intel_ctx_cfg_t *cfg,
> >  	unsigned int num_values =
> >  		flags & (DIRTY1 | DIRTY2) ? ARRAY_SIZE(values) : 1;
> >  
> > +	igt_require(engine_has_context_isolation(e, gen));
> > +
> >  	gem_quiescent_gpu(fd);
> >  
> >  	for (int v = 0; v < num_values; v++) {
> > @@ -863,7 +901,8 @@ static void inject_reset_context(int fd, const intel_ctx_cfg_t *cfg,
> >  
> >  static void preservation(int fd, const intel_ctx_cfg_t *cfg,
> >  			 const struct intel_execution_engine2 *e,
> > -			 unsigned int flags)
> > +			 unsigned int flags,
> > +			 int gen)
> >  {
> >  	static const uint32_t values[] = {
> >  		0x0,
> > @@ -880,6 +919,8 @@ static void preservation(int fd, const intel_ctx_cfg_t *cfg,
> >  	uint64_t ahnd[num_values + 1];
> >  	igt_spin_t *spin;
> >  
> > +	igt_require(engine_has_context_isolation(e, gen));
> > +
> >  	gem_quiescent_gpu(fd);
> >  
> >  	ctx[num_values] = intel_ctx_create(fd, cfg);
> > @@ -900,8 +941,19 @@ static void preservation(int fd, const intel_ctx_cfg_t *cfg,
> >  	gem_close(fd, read_regs(fd, ahnd[num_values], ctx[num_values], e, flags));
> >  	igt_spin_free(fd, spin);
> >  
> > -	if (flags & RESET)
> > +	if (flags & RESET) {
> > +		/*
> > +		 * TODO: handle this differently if CSS and RCS ever became
> > +		 * part of different reset domains
> > +		 */
> > +		igt_skip_on_f(has_engine_class(cfg, I915_ENGINE_CLASS_RENDER) &&
> > +			      has_engine_class(cfg, I915_ENGINE_CLASS_COMPUTE),
> > +			      "Both render and compute types of engines are present on the HW. \
> > +			      Skipping test because architecturally we don't make cross engine \
> > +			      isolation guarantees on those.\n");
> > +
> 
> In comment you write about reset domain, yet in skip comment
> you added that there is no ctx isolation between these engine
> classes, so maybe we should skip this test also for non-reset ?
> If you want to keep it for reset as is, change message
> accordingly.

Here I refer specifically to cross-engine reset isolation, rather than engine
context isolation.  Because they belong to the same reset domain, then resetting
one engine would affect the other, so test result would be undefined. That's why
I think when the test does not involve explicit resets, then it should go on as
usual.

> >  		inject_reset_context(fd, cfg, e);
> > +	}
> >  
> >  	switch (flags & SLEEP_MASK) {
> >  	case NOSLEEP:
> > @@ -960,7 +1012,7 @@ static unsigned int __has_context_isolation(int fd)
> >  	int value = 0;
> >  
> >  	memset(&gp, 0, sizeof(gp));
> > -	gp.param = 50; /* I915_PARAM_HAS_CONTEXT_ISOLATION */
> > +	gp.param = I915_PARAM_HAS_CONTEXT_ISOLATION;
> >  	gp.value = &value;
> >  
> >  	igt_ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp);
> > @@ -969,21 +1021,19 @@ static unsigned int __has_context_isolation(int fd)
> >  	return value;
> >  }

I've also decided to remove this function and its call at main's prelude because
it's no longer useful in deciding what engines support context isolation, as
it's meant to change soon to return just a boolean value.

> > -#define test_each_engine(e, i915, cfg, mask) \
> > +#define test_each_engine(e, i915, cfg) \
> >  	for_each_ctx_cfg_engine(i915, cfg, e) \
> > -		for_each_if(mask & (1 << (e)->class)) \
> > -			igt_dynamic_f("%s", (e)->name)
> > +	     igt_dynamic_f("%s", (e)->name)
> >  
> >  igt_main
> >  {
> > -	unsigned int has_context_isolation = 0;
> > +	bool has_context_isolation = 0;
> >  	const struct intel_execution_engine2 *e;
> >  	intel_ctx_cfg_t cfg;
> >  	int i915 = -1;
> > +	int gen;
> ------- ^
> This should be unsigned.
> 
> Regards,
> Kamil
> 
> >  
> >  	igt_fixture {
> > -		int gen;
> > -
> >  		i915 = drm_open_driver(DRIVER_INTEL);
> >  		igt_require_gem(i915);
> >  		igt_require(gem_has_contexts(i915));
> > @@ -993,6 +1043,7 @@ igt_main
> >  		igt_require(has_context_isolation);
> >  
> >  		gen = intel_gen(intel_get_drm_devid(i915));
> > +		igt_require(gen >= 2);
> >  
> >  		igt_warn_on_f(gen > LAST_KNOWN_GEN,
> >  			      "GEN not recognized! Test needs to be updated to run.\n");
> > @@ -1004,43 +1055,43 @@ igt_main
> >  	}
> >  
> >  	igt_subtest_with_dynamic("nonpriv") {
> > -		test_each_engine(e, i915, &cfg, has_context_isolation)
> > -			nonpriv(i915, &cfg, e, 0);
> > +		test_each_engine(e, i915, &cfg)
> > +			nonpriv(i915, &cfg, e, 0, gen);
> >  	}
> >  
> >  	igt_subtest_with_dynamic("nonpriv-switch") {
> > -		test_each_engine(e, i915, &cfg, has_context_isolation)
> > -			nonpriv(i915, &cfg, e, DIRTY2);
> > +		test_each_engine(e, i915, &cfg)
> > +			nonpriv(i915, &cfg, e, DIRTY2, gen);
> >  	}
> >  
> >  	igt_subtest_with_dynamic("clean") {
> > -		test_each_engine(e, i915, &cfg, has_context_isolation)
> > -			isolation(i915, &cfg, e, 0);
> > +		test_each_engine(e, i915, &cfg)
> > +			isolation(i915, &cfg, e, 0, gen);
> >  	}
> >  
> >  	igt_subtest_with_dynamic("dirty-create") {
> > -		test_each_engine(e, i915, &cfg, has_context_isolation)
> > -			isolation(i915, &cfg, e, DIRTY1);
> > +		test_each_engine(e, i915, &cfg)
> > +			isolation(i915, &cfg, e, DIRTY1, gen);
> >  	}
> >  
> >  	igt_subtest_with_dynamic("dirty-switch") {
> > -		test_each_engine(e, i915, &cfg, has_context_isolation)
> > -			isolation(i915, &cfg, e, DIRTY2);
> > +		test_each_engine(e, i915, &cfg)
> > +			isolation(i915, &cfg, e, DIRTY2, gen);
> >  	}
> >  
> >  	igt_subtest_with_dynamic("preservation") {
> > -		test_each_engine(e, i915, &cfg, has_context_isolation)
> > -			preservation(i915, &cfg, e, 0);
> > +		test_each_engine(e, i915, &cfg)
> > +			preservation(i915, &cfg, e, 0, gen);
> >  	}
> >  
> >  	igt_subtest_with_dynamic("preservation-S3") {
> > -		test_each_engine(e, i915, &cfg, has_context_isolation)
> > -			preservation(i915, &cfg, e, S3);
> > +		test_each_engine(e, i915, &cfg)
> > +			preservation(i915, &cfg, e, S3, gen);
> >  	}
> >  
> >  	igt_subtest_with_dynamic("preservation-S4") {
> > -		test_each_engine(e, i915, &cfg, has_context_isolation)
> > -			preservation(i915, &cfg, e, S4);
> > +		test_each_engine(e, i915, &cfg)
> > +			preservation(i915, &cfg, e, S4, gen);
> >  	}
> >  
> >  	igt_fixture {
> > @@ -1050,8 +1101,8 @@ igt_main
> >  	igt_subtest_with_dynamic("preservation-reset") {
> >  		igt_hang_t hang = igt_allow_hang(i915, 0, 0);
> >  
> > -		test_each_engine(e, i915, &cfg, has_context_isolation)
> > -			preservation(i915, &cfg, e, RESET);
> > +		test_each_engine(e, i915, &cfg)
> > +			preservation(i915, &cfg, e, RESET, gen);
> >  
> >  		igt_disallow_hang(i915, hang);
> >  	}
> > -- 
> > 2.37.0


Adrian Larumbe
