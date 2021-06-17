Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCDA6E97A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 18:31:21 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id f70so4504584qke.13
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 11:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210614163704.365989-1-jason@jlekstrand.net>
 <20210614163704.365989-20-jason@jlekstrand.net>
 <87bl852q0t.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87bl852q0t.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 17 Jun 2021 13:31:08 -0500
Message-ID: <CAOFGe95PRHcQO9ZBQa0nmnth0SV0gqpKiLsPGjeD1SAJFCyKLA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 19/77] tests/gem_exec_whisper: Convert
 to intel_ctx_t
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

On Wed, Jun 16, 2021 at 9:17 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Mon, 14 Jun 2021 09:36:34 -0700, Jason Ekstrand wrote:
> >
> > @@ -98,6 +101,13 @@ static void init_hang(struct hang *h, int fd)
> >
> >       gen = intel_gen(intel_get_drm_devid(h->fd));
> >
> > +     if (gem_has_contexts(fd)) {
> > +             h->ctx = intel_ctx_create(h->fd, cfg);
>
> Probably could submit against the ctx passed into whisper(), but probably
> doesn't matter so should be ok.
>
> > @@ -221,10 +234,10 @@ static void whisper(int fd, unsigned engine, unsigned flags)
> >               gem_require_contexts(fd);
> >
> >       if (flags & QUEUES)
> > -             igt_require(gem_has_queues(fd));
> > +             igt_require(gem_has_vm(fd));
>
> Don't need to check for I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE support here?

Yeah.  I dropped the SINGLE_TIMELINE.  I didn't think it was helping
with anything but I've restored it.

> > @@ -294,18 +308,20 @@ static void whisper(int fd, unsigned engine, unsigned flags)
> >               igt_assert(loc == sizeof(uint32_t) * i);
> >               batch[++i] = MI_BATCH_BUFFER_END;
> >
> > -             if (flags & CONTEXTS) {
> > -                     for (n = 0; n < 64; n++)
> > -                             contexts[n] = gem_context_clone_with_engines(fd, 0);
> > -             }
> > -             if (flags & QUEUES) {
> > -                     for (n = 0; n < 64; n++)
> > -                             contexts[n] = gem_queue_create(fd);
> > -             }
> >               if (flags & FDS) {
> >                       for (n = 0; n < 64; n++) {
> >                               fds[n] = gem_reopen_driver(fd);
> > -                             gem_context_copy_engines(fd, 0, fds[n], 0);
> > +                     }
> > +             }
> > +             if (flags & (CONTEXTS | QUEUES | FDS)) {
> > +                     local_cfg = ctx->cfg;
> > +                     if (flags & QUEUES) {
> > +                             igt_assert(!(flags & FDS));
>
> Is this assert needed, what is the reason for it?

Because I use fd and not fds[n] below.  Yeah, it's not needed but I
like dropping asserts for assumptions.

> > +                             local_cfg.vm = gem_vm_create(fd);
>
> Don't need to handle I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE here (so
> that contexts share a timeline)?

I've restored it.

--Jason

> > +                     }
> > +                     for (n = 0; n < 64; n++) {
> > +                             int this_fd = (flags & FDS) ? fds[n] : fd;
> > +                             contexts[n] = intel_ctx_create(this_fd, &local_cfg);
> >                       }
> >               }
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
