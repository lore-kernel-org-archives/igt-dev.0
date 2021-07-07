Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DA06E170
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:24:26 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id b13so3426481ybk.4
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210617191256.577244-1-jason@jlekstrand.net>
 <20210617191256.577244-50-jason@jlekstrand.net>
 <87sg1172cr.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87sg1172cr.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 7 Jul 2021 09:24:14 -0500
Message-ID: <CAOFGe964k-iwppRyJXaPuq-gSyO5aY0y7CiFiuPQHeF=HQXXxg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 49/79] tests/i915/gem_exec_balancer:
 Don't reset engines on a context
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

On Mon, Jun 28, 2021 at 10:53 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Thu, 17 Jun 2021 12:12:56 -0700, Jason Ekstrand wrote:
> >
> > Instead the set of engines to break implicit dependencies,
> > just use a new context.  This does drop a theoretical bit of test
> > coverage in the bonded chain tests because we can't drop the timeline
> > easily.
>
> I don't know enough to comment on the seriousness of this. If this scenario
> is of interest would you know if this is being tested elsewhere?

Actually, I've convinced myself that we're not really losing coverage.
Basically everything gets thrown away when you replace the engine set
with the old API so creating a new context should be the same.

> I guess the original code could "drop the timeline easily" through a
> set_load_balancer() call on the context which we cannot do after this
> series. Or is the timeline being replaced/dropped a different way?

I'm re-creating the context.  I'll leave the old comment with a couple tweaks.

> > However, those tests also use the FENCE_SUBMIT pattern in a way that the
> > set of engines is swapped out between the first and second half of the
> > bonded pair.  That seems pretty sketchy.
>
> I did not understand this comment either. As I mention above I thought this
> is the way to replace/drop the timeline but maybe I am wrong.
>
> The patch itself is fine. If you think the above issues are ok, I can give
> a R-b after I hear from you. Thanks.

I'm going to drop that commentary from the commit message and replace
it with something better.  I'm now convinced there are no interesting
changes.

> > @@ -1067,11 +1072,12 @@ static void __bonded_sema(int i915, uint32_t ctx,
> >       struct drm_i915_gem_execbuffer2 execbuf = {
> >               .buffers_ptr = to_user_pointer(&batch),
> >               .buffer_count = 1,
> > -             .rsvd1 = ctx,
> >       };
> >       igt_spin_t *spin;
> >
> >       for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
> > +             uint32_t ctx;
> > +
> >               /* A: spin forever on seperate render engine */
> >               spin = igt_spin_new(i915,
> >                                   .flags = (IGT_SPIN_POLL_RUN |
> > @@ -1086,16 +1092,21 @@ static void __bonded_sema(int i915, uint32_t ctx,
> >                */
>
> We should probably delete the comment above here in the code similar to
> __bonded_chain* since we are not replacing/dropping the timeline here
> anymore?

I've done the same update to both now to talk about replacing contexts
and their timelines instead of just timelines.

> > @@ -1818,8 +1824,8 @@ static void __bonded_early(int i915, uint32_t ctx,
> >       struct drm_i915_gem_execbuffer2 execbuf = {
> >               .buffers_ptr = to_user_pointer(&batch),
> >               .buffer_count = 1,
> > -             .rsvd1 = ctx,
> >       };
> > +     uint32_t vm, ctx;
> >       igt_spin_t *spin;
> >
> >       memset(bonds, 0, sizeof(bonds));
> > @@ -1833,6 +1839,11 @@ static void __bonded_early(int i915, uint32_t ctx,
> >               bonds[n].engines[0] = siblings[(n + 1) % count];
> >       }
> >
> > +     /* We share a VM so that the spin cancel will work without a reloc */
>
> Didn't understand this comment either. Though both __bonded_early() and
> bonded() are deleted later on in the series so if had reordered the patches
> we could have avoided changing these functions. Anyway, leave as is, no
> need to change.

Sounds good.

--Jason
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
