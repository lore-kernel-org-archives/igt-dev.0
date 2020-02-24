Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16966E1D6
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2020 08:50:01 +0000 (UTC)
Date: Mon, 24 Feb 2020 10:49:59 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200224084959.GH25209@platvala-desk.ger.corp.intel.com>
References: <20200219142445.69061-1-emil.l.velikov@gmail.com>
 <20200221115825.GF25209@platvala-desk.ger.corp.intel.com>
 <CACvgo50TohYm7aYw2HMej5w8faXOPVSa5SXk5RDhowz=bJvWqg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo50TohYm7aYw2HMej5w8faXOPVSa5SXk5RDhowz=bJvWqg@mail.gmail.com>
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
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 01:55:18PM +0000, Emil Velikov wrote:
> Hi Petri,
> 
> Thank you for having a look.
> 
> On Fri, 21 Feb 2020 at 11:58, Petri Latvala <petri.latvala@intel.com> wrote:
> 
> > > +static void check_drop_set(void)
> > > +{
> > > +     int master;
> > > +
> > > +     master = __drm_open_driver(DRIVER_ANY);
> > > +
> > > +     /* Double-check if open has failed */
> > > +     igt_assert_neq(master, -1);
> >
> > Just use drm_open_driver(). For sure you don't want to produce a
> > 'FAIL' when running on a system without GPU drivers. 'SKIP' is correct
> > for that case.
> >
> This sounds very strange. Why would anyone run IGT if they lack _any_
> GPU drivers.

Accidentally, by breaking the driver module loading.

> If I'm running GPU tests and my GPU doesn't show up for any reason,
> I'd expect a hard failure.

Sure, some kind of a notification for that case is desired. However
the correct notification for that is a SKIP result. Granted, for
DRIVER_ANY open call the story is a bit more far-fetched, but consider
this:

If you get a FAIL from this test, you want to be able to say "I got
that because handling master in kernel is broken". If you can't open a
driver, you can't tell that kernel is broken. The only thing you can
tell is: You can't test the feature. SKIP is exactly that: Can't test
this.


> Even if we ignore that, a quick look around shows that there are
> multiple tests that will happily pass -1 to forward.
> If anything, the only way to trigger this is my dropping the chown()
> calls.

Which tests would those be? The only ones I can spot are ones that
want to test "can we still load the driver after doing $badthing".

Notice that drm_open_driver() stops testing if the open fails so it
cannot pass -1 along.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
