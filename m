Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0601689725
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2020 14:17:19 +0000 (UTC)
Date: Wed, 4 Mar 2020 16:17:17 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200304141717.GR3839@platvala-desk.ger.corp.intel.com>
References: <20200302173314.378918-1-emil.l.velikov@gmail.com>
 <20200303131315.GO3839@platvala-desk.ger.corp.intel.com>
 <CACvgo51-Tp34pGVaimqNfD=USdc8PuNskxs7H0=swHqxoLDFwQ@mail.gmail.com>
 <20200304112511.GQ3839@platvala-desk.ger.corp.intel.com>
 <CACvgo503OJUtDz0JLp3ot-=eXdKuryws4DLxvYX4CxF4GfqAkg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo503OJUtDz0JLp3ot-=eXdKuryws4DLxvYX4CxF4GfqAkg@mail.gmail.com>
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

On Wed, Mar 04, 2020 at 01:26:49PM +0000, Emil Velikov wrote:
> On Wed, 4 Mar 2020 at 11:25, Petri Latvala <petri.latvala@intel.com> wrot=
e:
> >
> > On Tue, Mar 03, 2020 at 02:46:51PM +0000, Emil Velikov wrote:
> > > On Tue, 3 Mar 2020 at 13:13, Petri Latvala <petri.latvala@intel.com> =
wrote:
> > > >
> > > > On Mon, Mar 02, 2020 at 05:33:14PM +0000, Emil Velikov wrote:
> > > > > From: Emil Velikov <emil.velikov@collabora.com>
> > > > >
> > > > > This test adds three distinct subtests:
> > > > >  - drop/set master as root
> > > > >  - drop/set master as non-root
> > > > >  - drop/set master for a shared fd
> > > > >
> > > > > Currently the second subtest will fail, with kernel patch to addr=
ess
> > > > > that has been submitted.
> > > > >
> > > > > v2: Add to the autotools build
> > > > > v3:
> > > > >  - Add igt_describe()
> > > > >  - Use igt_fixture() for tweak_perm
> > > > >  - Enhance comments
> > > > >
> > > > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > > > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > > > > ---
> > > > >  tests/Makefile.sources |   1 +
> > > > >  tests/core_setmaster.c | 206 +++++++++++++++++++++++++++++++++++=
++++++
> > > > >  tests/meson.build      |   1 +
> > > > >  3 files changed, 208 insertions(+)
> > > > >  create mode 100644 tests/core_setmaster.c
> > > > >
> > > > > diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> > > > > index b87d6333..5da36a91 100644
> > > > > --- a/tests/Makefile.sources
> > > > > +++ b/tests/Makefile.sources
> > > > > @@ -18,6 +18,7 @@ TESTS_progs =3D \
> > > > >       core_getclient \
> > > > >       core_getstats \
> > > > >       core_getversion \
> > > > > +     core_setmaster \
> > > > >       core_setmaster_vs_auth \
> > > > >       debugfs_test \
> > > > >       dmabuf \
> > > > > diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> > > > > new file mode 100644
> > > > > index 00000000..58ed9771
> > > > > --- /dev/null
> > > > > +++ b/tests/core_setmaster.c
> > > > > @@ -0,0 +1,206 @@
> > > > > +/*
> > > > > + * Copyright =A9 2020 Collabora, Ltd.
> > > > > + *
> > > > > + * Permission is hereby granted, free of charge, to any person o=
btaining a
> > > > > + * copy of this software and associated documentation files (the=
 "Software"),
> > > > > + * to deal in the Software without restriction, including withou=
t limitation
> > > > > + * the rights to use, copy, modify, merge, publish, distribute, =
sublicense,
> > > > > + * and/or sell copies of the Software, and to permit persons to =
whom the
> > > > > + * Software is furnished to do so, subject to the following cond=
itions:
> > > > > + *
> > > > > + * The above copyright notice and this permission notice (includ=
ing the next
> > > > > + * paragraph) shall be included in all copies or substantial por=
tions of the
> > > > > + * Software.
> > > > > + *
> > > > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR
> > > > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCH=
ANTABILITY,
> > > > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO =
EVENT SHALL
> > > > > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAM=
AGES OR OTHER
> > > > > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E, ARISING
> > > > > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR=
 OTHER DEALINGS
> > > > > + * IN THE SOFTWARE.
> > > > > + *
> > > > > + * Authors:
> > > > > + *    Emil Velikov <emil.l.velikov@gmail.com>
> > > > > + *
> > > > > + */
> > > > > +
> > > > > +/*
> > > > > + * Testcase: Check that drop/setMaster behaves correctly wrt roo=
t/user access
> > > > > + *
> > > > > + * Test checks if the ioctls succeed or fail, depending if the a=
pplications was
> > > > > + * run with root, user privileges or if we have separate privile=
ged arbitrator.
> > > > > + */
> > > > > +
> > > > > +#include "igt.h"
> > > > > +#include <unistd.h>
> > > > > +#include <stdlib.h>
> > > > > +#include <stdio.h>
> > > > > +#include <string.h>
> > > > > +#include <sys/stat.h>
> > > > > +
> > > > > +IGT_TEST_DESCRIPTION("Check that Drop/SetMaster behaves correctl=
y wrt root/user"
> > > > > +                  " access");
> > > > > +
> > > > > +static bool is_master(int fd)
> > > > > +{
> > > > > +     /* FIXME: replace with drmIsMaster once we bumped libdrm ve=
rsion */
> > > > > +     return drmAuthMagic(fd, 0) !=3D -EACCES;
> > > > > +}
> > > > > +
> > > > > +static void check_drop_set(void)
> > > > > +{
> > > > > +     int master;
> > > > > +
> > > > > +     master =3D __drm_open_driver(DRIVER_ANY);
> > > > > +
> > > > > +     /* Ensure we have a valid device. This is _extremely_ unlik=
ely to
> > > > > +      * trigger as tweak_perm() aims to ensure we have the corre=
ct rights.
> > > > > +      * Although:
> > > > > +      * - according to the manual igt_drop_root() + igt_skip() i=
s broken
> > > >
> > > > I asked for clarification on this and didn't get a reply. I'm not
> > > > seeing such a mention. Well, there is the text warning about
> > > > igt_drop_root() and atexit handlers and recommending the use of
> > > > igt_drop_root() in a child process to avoid issues, and this is in a
> > > > child process.
> > > >
> > > > Whatever I'm missing here surely also applies to igt_assert as well?
> > > >
> > > Darn it ... got the wrong function which explains the confusion.
> > >
> > > In particular igt_skip() isn't propagated properly within a
> > > igt_fork(), as documented [1].
> > > This results in a) the test failing [2] (instead of skipping) with b)
> > > semi-magical trace.
> > >
> > > If the IGT team is happy with those pitfalls, I can switch to igt_req=
uire :-)
> > >
> > > [1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/li=
b/igt_core.h#L1045
> > > [2] igt_skip: Assertion `"!test_child` failed
> >
> > Ah, now I see!
> >
> > Indeed skip isn't propagated properly and we should get that fixed at
> > some point. No need to hold your patch as hostage though.
> >
> AFAICT I'm the only person who ever dares running tests as non-root,
> which explains the current state ;-)

Yeah generally we just assume tests are run as root and we lack the
necessary checks on the tests that do require root. =3D(

> > With a comment that states that skip is not properly propagated from
> > child processes, keep the igt_assert and __drm_open_driver() usage in
> > check_drop_set().
> =

> Ack, comment tweaked.
> =

> > There's igt_assert_fd() btw for a shorthand check
> > for fd !=3D -1.
> >
> See my comment below.
> =

> > The second subtest can use igt_require though, by way of using
> > drm_open_driver().
> >
> Do you really mean "second" aka "master-drop-set-user" here?
> Above you're agree with using igt_assert(), yet here you suggest
> (again) for igt_require()...
> =

> I'm confused :-\

Sorry, the first subtest is so small that it slipped from my eyes. I
mean the last subtest, the shared-fd one. The one that opens the
driver in the main process.

> =

> drm_open_driver() does not look like a good solution here.
> In particular we're testing core DRM functionality so anything GEM
> (like in the embedded gem_quiescent_gpu call) is irrelevant.
> =

> Additionally, both gem_quiescent_gpu and the atexit handler require
> root to drop the caches, et al.
> =

> Thinking about it, you're likely talking about the 3rd subtest aka
> "master-drop-set-shared-fd". Sure we can use igt_require() there,
> although I'd rather keep the__drm_open_driver() + igt_require()
> combination.
> =

> Do you agree?

For i915, gem_quiescent_gpu and pals are required so pending work
failing is reported on the correct test. Without that done, results
are hilariously racy.



> =

> >
> > >
> > >
> > > >
> > > > > +      * - there is _no_ guarantee that we'll open a device handl=
ed by
> > > > > +      * tweak_perm()
> > > >
> > > > This is a point that came to mind later, the building blocks for th=
at
> > > > guarantee are in igt_device_scan.
> > > >
> > > > 1) If filter already set (test being run with --device), use that
> > > >    filter (igt_device_filter_get or so). Otherwise loop through the
> > > >    generated card%u names, using drm:/dev/dri/card%u as the
> > > >    filter. igt_device_scan.c stuff already has a list of all possib=
le
> > > >    devices but I don't see an easy way to get to the list.
> > > >
> > > > 2) igt_device_card_match() gets you a card
> > > >
> > > > 3) card->card should be the path to /dev/dri to chmod on
> > > >
> > > > 4) igt_open_card(card) gives you an fd to that card
> > > >
> > > Not entirely sure what you're suggesting here. Can you please elabora=
te?
> >
> > lib/igt_device_scan.[ch] is for device selection and you can use that
> > to make sure chown has hit the device drm_open_driver() is
> > opening. Although I wrote that comment thinking you only chmod one of
> > them but that was a misreading from my part, ignore this comment. You
> > chmod all of them. Even with --device usage chmoding all devices will
> > ensure the only way for chmodding not to be done is not having the
> > proper kernel modules modprobed. Which drm_open_driver will do. Yikes.
> >
> > Which luckily brings us to the best of both worlds. In the igt_fixture
> > before the first subtest:
> >
> > /* Ensure modules are loaded and the device file exists */
> > close(drm_open_driver(DRIVER_ANY));
> >
> > Now having the igt_assert (as opposed to igt_require()) in the child
> > process makes even more sense.
> >
> Thinking about it close(drm_open_driver(...)) looks like a workaround,
> instead of addressing the issue.
> Even though it seems like it might work, the modprobe machinery seems par=
tial:
>  - in the non i915 case, modprobe failure is a _debug_ message

igt_warn("Could not load i915\n");

Looks like a warn to me.

>  - the DRIVER_FOO to module name mapping is partial

Yes, we don't have all of them, but we should have all that have
module reloading tests.

>  - for some drivers, the module name differs from the name in
     drmGetVersion()

Hence the special cased modprobe hook for i915 and the now-removed
virtio-gpu.

>  - some drivers have changed their module name

The ones we modprobe in IGT don't seem to have?


Now, for i915 in particular since we do a load of module reload
testing, our required semantics for tests are to leave the state of
the system at test exit time in either

1) module is loaded and working
2) module not loaded

For i915, not doing drm_open_driver() first means you don't have
/dev/dri/card0 if the previously run test is something from
i915_module_load.

See commit 676d031e6bd9 for a related fix.


> > In general, use igt_assert_eq(x, y) instead of igt_assert(x =3D=3D y) to
> > get better error messages on failure, as it prints the values of both
> > operands. However, for values that are already just booleans, plain
> > igt_assert() reads a bit better.
> >
> From a quick look:
>  - 700+ instances of igt_assert(... =3D=3D ...)
>  - 200+ instances of igt_assert(... !=3D ...)
>  - 10+ instances of igt_assert_[n]eq(... {true,false})
>  - 200+ instances of igt_assert_fd permutations >=3D 0, < 0, -1
> =

> While I agree on the readability aspect, as-is we're in a pretty weird
> spot. How about we a) document b) add basic CI plumbing (so reviewers
> don't need to spend brain cycles) and c) update the existing codebase
> in few large commits?

Weird spot is a good name for this state. a+c gets +1 from me, and b
in principle but I don't know how feasible it is to implement.

There's lib/igt.cocci that hasn't been touched in a while...

> None of which seems like a blocker for this patch IMHO.

No, definitely not blocking this!


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
