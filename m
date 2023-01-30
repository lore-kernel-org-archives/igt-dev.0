Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47FD10E064
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jan 2023 17:29:34 +0000 (UTC)
Date: Mon, 30 Jan 2023 19:29:15 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Message-ID: <Y9f+a6WfaL6NIEuY@intel.com>
References: <20230127192220.10071-1-ville.syrjala@linux.intel.com>
 <20230130172404.fb35yqai3vvjyl5b@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130172404.fb35yqai3vvjyl5b@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] intel: Unify STORE_DWORD gen checks
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

On Mon, Jan 30, 2023 at 06:24:04PM +0100, Kamil Konieczny wrote:
> Hi Ville,
> 
> thank you for patches, I have few nits, see below.
> 
> On 2023-01-27 at 21:22:19 +0200, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > A bunch of tests use a lax 'gen<6' check to determine if
> > MI_STORE_DWORD needs a secure batch or not, while other
> > places use the more accurate gen==4||5 check. And that
> > check is also written in two different styles in various
> > places. Unify all of it to use a common helper.
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  lib/igt_dummyload.c            | 2 +-
> >  lib/igt_gt.c                   | 5 +++++
> >  lib/igt_gt.h                   | 1 +
> >  lib/igt_store.c                | 2 +-
> >  tests/i915/gem_ctx_shared.c    | 4 ++--
> >  tests/i915/gem_exec_async.c    | 2 +-
> >  tests/i915/gem_exec_capture.c  | 4 ++--
> >  tests/i915/gem_exec_fence.c    | 4 ++--
> >  tests/i915/gem_exec_flush.c    | 4 ++--
> >  tests/i915/gem_exec_gttfill.c  | 2 +-
> >  tests/i915/gem_exec_nop.c      | 4 ++--
> >  tests/i915/gem_exec_parallel.c | 2 +-
> >  tests/i915/gem_exec_params.c   | 2 +-
> >  tests/i915/gem_exec_reloc.c    | 7 +++++--
> >  tests/i915/gem_exec_schedule.c | 4 ++--
> >  tests/i915/gem_exec_store.c    | 6 +++---
> >  tests/i915/gem_exec_suspend.c  | 2 +-
> >  tests/i915/gem_exec_whisper.c  | 2 +-
> >  tests/i915/gem_ringfill.c      | 2 +-
> >  tests/i915/gem_softpin.c       | 4 ++--
> >  tests/i915/gem_sync.c          | 8 ++++----
> >  tests/i915/gem_userptr_blits.c | 4 ++--
> >  tests/i915/i915_module_load.c  | 2 +-
> >  tests/prime_vgem.c             | 2 +-
> 
> Looks like there are some more tests using I915_EXEC_SECURE:
> 
> tests/i915/gem_exec_big.c
> tests/i915/gem_exec_fair.c
> tests/i915/perf_pmu.c

I'm not sure why exactly they need secure batches. Would
need to actually figure out what they do first.

> 
> >  24 files changed, 45 insertions(+), 36 deletions(-)
> > 
> > diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> > index 5f3c6b10c7d5..dbf164421954 100644
> > --- a/lib/igt_dummyload.c
> > +++ b/lib/igt_dummyload.c
> > @@ -217,7 +217,7 @@ emit_recursive_batch(igt_spin_t *spin,
> >  	} else if (opts->flags & IGT_SPIN_POLL_RUN) {
> >  		igt_assert(!opts->dependency);
> >  
> > -		if (gen == 4 || gen == 5) {
> > +		if (gem_store_dword_needs_secure(gen)) {
> >  			execbuf->flags |= I915_EXEC_SECURE;
> >  			igt_require(__igt_device_set_master(fd) == 0);
> >  		}
> > diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> > index d4a825e6642e..f91c956e53d9 100644
> > --- a/lib/igt_gt.c
> > +++ b/lib/igt_gt.c
> > @@ -611,6 +611,11 @@ bool gem_can_store_dword(int fd, unsigned int engine)
> >  				gem_execbuf_flags_to_engine_class(engine));
> >  }
> >  
> 
> All public library functions should be described, please put it here.
> 
> Regards,
> Kamil
> 
> > +bool gem_store_dword_needs_secure(int gen)
> > +{
> > +	return gen == 4 || gen == 5;
> > +}
> > +
> >  const struct intel_execution_engine2 intel_execution_engines2[] = {
> >  	{ "rcs0", I915_ENGINE_CLASS_RENDER, 0, I915_EXEC_RENDER },
> >  	{ "bcs0", I915_ENGINE_CLASS_COPY, 0, I915_EXEC_BLT },
> > diff --git a/lib/igt_gt.h b/lib/igt_gt.h
> > index 3d10349e4621..3a60b3747ba5 100644
> > --- a/lib/igt_gt.h
> > +++ b/lib/igt_gt.h
> > @@ -73,6 +73,7 @@ unsigned intel_detect_and_clear_missed_interrupts(int fd);
> >  
> >  bool gem_can_store_dword(int fd, unsigned int engine);
> >  bool gem_class_can_store_dword(int fd, int class);
> > +bool gem_store_dword_needs_secure(int gen);
> >  
> >  extern const struct intel_execution_engine2 {
> >  	char name[16];
> > diff --git a/lib/igt_store.c b/lib/igt_store.c
> > index 98c6c4fbd192..fd8dd1dd664b 100644
> > --- a/lib/igt_store.c
> > +++ b/lib/igt_store.c
> > @@ -48,7 +48,7 @@ void igt_store_word(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
> >  		execbuf.flags |= I915_EXEC_FENCE_IN;
> >  		execbuf.rsvd2 = fence;
> >  	}
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  
> >  	memset(obj, 0, sizeof(obj));
> > diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> > index 18d8cc013d68..209377be1c84 100644
> > --- a/tests/i915/gem_ctx_shared.c
> > +++ b/tests/i915/gem_ctx_shared.c
> > @@ -327,7 +327,7 @@ static void exec_shared_gtt(int i915, const intel_ctx_cfg_t *cfg,
> >  	obj.handle = batch;
> >  	obj.offset += 8192; /* make sure we don't cause an eviction! */
> >  	execbuf.rsvd1 = ctx[1]->id;
> > -	if (gen > 3 && gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	gem_execbuf(i915, &execbuf);
> >  
> > @@ -528,7 +528,7 @@ static void store_dword(int i915, uint64_t ahnd, const intel_ctx_t *ctx,
> >  	execbuf.buffers_ptr = to_user_pointer(obj + !cork);
> >  	execbuf.buffer_count = 2 + !!cork;
> >  	execbuf.flags = ring;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > diff --git a/tests/i915/gem_exec_async.c b/tests/i915/gem_exec_async.c
> > index d50fe45ec57c..0d4efd736d71 100644
> > --- a/tests/i915/gem_exec_async.c
> > +++ b/tests/i915/gem_exec_async.c
> > @@ -44,7 +44,7 @@ static void store_dword(int fd, int id, const intel_ctx_t *ctx,
> >  	execbuf.buffers_ptr = to_user_pointer(obj);
> >  	execbuf.buffer_count = 2;
> >  	execbuf.flags = ring;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> > index 2db58266fd4e..9ecf2b546da0 100644
> > --- a/tests/i915/gem_exec_capture.c
> > +++ b/tests/i915/gem_exec_capture.c
> > @@ -346,7 +346,7 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
> >  	execbuf.buffers_ptr = (uintptr_t)obj;
> >  	execbuf.buffer_count = ARRAY_SIZE(obj);
> >  	execbuf.flags = e->flags;
> > -	if (gen > 3 && gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.flags |= I915_EXEC_FENCE_OUT;
> >  	execbuf.rsvd1 = ctx->id;
> > @@ -536,7 +536,7 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
> >  	execbuf.buffers_ptr = (uintptr_t)obj;
> >  	execbuf.buffer_count = count + 2;
> >  	execbuf.flags = e->flags;
> > -	if (gen > 3 && gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.flags |= I915_EXEC_FENCE_OUT;
> >  	execbuf.rsvd1 = ctx->id;
> > diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> > index 6bf1cdb57741..b713cb16d790 100644
> > --- a/tests/i915/gem_exec_fence.c
> > +++ b/tests/i915/gem_exec_fence.c
> > @@ -622,7 +622,7 @@ static void test_parallel(int i915, const intel_ctx_t *ctx,
> >  		batch[++i] = MI_BATCH_BUFFER_END;
> >  		gem_write(i915, obj[1].handle, 0, batch, sizeof(batch));
> >  
> > -		if (gen < 6)
> > +		if (gem_store_dword_needs_secure(gen))
> >  			execbuf.flags |= I915_EXEC_SECURE;
> >  
> >  		gem_execbuf(i915, &execbuf);
> > @@ -745,7 +745,7 @@ static void test_concurrent(int i915, const intel_ctx_t *ctx,
> >  	tmp_ctx = intel_ctx_create(i915, &ctx->cfg);
> >  	execbuf.rsvd1 = tmp_ctx->id;
> >  	execbuf.rsvd2 = spin->out_fence;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  
> >  	gem_execbuf(i915, &execbuf);
> > diff --git a/tests/i915/gem_exec_flush.c b/tests/i915/gem_exec_flush.c
> > index 40c58db2bb7d..b41eafcd07c5 100644
> > --- a/tests/i915/gem_exec_flush.c
> > +++ b/tests/i915/gem_exec_flush.c
> > @@ -168,7 +168,7 @@ static void run(int fd, unsigned ring, int nchild, int timeout,
> >  		execbuf.buffers_ptr = to_user_pointer(obj);
> >  		execbuf.buffer_count = 3;
> >  		execbuf.flags = ring | (1 << 12);
> > -		if (gen < 6)
> > +		if (gem_store_dword_needs_secure(gen))
> >  			execbuf.flags |= I915_EXEC_SECURE;
> >  
> >  		obj[1].handle = gem_create(fd, 1024*64);
> > @@ -414,7 +414,7 @@ static void batch(int fd, unsigned ring, int nchild, int timeout,
> >  		execbuf.buffers_ptr = to_user_pointer(obj);
> >  		execbuf.buffer_count = 2;
> >  		execbuf.flags = ring | (1 << 12);
> > -		if (gen < 6)
> > +		if (gem_store_dword_needs_secure(gen))
> >  			execbuf.flags |= I915_EXEC_SECURE;
> >  
> >  		obj[1].handle = gem_create(fd, 64<<10);
> > diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
> > index 137277fe5313..d647f544e446 100644
> > --- a/tests/i915/gem_exec_gttfill.c
> > +++ b/tests/i915/gem_exec_gttfill.c
> > @@ -166,7 +166,7 @@ static void fillgtt(int fd, const intel_ctx_t *ctx, unsigned ring, int timeout)
> >  
> >  	memset(&execbuf, 0, sizeof(execbuf));
> >  	execbuf.buffer_count = 1;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
> > index f35cc8401f91..f11a1dd92679 100644
> > --- a/tests/i915/gem_exec_nop.c
> > +++ b/tests/i915/gem_exec_nop.c
> > @@ -120,7 +120,7 @@ static void poll_ring(int fd, const intel_ctx_t *ctx,
> >  	uint64_t elapsed;
> >  
> >  	flags = I915_EXEC_NO_RELOC;
> > -	if (gen == 4 || gen == 5)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		flags |= I915_EXEC_SECURE;
> >  
> >  	igt_require(gem_class_can_store_dword(fd, e->class));
> > @@ -234,7 +234,7 @@ static void poll_sequential(int fd, const intel_ctx_t *ctx,
> >  	bool cached;
> >  
> >  	flags = I915_EXEC_NO_RELOC;
> > -	if (gen == 4 || gen == 5)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		flags |= I915_EXEC_SECURE;
> >  
> >  	nengine = 0;
> > diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
> > index 429620884b1f..7676244568a7 100644
> > --- a/tests/i915/gem_exec_parallel.c
> > +++ b/tests/i915/gem_exec_parallel.c
> > @@ -127,7 +127,7 @@ static void *thread(void *data)
> >  	execbuf.flags = t->engine;
> >  	execbuf.flags |= I915_EXEC_HANDLE_LUT;
> >  	execbuf.flags |= I915_EXEC_NO_RELOC;
> > -	if (t->gen < 6)
> > +	if (t->gen == 4 || t->gen == 5)
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	if (t->flags & (CONTEXTS | FDS)) {
> >  		tmp_ctx = intel_ctx_create(fd, &t->ctx->cfg);
> > diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
> > index 618635ec38fb..909c6b7daf44 100644
> > --- a/tests/i915/gem_exec_params.c
> > +++ b/tests/i915/gem_exec_params.c
> > @@ -171,7 +171,7 @@ static void test_batch_first(int fd)
> >  	memset(&execbuf, 0, sizeof(execbuf));
> >  	execbuf.buffers_ptr = to_user_pointer(obj);
> >  	execbuf.buffer_count = ARRAY_SIZE(obj);
> > -	if (gen > 3 && gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  
> >  	/* Normal mode */
> > diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
> > index 7a354a32a1a0..eefc10f1f136 100644
> > --- a/tests/i915/gem_exec_reloc.c
> > +++ b/tests/i915/gem_exec_reloc.c
> > @@ -307,7 +307,7 @@ static void active(int fd, const intel_ctx_t *ctx, unsigned engine)
> >  	memset(&execbuf, 0, sizeof(execbuf));
> >  	execbuf.buffers_ptr = to_user_pointer(obj);
> >  	execbuf.buffer_count = 2;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > @@ -732,7 +732,7 @@ static void concurrent_child(int i915, const intel_ctx_t *ctx,
> >  	struct drm_i915_gem_execbuffer2 execbuf = {
> >  		.buffers_ptr = to_user_pointer(obj),
> >  		.buffer_count = ARRAY_SIZE(obj),
> > -		.flags = e->flags | I915_EXEC_HANDLE_LUT | (gen < 6 ? I915_EXEC_SECURE : 0),
> > +		.flags = e->flags | I915_EXEC_HANDLE_LUT,
> >  		.rsvd1 = ctx->id,
> >  	};
> >  	uint32_t *batch = &obj[num_common + 1].handle;
> > @@ -740,6 +740,9 @@ static void concurrent_child(int i915, const intel_ctx_t *ctx,
> >  	uint32_t *x;
> >  	int err = 0;
> >  
> > +	if (gem_store_dword_needs_secure(gen))
> > +		execbuf.flags |= I915_EXEC_SECURE;
> > +
> >  	memset(obj, 0, sizeof(obj));
> >  	obj[0].handle = gem_create(i915, 64 * CONCURRENT * 4);
> >  
> > diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> > index 58b118c79ea1..2fdc1ea0e786 100644
> > --- a/tests/i915/gem_exec_schedule.c
> > +++ b/tests/i915/gem_exec_schedule.c
> > @@ -108,7 +108,7 @@ static uint32_t __store_dword(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
> >  	execbuf.buffers_ptr = to_user_pointer(obj + !cork);
> >  	execbuf.buffer_count = 2 + !!cork;
> >  	execbuf.flags = ring;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > @@ -2257,7 +2257,7 @@ static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
> >  	execbuf.buffers_ptr = to_user_pointer(obj);
> >  	execbuf.buffer_count = ARRAY_SIZE(obj);
> >  	execbuf.flags = ring;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  
> >  	execbuf.flags |= I915_EXEC_FENCE_IN;
> > diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
> > index efb9907ebb2a..ec4f0bc9338e 100644
> > --- a/tests/i915/gem_exec_store.c
> > +++ b/tests/i915/gem_exec_store.c
> > @@ -58,7 +58,7 @@ static void store_dword(int fd, const intel_ctx_t *ctx,
> >  	execbuf.buffers_ptr = to_user_pointer(obj);
> >  	execbuf.buffer_count = 2;
> >  	execbuf.flags = e->flags;
> > -	if (gen > 3 && gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > @@ -143,7 +143,7 @@ static void store_cachelines(int fd, const intel_ctx_t *ctx,
> >  	memset(&execbuf, 0, sizeof(execbuf));
> >  	execbuf.buffer_count = flags & PAGES ? NCACHELINES + 1 : 2;
> >  	execbuf.flags = e->flags;
> > -	if (gen > 3 && gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > @@ -255,7 +255,7 @@ static void store_all(int fd, const intel_ctx_t *ctx)
> >  	memset(&execbuf, 0, sizeof(execbuf));
> >  	execbuf.buffers_ptr = to_user_pointer(obj);
> >  	execbuf.buffer_count = 2;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
> > index 3b59966a11d1..e14df2ad1509 100644
> > --- a/tests/i915/gem_exec_suspend.c
> > +++ b/tests/i915/gem_exec_suspend.c
> > @@ -110,7 +110,7 @@ static void run_test(int fd, const intel_ctx_t *ctx,
> >  	execbuf.buffers_ptr = to_user_pointer(obj);
> >  	execbuf.buffer_count = 2;
> >  	execbuf.flags = 1 << 11;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
> > index 616231aa9667..5a1a4fa9a074 100644
> > --- a/tests/i915/gem_exec_whisper.c
> > +++ b/tests/i915/gem_exec_whisper.c
> > @@ -297,7 +297,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
> >  			execbuf.buffer_count = 2;
> >  			execbuf.flags = I915_EXEC_HANDLE_LUT;
> >  			execbuf.flags |= I915_EXEC_NO_RELOC;
> > -			if (gen < 6)
> > +			if (gem_store_dword_needs_secure(gen))
> >  				execbuf.flags |= I915_EXEC_SECURE;
> >  
> >  			execbuf.rsvd1 = ctx->id;
> > diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
> > index 8ab00525ff28..50d0c6179db1 100644
> > --- a/tests/i915/gem_ringfill.c
> > +++ b/tests/i915/gem_ringfill.c
> > @@ -116,7 +116,7 @@ static void setup_execbuf(int fd, const intel_ctx_t *ctx,
> >  	execbuf->buffers_ptr = to_user_pointer(obj);
> >  	execbuf->flags = ring | I915_EXEC_NO_RELOC | I915_EXEC_HANDLE_LUT;
> >  
> > -	if (gen > 3 && gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf->flags |= I915_EXEC_SECURE;
> >  
> >  	execbuf->rsvd1 = ctx->id;
> > diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> > index ad6d3f531c5f..f90526bffc92 100644
> > --- a/tests/i915/gem_softpin.c
> > +++ b/tests/i915/gem_softpin.c
> > @@ -631,7 +631,7 @@ static void test_noreloc(int fd, enum sleep sleep, unsigned flags)
> >  	memset(&execbuf, 0, sizeof(execbuf));
> >  	execbuf.buffers_ptr = to_user_pointer(object);
> >  	execbuf.buffer_count = 1;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	gem_execbuf(fd, &execbuf);
> >  	gem_close(fd, object[0].handle);
> > @@ -1004,7 +1004,7 @@ static void test_allocator_evict(int fd, const intel_ctx_t *ctx,
> >  
> >  	memset(&execbuf, 0, sizeof(execbuf));
> >  	execbuf.buffer_count = 1;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> > index 07cabf7abcd0..e04038c55c53 100644
> > --- a/tests/i915/gem_sync.c
> > +++ b/tests/i915/gem_sync.c
> > @@ -554,7 +554,7 @@ store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
> >  		execbuf.flags = ied_flags(&ied, child);
> >  		execbuf.flags |= I915_EXEC_NO_RELOC;
> >  		execbuf.flags |= I915_EXEC_HANDLE_LUT;
> > -		if (gen < 6)
> > +		if (gem_store_dword_needs_secure(gen))
> >  			execbuf.flags |= I915_EXEC_SECURE;
> >  		execbuf.rsvd1 = ctx->id;
> >  
> > @@ -663,7 +663,7 @@ switch_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
> >  			c->execbuf.flags = ied_flags(&ied, child);
> >  			c->execbuf.flags |= I915_EXEC_NO_RELOC;
> >  			c->execbuf.flags |= I915_EXEC_HANDLE_LUT;
> > -			if (gen < 6)
> > +			if (gem_store_dword_needs_secure(gen))
> >  				c->execbuf.flags |= I915_EXEC_SECURE;
> >  
> >  			c->ctx = intel_ctx_create(fd, &ctx->cfg);
> > @@ -831,7 +831,7 @@ __store_many(int fd, const intel_ctx_t *ctx, unsigned ring,
> >  	execbuf.flags = ring;
> >  	execbuf.flags |= I915_EXEC_NO_RELOC;
> >  	execbuf.flags |= I915_EXEC_HANDLE_LUT;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > @@ -1046,7 +1046,7 @@ store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
> >  		execbuf.buffers_ptr = to_user_pointer(object);
> >  		execbuf.flags |= I915_EXEC_NO_RELOC;
> >  		execbuf.flags |= I915_EXEC_HANDLE_LUT;
> > -		if (gen < 6)
> > +		if (gem_store_dword_needs_secure(gen))
> >  			execbuf.flags |= I915_EXEC_SECURE;
> >  		execbuf.rsvd1 = ctx->id;
> >  
> > diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
> > index 6985086694c4..83048ab3fe6e 100644
> > --- a/tests/i915/gem_userptr_blits.c
> > +++ b/tests/i915/gem_userptr_blits.c
> > @@ -285,7 +285,7 @@ static void store_dword(int fd, uint32_t target,
> >  	execbuf.buffers_ptr = to_user_pointer(obj);
> >  	execbuf.buffer_count = ARRAY_SIZE(obj);
> >  	execbuf.flags = 0;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  
> >  	memset(obj, 0, sizeof(obj));
> > @@ -1266,7 +1266,7 @@ static void store_dword_rand(int i915, const intel_ctx_t *ctx,
> >  	exec.buffer_count = 2;
> >  	exec.buffers_ptr = to_user_pointer(obj);
> >  	exec.flags = engine;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		exec.flags |= I915_EXEC_SECURE;
> >  	exec.rsvd1 = ctx->id;
> >  
> > diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
> > index d3a86b113317..a3300c0d7ff2 100644
> > --- a/tests/i915/i915_module_load.c
> > +++ b/tests/i915/i915_module_load.c
> > @@ -128,7 +128,7 @@ static void store_all(int i915)
> >  		batch[value] = nengine;
> >  
> >  		execbuf.flags = e->flags;
> > -		if (gen < 6)
> > +		if (gem_store_dword_needs_secure(gen))
> >  			execbuf.flags |= I915_EXEC_SECURE;
> >  		execbuf.flags |= I915_EXEC_NO_RELOC | I915_EXEC_HANDLE_LUT;
> >  		execbuf.rsvd1 = ctx->id;
> > diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> > index 06be273c0b6f..36a10b177517 100644
> > --- a/tests/prime_vgem.c
> > +++ b/tests/prime_vgem.c
> > @@ -593,7 +593,7 @@ static void work(int i915, uint64_t ahnd, uint64_t scratch_offset, int dmabuf,
> >  	execbuf.buffers_ptr = (uintptr_t)obj;
> >  	execbuf.buffer_count = 2;
> >  	execbuf.flags = ring;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(gen))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > -- 
> > 2.39.1
> > 

-- 
Ville Syrjälä
Intel
