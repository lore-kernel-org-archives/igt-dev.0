Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839866E207
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jun 2021 17:22:04 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id q21so4091553ybg.8
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jun 2021 10:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210614163704.365989-1-jason@jlekstrand.net>
 <20210614163902.366168-19-jason@jlekstrand.net>
 <87o8c65ywy.wl-ashutosh.dixit@intel.com>
 <87mtrq5xsl.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87mtrq5xsl.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 16 Jun 2021 12:21:52 -0500
Message-ID: <CAOFGe97TM-O_BZybpJrsnaDF_0tmt2-_Zc7eCsi+NZiBEFkrgw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 68/77] igt/dummyload: Require an
 intel_ctx_t for POLL_RUN and !ALL_ENGINES
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

On Tue, Jun 15, 2021 at 9:49 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Tue, 15 Jun 2021 19:25:01 -0700, Dixit, Ashutosh wrote:
> >
> > On Mon, 14 Jun 2021 09:38:53 -0700, Jason Ekstrand wrote:
> > >
> > > diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> > > index b0a7b361c..25e49de47 100644
> > > --- a/lib/igt_dummyload.c
> > > +++ b/lib/igt_dummyload.c
> > > @@ -421,22 +421,12 @@ igt_spin_factory(int fd, const struct igt_spin_factory *opts)
> > >  {
> > >     igt_spin_t *spin;
> > >
> > > -   if (opts->engine != ALL_ENGINES) {
> > > -           struct intel_execution_engine2 e;
> > > -           int class;
> > > -
> > > -           if (opts->ctx) {
> > > -                   class = opts->ctx->cfg.engines[opts->engine].engine_class;
> > > -           } else if (!gem_context_lookup_engine(fd, opts->engine,
> > > -                                                 opts->ctx_id, &e)) {
> > > -                   class = e.class;
> > > -           } else {
> > > -                   gem_require_ring(fd, opts->engine);
> > > -                   class = gem_execbuf_flags_to_engine_class(opts->engine);
> > > -           }
> > > +   if ((opts->flags & IGT_SPIN_POLL_RUN) && opts->engine != ALL_ENGINES) {
> > > +           unsigned int class;
> > >
> > > -           if (opts->flags & IGT_SPIN_POLL_RUN)
> > > -                   igt_require(gem_class_can_store_dword(fd, class));
> > > +           igt_assert(opts->ctx);
> > > +           class = intel_ctx_engine_class(opts->ctx, opts->engine);
> > > +           igt_require(gem_class_can_store_dword(fd, class));
> > >     }
> >
> > I am not sure if this is correct. If I straightforwardly enforce opts->ctx
> > and tranform the original logic I get this:
> >
> >         if (opts->engine != ALL_ENGINES) {
> >                 int class;
> >
> >                 igt_assert(opts->ctx);
> >                 class = intel_ctx_engine_class(opts->ctx, opts->engine);
> >                 if (opts->flags & IGT_SPIN_POLL_RUN)
> >                         igt_require(gem_class_can_store_dword(fd, class));
> >         }
> >
> > or even
> >
> >         if (opts->engine != ALL_ENGINES) {
> >                 igt_assert(opts->ctx);
> >                 if (opts->flags & IGT_SPIN_POLL_RUN) {
> >                       int class = intel_ctx_engine_class(opts->ctx, opts->engine);
> >                         igt_require(gem_class_can_store_dword(fd, class));
> >               }
> >         }
> >
> > Importantly, "igt_assert(opts->ctx)" is invoked independent of opts->flags,
> > unlike the code in the patch.

Yes, that's correct.  However, if you look at the original, the only
side-effect of any of the code in the outer `if (opts->engine !=
ALL_ENGINES)` block is the `igt_require(gem_class_can_store_dword()`.
All of the rest of it exists simply to get the class.  My original
intention was to add the `igt_assert(opts->ctx)` as conservatively as
possible.

But, now that I look deeper... we have this in emit_recursive_batch()
which is called unconditionally from igt_spin_factory():

    nengine = 0;
    if (opts->engine == ALL_ENGINES) {
        struct intel_execution_engine2 *engine;

        igt_assert(opts->ctx);
        for_each_ctx_engine(fd, opts->ctx, engine) {
            if (opts->flags & IGT_SPIN_POLL_RUN &&
                !gem_class_can_store_dword(fd, engine->class))
                continue;

            flags[nengine++] = engine->flags;
        }
    } else {
        flags[nengine++] = opts->engine;
    }
    igt_require(nengine);

so I think I was being conservative for no good reason.  I'll
restructure like you suggested.

> I have another related question/observation. If what I am saying above is
> indeed true, is the "ctx_id" field in "struct igt_spin_factory" ever
> really used? If not we should delete it from the struct and we can get rid
> of these asserts.
>
> This is because I am saying above that we have an igt_assert(opts->ctx)
> above in igt_spin_factory() when "opts->engine != ALL_ENGINES" and then we
> have another igt_assert(opts->ctx) in emit_recursive_batch() when
> "opts->engine == ALL_ENGINES". So it appears we must always have
> intel_ctx_t and can never use the "ctx_id" field in "struct
> igt_spin_factory" so it should be removed.

It is gone by the end of the series.

> So appears the spinner interface will always need a intel_ctx_t (meaning
> more code changes).

At the end, it does still work with ctx0 if you use I915_EXEC_RENDER
or similar.  There are a few users of this which just want the GPU
busy for some reason.  However, the vast majority of cases use an
intel_ctx_t.

--Jason
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
