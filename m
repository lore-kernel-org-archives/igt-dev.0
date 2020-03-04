Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411806EB23
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2020 11:25:14 +0000 (UTC)
Date: Wed, 4 Mar 2020 13:25:11 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200304112511.GQ3839@platvala-desk.ger.corp.intel.com>
References: <20200302173314.378918-1-emil.l.velikov@gmail.com>
 <20200303131315.GO3839@platvala-desk.ger.corp.intel.com>
 <CACvgo51-Tp34pGVaimqNfD=USdc8PuNskxs7H0=swHqxoLDFwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo51-Tp34pGVaimqNfD=USdc8PuNskxs7H0=swHqxoLDFwQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] ts/core_setmaster: new test for
 drop/set master semantics
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 03, 2020 at 02:46:51PM +0000, Emil Velikov wrote:
> On Tue, 3 Mar 2020 at 13:13, Petri Latvala <petri.latvala@intel.com> wrot=
e:
> >
> > On Mon, Mar 02, 2020 at 05:33:14PM +0000, Emil Velikov wrote:
> > > From: Emil Velikov <emil.velikov@collabora.com>
> > >
> > > This test adds three distinct subtests:
> > >  - drop/set master as root
> > >  - drop/set master as non-root
> > >  - drop/set master for a shared fd
> > >
> > > Currently the second subtest will fail, with kernel patch to address
> > > that has been submitted.
> > >
> > > v2: Add to the autotools build
> > > v3:
> > >  - Add igt_describe()
> > >  - Use igt_fixture() for tweak_perm
> > >  - Enhance comments
> > >
> > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > > ---
> > >  tests/Makefile.sources |   1 +
> > >  tests/core_setmaster.c | 206 +++++++++++++++++++++++++++++++++++++++=
++
> > >  tests/meson.build      |   1 +
> > >  3 files changed, 208 insertions(+)
> > >  create mode 100644 tests/core_setmaster.c
> > >
> > > diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> > > index b87d6333..5da36a91 100644
> > > --- a/tests/Makefile.sources
> > > +++ b/tests/Makefile.sources
> > > @@ -18,6 +18,7 @@ TESTS_progs =3D \
> > >       core_getclient \
> > >       core_getstats \
> > >       core_getversion \
> > > +     core_setmaster \
> > >       core_setmaster_vs_auth \
> > >       debugfs_test \
> > >       dmabuf \
> > > diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> > > new file mode 100644
> > > index 00000000..58ed9771
> > > --- /dev/null
> > > +++ b/tests/core_setmaster.c
> > > @@ -0,0 +1,206 @@
> > > +/*
> > > + * Copyright =A9 2020 Collabora, Ltd.
> > > + *
> > > + * Permission is hereby granted, free of charge, to any person obtai=
ning a
> > > + * copy of this software and associated documentation files (the "So=
ftware"),
> > > + * to deal in the Software without restriction, including without li=
mitation
> > > + * the rights to use, copy, modify, merge, publish, distribute, subl=
icense,
> > > + * and/or sell copies of the Software, and to permit persons to whom=
 the
> > > + * Software is furnished to do so, subject to the following conditio=
ns:
> > > + *
> > > + * The above copyright notice and this permission notice (including =
the next
> > > + * paragraph) shall be included in all copies or substantial portion=
s of the
> > > + * Software.
> > > + *
> > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, E=
XPRESS OR
> > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTA=
BILITY,
> > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVEN=
T SHALL
> > > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR OTHER
> > > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, A=
RISING
> > > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTH=
ER DEALINGS
> > > + * IN THE SOFTWARE.
> > > + *
> > > + * Authors:
> > > + *    Emil Velikov <emil.l.velikov@gmail.com>
> > > + *
> > > + */
> > > +
> > > +/*
> > > + * Testcase: Check that drop/setMaster behaves correctly wrt root/us=
er access
> > > + *
> > > + * Test checks if the ioctls succeed or fail, depending if the appli=
cations was
> > > + * run with root, user privileges or if we have separate privileged =
arbitrator.
> > > + */
> > > +
> > > +#include "igt.h"
> > > +#include <unistd.h>
> > > +#include <stdlib.h>
> > > +#include <stdio.h>
> > > +#include <string.h>
> > > +#include <sys/stat.h>
> > > +
> > > +IGT_TEST_DESCRIPTION("Check that Drop/SetMaster behaves correctly wr=
t root/user"
> > > +                  " access");
> > > +
> > > +static bool is_master(int fd)
> > > +{
> > > +     /* FIXME: replace with drmIsMaster once we bumped libdrm versio=
n */
> > > +     return drmAuthMagic(fd, 0) !=3D -EACCES;
> > > +}
> > > +
> > > +static void check_drop_set(void)
> > > +{
> > > +     int master;
> > > +
> > > +     master =3D __drm_open_driver(DRIVER_ANY);
> > > +
> > > +     /* Ensure we have a valid device. This is _extremely_ unlikely =
to
> > > +      * trigger as tweak_perm() aims to ensure we have the correct r=
ights.
> > > +      * Although:
> > > +      * - according to the manual igt_drop_root() + igt_skip() is br=
oken
> >
> > I asked for clarification on this and didn't get a reply. I'm not
> > seeing such a mention. Well, there is the text warning about
> > igt_drop_root() and atexit handlers and recommending the use of
> > igt_drop_root() in a child process to avoid issues, and this is in a
> > child process.
> >
> > Whatever I'm missing here surely also applies to igt_assert as well?
> >
> Darn it ... got the wrong function which explains the confusion.
> =

> In particular igt_skip() isn't propagated properly within a
> igt_fork(), as documented [1].
> This results in a) the test failing [2] (instead of skipping) with b)
> semi-magical trace.
> =

> If the IGT team is happy with those pitfalls, I can switch to igt_require=
 :-)
> =

> [1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/ig=
t_core.h#L1045
> [2] igt_skip: Assertion `"!test_child` failed

Ah, now I see!

Indeed skip isn't propagated properly and we should get that fixed at
some point. No need to hold your patch as hostage though.

With a comment that states that skip is not properly propagated from
child processes, keep the igt_assert and __drm_open_driver() usage in
check_drop_set(). There's igt_assert_fd() btw for a shorthand check
for fd !=3D -1.

The second subtest can use igt_require though, by way of using
drm_open_driver().


> =

> =

> >
> > > +      * - there is _no_ guarantee that we'll open a device handled by
> > > +      * tweak_perm()
> >
> > This is a point that came to mind later, the building blocks for that
> > guarantee are in igt_device_scan.
> >
> > 1) If filter already set (test being run with --device), use that
> >    filter (igt_device_filter_get or so). Otherwise loop through the
> >    generated card%u names, using drm:/dev/dri/card%u as the
> >    filter. igt_device_scan.c stuff already has a list of all possible
> >    devices but I don't see an easy way to get to the list.
> >
> > 2) igt_device_card_match() gets you a card
> >
> > 3) card->card should be the path to /dev/dri to chmod on
> >
> > 4) igt_open_card(card) gives you an fd to that card
> >
> Not entirely sure what you're suggesting here. Can you please elaborate?

lib/igt_device_scan.[ch] is for device selection and you can use that
to make sure chown has hit the device drm_open_driver() is
opening. Although I wrote that comment thinking you only chmod one of
them but that was a misreading from my part, ignore this comment. You
chmod all of them. Even with --device usage chmoding all devices will
ensure the only way for chmodding not to be done is not having the
proper kernel modules modprobed. Which drm_open_driver will do. Yikes.

Which luckily brings us to the best of both worlds. In the igt_fixture
before the first subtest:

/* Ensure modules are loaded and the device file exists */
close(drm_open_driver(DRIVER_ANY));

Now having the igt_assert (as opposed to igt_require()) in the child
process makes even more sense.


> =

> >
> > > +      * - having a device is integral part of the test
> >
> > It's an integral part of all tests. The issue with the use of
> > igt_require vs igt_assert is whether it's a prerequisite or the thing
> > you're actually testing.
> >
> The latter. I can reword that comment to "successfully opening a
> device is part of the test" or anything that you'd prefer.

I would prefer that yes. The skip propagation is enough to justify
igt_assert though. And having that module reloading drm_open_driver()
in the fixture.


> =

> >
> > > +      */
> > > +     igt_assert_neq(master, -1);
> > > +
> > > +     /* At this point we're master capable due to:
> > > +      * - being root - always
> > > +      * - normal user - as the only drm only drm client (on this VT)
> > > +      */
> > > +     igt_assert_eq(is_master(master), true);
> >
> > Just igt_assert(is_master(master))
> >
> Sure fixed, alongside the s/ts/test/ type in the summary.
> =

> Is there some dos and don'ts about which igt_assert* functions to use?
> Would it make sense to write short list + mass conversion to the
> recommended ones?

In general, use igt_assert_eq(x, y) instead of igt_assert(x =3D=3D y) to
get better error messages on failure, as it prints the values of both
operands. However, for values that are already just booleans, plain
igt_assert() reads a bit better.


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
