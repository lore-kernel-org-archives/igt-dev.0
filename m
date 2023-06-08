Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B5E10E594
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jun 2023 07:56:40 +0000 (UTC)
Date: Thu, 8 Jun 2023 09:56:34 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230608095634.52270eb6@maurocar-mobl2>
In-Reply-To: <1733872.vCJZsxu672@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
 <4584627.CvnuH1ECHv@jkrzyszt-mobl2.ger.corp.intel.com>
 <20230607175920.76cdf9ad@maurocar-mobl2>
 <1733872.vCJZsxu672@jkrzyszt-mobl2.ger.corp.intel.com>
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

On Wed, 07 Jun 2023 19:40:39 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> On Wednesday, 7 June 2023 17:59:20 CEST Mauro Carvalho Chehab wrote:
> > On Wed, 07 Jun 2023 16:39:23 +0200
> > Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> >  =20
> > > Auto-correction, sorry.
> > >=20
> > > On Wednesday, 7 June 2023 16:35:32 CEST Janusz Krzysztofik wrote: =20
> > > > On Wednesday, 7 June 2023 14:45:41 CEST Mauro Carvalho Chehab wrote=
:   =20
> > > > > On Wed, 07 Jun 2023 12:24:55 +0200
> > > > > Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> > > > >    =20
> > > > > > On Monday, 5 June 2023 12:47:12 CEST Dominik Karol Piatkowski w=
rote:   =20
> > > > > > > From: Isabella Basso <isabbasso@riseup.net>
> > > > > > >=20
> > > > > > > As the DRM selftests are now using KUnit [1], update IGT test=
s as well.
> > > > > > >=20
> > > > > > > [1] - https://lore.kernel.org/all/20220708203052.236290-1-mai=
ra.canal@usp.br/
> > > > > > >=20
> > > > > > > Signed-off-by: Isabella Basso <isabbasso@riseup.net>
> > > > > > >=20
> > > > > > > v1 -> v2:
> > > > > > > - drm_buddy|drm_mm: fallback to igt_kselftests if igt_kunit f=
ailed
> > > > > > >   with code other than IGT_EXIT_ABORT
> > > > > > > - kms_selftest: move igt_kunit tests to separate subtests
> > > > > > > - kms_selftest: fallback to igt_kselftests if all subtests fa=
iled
> > > > > > >=20
> > > > > > > v2 -> v3:
> > > > > > > - expose all subtests
> > > > > > >=20
> > > > > > > Signed-off-by: Dominik Karol Pi=C4=85tkowski    =20
> > > > <dominik.karol.piatkowski@intel.com>   =20
> > > > > > > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > > > > > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > > > > > > ---
> > > > > > >  tests/drm_buddy.c    | 4 +++-
> > > > > > >  tests/drm_mm.c       | 4 +++-
> > > > > > >  tests/kms_selftest.c | 8 ++++++++
> > > > > > >  3 files changed, 14 insertions(+), 2 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
> > > > > > > index 06876e0c..3261f0d6 100644
> > > > > > > --- a/tests/drm_buddy.c
> > > > > > > +++ b/tests/drm_buddy.c
> > > > > > > @@ -10,5 +10,7 @@ IGT_TEST_DESCRIPTION("Basic sanity check of=
 DRM's    =20
> > > > buddy    =20
> > > > > > allocator (struct drm_bu   =20
> > > > > > > =20
> > > > > > >  igt_main
> > > > > > >  {
> > > > > > > -	igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
> > > > > > > +	int ret =3D igt_kunit("drm_buddy_test", NULL);
> > > > > > > +	if (ret !=3D 0 && ret !=3D IGT_EXIT_ABORT)
> > > > > > > +		igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
> > > > > > >  }
> > > > > > > diff --git a/tests/drm_mm.c b/tests/drm_mm.c
> > > > > > > index 0bce7139..88f76a57 100644
> > > > > > > --- a/tests/drm_mm.c
> > > > > > > +++ b/tests/drm_mm.c
> > > > > > > @@ -156,5 +156,7 @@ IGT_TEST_DESCRIPTION("Basic sanity check =
of DRM's    =20
> > > > range    =20
> > > > > > manager (struct drm_mm)"   =20
> > > > > > > =20
> > > > > > >  igt_main
> > > > > > >  {
> > > > > > > -	igt_kselftests("test-drm_mm", NULL, NULL, NULL);
> > > > > > > +	int ret =3D igt_kunit("drm_mm_test", NULL);
> > > > > > > +	if (ret !=3D 0 && ret !=3D IGT_EXIT_ABORT)
> > > > > > > +		igt_kselftests("test-drm_mm", NULL, NULL, NULL);   =20
> > > > > >=20
> > > > > > My discussion with Mauro about subtest names and their consiste=
ncy with    =20
> > > > inline    =20
> > > > > > documentation has lead me to a question: have we verified if be=
havior of=20
> > > > > > --list-subtests option under such conditional construct is cons=
istent with=20
> > > > > > expectations of the testplan tool?
> > > > > >=20
> > > > > > But maybe we should still get back to a design phase and the qu=
estion of    =20
> > > > how    =20
> > > > > > we want these three generic DRM selftests to behave on old and =
new kernels=20
> > > > > > after the change.
> > > > > >=20
> > > > > > Option 1:
> > > > > > We just add kunit variants as new subtests, aside the existing =
i915-like=20
> > > > > > selftest subtests.  Whether kunit or i915-like selftest variant=
s will    =20
> > > > execute    =20
> > > > > > or skip depends on availability of required kernel side kunit o=
r selftest=20
> > > > > > modules.
> > > > > >=20
> > > > > > Option 2:
> > > > > > Each of the three tests still provides one igt_subtest_with_dyn=
amic().     =20
> > > > Which    =20
> > > > > > dynamic subtests are executed, whether kunit or i915-like selft=
est or    =20
> > > > none,    =20
> > > > > > depends on availability of required kernel modules.
> > > > > >=20
> > > > > > Option 3:
> > > > > > Current approach: provide only kunit subtests on kernels with k=
unit    =20
> > > > modules    =20
> > > > > > and only i915-like sleftest subtests otherwise.  But then, take=
 care of=20
> > > > > > --list-subtests option always returning only names of subtests =
that can be=20
> > > > > > executed (for which kernel modules are available).
> > > > > > Aditional assumption for the testplan tool: the same kunit kern=
el modules=20
> > > > > > available when building the testplan will be available when exe=
cuting it.   =20
> > > > >=20
> > > > > It sounds to me that you're over complicating it.   =20
> > > >=20
> > > > No, but I was just wrong about --list-subtests behavior for option =
3.  It=20
> > > > always displays the name of the kunit subtest, never of the i915-se=
lftest-like=20
> > > > subtest, no matter which kernel modules are available. =20
> >=20
> > It always display the name that igt_subtest_dynamic() uses. Such
> > behavior should be preserved after adding support for KUnit. =20
>=20
> Each instance of igt_subtest_dynamic()?  If there are two, one for kunit,=
 one=20
> for i915-like sleftest, and the second one is called conditionally, only =
if=20
> the first one fails, then what?
> The first one never fails with --list-subtests option provided.

I don't see any reason to have a fallback. For DRM tests, we should
simply remove selftests, as, afaikt, upstream doesn't support it
anymore. The same applies for Xe and KMS, as we won't have support
for selftests at the Xe driver.

Selftests should only be kept for i915 selftests, which this series
don't touch.

So, what I meant to say is that KUnit tests - after their conversion
from selftest - should use igt_subtest_dynamic(). This is needed in order
for IGT to list KUnit tests as dynamic subtests when using --list parameter.

>=20
> >  =20
> > > >    =20
> > > > >=20
> > > > > At IGT build time, it doesn't really matter if the tests will run=
 with
> > > > > KUnit or kselftest. What it matters is that igt dynamic subtest is
> > > > > properly setup, in a way that --list will display the dynamic sub=
test(s)
> > > > > that are part of it.
> > > > >=20
> > > > > Looking further, this series touch only 3 tests:
> > > > >=20
> > > > > 	- tests/drm_buddy.c
> > > > > 	- tests/drm_mm.c
> > > > > 	- tests/kms_selftest.c
> > > > >=20
> > > > > The first two are related to some changes that already happened
> > > > > upstream: DRM core now uses KUnit and don't have support for
> > > > > selftests.
> > > > >=20
> > > > > For KMS, I would expect that the Xe driver will require those to =
use
> > > > > KUnit as well, as Xe driver doesn't support selftest. It may eith=
er
> > > > > run as selftest or KUnit for i915. The IGT runtime decision to ru=
n=20
> > > > > either with KUnit or via selftest may depend if the Kernel is bui=
lt
> > > > > with KUnit support or not.
> > > > >=20
> > > > > -
> > > > >=20
> > > > > Now, preserving dynamic subtest namespace is particularly needed=
=20
> > > > > by drm_mm, which has an extensive documentation for the subtests=
=20
> > > > > provided by DRM core. We need to group the tests there inside
> > > > > igt_subtest_with_dynamic("all-tests"), in order to preserve the
> > > > > documentation we have.
> > > > >=20
> > > > > An alternative approach would be to change it to some other
> > > > > name:
> > > > >=20
> > > > > 	igt_subtest_with_dynamic("some-foo-name")
> > > > >=20
> > > > > And then rename the subtests inside tests/drm_mm.c replacing
> > > > > "all-tests" with "some-foo-name".
> > > > >=20
> > > > > I can't see any rationale for doing that, but, if you think it
> > > > > is worth doing that, feel free to submit a patch after we have
> > > > > this patch series merged.   =20
> > > >=20
> > > > So we're back to the discussion limited to subtest naming, while I =
was not=20
> > > > talking about subtest names, only about the structure of the tests,=
 and for me=20
> > > > it seems like you missed my points.
> > > >=20
> > > > Having the whole series applied, we can now observe two different a=
pproaches:
> > > >=20
> > > > Tests drm_mm and drm_buddy implement my option 1.     =20
> > >=20
> > > Should read: option 3 =20
> >=20
> > Yes, I missed the point. Could you please reply with a patch showing
> > what kind of changes are you talking about? =20
>=20
> I'm not sure what you mean.  Would you like me to reply with a patch that=
=20
> fixes the issues I've pointed out?

Yes, a patch on the top of this series, doing the changes you think
are still needed to get this series merged.

>  Or would you like me to respond to another=20
> patch of this series that's more related to my points than this one?
>=20
> If the former then I don't have a solution ready out of top of my head si=
nce=20
> I'm still not sure how we want to have coexistence of backword compatible=
=20
> subtests with new kunit ones designed.
>=20
> Thanks,
> Janusz
>=20
>=20
> >=20
> > Regards,
> > Mauro
> >=20
> >=20
> >=20
> >  =20
>=20
>=20
>=20
>=20
