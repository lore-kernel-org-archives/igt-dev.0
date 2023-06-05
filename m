Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627DE10E28B
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 11:00:26 +0000 (UTC)
Date: Mon, 5 Jun 2023 13:00:20 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Message-ID: <20230605130020.1efcfa3d@maurocar-mobl2>
In-Reply-To: <20230605104716.5678-5-dominik.karol.piatkowski@intel.com>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
 <20230605104716.5678-5-dominik.karol.piatkowski@intel.com>
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

On Mon,  5 Jun 2023 12:47:12 +0200
Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com> wrote:

> From: Isabella Basso <isabbasso@riseup.net>
>=20
> As the DRM selftests are now using KUnit [1], update IGT tests as well.
>=20
> [1] - https://lore.kernel.org/all/20220708203052.236290-1-maira.canal@usp=
.br/
>=20
> Signed-off-by: Isabella Basso <isabbasso@riseup.net>

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

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
 allocator (struct drm_bu
> =20
>  igt_main
>  {
> -	igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
> +	int ret =3D igt_kunit("drm_buddy_test", NULL);
> +	if (ret !=3D 0 && ret !=3D IGT_EXIT_ABORT)

Nit: Kernel style asks for a blank like after variable initialization.

> +		igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
>  }
> diff --git a/tests/drm_mm.c b/tests/drm_mm.c
> index 0bce7139..88f76a57 100644
> --- a/tests/drm_mm.c
> +++ b/tests/drm_mm.c
> @@ -156,5 +156,7 @@ IGT_TEST_DESCRIPTION("Basic sanity check of DRM's ran=
ge manager (struct drm_mm)"
> =20
>  igt_main
>  {
> -	igt_kselftests("test-drm_mm", NULL, NULL, NULL);
> +	int ret =3D igt_kunit("drm_mm_test", NULL);
> +	if (ret !=3D 0 && ret !=3D IGT_EXIT_ABORT)
> +		igt_kselftests("test-drm_mm", NULL, NULL, NULL);
>  }
> diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
> index abc4bfe9..b27f60fb 100644
> --- a/tests/kms_selftest.c
> +++ b/tests/kms_selftest.c
> @@ -28,5 +28,13 @@ IGT_TEST_DESCRIPTION("Basic sanity check of KMS selfte=
sts.");
> =20
>  igt_main
>  {
> +	static const char *kunit_subtests[] =3D { "drm_cmdline_parser_test", "d=
rm_damage_helper_test",
> +						"drm_dp_mst_helper_test", "drm_format_helper_test",
> +						"drm_format_test", "drm_framebuffer_test",
> +						"drm_plane_helper_test", NULL };
> +
> +	for (int i =3D 0; kunit_subtests[i] !=3D NULL; i++)
> +		igt_kunit(kunit_subtests[i], NULL);
> +
>  	igt_kselftests("test-drm_modeset", NULL, NULL, NULL);
>  }
