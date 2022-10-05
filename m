Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AB310E45A
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 06:44:22 +0000 (UTC)
Date: Wed, 5 Oct 2022 08:44:15 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20221005084415.108a88b7@maurocar-mobl2>
In-Reply-To: <YzcISxi01TrOL4aU@kamilkon-desk1>
References: <cover.1664173031.git.mchehab@kernel.org>
 <50da9d5c006ba73f8464eb0cee1e40257a00486e.1664173031.git.mchehab@kernel.org>
 <YzcISxi01TrOL4aU@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH 01/76] lib: Introduce typed cleanups
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 30 Sep 2022 17:16:27 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
>=20
> On 2022-09-26 at 08:17:06 +0200, Mauro Carvalho Chehab wrote:
> > From: Chris Wilson <chris@chris-wilson.co.uk>
> >=20
> > Start introducing standard types with automatic cleanup courtesy of
> > gcc's __attribute__((cleanup)). As an example, we start with an fd
> > that will automatically call close() on going out of scope, and
> > crucially before atexit where we will want to check for resource leaks.=
 =20
>=20
> This is "what is changing" part, please also put here "why part"
> from cover letter, so it will stay in git history.
>=20
> >=20
> > Suggested-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Acked-by: Nirmoy Das <nirmoy.das@linux.intel.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org> =20
>=20
> I will send cc also to Zbigniew.
>=20
> > ---
> >=20
> > To avoid mailbombing on a large number of people, only mailing lists we=
re C/C on the cover.
> > See [PATCH 00/76] at: https://lore.kernel.org/all/cover.1664173031.git.=
mchehab@kernel.org/
> >=20
> >  lib/igt_core.c               |   6 ++
> >  lib/igt_core.h               |   2 +
> >  lib/igt_types.c              |  17 +++++
> >  lib/igt_types.h              |  47 ++++++++++++
> >  lib/meson.build              |   1 +
> >  lib/tests/bad_subtest_type.c |  19 +++++
> >  lib/tests/igt_types.c        | 136 +++++++++++++++++++++++++++++++++++
> >  lib/tests/meson.build        |   2 +
> >  8 files changed, 230 insertions(+)
> >  create mode 100644 lib/igt_types.c
> >  create mode 100644 lib/igt_types.h
> >  create mode 100644 lib/tests/bad_subtest_type.c
> >  create mode 100644 lib/tests/igt_types.c
> >=20
> > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > index e7425326b7f0..dc6486c841f0 100644
> > --- a/lib/igt_core.c
> > +++ b/lib/igt_core.c
> > @@ -624,6 +624,12 @@ uint64_t igt_nsec_elapsed(struct timespec *start)
> >  		(uint64_t)NSEC_PER_SEC*(now.tv_sec - start->tv_sec));
> >  }
> > =20
> > +void __igt_assert_in_outer_scope(void)
> > +{
> > +	internal_assert(!in_subtest,
> > +			"must only be called outside of a subtest");
> > +}
> > +
> >  bool __igt_fixture(void)
> >  {
> >  	internal_assert(!in_fixture,
> > diff --git a/lib/igt_core.h b/lib/igt_core.h
> > index aa98e8ed8deb..f21723dec4bc 100644
> > --- a/lib/igt_core.h
> > +++ b/lib/igt_core.h
> > @@ -135,6 +135,8 @@ struct _GKeyFile *igt_load_igtrc(void);
> >   */
> >  #define IGT_EXIT_ABORT 112
> > =20
> > +void __igt_assert_in_outer_scope(void);
> > +
> >  bool __igt_fixture(void);
> >  void __igt_fixture_complete(void);
> >  __noreturn void __igt_fixture_end(void);
> > diff --git a/lib/igt_types.c b/lib/igt_types.c
> > new file mode 100644
> > index 000000000000..392f30fcab23
> > --- /dev/null
> > +++ b/lib/igt_types.c
> > @@ -0,0 +1,17 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > +* Copyright =C2=A9 2022 Intel Corporation
> > +*/
> > +
> > +#include <unistd.h>
> > +
> > +#include "igt_types.h"
> > +
> > +void igt_cleanup_fd(volatile int *fd)
> > +{
> > +	if (!fd || *fd < 0) =20
> ---------------------- ^
> imho here should be !=3D -1

In practice, it is identical, as open() returns only -1. On the other
hand, close(-2) - or any other negative value - will produce an error,
so, I prefer checking against < 0 here.

> Consider also (*fd >=3D -1 && *fd <=3D 2) as these are=20
> stdout/in/error file descriptors.

In thesis, you're right, but the only case where 0, 1 or 2 would be
used would be if someone would force using the typed cleanups with
something like:

foo()
{
	igt_fd_t(close_stdout_fd);

	close_stdout_fd =3D STDOUT;
}

this would cause STDOUT to be closed at the end of foo() function.

I can't see any cases where something like that would be used. On the
other hand, if someone is doing some tricks with stdout, I can't see
why the library should care enough to not let things like the above
work ;-)

>=20
> > +		return;
> > +
> > +	close(*fd);
> > +	*fd =3D -1;
> > +}
> > diff --git a/lib/igt_types.h b/lib/igt_types.h
> > new file mode 100644
> > index 000000000000..c4bc01ecdb3b
> > --- /dev/null
> > +++ b/lib/igt_types.h
> > @@ -0,0 +1,47 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright =C2=A9 2022 Intel Corporation
> > + */
> > +
> > +#ifndef IGT_TYPES_H
> > +#define IGT_TYPES_H
> > +
> > +/*
> > + * GCC can automatically cleanup variables that go out of scope, but o=
nly
> > + * through normal means. Breaking out of scope using longjmp (i.e. igt=
_skip)
> > + * is not handled automatically by GCC. Such scoped variables must be =
tracked
> > + * in an outer scope to the skipping subtest.
> > + *
> > + * BAD:
> > + * 	igt_subtest("bad") {
> > + * 		igt_fd_t(fd);
> > + *
> > + * 		fd =3D drm_open_driver();
> > + * 	}
> > + *
> > + * GOOD:
> > + * 	igt_subtest_group() {
> > + * 		igt_fd_t(fd);
> > + *
> > + * 		igt_fixture {
> > + * 			fd =3D drm_open_driver();
> > + * 		}
> > + *
> > + * 		igt_subtest("good")
> > + * 			; =20
>=20
> Should we close here fd ? This is example of good practice so
> imho here:
> 		igt_fixture
> 			close(fd);
>=20
> even if this is redundant in case of assert or fail, or just
> close(fd) without fixture ?

Just close won't work when longjmp is used, as this is an undefined STD-C
behavior. See this comment at lib/igt_core.c:

 *
 * # Magic Control Blocks
 *
 * i-g-t makes heavy use of C macros which serve as magic control blocks. T=
hey
 * work fairly well and transparently but since C doesn't have full-blown
 * closures there are caveats:
...
 *
 * - Code blocks with magic control flow are implemented with setjmp()
 *   and longjmp(). This applies to #igt_fixture, #igt_subtest,
 *   #igt_subtest_with_dynamic and #igt_dynamic
 *   blocks and all the three variants to finish test: igt_success(),
 *   igt_skip() and igt_fail(). Mostly this is of no concern, except
 *   when such a control block changes stack variables defined in the
 *   same function as the control block resides.  Any store/load
 *   behaviour after a longjmp() is ill-defined for these
 *   variables. Avoid such code.
 *
 *   Quoting the man page for longjmp():
 *
 *   "The values of automatic variables are unspecified after a call to
 *   longjmp() if they meet all the following criteria:"
 *    - "they are local to the function that made the corresponding setjmp(=
) call;
 *    - "their values are changed between the calls to setjmp() and longjmp=
(); and
 *    - "they are not declared as volatile."

The hole idea of this series is to teach gcc and clang how to deal when
igt_skip() & similar functions are used. Basically, when a fd variable is
declared with:

	igt_fd_t(fd);

gcc/clang will then free the variable even when longjmp is used.

Regards,
Mauro
