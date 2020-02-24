Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C85789718
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2020 11:57:20 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id x18so5505947vsq.4
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2020 03:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20200219142445.69061-1-emil.l.velikov@gmail.com>
 <20200221115825.GF25209@platvala-desk.ger.corp.intel.com>
 <CACvgo50TohYm7aYw2HMej5w8faXOPVSa5SXk5RDhowz=bJvWqg@mail.gmail.com>
 <20200224084959.GH25209@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200224084959.GH25209@platvala-desk.ger.corp.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 24 Feb 2020 11:57:01 +0000
Message-ID: <CACvgo50+RM0ziBPBNxNF27dyym4VfBiyruRHXAXq9xiNGEZWiA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] ts/core_setmaster: new test for
 drop/set master semantics
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 24 Feb 2020 at 08:50, Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Fri, Feb 21, 2020 at 01:55:18PM +0000, Emil Velikov wrote:
> > Hi Petri,
> >
> > Thank you for having a look.
> >
> > On Fri, 21 Feb 2020 at 11:58, Petri Latvala <petri.latvala@intel.com> wrote:
> >
> > > > +static void check_drop_set(void)
> > > > +{
> > > > +     int master;
> > > > +
> > > > +     master = __drm_open_driver(DRIVER_ANY);
> > > > +
> > > > +     /* Double-check if open has failed */
> > > > +     igt_assert_neq(master, -1);
> > >
> > > Just use drm_open_driver(). For sure you don't want to produce a
> > > 'FAIL' when running on a system without GPU drivers. 'SKIP' is correct
> > > for that case.
> > >
> > This sounds very strange. Why would anyone run IGT if they lack _any_
> > GPU drivers.
>
> Accidentally, by breaking the driver module loading.
>
> > If I'm running GPU tests and my GPU doesn't show up for any reason,
> > I'd expect a hard failure.
>
> Sure, some kind of a notification for that case is desired. However
> the correct notification for that is a SKIP result. Granted, for
> DRIVER_ANY open call the story is a bit more far-fetched, but consider
> this:
>
> If you get a FAIL from this test, you want to be able to say "I got
> that because handling master in kernel is broken". If you can't open a
> driver, you can't tell that kernel is broken. The only thing you can
> tell is: You can't test the feature. SKIP is exactly that: Can't test
> this.
>
"If you can't open a driver, you can't tell that kernel is broken."
Pretty sure that failing to load a DRM driver classifies as broken ;-)

Although I see the goal here: Ensuring _only_ a particular corner-case
is reported [as broken] by the individual test.
IMHO this is valid yet, it only ensures the test summary isn't plagued
with FAIL but with SKIP instead.

Personally le coupe de grace against igt_require/igt_skip is that
ig_drop_root + igt_skip seems to be _busted_.
So in the case of this failing, we'll end up with a garbled state +
misleading trace.

While I appreciate the overall sentiment, with igt_assert() we are
left in more obvious and manageable stage.

>
> > Even if we ignore that, a quick look around shows that there are
> > multiple tests that will happily pass -1 to forward.
> > If anything, the only way to trigger this is my dropping the chown()
> > calls.
>
> Which tests would those be? The only ones I can spot are ones that
> want to test "can we still load the driver after doing $badthing".
>
Git grep shows ~20 hits, from which I cannot see anyone that does a "bad thing".

Looking at gem_sanitycheck() - it will result in mislabelled error.
While gem_exec_store() will report failure (due to
igt_fork_hang_detector) is the open fail. Others like
drm_open_driver_render() will barf misleading message about sysfs,
when attempting gem_quiescent_gpu().

As a Tl;Dr: the igt_require() isn't enforced everywhere - rightfully so IMHO.


Does this make sense or you'd prefer the igt_require() regardless?

Thanks
Emil
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
