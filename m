Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0796A6EA65
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jun 2021 17:49:30 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id r135so6451886ybc.0
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jun 2021 10:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210617191256.577244-1-jason@jlekstrand.net>
 <20210617191256.577244-44-jason@jlekstrand.net>
 <87czse8y4j.wl-ashutosh.dixit@intel.com>
 <CAOFGe95Vt4ZPxkOGbappEPvmc_+H62+2T9ya9yCNwDpK5wjuWw@mail.gmail.com>
 <87o8bwja9g.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87o8bwja9g.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 30 Jun 2021 12:49:18 -0500
Message-ID: <CAOFGe97eZ5KB7NJ4-7eZ5rZmBugkC3f4oQcXB+007c5eH=MCvA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 43/79] tests/i915/gem_ctx_persistence:
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

On Wed, Jun 23, 2021 at 8:56 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> Some time ago, Dixit, Ashutosh wrote:
> >
> > On Tue, 22 Jun 2021 22:38:04 -0700, Jason Ekstrand wrote:
> > >
> > > On Mon, Jun 21, 2021 at 8:52 PM Dixit, Ashutosh
> > > <ashutosh.dixit@intel.com> wrote:
> > > >
> > > > On Thu, 17 Jun 2021 12:12:50 -0700, Jason Ekstrand wrote:
> > > > >
> > > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > >
> > > > A couple of questions below just in case, otherwise this is:
> > > >
> > > > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > >
> > > Thanks!  I'll wait to apply that until you're satisfied with the
> > > answers below.
>
> I have a question below but please go ahead and apply.
>
> > >
> > > > > diff --git a/lib/intel_ctx.h b/lib/intel_ctx.h
> > > > > index 054fecc4a..e34cefc14 100644
> > > > > --- a/lib/intel_ctx.h
> > > > > +++ b/lib/intel_ctx.h
> > > > > @@ -16,6 +16,7 @@
> > > > >   * intel_ctx_cfg_t:
> > > > >   * @flags: Context create flags
> > > > >   * @vm: VM to inherit or 0 for using a per-context VM
> > > > > + * @nopersist: set I915_CONTEXT_PARAM_PERSISTENCE to 0
> > > > >   * @num_engines: Number of client-specified engines or 0 for legacy mode
> > > > >   * @engines: Client-specified engines
> > > > >   *
> > > > > @@ -42,6 +43,7 @@
> > > > >  typedef struct intel_ctx_cfg {
> > > > >       uint32_t flags;
> > > > >       uint32_t vm;
> > > > > +     bool nopersist;
> > > >
> > > > To avoid the negative, wondering if we could have had a 'persist' field
> > > > here rather than 'nopersist'? For regular contexts 'persist' seems
> > > > fine. When this field is introduced we would default it to true but call
> > > > the context setparam ioctl only if 'persist' were false.
> > >
> > > We don't have a good way to "default" things, at least not yet.  We
> > > could have a #define INTEL_CTX_CFG_DEFAULT or something like that if
> > > we wanted to have non-zero values be defaults, I suppose.  Then we
> > > could default persist=true.
> > >
> > > > I do understand that contexts are persistent by default so 'nopersist' is
> > > > really where something extra needs to be done. Is this why 'nopersist' was
> > > > chosen here?
> > >
> > > Roughly, yes...
>
> 'nopersist' is fine for now, we can revisit if needed later.
>
> > >
> > > > Also, how are legacy contexts handled (since they really don't have a cfg)?
> > > > Are they always persistent (or can they ever be non-persistent)? That would
> > > > be another reason for having 'nopersist' I guess.
> > >
> > > I've tried to make it so that a legacy context (regular old
> > > gem_context_create(fd) or intel_ctx_create(fd, NULL)) is equivalent to
> > > using a zero-initialized context.  Legacy contexts are persistent by
> > > default.
>
> The question I had was can a legacy context ever be non-persistent? Is the
> 'nopersist' field valid for a legacy context and can it have a 'true' value?

If you mean "legacy" in the sense of having the default engine set,
then yes.  They are orthogonal.

--Jason

> > >
> > > > > @@ -460,14 +467,16 @@ static void test_noheartbeat_many(int i915, int count, unsigned int flags)
> > > > >               igt_assert(set_heartbeat(i915, e->full_name, 500));
> > > > >
> > > > >               for (int n = 0; n < ARRAY_SIZE(spin); n++) {
> > > > > -                     uint32_t ctx;
> > > > > +                     const intel_ctx_t *ctx;
> > > > > +
> > > > > +                     ctx = intel_ctx_create(i915, NULL);
> > > > >
> > > > > -                     ctx = gem_context_create(i915);
> > > > > -                     spin[n] = igt_spin_new(i915, ctx, .engine = eb_ring(e),
> > > > > +                     spin[n] = igt_spin_new(i915, .ctx = ctx,
> > > > > +                                            .engine = eb_ring(e),
> > > > >                                              .flags = (IGT_SPIN_FENCE_OUT |
> > > > >                                                        IGT_SPIN_POLL_RUN |
> > > > >                                                        flags));
> > > > > -                     gem_context_destroy(i915, ctx);
> > > > > +                     intel_ctx_destroy(i915, ctx);
> > > >
> > > > Any particular reason why we are creating legacy intel_ctx_t here (and also
> > > > in test_noheartbeat_close())? There are other places in this file where we
> > > > have not changed previous gem contexts created with gem_context_create() so
> > > > just wondering.
> > >
> > > Most likely for IGT_SPIN_POLL_RUN.
>
> Got it, thanks!
>
> > >
> > > --Jason
> > >
> > > > > @@ -772,13 +783,10 @@ static void test_process_mixed(int pfd, unsigned int engine)
> > > > >
> > > > >               for (int persists = 0; persists <= 1; persists++) {
> > > > >                       igt_spin_t *spin;
> > > > > -                     uint32_t ctx;
> > > > > -
> > > > > -                     ctx = gem_context_create(i915);
> > > > > -                     gem_context_copy_engines(pfd, 0, i915, ctx);
> > > > > -                     gem_context_set_persistence(i915, ctx, persists);
> > > > > +                     const intel_ctx_t *ctx;
> > > > >
> > > > > -                     spin = igt_spin_new(i915, ctx,
> > > > > +                     ctx = ctx_create_persistence(i915, cfg, persists);
> > > > > +                     spin = igt_spin_new(i915, .ctx = ctx,
> > > > >                                           .engine = engine,
> > > > >                                           .flags = IGT_SPIN_FENCE_OUT);
> > > >
> > > > No intel_ctx_destroy() here, but neither gem_context_destroy() so that
> > > > seems to be the design...
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
