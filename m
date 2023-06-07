Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ED610E4FE
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 14:39:28 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Wed, 07 Jun 2023 16:39:23 +0200
Message-ID: <4584627.CvnuH1ECHv@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <2312494.n0HT0TaD9V@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
 <20230607144541.31b19cfa@maurocar-mobl2>
 <2312494.n0HT0TaD9V@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t 4/8] tests: DRM selftests: switch to
 KUnit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>
List-ID: <igt-dev@lists.freedesktop.org>

Auto-correction, sorry.

On Wednesday, 7 June 2023 16:35:32 CEST Janusz Krzysztofik wrote:
> On Wednesday, 7 June 2023 14:45:41 CEST Mauro Carvalho Chehab wrote:
> > On Wed, 07 Jun 2023 12:24:55 +0200
> > Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> >=20
> > > On Monday, 5 June 2023 12:47:12 CEST Dominik Karol Piatkowski wrote:
> > > > From: Isabella Basso <isabbasso@riseup.net>
> > > >=20
> > > > As the DRM selftests are now using KUnit [1], update IGT tests as w=
ell.
> > > >=20
> > > > [1] - https://lore.kernel.org/all/20220708203052.236290-1-maira.can=
al@usp.br/
> > > >=20
> > > > Signed-off-by: Isabella Basso <isabbasso@riseup.net>
> > > >=20
> > > > v1 -> v2:
> > > > - drm_buddy|drm_mm: fallback to igt_kselftests if igt_kunit failed
> > > >   with code other than IGT_EXIT_ABORT
> > > > - kms_selftest: move igt_kunit tests to separate subtests
> > > > - kms_selftest: fallback to igt_kselftests if all subtests failed
> > > >=20
> > > > v2 -> v3:
> > > > - expose all subtests
> > > >=20
> > > > Signed-off-by: Dominik Karol Pi=C4=85tkowski=20
> <dominik.karol.piatkowski@intel.com>
> > > > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > > > ---
> > > >  tests/drm_buddy.c    | 4 +++-
> > > >  tests/drm_mm.c       | 4 +++-
> > > >  tests/kms_selftest.c | 8 ++++++++
> > > >  3 files changed, 14 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
> > > > index 06876e0c..3261f0d6 100644
> > > > --- a/tests/drm_buddy.c
> > > > +++ b/tests/drm_buddy.c
> > > > @@ -10,5 +10,7 @@ IGT_TEST_DESCRIPTION("Basic sanity check of DRM's=
=20
> buddy=20
> > > allocator (struct drm_bu
> > > > =20
> > > >  igt_main
> > > >  {
> > > > -	igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
> > > > +	int ret =3D igt_kunit("drm_buddy_test", NULL);
> > > > +	if (ret !=3D 0 && ret !=3D IGT_EXIT_ABORT)
> > > > +		igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
> > > >  }
> > > > diff --git a/tests/drm_mm.c b/tests/drm_mm.c
> > > > index 0bce7139..88f76a57 100644
> > > > --- a/tests/drm_mm.c
> > > > +++ b/tests/drm_mm.c
> > > > @@ -156,5 +156,7 @@ IGT_TEST_DESCRIPTION("Basic sanity check of DRM=
's=20
> range=20
> > > manager (struct drm_mm)"
> > > > =20
> > > >  igt_main
> > > >  {
> > > > -	igt_kselftests("test-drm_mm", NULL, NULL, NULL);
> > > > +	int ret =3D igt_kunit("drm_mm_test", NULL);
> > > > +	if (ret !=3D 0 && ret !=3D IGT_EXIT_ABORT)
> > > > +		igt_kselftests("test-drm_mm", NULL, NULL, NULL);
> > >=20
> > > My discussion with Mauro about subtest names and their consistency wi=
th=20
> inline=20
> > > documentation has lead me to a question: have we verified if behavior=
 of=20
> > > --list-subtests option under such conditional construct is consistent=
 with=20
> > > expectations of the testplan tool?
> > >=20
> > > But maybe we should still get back to a design phase and the question=
 of=20
> how=20
> > > we want these three generic DRM selftests to behave on old and new ke=
rnels=20
> > > after the change.
> > >=20
> > > Option 1:
> > > We just add kunit variants as new subtests, aside the existing i915-l=
ike=20
> > > selftest subtests.  Whether kunit or i915-like selftest variants will=
=20
> execute=20
> > > or skip depends on availability of required kernel side kunit or self=
test=20
> > > modules.
> > >=20
> > > Option 2:
> > > Each of the three tests still provides one igt_subtest_with_dynamic()=
=2E =20
> Which=20
> > > dynamic subtests are executed, whether kunit or i915-like selftest or=
=20
> none,=20
> > > depends on availability of required kernel modules.
> > >=20
> > > Option 3:
> > > Current approach: provide only kunit subtests on kernels with kunit=20
> modules=20
> > > and only i915-like sleftest subtests otherwise.  But then, take care =
of=20
> > > --list-subtests option always returning only names of subtests that c=
an be=20
> > > executed (for which kernel modules are available).
> > > Aditional assumption for the testplan tool: the same kunit kernel mod=
ules=20
> > > available when building the testplan will be available when executing=
 it.
> >=20
> > It sounds to me that you're over complicating it.
>=20
> No, but I was just wrong about --list-subtests behavior for option 3.  It=
=20
> always displays the name of the kunit subtest, never of the i915-selftest=
=2Dlike=20
> subtest, no matter which kernel modules are available.
>=20
> >=20
> > At IGT build time, it doesn't really matter if the tests will run with
> > KUnit or kselftest. What it matters is that igt dynamic subtest is
> > properly setup, in a way that --list will display the dynamic subtest(s)
> > that are part of it.
> >=20
> > Looking further, this series touch only 3 tests:
> >=20
> > 	- tests/drm_buddy.c
> > 	- tests/drm_mm.c
> > 	- tests/kms_selftest.c
> >=20
> > The first two are related to some changes that already happened
> > upstream: DRM core now uses KUnit and don't have support for
> > selftests.
> >=20
> > For KMS, I would expect that the Xe driver will require those to use
> > KUnit as well, as Xe driver doesn't support selftest. It may either
> > run as selftest or KUnit for i915. The IGT runtime decision to run=20
> > either with KUnit or via selftest may depend if the Kernel is built
> > with KUnit support or not.
> >=20
> > -
> >=20
> > Now, preserving dynamic subtest namespace is particularly needed=20
> > by drm_mm, which has an extensive documentation for the subtests=20
> > provided by DRM core. We need to group the tests there inside
> > igt_subtest_with_dynamic("all-tests"), in order to preserve the
> > documentation we have.
> >=20
> > An alternative approach would be to change it to some other
> > name:
> >=20
> > 	igt_subtest_with_dynamic("some-foo-name")
> >=20
> > And then rename the subtests inside tests/drm_mm.c replacing
> > "all-tests" with "some-foo-name".
> >=20
> > I can't see any rationale for doing that, but, if you think it
> > is worth doing that, feel free to submit a patch after we have
> > this patch series merged.
>=20
> So we're back to the discussion limited to subtest naming, while I was no=
t=20
> talking about subtest names, only about the structure of the tests, and f=
or me=20
> it seems like you missed my points.
>=20
> Having the whole series applied, we can now observe two different approac=
hes:
>=20
> Tests drm_mm and drm_buddy implement my option 1. =20

Should read: option 3

> Command line option=20
> --list-subtests displays only the name of the kunit subtest.  Its name=20
> "all-tests" is deliberately the same as that of the i915-like selftest=20
> subtest, called conditionally if the former returns an error code (which =
never=20
> happens with --list-subtests, I believe).  Documentation checking tool, w=
hich=20
> ignores dynamic sub-subtests documentation sections if any, will be happy=
=2E  If=20
> the documentation provides details on individual dynamic sub-subtests the=
n it=20
> will be correct as long as respective kunit kernel modules provide the sa=
me=20
> set of tests as their old i915-selftest-like counterparts.
>=20
> OTOH, test kms_selftest implements my option 3. =20
=20
Should read: option 1

> Command line option=20
> --list-subtests displays a static list of several kunit subtest names,=20
> followed by the name of the i915-selftest-like subtest "all-test", which =
is=20
> not consistent with drm_mm and drm_buddy.  All subtests, including the i9=
15-
> selftest-like one, will have to be documented to make the documentation=20
> checking tool happy.
>=20
> Other than that, I think that returning from a subtest body via just retu=
rn,=20
> as implemented by patch 6/8, and not via either igt_success() or igt_fail=
()=20
> and friends is not supported, then I think we can't predict how the tests=
=20
> modified with this series will behave under different conditions.
>=20
> Thanks,
> Janusz
>=20
> >=20
> > Regards,
> > Mauro
> >=20
>=20
>=20





