Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4979B6E9A7
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 16:42:07 +0000 (UTC)
Date: Thu, 19 Aug 2021 19:42:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YR6J2oUCF3Mou9am@intel.com>
References: <20210819115942.23920-1-thomas.hellstrom@linux.intel.com>
 <20210819115942.23920-3-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210819115942.23920-3-thomas.hellstrom@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/kms_addfb_basic: Skip tiling
 subtests on device without hw tiling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, apoorva1.singh@intel.com, zbigniew.kempczynski@intel.com, Vanshidhar Konda <vanshidhar.r.konda@intel.com>, Uma Shankar <uma.shankar@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 19, 2021 at 01:59:41PM +0200, Thomas Hellstr=F6m wrote:
> From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
>=20
> Skip subtests that are testing interoperability of FB modifiers and
> hardware tiling if the device does not support HW tiling
>=20
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
> ---
>  tests/kms_addfb_basic.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 05c8b5f6..f5a15298 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -138,6 +138,7 @@ static void invalid_tests(int fd)
>  	igt_describe("Check if addfb2 call works for clobbered modifier");
>  	igt_subtest("clobberred-modifier") {
>  		igt_require_intel(fd);
> +		igt_require(gem_has_legacy_hw_tiling(fd));
>  		f.flags =3D 0;
>  		f.modifier[0] =3D 0;
>  		gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4);
> @@ -340,6 +341,7 @@ static void tiling_tests(int fd)
>  	igt_subtest_group {
>  		igt_fixture {
>  			igt_require_intel(fd);
> +			igt_require(gem_has_legacy_hw_tiling(fd));
>  			tiled_x_bo =3D igt_create_bo_with_dimensions(fd, 1024, 1024,
>  				DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED,
>  				1024*4, NULL, NULL, NULL);

Hmm. These tests look at bit borked atm. There's no explicit
set_tiling() calls in sight, so I guess currently we're just
assuming that igt_fb will do it for us. That seems rather
fragile, and if we were to remove the set_tiling() calls from
igt_fb then these tests would no longer be testing what we think
they are testing...

> @@ -511,6 +513,7 @@ static void size_tests(int fd)
>  	igt_describe("Test that addfb2 call fails correctly with small buffer o=
bject after changing tile");
>  	igt_subtest("bo-too-small-due-to-tiling") {
>  		igt_require_intel(fd);
> +		igt_require(gem_has_legacy_hw_tiling(fd));
>  		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 1024*4);
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) =3D=3D -1 &&
>  			   errno =3D=3D EINVAL);
> @@ -565,6 +568,7 @@ static void addfb25_tests(int fd)
>  	igt_subtest_group {
>  		igt_fixture {
>  			igt_require_intel(fd);
> +			igt_require(gem_has_legacy_hw_tiling(fd));
>  			gem_set_tiling(fd, gem_bo, I915_TILING_X, 1024*4);
>  			igt_require_fb_modifiers(fd);
>  		}
> --=20
> 2.31.1

--=20
Ville Syrj=E4l=E4
Intel
