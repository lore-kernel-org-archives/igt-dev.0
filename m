Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EAA10E5CD
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 17:35:39 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 10 Aug 2023 17:35:12 +0000
Message-ID: <DM4PR11MB63128B58B8AE8AA0B88BCD199013A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-60-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-60-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 59/81] tests/kms_plane: Document each
 subtest for testplan
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Thursday, June 29, 2023 8:19 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [V5 i-g-t 59/81] tests/kms_plane: Document each subtes=
t for
> testplan
>=20
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM.
Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  tests/kms_plane.c | 58
> +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c index 67cff61d6..8c6ce=
78f3
> 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -24,6 +24,11 @@
>   *   Damien Lespiau <damien.lespiau@intel.com>
>   */
>=20
> +/**
> + * TEST: kms plane
> + * Category: Display
> + * Description: Testes for KMS Plane
> + */
>  #include "igt.h"
>  #include "igt_vec.h"
>  #include <errno.h>
> @@ -273,6 +278,21 @@ test_plane_position_with_output(data_t *data,
>  	igt_remove_fb(data->drm_fd, &sprite_fb);  }
>=20
> +/**
> + * SUBTEST: plane-position-%s
> + * Description: Verify plane position using two planes to create a
> +%arg[1]
> + * Driver requirement: any
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @covered:           fully covered screen
> + * @hole:              partially covered screen
> + * @hole-dpms:         partially covered screen and check for DPMS
> + */
>  static void
>  test_plane_position(data_t *data, enum pipe pipe)  { @@ -381,6 +401,21 @=
@
> test_plane_panning_with_output(data_t *data,
>  	igt_remove_fb(data->drm_fd, &primary_fb);  }
>=20
> +/**
> + * SUBTEST: plane-panning-%s
> + * Description: Verify plane panning at %arg[1] using primary plane
> + * Driver requirement: any
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @bottom-right:               bottom-right position
> + * @bottom-right-suspend:       bottom-right position with suspend
> + * @top-left:                   top-left position
> + */
>  static void
>  test_plane_panning(data_t *data, enum pipe pipe)  { @@ -1101,6 +1136,20
> @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
>  	return index !=3D 0 && index !=3D 3 && index !=3D 5;  }
>=20
> +/**
> + * SUBTEST: pixel-%s
> + * Description: verify the pixel formats for given plane and pipe
> + * Driver requirement: any
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @format:
> + * @format-source-clamping:          with source clamping
> + */
>  static void
>  test_pixel_formats(data_t *data, enum pipe pipe)  { @@ -1157,6 +1206,15 =
@@
> test_pixel_formats(data_t *data, enum pipe pipe)
>  	igt_assert_f(result, "At least one CRC mismatch happened\n");  }
>=20
> +/**
> + * SUBTEST: invalid-pixel-format-settings
> + * Description: verify invalid settings for pixel format are not
> +accepted
> + * Driver requirement: any
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>  static void test_invalid_settings(data_t *data)  {
>  	enum pipe pipe =3D PIPE_A;
> --
> 2.40.0
