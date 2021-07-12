Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC03C89D42
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jul 2021 16:00:47 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id b13so29786997ybk.4
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jul 2021 09:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210711035204.802908-1-jason@jlekstrand.net>
 <20210711035204.802908-6-jason@jlekstrand.net>
 <YOxYjc557Ri9q+Hb@phenom.ffwll.local>
In-Reply-To: <YOxYjc557Ri9q+Hb@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Jul 2021 11:00:35 -0500
Message-ID: <CAOFGe97BxsOVDt1a9NLAD3wPOh+yMP_Xeg62LG-cVpFWr=zHvA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/6] tests/i915/gem_exec_schedule: Avoid
 cmdparser dependencies in deep()
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 9:58 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sat, Jul 10, 2021 at 10:52:03PM -0500, Jason Ekstrand wrote:
> > When we have a command parser which runs synchronously, it blocks until
> > the batch is idle.  For most userspace, this doesn't matter as they
> > never re-use a batch.  With IGT, this can be a problem because it means
> > we can't queue up multiple instances of the same batch.  The easy
> > solution is to create a new batch BO for each execbuf.
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>
> I'm way behind on all the reloc work I've done, but should we instead do
> my patch (which you reviewed):
>
> https://patchwork.freedesktop.org/patch/437683/

Yup.  I've replaced this patch with a rebased version of yours.

--Jason

> Or does that not work? Asking since you're papering over the same issue I
> spotted already ...
> -Daniel
>
> > ---
> >  tests/i915/gem_exec_schedule.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> > index a75faeb68..ee7b10f7f 100644
> > --- a/tests/i915/gem_exec_schedule.c
> > +++ b/tests/i915/gem_exec_schedule.c
> > @@ -1891,7 +1891,6 @@ static void deep(int fd, const intel_ctx_cfg_t *cfg,
> >               reloc.delta = sizeof(uint32_t) * n;
> >               reloc.read_domains = I915_GEM_DOMAIN_RENDER;
> >               reloc.write_domain = I915_GEM_DOMAIN_RENDER;
> > -             obj[2].handle = gem_create(fd, 4096);
> >               obj[2].relocs_ptr = to_user_pointer(&reloc);
> >               obj[2].relocation_count = 1;
> >
> > @@ -1910,15 +1909,20 @@ static void deep(int fd, const intel_ctx_cfg_t *cfg,
> >               }
> >               batch[++i] = eb.rsvd1;
> >               batch[++i] = MI_BATCH_BUFFER_END;
> > -             gem_write(fd, obj[2].handle, 0, batch, sizeof(batch));
> >
> >               gem_context_set_priority(fd, eb.rsvd1, MAX_PRIO - nreq + n);
> >               for (int m = 0; m < XS; m++) {
> >                       obj[1].handle = dep[m];
> >                       reloc.target_handle = obj[1].handle;
> > +
> > +                     /* Create a new batch BO every time so we don't end
> > +                      * up with extra dependencies
> > +                      */
> > +                     obj[2].handle = gem_create(fd, 4096);
> > +                     gem_write(fd, obj[2].handle, 0, batch, sizeof(batch));
> >                       gem_execbuf(fd, &eb);
> > +                     gem_close(fd, obj[2].handle);
> >               }
> > -             gem_close(fd, obj[2].handle);
> >       }
> >       igt_info("First deptree: %d requests [%.3fs]\n",
> >                n * XS, 1e-9*igt_nsec_elapsed(&tv));
> > --
> > 2.31.1
> >
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
