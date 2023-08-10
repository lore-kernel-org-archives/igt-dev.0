Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E1E10E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 05:40:16 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 10 Aug 2023 05:40:12 +0000
Message-ID: <DM4PR11MB63126CDFB0C8E5AEA2BC8F1D9013A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-16-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-16-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 15/81] tests/i915/kms_draw_crc: Document
 each subtest for testplan
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
> Sent: Thursday, June 29, 2023 8:18 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [V5 i-g-t 15/81] tests/i915/kms_draw_crc: Document eac=
h
> subtest for testplan
>=20
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM.
Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  tests/i915/kms_draw_crc.c | 49
> +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 47 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c index
> 01ecb7bb9..8a001f6b6 100644
> --- a/tests/i915/kms_draw_crc.c
> +++ b/tests/i915/kms_draw_crc.c
> @@ -22,8 +22,11 @@
>   *
>   */
>=20
> -/* This program tests whether the igt_draw library actually works. */
> -
> +/**
> + * TEST: kms draw crc
> + * Category: Display
> + * Description: Tests whether the igt_draw library actually works.
> + */
>  #include "i915/gem.h"
>  #include "igt.h"
>=20
> @@ -140,6 +143,39 @@ static void get_method_crc(enum igt_draw_method
> method, uint32_t drm_format,
>  	igt_remove_fb(drm_fd, &fb);
>  }
>=20
> +/**
> + * SUBTEST: draw-method-%s
> + * Description: Verify that igt draw library works for the %arg[1] metho=
d
> with
> + *              different modifiers & DRM formats.
> + * Driver requirement: any
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @blt:          Blitter
> + * @mmap-wc:      MMAP-WC
> + * @render:       Render
> + */
> +
> +/**
> + * SUBTEST: draw-method-%s
> + * Description: Verify that igt draw library works for the %arg[1] metho=
d
> with
> + *              different modifiers & DRM formats.
> + * Driver requirement: i915
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @mmap-cpu:     MMAP-CPU
> + * @mmap-gtt:     MMAP-GTT
> + * @pwrite:       PWRITE
> + */
>  static void draw_method_subtest(enum igt_draw_method method,
>  				uint32_t format_index, uint64_t modifier)  {
> @@ -179,6 +215,15 @@ static void get_fill_crc(uint64_t modifier, igt_crc_=
t
> *crc)
>  	igt_remove_fb(drm_fd, &fb);
>  }
>=20
> +/**
> + * SUBTEST: fill-fb
> + * Description: This subtest verifies CRC after filling fb with x-tiling=
 or none.
> + * Driver requirement: any
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>  static void fill_fb_subtest(void)
>  {
>  	int rc;
> --
> 2.40.0
