Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BF96E25B
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 19:08:14 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id q190so2194481qkd.2
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 12:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210614163704.365989-1-jason@jlekstrand.net>
 <20210614163704.365989-28-jason@jlekstrand.net>
 <87a6np2hhj.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87a6np2hhj.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 17 Jun 2021 14:08:01 -0500
Message-ID: <CAOFGe94XiYL=vp_H1jn6BHv_z3sj_4Kv-+XvVdF3i7nQgppk1A@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 27/77] tests/i915/gem_ctx_shared:
 Convert to intel_ctx_t
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 17, 2021 at 12:22 AM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Mon, 14 Jun 2021 09:36:42 -0700, Jason Ekstrand wrote:
> >
> > @@ -347,11 +368,12 @@ static void single_timeline(int i915)
> >        * to, it reports the same timeline name and fence context. However,
> >        * the fence context is not reported through the sync_fence_info.
> >        */
> > -     spin->execbuf.rsvd1 =
> > -             gem_context_clone(i915, 0, 0,
> > -                               I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
> > +     st_cfg = *cfg;
> > +     st_cfg.flags |= I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE;
> > +     ctx = intel_ctx_create(i915, &st_cfg);
> > +     spin->execbuf.rsvd1 = ctx->id;
>
> It's probably the same but could've passed ctx into igt_spin_new just above.

Not quite.  The spinner is left running on a separate context.

> > @@ -403,27 +428,29 @@ static void exec_single_timeline(int i915, unsigned int engine)
> >       igt_require(spin);
> >       igt_assert_eq(nop_sync(i915, ctx, engine, NSEC_PER_SEC), 0);
> >       igt_spin_free(i915, spin);
> > +     intel_ctx_destroy(i915, ctx);
> >
> >       /*
> >        * But if we create a context with just a single shared timeline,
> >        * then it will block waiting for the earlier requests on the
> >        * other engines.
> >        */
> > -     ctx = gem_context_clone(i915, 0, 0,
> > -                             I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
> > +     st_cfg = *cfg;
> > +     st_cfg.flags |= I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE;
> > +     ctx = intel_ctx_create(i915, &st_cfg);
> >       spin = NULL;
> > -     __for_each_physical_engine(i915, e) {
> > +     for_each_ctx_cfg_engine(i915, cfg, e) {
>
> Preferably &st_cfg, ok otherwise too.

Done.

> > @@ -592,22 +620,19 @@ static void independent(int i915,
> >       igt_require_f(mmio_base, "mmio base not known\n");
> >
> >       for (int n = 0; n < ARRAY_SIZE(spin); n++) {
> > -             const struct igt_spin_factory opts = {
> > -                     .ctx_id = create_highest_priority(i915),
> > -                     .engine = e->flags,
> > -             };
> > -             spin[n] = __igt_spin_factory(i915, &opts);
> > -             gem_context_destroy(i915, opts.ctx_id);
> > +             const intel_ctx_t *ctx = create_highest_priority(i915, cfg);
> > +             spin[n] = __igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
> > +             intel_ctx_destroy(i915, ctx);
> >       }
> >
> >       fence = igt_cork_plug(&cork, i915);
> >       for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
> > -             uint32_t ctx = gem_queue_create(i915);
> > -             gem_context_set_priority(i915, ctx, priorities[i]);
> > +             const intel_ctx_t *ctx = create_highest_priority(i915, cfg);
>
> Don't we need gem_queue_create equivalent here (I915_CONTEXT_CLONE_VM and
> I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE)?

Each of these contexts is only used for the one spinner and will
execute exactly one batch before being destroyed.  Having
SINGLE_TIMELINE in there does us nothing.

> > -static void reorder(int i915, unsigned ring, unsigned flags)
> > +static void reorder(int i915, const intel_ctx_cfg_t *cfg,
> > +                 unsigned ring, unsigned flags)
> >  #define EQUAL 1
> >  {
> >       IGT_CORK_HANDLE(cork);
> >       uint32_t scratch;
> >       uint32_t *ptr;
> > -     uint32_t ctx[2];
> > +     const intel_ctx_t *ctx[2];
> >       uint32_t plug;
> >
> > -     ctx[LO] = gem_queue_create(i915);
> > -     gem_context_set_priority(i915, ctx[LO], MIN_PRIO);
> > +     ctx[LO] = intel_ctx_create(i915, cfg);
> > +     gem_context_set_priority(i915, ctx[LO]->id, MIN_PRIO);
> >
> > -     ctx[HI] = gem_queue_create(i915);
> > -     gem_context_set_priority(i915, ctx[HI], flags & EQUAL ? MIN_PRIO : 0);
> > +     ctx[HI] = intel_ctx_create(i915, cfg);
> > +     gem_context_set_priority(i915, ctx[HI]->id, flags & EQUAL ? MIN_PRIO : 0);
>
> Again, don't we need gem_queue_create equivalent here?

Again, they're only used for a single store_dword(), single_timeline
doesn't do anything.

It's important to note that SINGLE_TIMELINE only applies to within a
context.  You only get timelines shared across context if you do
CLONE_TIMELINE which gem_queue_create() does NOT set.

> > -static void promotion(int i915, unsigned ring)
> > +static void promotion(int i915, const intel_ctx_cfg_t *cfg, unsigned ring)
> >  {
> >       IGT_CORK_HANDLE(cork);
> >       uint32_t result, dep;
> >       uint32_t *ptr;
> > -     uint32_t ctx[3];
> > +     const intel_ctx_t *ctx[3];
> >       uint32_t plug;
> >
> > -     ctx[LO] = gem_queue_create(i915);
> > -     gem_context_set_priority(i915, ctx[LO], MIN_PRIO);
> > +     ctx[LO] = intel_ctx_create(i915, cfg);
> > +     gem_context_set_priority(i915, ctx[LO]->id, MIN_PRIO);
> >
> > -     ctx[HI] = gem_queue_create(i915);
> > -     gem_context_set_priority(i915, ctx[HI], 0);
> > +     ctx[HI] = intel_ctx_create(i915, cfg);
> > +     gem_context_set_priority(i915, ctx[HI]->id, 0);
> >
> > -     ctx[NOISE] = gem_queue_create(i915);
> > -     gem_context_set_priority(i915, ctx[NOISE], MIN_PRIO/2);
> > +     ctx[NOISE] = intel_ctx_create(i915, cfg);
> > +     gem_context_set_priority(i915, ctx[NOISE]->id, MIN_PRIO/2);
>
> Again, don't we need gem_queue_create equivalent here?

Same.  The only engine used is the one specified by the ring parameter.

Except I just realized we have a potential problem here if we don't
share a VM.  In particular, if anything has to relocate, it's going to
force an ordering other than the one we're trying to test.  We really
should convert these tests to always use softpin but that's a task for
another day.  I've fixed them all and the fixes will be in v2.

--Jason

> > @@ -761,16 +788,16 @@ static void smoketest(int i915, unsigned ring, unsigned timeout)
> >       scratch = gem_create(i915, 4096);
> >       igt_fork(child, ncpus) {
> >               unsigned long count = 0;
> > -             uint32_t ctx;
> > +             const intel_ctx_t *ctx;
> >
> >               hars_petruska_f54_1_random_perturb(child);
> >
> > -             ctx = gem_queue_create(i915);
> > +             ctx = intel_ctx_create(i915, cfg);
>
> Again, don't we need gem_queue_create equivalent here?
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
