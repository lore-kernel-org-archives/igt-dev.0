Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565A910E4AF
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 10:26:02 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Wed, 07 Jun 2023 12:24:55 +0200
Message-ID: <4511080.cEBGB3zze1@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <20230605104716.5678-5-dominik.karol.piatkowski@intel.com>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
 <20230605104716.5678-5-dominik.karol.piatkowski@intel.com>
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
To: igt-dev@lists.freedesktop.org, Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Cc: Isabella Basso <isabbasso@riseup.net>
List-ID: <igt-dev@lists.freedesktop.org>

On Monday, 5 June 2023 12:47:12 CEST Dominik Karol Piatkowski wrote:
> From: Isabella Basso <isabbasso@riseup.net>
>=20
> As the DRM selftests are now using KUnit [1], update IGT tests as well.
>=20
> [1] - https://lore.kernel.org/all/20220708203052.236290-1-maira.canal@usp=
=2Ebr/
>=20
> Signed-off-by: Isabella Basso <isabbasso@riseup.net>
>=20
> v1 -> v2:
> - drm_buddy|drm_mm: fallback to igt_kselftests if igt_kunit failed
>   with code other than IGT_EXIT_ABORT
> - kms_selftest: move igt_kunit tests to separate subtests
> - kms_selftest: fallback to igt_kselftests if all subtests failed
>=20
> v2 -> v3:
> - expose all subtests
>=20
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  tests/drm_buddy.c    | 4 +++-
>  tests/drm_mm.c       | 4 +++-
>  tests/kms_selftest.c | 8 ++++++++
>  3 files changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
> index 06876e0c..3261f0d6 100644
> --- a/tests/drm_buddy.c
> +++ b/tests/drm_buddy.c
> @@ -10,5 +10,7 @@ IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy=
=20
allocator (struct drm_bu
> =20
>  igt_main
>  {
> -	igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
> +	int ret =3D igt_kunit("drm_buddy_test", NULL);
> +	if (ret !=3D 0 && ret !=3D IGT_EXIT_ABORT)
> +		igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
>  }
> diff --git a/tests/drm_mm.c b/tests/drm_mm.c
> index 0bce7139..88f76a57 100644
> --- a/tests/drm_mm.c
> +++ b/tests/drm_mm.c
> @@ -156,5 +156,7 @@ IGT_TEST_DESCRIPTION("Basic sanity check of DRM's ran=
ge=20
manager (struct drm_mm)"
> =20
>  igt_main
>  {
> -	igt_kselftests("test-drm_mm", NULL, NULL, NULL);
> +	int ret =3D igt_kunit("drm_mm_test", NULL);
> +	if (ret !=3D 0 && ret !=3D IGT_EXIT_ABORT)
> +		igt_kselftests("test-drm_mm", NULL, NULL, NULL);

My discussion with Mauro about subtest names and their consistency with inl=
ine=20
documentation has lead me to a question: have we verified if behavior of=20
=2D-list-subtests option under such conditional construct is consistent wit=
h=20
expectations of the testplan tool?

But maybe we should still get back to a design phase and the question of ho=
w=20
we want these three generic DRM selftests to behave on old and new kernels=
=20
after the change.

Option 1:
We just add kunit variants as new subtests, aside the existing i915-like=20
selftest subtests.  Whether kunit or i915-like selftest variants will execu=
te=20
or skip depends on availability of required kernel side kunit or selftest=20
modules.

Option 2:
Each of the three tests still provides one igt_subtest_with_dynamic().  Whi=
ch=20
dynamic subtests are executed, whether kunit or i915-like selftest or none,=
=20
depends on availability of required kernel modules.

Option 3:
Current approach: provide only kunit subtests on kernels with kunit modules=
=20
and only i915-like sleftest subtests otherwise.  But then, take care of=20
=2D-list-subtests option always returning only names of subtests that can b=
e=20
executed (for which kernel modules are available).
Aditional assumption for the testplan tool: the same kunit kernel modules=20
available when building the testplan will be available when executing it.

Thanks,
Janusz
 =20
>  }
> diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
> index abc4bfe9..b27f60fb 100644
> --- a/tests/kms_selftest.c
> +++ b/tests/kms_selftest.c
> @@ -28,5 +28,13 @@ IGT_TEST_DESCRIPTION("Basic sanity check of KMS=20
selftests.");
> =20
>  igt_main
>  {
> +	static const char *kunit_subtests[] =3D { "drm_cmdline_parser_test",=20
"drm_damage_helper_test",
> +					=09
"drm_dp_mst_helper_test", "drm_format_helper_test",
> +						"drm_format_test",=20
"drm_framebuffer_test",
> +					=09
"drm_plane_helper_test", NULL };
> +
> +	for (int i =3D 0; kunit_subtests[i] !=3D NULL; i++)
> +		igt_kunit(kunit_subtests[i], NULL);
> +
>  	igt_kselftests("test-drm_modeset", NULL, NULL, NULL);
>  }
>=20





