Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522996F4DE
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2020 09:13:36 +0000 (UTC)
Date: Wed, 5 Feb 2020 14:43:06 +0530
From: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Message-ID: <20200205091306.GB1580@arjun-NUC8i7BEH>
References: <20200203025250.30943-1-arjun.melkaveri@intel.com>
 <7c117c23-98a3-efbe-ac59-f85ac2b63b19@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c117c23-98a3-efbe-ac59-f85ac2b63b19@linux.intel.com>
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t] gem_ctx_create:Adjusted test to
 use __for_each_physical_engine to utilize all available engines
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 04, 2020 at 04:49:47PM +0000, Tvrtko Ursulin wrote:
> 
> On 03/02/2020 02:52, Arjun Melkaveri wrote:
> > Changes :-
> > 1) Added __for_each_physical_engine for subtest engines.
> > 2) Moved test cases from static to dynamic.
> > 3) used gem_context_clone_with_engines for creating contexts.
> > 4) Passing NULL in active test to run test for all engines.
> > 
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
> > Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> > ---
> >   tests/i915/gem_ctx_create.c | 56 ++++++++++++++++++++++---------------
> >   1 file changed, 34 insertions(+), 22 deletions(-)
> > 
> > diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
> > index d9a820e2..7100e75a 100644
> > --- a/tests/i915/gem_ctx_create.c
> > +++ b/tests/i915/gem_ctx_create.c
> > @@ -124,22 +124,22 @@ static void files(int core, int timeout, const int ncpus)
> >   	gem_close(core, batch);
> >   }
> > -static void active(int fd, unsigned engine, int timeout, int ncpus)
> > +static void active(int fd, const struct intel_execution_engine2 *e,
> > +		   int timeout, int ncpus)
> >   {
> >   	const uint32_t bbe = MI_BATCH_BUFFER_END;
> >   	struct drm_i915_gem_execbuffer2 execbuf;
> >   	struct drm_i915_gem_exec_object2 obj;
> >   	unsigned int nengine, engines[16];
> >   	unsigned *shared;
> > -
> > -	if (engine == ALL_ENGINES) {
> > +	/* When e is NULL, test would run for all engines */
> > +	if (!e) {
> >   		igt_require(all_nengine);
> >   		nengine = all_nengine;
> >   		memcpy(engines, all_engines, sizeof(engines[0])*nengine);
> >   	} else {
> > -		gem_require_ring(fd, engine);
> >   		nengine = 1;
> > -		engines[0] = engine;
> > +		engines[0] = e->flags;
> >   	}
> >   	shared = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> > @@ -157,7 +157,7 @@ static void active(int fd, unsigned engine, int timeout, int ncpus)
> >   		igt_fork(child, ppgtt_nengine) {
> >   			unsigned long count = 0;
> 
> After fork you need to transfer the engine map from parent fd default
> context. (gem_context_copy_engines)
> 
> There are two more forks which needs this treatment on a quick look.
> 
> Also, since you have __for_each_physical_engine in the top level
> igt_fixture, I think _all_ subtests run with default ctx engine map. So all
> which submit to one from either all_engines or ppgtt_engines need to make
> sure engine maps are aligned. I can see files(), which should be covered
> already when you handle the igt_fork properly. But please double check me
> and audit everything.
> 
Will make changes , I need to modify files() too . It open Drm driver 
directly . Will change it to gem_reopn_driver .
> > -			if (ppgtt_engines[child] == engine)
> > +			if (ppgtt_engines[child] == e->flags)
> >   				continue;
> 
> What is continue doing outside a loop, I'm confused? Does it relate to
> igt_fork? Spawns N children and then exists some immediately?
> 
you are correct , This is related to igt_fork
> >   			execbuf.flags = ppgtt_engines[child];
> > @@ -183,7 +183,7 @@ static void active(int fd, unsigned engine, int timeout, int ncpus)
> >   		clock_gettime(CLOCK_MONOTONIC, &start);
> >   		do {
> >   			do {
> > -				execbuf.rsvd1 = gem_context_create(fd);
> > +				execbuf.rsvd1 = gem_context_clone_with_engines(fd, 0);
> >   				for (unsigned n = 0; n < nengine; n++) {
> >   					execbuf.flags = engines[n];
> >   					gem_execbuf(fd, &execbuf);
> > @@ -276,7 +276,9 @@ static void maximum(int fd, int ncpus, unsigned mode)
> >   		err = -ENOMEM;
> >   		if (avail_mem > (count + 1) * ctx_size)
> > -			err = __gem_context_create(fd, &ctx_id);
> > +			err =  __gem_context_clone(fd, 0,
> > +						   I915_CONTEXT_CLONE_ENGINES,
> > +						   0, &ctx_id);
> >   		if (err) {
> >   			igt_info("Created %lu contexts, before failing with '%s' [%d]\n",
> >   				 count, strerror(-err), -err);
> > @@ -370,6 +372,7 @@ static void basic_ext_param(int i915)
> >   		gem_context_destroy(i915, create.ctx_id);
> > +
> 
> Try to avoid noise.
> 
will note it
> >   		/* Having demonstrated a valid setup, check a few invalids */
> >   		ext.param.ctx_id = 1;
> >   		igt_assert_eq(create_ext_ioctl(i915, &create), -EINVAL);
> > @@ -524,6 +527,7 @@ igt_main
> >   {
> >   	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> >   	struct drm_i915_gem_context_create create;
> > +	const struct intel_execution_engine2 *e;
> >   	int fd = -1;
> >   	igt_fixture {
> > @@ -531,8 +535,8 @@ igt_main
> >   		igt_require_gem(fd);
> >   		gem_require_contexts(fd);
> > -		for_each_physical_engine(e, fd)
> > -			all_engines[all_nengine++] = eb_ring(e);
> > +		__for_each_physical_engine(fd, e)
> > +			all_engines[all_nengine++] = e->flags;
> >   		igt_require(all_nengine);
> >   		if (gem_uses_full_ppgtt(fd)) {
> > @@ -572,20 +576,28 @@ igt_main
> >   	igt_subtest("forked-files")
> >   		files(fd, 20, ncpus);
> > +	/* NULL value means all engines */
> >   	igt_subtest("active-all")
> > -		active(fd, ALL_ENGINES, 20, 1);
> > +		active(fd, NULL, 20, 1);
> >   	igt_subtest("forked-active-all")
> > -		active(fd, ALL_ENGINES, 20, ncpus);
> > -
> > -	for (const struct intel_execution_engine *e = intel_execution_engines;
> > -	     e->name; e++) {
> > -		igt_subtest_f("active-%s", e->name)
> > -			active(fd, eb_ring(e), 20, 1);
> > -		igt_subtest_f("forked-active-%s", e->name)
> > -			active(fd, eb_ring(e), 20, ncpus);
> > -		if (e->exec_id) {
> > -			igt_subtest_f("hog-%s", e->name)
> > -				active(fd, eb_ring(e), 20, -1);
> > +		active(fd, NULL, 20, ncpus);
> > +
> > +	igt_subtest_with_dynamic("active") {
> > +		__for_each_physical_engine(fd, e) {
> > +			igt_dynamic_f("%s", e->name)
> 
> Does igt_dynamic_f(e->name) work?
> 
This does work , verified it when test is executed . engine name is
logged as " Dynamic subtest  " 
> > +				active(fd, e, 20, 1);
> > +		}
> > +	}
> > +	igt_subtest_with_dynamic("forked-active") {
> > +		__for_each_physical_engine(fd, e) {
> > +			igt_dynamic_f("%s", e->name)
> > +				active(fd, e, 20, ncpus);
> > +		}
> > +	}
> > +	igt_subtest_with_dynamic("hog") {
> > +		__for_each_physical_engine(fd, e) {
> > +			igt_dynamic_f("%s", e->name)
> > +				active(fd, e, 20, -1);
> >   		}
> >   	}
> > 
> 
> And finally, you can send this to upstream igt-dev in the next incarnation.
> 
> Regards,
> 
> Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
