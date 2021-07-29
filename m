Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Thu, 29 Jul 2021 23:35:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20210729233555.GA57981@DUT151-ICLU.fm.intel.com>
References: <20210727152202.9527-1-matthew.brost@intel.com>
 <20210727152202.9527-7-matthew.brost@intel.com>
 <e46a72c7-3443-bbcd-273e-6939b743fc2b@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e46a72c7-3443-bbcd-273e-6939b743fc2b@intel.com>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 6/7] i915/gem_scheduler:
 Make gem_scheduler understand static priority mapping
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 06:51:29PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 7/27/2021 8:22 AM, Matthew Brost wrote:
> > The i915 currently has 2k visible priority levels which are currently
> > unique. This is changing to statically map these 2k levels into 3
> > buckets:
> > 
> > low: < 0
> > mid: 0
> > high: > 0
> > 
> > Update gem_scheduler to understand this. This entails updating promotion
> > test to use 3 levels that will map into different buckets and also
> > delete a racey check. Also skip any tests that rely on having more than
> 
> Can you elaborate on why the check is racey? I'm sure you've already
> explained it to me in the past but can't spot it right now.
> 

Basically NOISE can complete before the HIGH context gets submitted to
the GuC. That being said, removing this check is totally wrong - not
quite sure what I was thinking. The proper solution is to add a delay
(sleep) in unplug_show_queue between igt_cork_unplug & igt_spin_free.
Will respin this patch, likely spliting it into 2 (1 for the promotion
fix and 1 for the skips).

Matt

> > 3 priority levels.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   lib/i915/gem_scheduler.c       | 13 ++++++++++
> >   lib/i915/gem_scheduler.h       |  1 +
> >   tests/i915/gem_exec_schedule.c | 47 ++++++++++++++++++++--------------
> >   3 files changed, 42 insertions(+), 19 deletions(-)
> > 
> > diff --git a/lib/i915/gem_scheduler.c b/lib/i915/gem_scheduler.c
> > index cdddf42ad..bec2e485a 100644
> > --- a/lib/i915/gem_scheduler.c
> > +++ b/lib/i915/gem_scheduler.c
> > @@ -90,6 +90,19 @@ bool gem_scheduler_has_ctx_priority(int fd)
> >   		I915_SCHEDULER_CAP_PRIORITY;
> >   }
> > +/**
> > + * gem_scheduler_has_ctx_priority:
> 
> s/ctx/static/
> 
> LGTM apart from this.
> 
> Daniele
> 
> > + * @fd: open i915 drm file descriptor
> > + *
> > + * Feature test macro to query whether the driver supports priority assigned
> > + * from user space are statically mapping into 3 buckets.
> > + */
> > +bool gem_scheduler_has_static_priority(int fd)
> > +{
> > +	return gem_scheduler_capability(fd) &
> > +		I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP;
> > +}
> > +
> >   /**
> >    * gem_scheduler_has_preemption:
> >    * @fd: open i915 drm file descriptor
> > diff --git a/lib/i915/gem_scheduler.h b/lib/i915/gem_scheduler.h
> > index d43e84bd2..b00804f70 100644
> > --- a/lib/i915/gem_scheduler.h
> > +++ b/lib/i915/gem_scheduler.h
> > @@ -29,6 +29,7 @@
> >   unsigned gem_scheduler_capability(int fd);
> >   bool gem_scheduler_enabled(int fd);
> >   bool gem_scheduler_has_ctx_priority(int fd);
> > +bool gem_scheduler_has_static_priority(int fd);
> >   bool gem_scheduler_has_preemption(int fd);
> >   bool gem_scheduler_has_semaphores(int fd);
> >   bool gem_scheduler_has_engine_busy_stats(int fd);
> > diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> > index e5fb45982..f03842478 100644
> > --- a/tests/i915/gem_exec_schedule.c
> > +++ b/tests/i915/gem_exec_schedule.c
> > @@ -1344,8 +1344,7 @@ static void reorder(int fd, const intel_ctx_cfg_t *cfg,
> >   static void promotion(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
> >   {
> >   	IGT_CORK_FENCE(cork);
> > -	uint32_t result, dep;
> > -	uint32_t result_read, dep_read;
> > +	uint32_t result, dep, dep_read;
> >   	const intel_ctx_t *ctx[3];
> >   	int fence;
> > @@ -1353,10 +1352,10 @@ static void promotion(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
> >   	gem_context_set_priority(fd, ctx[LO]->id, MIN_PRIO);
> >   	ctx[HI] = intel_ctx_create(fd, cfg);
> > -	gem_context_set_priority(fd, ctx[HI]->id, 0);
> > +	gem_context_set_priority(fd, ctx[HI]->id, MAX_PRIO);
> >   	ctx[NOISE] = intel_ctx_create(fd, cfg);
> > -	gem_context_set_priority(fd, ctx[NOISE]->id, MIN_PRIO/2);
> > +	gem_context_set_priority(fd, ctx[NOISE]->id, 0);
> >   	result = gem_create(fd, 4096);
> >   	dep = gem_create(fd, 4096);
> > @@ -1383,11 +1382,9 @@ static void promotion(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
> >   	dep_read = __sync_read_u32(fd, dep, 0);
> >   	gem_close(fd, dep);
> > -	result_read = __sync_read_u32(fd, result, 0);
> >   	gem_close(fd, result);
> >   	igt_assert_eq_u32(dep_read, ctx[HI]->id);
> > -	igt_assert_eq_u32(result_read, ctx[NOISE]->id);
> >   	intel_ctx_destroy(fd, ctx[NOISE]);
> >   	intel_ctx_destroy(fd, ctx[LO]);
> > @@ -2963,19 +2960,25 @@ igt_main
> >   			test_each_engine_store("preempt-other-chain", fd, ctx, e)
> >   				preempt_other(fd, &ctx->cfg, e->flags, CHAIN);
> > -			test_each_engine_store("preempt-queue", fd, ctx, e)
> > -				preempt_queue(fd, &ctx->cfg, e->flags, 0);
> > +			test_each_engine_store("preempt-engines", fd, ctx, e)
> > +				preempt_engines(fd, e, 0);
> > -			test_each_engine_store("preempt-queue-chain", fd, ctx, e)
> > -				preempt_queue(fd, &ctx->cfg, e->flags, CHAIN);
> > -			test_each_engine_store("preempt-queue-contexts", fd, ctx, e)
> > -				preempt_queue(fd, &ctx->cfg, e->flags, CONTEXTS);
> > +			igt_subtest_group {
> > +				igt_fixture {
> > +					igt_require(!gem_scheduler_has_static_priority(fd));
> > +				}
> > -			test_each_engine_store("preempt-queue-contexts-chain", fd, ctx, e)
> > -				preempt_queue(fd, &ctx->cfg, e->flags, CONTEXTS | CHAIN);
> > +				test_each_engine_store("preempt-queue", fd, ctx, e)
> > +					preempt_queue(fd, &ctx->cfg, e->flags, 0);
> > -			test_each_engine_store("preempt-engines", fd, ctx, e)
> > -				preempt_engines(fd, e, 0);
> > +				test_each_engine_store("preempt-queue-chain", fd, ctx, e)
> > +					preempt_queue(fd, &ctx->cfg, e->flags, CHAIN);
> > +				test_each_engine_store("preempt-queue-contexts", fd, ctx, e)
> > +					preempt_queue(fd, &ctx->cfg, e->flags, CONTEXTS);
> > +
> > +				test_each_engine_store("preempt-queue-contexts-chain", fd, ctx, e)
> > +					preempt_queue(fd, &ctx->cfg, e->flags, CONTEXTS | CHAIN);
> > +			}
> >   			igt_subtest_group {
> >   				igt_hang_t hang;
> > @@ -3017,11 +3020,17 @@ igt_main
> >   		test_each_engine_store("wide", fd, ctx, e)
> >   			wide(fd, &ctx->cfg, e->flags);
> > -		test_each_engine_store("reorder-wide", fd, ctx, e)
> > -			reorder_wide(fd, &ctx->cfg, e->flags);
> > -
> >   		test_each_engine_store("smoketest", fd, ctx, e)
> >   			smoketest(fd, &ctx->cfg, e->flags, 5);
> > +
> > +		igt_subtest_group {
> > +			igt_fixture {
> > +				igt_require(!gem_scheduler_has_static_priority(fd));
> > +			}
> > +
> > +			test_each_engine_store("reorder-wide", fd, ctx, e)
> > +				reorder_wide(fd, &ctx->cfg, e->flags);
> > +		}
> >   	}
> >   	igt_subtest_group {
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
