Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5B510E6A8
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Mar 2023 15:16:00 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 03 Mar 2023 16:15:37 +0100
Message-ID: <13658044.RDIVbhacDa@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <3040098.CbtlEUcBR6@jkrzyszt-mobl1.ger.corp.intel.com>
References: <20230303110715.8183-1-dominik.karol.piatkowski@intel.com>
 <20230303110715.8183-5-dominik.karol.piatkowski@intel.com>
 <3040098.CbtlEUcBR6@jkrzyszt-mobl1.ger.corp.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests: DRM selftests: switch to
 KUnit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Isabella Basso <isabbasso@riseup.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Friday, 3 March 2023 16:08:33 CET Janusz Krzysztofik wrote:
> On Friday, 3 March 2023 12:07:15 CET Dominik Karol Piatkowski wrote:
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
> > Co-authored-by: Dominik Karol Pi=C4=85tkowski=20
> <dominik.karol.piatkowski@intel.com>
> > ---
> >  tests/drm_buddy.c    |  4 +++-
> >  tests/drm_mm.c       |  4 +++-
> >  tests/kms_selftest.c | 17 ++++++++++++++++-
> >  3 files changed, 22 insertions(+), 3 deletions(-)
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
> > index 2052b115..46d0142f 100644
> > --- a/tests/drm_mm.c
> > +++ b/tests/drm_mm.c
> > @@ -28,5 +28,7 @@ IGT_TEST_DESCRIPTION("Basic sanity check of DRM's ran=
ge=20
> manager (struct drm_mm)"
> > =20
> >  igt_main
> >  {
> > -	igt_kselftests("test-drm_mm", NULL, NULL, NULL);
> > +	int ret =3D igt_kunit("drm_mm_test", NULL);
> > +	if (ret !=3D 0 && ret !=3D IGT_EXIT_ABORT)
> > +		igt_kselftests("test-drm_mm", NULL, NULL, NULL);
> >  }
> > diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
> > index abc4bfe9..88d48545 100644
> > --- a/tests/kms_selftest.c
> > +++ b/tests/kms_selftest.c
> > @@ -28,5 +28,20 @@ IGT_TEST_DESCRIPTION("Basic sanity check of KMS=20
> selftests.");
> > =20
> >  igt_main
> >  {
> > -	igt_kselftests("test-drm_modeset", NULL, NULL, NULL);
> > +	int ret;
> > +	int passed =3D 0;
> > +	static const char *kunit_subtests[] =3D { "drm_cmdline_parser_test",=
=20
> "drm_damage_helper_test",
> > +					=09
> "drm_dp_mst_helper_test", "drm_format_helper_test",
> > +					=09
> "drm_format_test", "drm_framebuffer_test",
> > +					=09
> "drm_plane_helper_test", NULL };
> > +
> > +	for (int i =3D 0; kunit_subtests[i] !=3D NULL; i++)
> > +		igt_subtest(kunit_subtests[i]) {
> > +			ret =3D igt_kunit(kunit_subtests[i], NULL);
> > +			passed +=3D (ret =3D=3D 0);
> > +			igt_assert(ret =3D=3D 0);
> > +		}
> > +
> > +	if (passed =3D=3D 0)
> > +		igt_kselftests("test-drm_modeset", NULL, NULL, NULL);
>=20
> I think that's not correct.  Since igt_kselftests() exposes a subtest (wi=
th=20
> dynamic sub-subtests), and CI expects a static list of subtests, that fun=
ction=20
> shouldn't be called conditionally, I believe.
>=20
> I think we have two options:
> 1) both igt_kselftests() and igt_kunit() expose a subtest which skips if =
no=20
>    requested module is found,=20
> or
> 2) a wrapper calls either igt_kunit() or igt_kselftests(), based on which=
=20
>    modules are present.

The wrapper provides the subtest, while igt_kunit() and igt_kselftests()=20
provide dynamic sub-subtests.  The wrapper likely doesn't need to look for=
=20
modules' presence.

Thanks,
Janusz

>=20
> Thanks,
> Janusz
>  =20
> >  }
> >=20
>=20
>=20



