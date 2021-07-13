Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7A289819
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jul 2021 09:24:51 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 o17-20020a9d76510000b02903eabfc221a9so21908099otl.0
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jul 2021 02:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210711035204.802908-1-jason@jlekstrand.net>
 <20210711035204.802908-7-jason@jlekstrand.net>
 <YOxZJxlJnx8erM7R@phenom.ffwll.local>
 <CAOFGe94r-piaqosSUKsVY0u813KrQrz9YXmM5EFMta3FztdiCQ@mail.gmail.com>
In-Reply-To: <CAOFGe94r-piaqosSUKsVY0u813KrQrz9YXmM5EFMta3FztdiCQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 13 Jul 2021 11:24:40 +0200
Message-ID: <CAKMK7uGfDVVSDUsTzxtRk8cAW=oeEycOavq2c6yWsbZzW1v-aw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] tests/i915/gem_exec_reloc: Don't
 attempt active relocations with the command parser
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
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 6:02 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> On Mon, Jul 12, 2021 at 10:00 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Sat, Jul 10, 2021 at 10:52:04PM -0500, Jason Ekstrand wrote:
> > > The command parser stalls waiting for the batch to be idle.  If it's
> > > blocked by a spinner, execbuf will timeout.
> > >
> > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> >
> > I think we should just ditch these tests as invalid. Can you pick the
> > right set of reverts from my series and just push them?
> >
> > https://patchwork.freedesktop.org/series/91160/
>
> Yeah, we can do that too.  Kind-of invalidates the need for the first
> 4.  I went this way because I was trying to be minimalist and wasn't
> sure what happened with your reloc series.

Just me being burried happened, so I'm happy if you pick whatever works.

And I thought your first 4 patches where about other test issues, not
about synchronous relocs specifically? Like the igt spinner stuff. I'm
not planning to touch anything in that area.
-Daniel

> --Jason
>
> > Cheers, Daniel
> >
> > > ---
> > >  tests/i915/gem_exec_reloc.c | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
> > > index d54473341..0c2f389ea 100644
> > > --- a/tests/i915/gem_exec_reloc.c
> > > +++ b/tests/i915/gem_exec_reloc.c
> > > @@ -415,6 +415,11 @@ static void many_active(int i915, const intel_ctx_t *ctx, unsigned engine)
> > >       const uint64_t max = 2048;
> > >       unsigned long count = 256;
> > >
> > > +     /* Relocating in an active batch buffer doesn't work with the
> > > +      * command parser
> > > +      */
> > > +     igt_require(!gem_engine_has_cmdparser(i915, &ctx->cfg, engine));
> > > +
> > >       igt_until_timeout(2) {
> > >               uint64_t required, total;
> > >
> > > @@ -488,6 +493,11 @@ static void wide_active(int i915, const intel_ctx_t *ctx, unsigned engine)
> > >       const uint64_t max = gem_aperture_size(i915) / 4096 / 2;
> > >       unsigned long count = 256;
> > >
> > > +     /* Relocating in an active batch buffer doesn't work with the
> > > +      * command parser
> > > +      */
> > > +     igt_require(!gem_engine_has_cmdparser(i915, &ctx->cfg, engine));
> > > +
> > >       igt_until_timeout(2) {
> > >               uint64_t required, total;
> > >
> > > @@ -517,6 +527,11 @@ static void active_spin(int fd, const intel_ctx_t *ctx, unsigned engine)
> > >       struct drm_i915_gem_execbuffer2 execbuf;
> > >       igt_spin_t *spin;
> > >
> > > +     /* Relocating in an active batch buffer doesn't work with the
> > > +      * command parser
> > > +      */
> > > +     igt_require(!gem_engine_has_cmdparser(fd, &ctx->cfg, engine));
> > > +
> > >       spin = igt_spin_new(fd,
> > >                           .ctx = ctx,
> > >                           .engine = engine,
> > > --
> > > 2.31.1
> > >
> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
