Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60F86EA7E
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 16:10:41 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j5so22890738wrn.4
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 09:10:41 -0700 (PDT)
Date: Thu, 15 Apr 2021 18:10:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YHhlflWm1ptdgfbx@phenom.ffwll.local>
References: <20210413035350.261794-1-jason@jlekstrand.net>
 <20210413035350.261794-15-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413035350.261794-15-jason@jlekstrand.net>
Subject: Re: [igt-dev] [PATCH i-g-t 14/74] lib/igt_spin: Rename
 igt_spin_factory::ctx to ctx_id
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
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 10:52:50PM -0500, Jason Ekstrand wrote:

+sob = Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  lib/igt_dummyload.c            |  6 +++---
>  lib/igt_dummyload.h            |  2 +-
>  lib/igt_gt.c                   |  2 +-
>  tests/i915/gem_ctx_engines.c   |  6 +++---
>  tests/i915/gem_ctx_exec.c      |  2 +-
>  tests/i915/gem_ctx_isolation.c | 18 +++++++++---------
>  tests/i915/gem_ctx_shared.c    | 16 ++++++++--------
>  tests/i915/gem_eio.c           |  2 +-
>  tests/i915/gem_exec_balancer.c | 26 +++++++++++++-------------
>  tests/i915/gem_exec_latency.c  |  2 +-
>  tests/i915/gem_exec_nop.c      |  2 +-
>  tests/i915/gem_exec_schedule.c | 26 +++++++++++++-------------
>  tests/i915/gem_spin_batch.c    |  2 +-
>  tests/i915/gem_sync.c          |  2 +-
>  tests/i915/gem_vm_create.c     |  4 ++--
>  tests/i915/gem_watchdog.c      |  2 +-
>  tests/i915/gem_workarounds.c   |  2 +-
>  tests/i915/perf_pmu.c          |  4 ++--
>  18 files changed, 63 insertions(+), 63 deletions(-)
> 
> diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> index 34ad9221..5a11ec4e 100644
> --- a/lib/igt_dummyload.c
> +++ b/lib/igt_dummyload.c
> @@ -127,7 +127,7 @@ emit_recursive_batch(igt_spin_t *spin,
>  	if (opts->engine == ALL_ENGINES) {
>  		struct intel_execution_engine2 *engine;
>  
> -		for_each_context_engine(fd, opts->ctx, engine) {
> +		for_each_context_engine(fd, opts->ctx_id, engine) {
>  			if (opts->flags & IGT_SPIN_POLL_RUN &&
>  			    !gem_class_can_store_dword(fd, engine->class))
>  				continue;
> @@ -325,7 +325,7 @@ emit_recursive_batch(igt_spin_t *spin,
>  
>  	execbuf->buffers_ptr =
>  	       	to_user_pointer(obj + (2 - execbuf->buffer_count));
> -	execbuf->rsvd1 = opts->ctx;
> +	execbuf->rsvd1 = opts->ctx_id;
>  
>  	if (opts->flags & IGT_SPIN_FENCE_OUT)
>  		execbuf->flags |= I915_EXEC_FENCE_OUT;
> @@ -423,7 +423,7 @@ igt_spin_factory(int fd, const struct igt_spin_factory *opts)
>  		int class;
>  
>  		if (!gem_context_lookup_engine(fd, opts->engine,
> -					       opts->ctx, &e)) {
> +					       opts->ctx_id, &e)) {
>  			class = e.class;
>  		} else {
>  			gem_require_ring(fd, opts->engine);
> diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
> index a75fcdeb..aee72da8 100644
> --- a/lib/igt_dummyload.h
> +++ b/lib/igt_dummyload.h
> @@ -60,7 +60,7 @@ typedef struct igt_spin {
>  } igt_spin_t;
>  
>  struct igt_spin_factory {
> -	uint32_t ctx;
> +	uint32_t ctx_id;
>  	uint32_t dependency;
>  	unsigned int engine;
>  	unsigned int flags;
> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> index f601d726..4981ef26 100644
> --- a/lib/igt_gt.c
> +++ b/lib/igt_gt.c
> @@ -298,7 +298,7 @@ igt_hang_t igt_hang_ctx(int fd, uint32_t ctx, int ring, unsigned flags)
>  		context_set_ban(fd, ctx, 0);
>  
>  	spin = __igt_spin_new(fd,
> -			      .ctx = ctx,
> +			      .ctx_id = ctx,
>  			      .engine = ring,
>  			      .flags = IGT_SPIN_NO_PREEMPTION);
>  
> diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
> index 643a0b2f..058b2cc2 100644
> --- a/tests/i915/gem_ctx_engines.c
> +++ b/tests/i915/gem_ctx_engines.c
> @@ -336,7 +336,7 @@ static void execute_one(int i915)
>  	igt_spin_t *spin;
>  
>  	/* Prewarm the spinner */
> -	spin = igt_spin_new(i915, .ctx = param.ctx_id,
> +	spin = igt_spin_new(i915, .ctx_id = param.ctx_id,
>  			    .flags = (IGT_SPIN_NO_PREEMPTION |
>  				      IGT_SPIN_POLL_RUN));
>  
> @@ -439,7 +439,7 @@ static void execute_oneforall(int i915)
>  			igt_spin_t *spin;
>  
>  			spin = __igt_spin_new(i915,
> -					      .ctx = param.ctx_id,
> +					      .ctx_id = param.ctx_id,
>  					      .engine = i);
>  
>  			busy.handle = spin->handle;
> @@ -480,7 +480,7 @@ static void execute_allforone(int i915)
>  		igt_spin_t *spin;
>  
>  		spin = __igt_spin_new(i915,
> -				      .ctx = param.ctx_id,
> +				      .ctx_id = param.ctx_id,
>  				      .engine = i++);
>  
>  		busy.handle = spin->handle;
> diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
> index 89776185..03c66bf7 100644
> --- a/tests/i915/gem_ctx_exec.c
> +++ b/tests/i915/gem_ctx_exec.c
> @@ -184,7 +184,7 @@ static void norecovery(int i915)
>  		igt_assert_eq(param.value, pass);
>  
>  		spin = __igt_spin_new(i915,
> -				      .ctx = param.ctx_id,
> +				      .ctx_id = param.ctx_id,
>  				      .flags = IGT_SPIN_POLL_RUN);
>  		igt_spin_busywait_until_started(spin);
>  
> diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
> index 4f174268..a57a6637 100644
> --- a/tests/i915/gem_ctx_isolation.c
> +++ b/tests/i915/gem_ctx_isolation.c
> @@ -629,7 +629,7 @@ static void nonpriv(int fd,
>  
>  		tmpl_regs(fd, ctx, e, tmpl, values[v]);
>  
> -		spin = igt_spin_new(fd, .ctx = ctx, .engine = e->flags);
> +		spin = igt_spin_new(fd, .ctx_id = ctx, .engine = e->flags);
>  
>  		igt_debug("%s[%d]: Setting all registers to 0x%08x\n",
>  			  __func__, v, values[v]);
> @@ -641,12 +641,12 @@ static void nonpriv(int fd,
>  
>  			/* Explicit sync to keep the switch between write/read */
>  			syncpt = igt_spin_new(fd,
> -					      .ctx = ctx,
> +					      .ctx_id = ctx,
>  					      .engine = e->flags,
>  					      .flags = IGT_SPIN_FENCE_OUT);
>  
>  			dirt = igt_spin_new(fd,
> -					    .ctx = sw,
> +					    .ctx_id = sw,
>  					    .engine = e->flags,
>  					    .fence = syncpt->out_fence,
>  					    .flags = (IGT_SPIN_FENCE_IN |
> @@ -654,7 +654,7 @@ static void nonpriv(int fd,
>  			igt_spin_free(fd, syncpt);
>  
>  			syncpt = igt_spin_new(fd,
> -					      .ctx = ctx,
> +					      .ctx_id = ctx,
>  					      .engine = e->flags,
>  					      .fence = dirt->out_fence,
>  					      .flags = IGT_SPIN_FENCE_IN);
> @@ -708,7 +708,7 @@ static void isolation(int fd,
>  		ctx[0] = gem_context_clone_with_engines(fd, 0);
>  		regs[0] = read_regs(fd, ctx[0], e, flags);
>  
> -		spin = igt_spin_new(fd, .ctx = ctx[0], .engine = e->flags);
> +		spin = igt_spin_new(fd, .ctx_id = ctx[0], .engine = e->flags);
>  
>  		if (flags & DIRTY1) {
>  			igt_debug("%s[%d]: Setting all registers of ctx 0 to 0x%08x\n",
> @@ -776,7 +776,7 @@ static uint32_t create_reset_context(int i915)
>  static void inject_reset_context(int fd, const struct intel_execution_engine2 *e)
>  {
>  	struct igt_spin_factory opts = {
> -		.ctx = create_reset_context(fd),
> +		.ctx_id = create_reset_context(fd),
>  		.engine = e->flags,
>  		.flags = IGT_SPIN_FAST,
>  	};
> @@ -801,7 +801,7 @@ static void inject_reset_context(int fd, const struct intel_execution_engine2 *e
>  	igt_force_gpu_reset(fd);
>  
>  	igt_spin_free(fd, spin);
> -	gem_context_destroy(fd, opts.ctx);
> +	gem_context_destroy(fd, opts.ctx_id);
>  }
>  
>  static void preservation(int fd,
> @@ -825,7 +825,7 @@ static void preservation(int fd,
>  	gem_quiescent_gpu(fd);
>  
>  	ctx[num_values] = gem_context_clone_with_engines(fd, 0);
> -	spin = igt_spin_new(fd, .ctx = ctx[num_values], .engine = e->flags);
> +	spin = igt_spin_new(fd, .ctx_id = ctx[num_values], .engine = e->flags);
>  	regs[num_values][0] = read_regs(fd, ctx[num_values], e, flags);
>  	for (int v = 0; v < num_values; v++) {
>  		ctx[v] = gem_context_clone_with_engines(fd, 0);
> @@ -865,7 +865,7 @@ static void preservation(int fd,
>  		break;
>  	}
>  
> -	spin = igt_spin_new(fd, .ctx = ctx[num_values], .engine = e->flags);
> +	spin = igt_spin_new(fd, .ctx_id = ctx[num_values], .engine = e->flags);
>  	for (int v = 0; v < num_values; v++)
>  		regs[v][1] = read_regs(fd, ctx[v], e, flags);
>  	regs[num_values][1] = read_regs(fd, ctx[num_values], e, flags);
> diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> index 6b21994d..e3e8a9be 100644
> --- a/tests/i915/gem_ctx_shared.c
> +++ b/tests/i915/gem_ctx_shared.c
> @@ -124,8 +124,8 @@ static void disjoint_timelines(int i915)
>  	child = gem_context_clone(i915, 0, I915_CONTEXT_CLONE_VM, 0);
>  	plug = igt_cork_plug(&cork, i915);
>  
> -	spin[0] = __igt_spin_new(i915, .ctx = 0, .dependency = plug);
> -	spin[1] = __igt_spin_new(i915, .ctx = child);
> +	spin[0] = __igt_spin_new(i915, .ctx_id = 0, .dependency = plug);
> +	spin[1] = __igt_spin_new(i915, .ctx_id = child);
>  
>  	/* Wait for the second spinner, will hang if stuck behind the first */
>  	igt_spin_end(spin[1]);
> @@ -388,7 +388,7 @@ static void exec_single_timeline(int i915, unsigned int engine)
>  			continue;
>  
>  		if (spin == NULL) {
> -			spin = __igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
> +			spin = __igt_spin_new(i915, .ctx_id = ctx, .engine = e->flags);
>  		} else {
>  			struct drm_i915_gem_execbuffer2 execbuf = {
>  				.buffers_ptr = spin->execbuf.buffers_ptr,
> @@ -416,7 +416,7 @@ static void exec_single_timeline(int i915, unsigned int engine)
>  			continue;
>  
>  		if (spin == NULL) {
> -			spin = __igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
> +			spin = __igt_spin_new(i915, .ctx_id = ctx, .engine = e->flags);
>  		} else {
>  			struct drm_i915_gem_execbuffer2 execbuf = {
>  				.buffers_ptr = spin->execbuf.buffers_ptr,
> @@ -510,11 +510,11 @@ static void unplug_show_queue(int i915, struct igt_cork *c, unsigned int engine)
>  
>  	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
>  		const struct igt_spin_factory opts = {
> -			.ctx = create_highest_priority(i915),
> +			.ctx_id = create_highest_priority(i915),
>  			.engine = engine,
>  		};
>  		spin[n] = __igt_spin_factory(i915, &opts);
> -		gem_context_destroy(i915, opts.ctx);
> +		gem_context_destroy(i915, opts.ctx_id);
>  	}
>  
>  	igt_cork_unplug(c); /* batches will now be queued on the engine */
> @@ -592,11 +592,11 @@ static void independent(int i915,
>  
>  	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
>  		const struct igt_spin_factory opts = {
> -			.ctx = create_highest_priority(i915),
> +			.ctx_id = create_highest_priority(i915),
>  			.engine = e->flags,
>  		};
>  		spin[n] = __igt_spin_factory(i915, &opts);
> -		gem_context_destroy(i915, opts.ctx);
> +		gem_context_destroy(i915, opts.ctx_id);
>  	}
>  
>  	fence = igt_cork_plug(&cork, i915);
> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
> index d86ccf2b..0036c4aa 100644
> --- a/tests/i915/gem_eio.c
> +++ b/tests/i915/gem_eio.c
> @@ -176,7 +176,7 @@ static int __gem_wait(int fd, uint32_t handle, int64_t timeout)
>  static igt_spin_t * __spin_poll(int fd, uint32_t ctx, unsigned long flags)
>  {
>  	struct igt_spin_factory opts = {
> -		.ctx = ctx,
> +		.ctx_id = ctx,
>  		.engine = flags,
>  		.flags = IGT_SPIN_NO_PREEMPTION | IGT_SPIN_FENCE_OUT,
>  	};
> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> index bfd65b29..c1b64578 100644
> --- a/tests/i915/gem_exec_balancer.c
> +++ b/tests/i915/gem_exec_balancer.c
> @@ -530,7 +530,7 @@ static void check_individual_engine(int i915,
>  			     I915_PMU_ENGINE_BUSY(ci[idx].engine_class,
>  						  ci[idx].engine_instance));
>  
> -	spin = igt_spin_new(i915, .ctx = ctx, .engine = idx + 1);
> +	spin = igt_spin_new(i915, .ctx_id = ctx, .engine = idx + 1);
>  	load = measure_load(pmu, 10000);
>  	igt_spin_free(i915, spin);
>  
> @@ -659,13 +659,13 @@ static void bonded(int i915, unsigned int flags)
>  			plug = NULL;
>  			if (flags & CORK) {
>  				plug = __igt_spin_new(i915,
> -						      .ctx = master,
> +						      .ctx_id = master,
>  						      .engine = bond,
>  						      .dependency = igt_cork_plug(&cork, i915));
>  			}
>  
>  			spin = __igt_spin_new(i915,
> -					      .ctx = master,
> +					      .ctx_id = master,
>  					      .engine = bond,
>  					      .flags = IGT_SPIN_FENCE_OUT);
>  
> @@ -806,7 +806,7 @@ static void bonded_slice(int i915)
>  		set_load_balancer(i915, ctx, siblings, count, NULL);
>  
>  		spin = __igt_spin_new(i915,
> -				      .ctx = ctx,
> +				      .ctx_id = ctx,
>  				      .flags = (IGT_SPIN_NO_PREEMPTION |
>  						IGT_SPIN_POLL_RUN));
>  		igt_spin_end(spin); /* we just want its address for later */
> @@ -831,7 +831,7 @@ static void bonded_slice(int i915)
>  
>  			while (!READ_ONCE(*stop)) {
>  				spin = igt_spin_new(i915,
> -						    .ctx = ctx,
> +						    .ctx_id = ctx,
>  						    .engine = (1 + rand() % count),
>  						    .flags = IGT_SPIN_POLL_RUN);
>  				igt_spin_busywait_until_started(spin);
> @@ -892,7 +892,7 @@ static void __bonded_chain(int i915, uint32_t ctx,
>  		if (priorities[i] < 0)
>  			gem_context_set_priority(i915, ctx, priorities[i]);
>  		spin = igt_spin_new(i915,
> -				    .ctx = ctx,
> +				    .ctx_id = ctx,
>  				    .engine = 1,
>  				    .flags = (IGT_SPIN_POLL_RUN |
>  					      IGT_SPIN_FENCE_OUT));
> @@ -971,7 +971,7 @@ static void __bonded_chain_inv(int i915, uint32_t ctx,
>  		if (priorities[i] < 0)
>  			gem_context_set_priority(i915, ctx, priorities[i]);
>  		spin = igt_spin_new(i915,
> -				    .ctx = ctx,
> +				    .ctx_id = ctx,
>  				    .engine = 1,
>  				    .flags = (IGT_SPIN_POLL_RUN |
>  					      IGT_SPIN_FENCE_OUT));
> @@ -1838,7 +1838,7 @@ static void __bonded_early(int i915, uint32_t ctx,
>  
>  	/* A: spin forever on engine 1 */
>  	spin = igt_spin_new(i915,
> -			    .ctx = ctx,
> +			    .ctx_id = ctx,
>  			    .engine = (flags & VIRTUAL_ENGINE) ? 0 : 1,
>  			    .flags = IGT_SPIN_NO_PREEMPTION);
>  
> @@ -1953,10 +1953,10 @@ static void busy(int i915)
>  		free(ci);
>  
>  		spin[0] = __igt_spin_new(i915,
> -					 .ctx = ctx,
> +					 .ctx_id = ctx,
>  					 .flags = IGT_SPIN_POLL_RUN);
>  		spin[1] = __igt_spin_new(i915,
> -					 .ctx = ctx,
> +					 .ctx_id = ctx,
>  					 .dependency = scratch);
>  
>  		igt_spin_busywait_until_started(spin[0]);
> @@ -2055,7 +2055,7 @@ static void full(int i915, unsigned int flags)
>  			ctx = load_balancer_create(i915, ci, count);
>  
>  			if (spin == NULL) {
> -				spin = __igt_spin_new(i915, .ctx = ctx);
> +				spin = __igt_spin_new(i915, .ctx_id = ctx);
>  			} else {
>  				struct drm_i915_gem_execbuffer2 eb = {
>  					.buffers_ptr = spin->execbuf.buffers_ptr,
> @@ -2602,7 +2602,7 @@ static void semaphore(int i915)
>  		for (int i = 0; i < count; i++) {
>  			set_load_balancer(i915, block[i], ci, count, NULL);
>  			spin[i] = __igt_spin_new(i915,
> -						 .ctx = block[i],
> +						 .ctx_id = block[i],
>  						 .dependency = scratch);
>  		}
>  
> @@ -2919,7 +2919,7 @@ static void __fairslice(int i915,
>  	for (int i = 0; i < ARRAY_SIZE(ctx); i++) {
>  		ctx[i] = load_balancer_create(i915, ci, count);
>  		if (spin == NULL) {
> -			spin = __igt_spin_new(i915, .ctx = ctx[i]);
> +			spin = __igt_spin_new(i915, .ctx_id = ctx[i]);
>  		} else {
>  			struct drm_i915_gem_execbuffer2 eb = {
>  				.buffer_count = 1,
> diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
> index 8ba924b8..e6466965 100644
> --- a/tests/i915/gem_exec_latency.c
> +++ b/tests/i915/gem_exec_latency.c
> @@ -318,7 +318,7 @@ static void latency_from_ring(int fd,
>  
>  		if (flags & PREEMPT)
>  			spin = __igt_spin_new(fd,
> -					      .ctx = ctx[0],
> +					      .ctx_id = ctx[0],
>  					      .engine = e->flags);
>  
>  		if (flags & CORK) {
> diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
> index 62554ecb..f24ff88f 100644
> --- a/tests/i915/gem_exec_nop.c
> +++ b/tests/i915/gem_exec_nop.c
> @@ -917,7 +917,7 @@ static void preempt(int fd, uint32_t handle,
>  	intel_detect_and_clear_missed_interrupts(fd);
>  
>  	count = 0;
> -	spin = __igt_spin_new(fd, .ctx = ctx[0], .engine = e->flags);
> +	spin = __igt_spin_new(fd, .ctx_id = ctx[0], .engine = e->flags);
>  	clock_gettime(CLOCK_MONOTONIC, &start);
>  	do {
>  		gem_execbuf(fd, &execbuf);
> diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> index 9585059d..f84967c7 100644
> --- a/tests/i915/gem_exec_schedule.c
> +++ b/tests/i915/gem_exec_schedule.c
> @@ -205,11 +205,11 @@ static void unplug_show_queue(int fd, struct igt_cork *c, unsigned int engine)
>  
>  	for (int n = 0; n < max; n++) {
>  		const struct igt_spin_factory opts = {
> -			.ctx = create_highest_priority(fd),
> +			.ctx_id = create_highest_priority(fd),
>  			.engine = engine,
>  		};
>  		spin[n] = __igt_spin_factory(fd, &opts);
> -		gem_context_destroy(fd, opts.ctx);
> +		gem_context_destroy(fd, opts.ctx_id);
>  	}
>  
>  	igt_cork_unplug(c); /* batches will now be queued on the engine */
> @@ -639,7 +639,7 @@ static void lateslice(int i915, unsigned int engine, unsigned long flags)
>  	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
>  
>  	ctx = gem_context_create(i915);
> -	spin[0] = igt_spin_new(i915, .ctx = ctx, .engine = engine,
> +	spin[0] = igt_spin_new(i915, .ctx_id = ctx, .engine = engine,
>  			       .flags = (IGT_SPIN_POLL_RUN |
>  					 IGT_SPIN_FENCE_OUT |
>  					 flags));
> @@ -648,7 +648,7 @@ static void lateslice(int i915, unsigned int engine, unsigned long flags)
>  	igt_spin_busywait_until_started(spin[0]);
>  
>  	ctx = gem_context_create(i915);
> -	spin[1] = igt_spin_new(i915, .ctx = ctx, .engine = engine,
> +	spin[1] = igt_spin_new(i915, .ctx_id = ctx, .engine = engine,
>  			       .fence = spin[0]->out_fence,
>  			       .flags = (IGT_SPIN_POLL_RUN |
>  					 IGT_SPIN_FENCE_IN |
> @@ -665,7 +665,7 @@ static void lateslice(int i915, unsigned int engine, unsigned long flags)
>  	 */
>  
>  	ctx = gem_context_create(i915);
> -	spin[2] = igt_spin_new(i915, .ctx = ctx, .engine = engine,
> +	spin[2] = igt_spin_new(i915, .ctx_id = ctx, .engine = engine,
>  			       .flags = IGT_SPIN_POLL_RUN | flags);
>  	gem_context_destroy(i915, ctx);
>  
> @@ -765,7 +765,7 @@ static void submit_slice(int i915,
>  		engines.engines[0].engine_class = e->class;
>  		engines.engines[0].engine_instance = e->instance;
>  		gem_context_set_param(i915, &param);
> -		spin = igt_spin_new(i915, .ctx = param.ctx_id,
> +		spin = igt_spin_new(i915, .ctx_id = param.ctx_id,
>  				    .fence = fence,
>  				    .flags =
>  				    IGT_SPIN_POLL_RUN |
> @@ -909,7 +909,7 @@ static void semaphore_codependency(int i915, unsigned long flags)
>  
>  		task[i].xcs =
>  			__igt_spin_new(i915,
> -				       .ctx = ctx,
> +				       .ctx_id = ctx,
>  				       .engine = e->flags,
>  				       .flags = IGT_SPIN_POLL_RUN | flags);
>  		igt_spin_busywait_until_started(task[i].xcs);
> @@ -917,7 +917,7 @@ static void semaphore_codependency(int i915, unsigned long flags)
>  		/* Common rcs tasks will be queued in FIFO */
>  		task[i].rcs =
>  			__igt_spin_new(i915,
> -				       .ctx = ctx,
> +				       .ctx_id = ctx,
>  				       .engine = 0,
>  				       .dependency = task[i].xcs->handle);
>  
> @@ -1403,7 +1403,7 @@ static void preempt(int fd, const struct intel_execution_engine2 *e, unsigned fl
>  			gem_context_set_priority(fd, ctx[LO], MIN_PRIO);
>  		}
>  		spin[n] = __igt_spin_new(fd,
> -					 .ctx = ctx[LO],
> +					 .ctx_id = ctx[LO],
>  					 .engine = e->flags,
>  					 .flags = flags & USERPTR ? IGT_SPIN_USERPTR : 0);
>  		igt_debug("spin[%d].handle=%d\n", n, spin[n]->handle);
> @@ -1439,7 +1439,7 @@ static igt_spin_t *__noise(int fd, uint32_t ctx, int prio, igt_spin_t *spin)
>  	__for_each_physical_engine(fd, e) {
>  		if (spin == NULL) {
>  			spin = __igt_spin_new(fd,
> -					      .ctx = ctx,
> +					      .ctx_id = ctx,
>  					      .engine = e->flags);
>  		} else {
>  			struct drm_i915_gem_execbuffer2 eb = {
> @@ -1718,7 +1718,7 @@ static void preempt_self(int fd, unsigned ring)
>  	gem_context_set_priority(fd, ctx[HI], MIN_PRIO);
>  	__for_each_physical_engine(fd, e) {
>  		spin[n] = __igt_spin_new(fd,
> -					 .ctx = ctx[NOISE],
> +					 .ctx_id = ctx[NOISE],
>  					 .engine = e->flags);
>  		store_dword(fd, ctx[HI], e->flags,
>  			    result, (n + 1)*sizeof(uint32_t), n + 1,
> @@ -1766,7 +1766,7 @@ static void preemptive_hang(int fd, const struct intel_execution_engine2 *e)
>  		gem_context_set_priority(fd, ctx[LO], MIN_PRIO);
>  
>  		spin[n] = __igt_spin_new(fd,
> -					 .ctx = ctx[LO],
> +					 .ctx_id = ctx[LO],
>  					 .engine = e->flags);
>  
>  		gem_context_destroy(fd, ctx[LO]);
> @@ -2751,7 +2751,7 @@ static void fairslice(int i915,
>  		ctx[i] = gem_context_clone_with_engines(i915, 0);
>  		if (spin == NULL) {
>  			spin = __igt_spin_new(i915,
> -					      .ctx = ctx[i],
> +					      .ctx_id = ctx[i],
>  					      .engine = e->flags,
>  					      .flags = flags);
>  		} else {
> diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
> index 2ed601a6..db0af018 100644
> --- a/tests/i915/gem_spin_batch.c
> +++ b/tests/i915/gem_spin_batch.c
> @@ -145,7 +145,7 @@ static void spin_all(int i915, unsigned int flags)
>  
>  		/* Prevent preemption so only one is allowed on each engine */
>  		spin = igt_spin_new(i915,
> -				    .ctx = ctx,
> +				    .ctx_id = ctx,
>  				    .engine = e->flags,
>  				    .flags = (IGT_SPIN_POLL_RUN |
>  					      IGT_SPIN_NO_PREEMPTION));
> diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> index 6ad31517..58781a5e 100644
> --- a/tests/i915/gem_sync.c
> +++ b/tests/i915/gem_sync.c
> @@ -1109,7 +1109,7 @@ preempt(int fd, unsigned ring, int num_children, int timeout)
>  		do {
>  			igt_spin_t *spin =
>  				__igt_spin_new(fd,
> -					       .ctx = ctx[0],
> +					       .ctx_id = ctx[0],
>  					       .engine = execbuf.flags);
>  
>  			do {
> diff --git a/tests/i915/gem_vm_create.c b/tests/i915/gem_vm_create.c
> index 6d93c98a..954ba13e 100644
> --- a/tests/i915/gem_vm_create.c
> +++ b/tests/i915/gem_vm_create.c
> @@ -363,7 +363,7 @@ static void async_destroy(int i915)
>  	int err;
>  
>  	spin[0] = igt_spin_new(i915,
> -			       .ctx = arg.ctx_id,
> +			       .ctx_id = arg.ctx_id,
>  			       .flags = IGT_SPIN_POLL_RUN);
>  	igt_spin_busywait_until_started(spin[0]);
>  
> @@ -372,7 +372,7 @@ static void async_destroy(int i915)
>  		err = 0;
>  	igt_assert_eq(err, 0);
>  
> -	spin[1] = __igt_spin_new(i915, .ctx = arg.ctx_id);
> +	spin[1] = __igt_spin_new(i915, .ctx_id = arg.ctx_id);
>  
>  	igt_spin_end(spin[0]);
>  	gem_sync(i915, spin[0]->handle);
> diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
> index 8f9fb177..22acf15c 100644
> --- a/tests/i915/gem_watchdog.c
> +++ b/tests/i915/gem_watchdog.c
> @@ -305,7 +305,7 @@ static void virtual(int i915)
>  			set_load_balancer(i915, ctx[i], ci, count, NULL);
>  
>  			spin[i] = igt_spin_new(i915,
> -					       .ctx = ctx[i],
> +					       .ctx_id = ctx[i],
>  					       .flags = spin_flags());
>  			i++;
>  		}
> diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
> index 00b475c2..0daf0cd6 100644
> --- a/tests/i915/gem_workarounds.c
> +++ b/tests/i915/gem_workarounds.c
> @@ -135,7 +135,7 @@ static int workaround_fail_count(int i915, uint32_t ctx)
>  
>  	gem_set_domain(i915, obj[0].handle, I915_GEM_DOMAIN_CPU, 0);
>  
> -	spin = igt_spin_new(i915, .ctx = ctx, .flags = IGT_SPIN_POLL_RUN);
> +	spin = igt_spin_new(i915, .ctx_id = ctx, .flags = IGT_SPIN_POLL_RUN);
>  	igt_spin_busywait_until_started(spin);
>  
>  	fw = igt_open_forcewake_handle(i915);
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index 50b5c82b..c7ddac85 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -175,7 +175,7 @@ static igt_spin_t * __spin_poll(int fd, uint32_t ctx,
>  				const struct intel_execution_engine2 *e)
>  {
>  	struct igt_spin_factory opts = {
> -		.ctx = ctx,
> +		.ctx_id = ctx,
>  		.engine = e->flags,
>  	};
>  
> @@ -381,7 +381,7 @@ busy_double_start(int gem_fd, const struct intel_execution_engine2 *e)
>  	spin[0] = __spin_sync(gem_fd, 0, e);
>  	usleep(500e3);
>  	spin[1] = __igt_spin_new(gem_fd,
> -				 .ctx = ctx,
> +				 .ctx_id = ctx,
>  				 .engine = e->flags);
>  
>  	/*
> -- 
> 2.31.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
