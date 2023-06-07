Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2417C10E4EA
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 12:45:48 +0000 (UTC)
Date: Wed, 7 Jun 2023 14:45:41 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230607144541.31b19cfa@maurocar-mobl2>
In-Reply-To: <4511080.cEBGB3zze1@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
 <20230605104716.5678-5-dominik.karol.piatkowski@intel.com>
 <4511080.cEBGB3zze1@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 4/8] tests: DRM selftests: switch to
 KUnit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 07 Jun 2023 12:24:55 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> On Monday, 5 June 2023 12:47:12 CEST Dominik Karol Piatkowski wrote:
> > From: Isabella Basso <isabbasso@riseup.net>
> >=20
> > As the DRM selftests are now using KUnit [1], update IGT tests as well.
> >=20
> > [1] - https://lore.kernel.org/all/20220708203052.236290-1-maira.canal@u=
sp.br/
> >=20
> > Signed-off-by: Isabella Basso <isabbasso@riseup.net>
> >=20
> > v1 -> v2:
> > - drm_buddy|drm_mm: fallback to igt_kselftests if igt_kunit failed
> >   with code other than IGT_EXIT_ABORT
> > - kms_selftest: move igt_kunit tests to separate subtests
> > - kms_selftest: fallback to igt_kselftests if all subtests failed
> >=20
> > v2 -> v3:
> > - expose all subtests
> >=20
> > Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@=
intel.com>
> > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > ---
> >  tests/drm_buddy.c    | 4 +++-
> >  tests/drm_mm.c       | 4 +++-
> >  tests/kms_selftest.c | 8 ++++++++
> >  3 files changed, 14 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
> > index 06876e0c..3261f0d6 100644
> > --- a/tests/drm_buddy.c
> > +++ b/tests/drm_buddy.c
> > @@ -10,5 +10,7 @@ IGT_TEST_DESCRIPTION("Basic sanity check of DRM's bud=
dy=20
> allocator (struct drm_bu
> > =20
> >  igt_main
> >  {
> > -	igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
> > +	int ret =3D igt_kunit("drm_buddy_test", NULL);
> > +	if (ret !=3D 0 && ret !=3D IGT_EXIT_ABORT)
> > +		igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
> >  }
> > diff --git a/tests/drm_mm.c b/tests/drm_mm.c
> > index 0bce7139..88f76a57 100644
> > --- a/tests/drm_mm.c
> > +++ b/tests/drm_mm.c
> > @@ -156,5 +156,7 @@ IGT_TEST_DESCRIPTION("Basic sanity check of DRM's r=
ange=20
> manager (struct drm_mm)"
> > =20
> >  igt_main
> >  {
> > -	igt_kselftests("test-drm_mm", NULL, NULL, NULL);
> > +	int ret =3D igt_kunit("drm_mm_test", NULL);
> > +	if (ret !=3D 0 && ret !=3D IGT_EXIT_ABORT)
> > +		igt_kselftests("test-drm_mm", NULL, NULL, NULL);
>=20
> My discussion with Mauro about subtest names and their consistency with i=
nline=20
> documentation has lead me to a question: have we verified if behavior of=
=20
> --list-subtests option under such conditional construct is consistent wit=
h=20
> expectations of the testplan tool?
>=20
> But maybe we should still get back to a design phase and the question of =
how=20
> we want these three generic DRM selftests to behave on old and new kernel=
s=20
> after the change.
>=20
> Option 1:
> We just add kunit variants as new subtests, aside the existing i915-like=
=20
> selftest subtests.  Whether kunit or i915-like selftest variants will exe=
cute=20
> or skip depends on availability of required kernel side kunit or selftest=
=20
> modules.
>=20
> Option 2:
> Each of the three tests still provides one igt_subtest_with_dynamic().  W=
hich=20
> dynamic subtests are executed, whether kunit or i915-like selftest or non=
e,=20
> depends on availability of required kernel modules.
>=20
> Option 3:
> Current approach: provide only kunit subtests on kernels with kunit modul=
es=20
> and only i915-like sleftest subtests otherwise.  But then, take care of=20
> --list-subtests option always returning only names of subtests that can b=
e=20
> executed (for which kernel modules are available).
> Aditional assumption for the testplan tool: the same kunit kernel modules=
=20
> available when building the testplan will be available when executing it.

It sounds to me that you're over complicating it.

At IGT build time, it doesn't really matter if the tests will run with
KUnit or kselftest. What it matters is that igt dynamic subtest is
properly setup, in a way that --list will display the dynamic subtest(s)
that are part of it.

Looking further, this series touch only 3 tests:

	- tests/drm_buddy.c
	- tests/drm_mm.c
	- tests/kms_selftest.c

The first two are related to some changes that already happened
upstream: DRM core now uses KUnit and don't have support for
selftests.

For KMS, I would expect that the Xe driver will require those to use
KUnit as well, as Xe driver doesn't support selftest. It may either
run as selftest or KUnit for i915. The IGT runtime decision to run=20
either with KUnit or via selftest may depend if the Kernel is built
with KUnit support or not.

-

Now, preserving dynamic subtest namespace is particularly needed=20
by drm_mm, which has an extensive documentation for the subtests=20
provided by DRM core. We need to group the tests there inside
igt_subtest_with_dynamic("all-tests"), in order to preserve the
documentation we have.

An alternative approach would be to change it to some other
name:

	igt_subtest_with_dynamic("some-foo-name")

And then rename the subtests inside tests/drm_mm.c replacing
"all-tests" with "some-foo-name".

I can't see any rationale for doing that, but, if you think it
is worth doing that, feel free to submit a patch after we have
this patch series merged.

Regards,
Mauro
