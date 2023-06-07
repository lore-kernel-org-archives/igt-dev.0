Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8408210E535
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 17:40:45 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Wed, 07 Jun 2023 19:40:39 +0200
Message-ID: <1733872.vCJZsxu672@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <20230607175920.76cdf9ad@maurocar-mobl2>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
 <4584627.CvnuH1ECHv@jkrzyszt-mobl2.ger.corp.intel.com>
 <20230607175920.76cdf9ad@maurocar-mobl2>
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

On Wednesday, 7 June 2023 17:59:20 CEST Mauro Carvalho Chehab wrote:
> On Wed, 07 Jun 2023 16:39:23 +0200
> Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
>=20
> > Auto-correction, sorry.
> >=20
> > On Wednesday, 7 June 2023 16:35:32 CEST Janusz Krzysztofik wrote:
> > > On Wednesday, 7 June 2023 14:45:41 CEST Mauro Carvalho Chehab wrote: =
=20
> > > > On Wed, 07 Jun 2023 12:24:55 +0200
> > > > Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> > > >  =20
> > > > > On Monday, 5 June 2023 12:47:12 CEST Dominik Karol Piatkowski wro=
te: =20
> > > > > > From: Isabella Basso <isabbasso@riseup.net>
> > > > > >=20
> > > > > > As the DRM selftests are now using KUnit [1], update IGT tests =
as well.
> > > > > >=20
> > > > > > [1] - https://lore.kernel.org/all/20220708203052.236290-1-maira=
=2Ecanal@usp.br/
> > > > > >=20
> > > > > > Signed-off-by: Isabella Basso <isabbasso@riseup.net>
> > > > > >=20
> > > > > > v1 -> v2:
> > > > > > - drm_buddy|drm_mm: fallback to igt_kselftests if igt_kunit fai=
led
> > > > > >   with code other than IGT_EXIT_ABORT
> > > > > > - kms_selftest: move igt_kunit tests to separate subtests
> > > > > > - kms_selftest: fallback to igt_kselftests if all subtests fail=
ed
> > > > > >=20
> > > > > > v2 -> v3:
> > > > > > - expose all subtests
> > > > > >=20
> > > > > > Signed-off-by: Dominik Karol Pi=C4=85tkowski  =20
> > > <dominik.karol.piatkowski@intel.com> =20
> > > > > > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > > > > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > > > > > ---
> > > > > >  tests/drm_buddy.c    | 4 +++-
> > > > > >  tests/drm_mm.c       | 4 +++-
> > > > > >  tests/kms_selftest.c | 8 ++++++++
> > > > > >  3 files changed, 14 insertions(+), 2 deletions(-)
> > > > > >=20
> > > > > > diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
> > > > > > index 06876e0c..3261f0d6 100644
> > > > > > --- a/tests/drm_buddy.c
> > > > > > +++ b/tests/drm_buddy.c
> > > > > > @@ -10,5 +10,7 @@ IGT_TEST_DESCRIPTION("Basic sanity check of D=
RM's  =20
> > > buddy  =20
> > > > > allocator (struct drm_bu =20
> > > > > > =20
> > > > > >  igt_main
> > > > > >  {
> > > > > > -	igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
> > > > > > +	int ret =3D igt_kunit("drm_buddy_test", NULL);
> > > > > > +	if (ret !=3D 0 && ret !=3D IGT_EXIT_ABORT)
> > > > > > +		igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
> > > > > >  }
> > > > > > diff --git a/tests/drm_mm.c b/tests/drm_mm.c
> > > > > > index 0bce7139..88f76a57 100644
> > > > > > --- a/tests/drm_mm.c
> > > > > > +++ b/tests/drm_mm.c
> > > > > > @@ -156,5 +156,7 @@ IGT_TEST_DESCRIPTION("Basic sanity check of=
 DRM's  =20
> > > range  =20
> > > > > manager (struct drm_mm)" =20
> > > > > > =20
> > > > > >  igt_main
> > > > > >  {
> > > > > > -	igt_kselftests("test-drm_mm", NULL, NULL, NULL);
> > > > > > +	int ret =3D igt_kunit("drm_mm_test", NULL);
> > > > > > +	if (ret !=3D 0 && ret !=3D IGT_EXIT_ABORT)
> > > > > > +		igt_kselftests("test-drm_mm", NULL, NULL, NULL); =20
> > > > >=20
> > > > > My discussion with Mauro about subtest names and their consistenc=
y with  =20
> > > inline  =20
> > > > > documentation has lead me to a question: have we verified if beha=
vior of=20
> > > > > --list-subtests option under such conditional construct is consis=
tent with=20
> > > > > expectations of the testplan tool?
> > > > >=20
> > > > > But maybe we should still get back to a design phase and the ques=
tion of  =20
> > > how  =20
> > > > > we want these three generic DRM selftests to behave on old and ne=
w kernels=20
> > > > > after the change.
> > > > >=20
> > > > > Option 1:
> > > > > We just add kunit variants as new subtests, aside the existing i9=
15-like=20
> > > > > selftest subtests.  Whether kunit or i915-like selftest variants =
will  =20
> > > execute  =20
> > > > > or skip depends on availability of required kernel side kunit or =
selftest=20
> > > > > modules.
> > > > >=20
> > > > > Option 2:
> > > > > Each of the three tests still provides one igt_subtest_with_dynam=
ic().   =20
> > > Which  =20
> > > > > dynamic subtests are executed, whether kunit or i915-like selftes=
t or  =20
> > > none,  =20
> > > > > depends on availability of required kernel modules.
> > > > >=20
> > > > > Option 3:
> > > > > Current approach: provide only kunit subtests on kernels with kun=
it  =20
> > > modules  =20
> > > > > and only i915-like sleftest subtests otherwise.  But then, take c=
are of=20
> > > > > --list-subtests option always returning only names of subtests th=
at can be=20
> > > > > executed (for which kernel modules are available).
> > > > > Aditional assumption for the testplan tool: the same kunit kernel=
 modules=20
> > > > > available when building the testplan will be available when execu=
ting it. =20
> > > >=20
> > > > It sounds to me that you're over complicating it. =20
> > >=20
> > > No, but I was just wrong about --list-subtests behavior for option 3.=
  It=20
> > > always displays the name of the kunit subtest, never of the i915-self=
test-like=20
> > > subtest, no matter which kernel modules are available.
>=20
> It always display the name that igt_subtest_dynamic() uses. Such
> behavior should be preserved after adding support for KUnit.

Each instance of igt_subtest_dynamic()?  If there are two, one for kunit, o=
ne=20
for i915-like sleftest, and the second one is called conditionally, only if=
=20
the first one fails, then what?
The first one never fails with --list-subtests option provided.

>=20
> > >  =20
> > > >=20
> > > > At IGT build time, it doesn't really matter if the tests will run w=
ith
> > > > KUnit or kselftest. What it matters is that igt dynamic subtest is
> > > > properly setup, in a way that --list will display the dynamic subte=
st(s)
> > > > that are part of it.
> > > >=20
> > > > Looking further, this series touch only 3 tests:
> > > >=20
> > > > 	- tests/drm_buddy.c
> > > > 	- tests/drm_mm.c
> > > > 	- tests/kms_selftest.c
> > > >=20
> > > > The first two are related to some changes that already happened
> > > > upstream: DRM core now uses KUnit and don't have support for
> > > > selftests.
> > > >=20
> > > > For KMS, I would expect that the Xe driver will require those to use
> > > > KUnit as well, as Xe driver doesn't support selftest. It may either
> > > > run as selftest or KUnit for i915. The IGT runtime decision to run=
=20
> > > > either with KUnit or via selftest may depend if the Kernel is built
> > > > with KUnit support or not.
> > > >=20
> > > > -
> > > >=20
> > > > Now, preserving dynamic subtest namespace is particularly needed=20
> > > > by drm_mm, which has an extensive documentation for the subtests=20
> > > > provided by DRM core. We need to group the tests there inside
> > > > igt_subtest_with_dynamic("all-tests"), in order to preserve the
> > > > documentation we have.
> > > >=20
> > > > An alternative approach would be to change it to some other
> > > > name:
> > > >=20
> > > > 	igt_subtest_with_dynamic("some-foo-name")
> > > >=20
> > > > And then rename the subtests inside tests/drm_mm.c replacing
> > > > "all-tests" with "some-foo-name".
> > > >=20
> > > > I can't see any rationale for doing that, but, if you think it
> > > > is worth doing that, feel free to submit a patch after we have
> > > > this patch series merged. =20
> > >=20
> > > So we're back to the discussion limited to subtest naming, while I wa=
s not=20
> > > talking about subtest names, only about the structure of the tests, a=
nd for me=20
> > > it seems like you missed my points.
> > >=20
> > > Having the whole series applied, we can now observe two different app=
roaches:
> > >=20
> > > Tests drm_mm and drm_buddy implement my option 1.   =20
> >=20
> > Should read: option 3
>=20
> Yes, I missed the point. Could you please reply with a patch showing
> what kind of changes are you talking about?

I'm not sure what you mean.  Would you like me to reply with a patch that=20
fixes the issues I've pointed out?  Or would you like me to respond to anot=
her=20
patch of this series that's more related to my points than this one?

If the former then I don't have a solution ready out of top of my head sinc=
e=20
I'm still not sure how we want to have coexistence of backword compatible=20
subtests with new kunit ones designed.

Thanks,
Janusz


>=20
> Regards,
> Mauro
>=20
>=20
>=20
>=20





