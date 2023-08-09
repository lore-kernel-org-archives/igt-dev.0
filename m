Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F2F10E232
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 05:31:42 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 9 Aug 2023 05:31:30 +0000
Message-ID: <DM4PR11MB631214AFE9E6907E4B23B4EA9012A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-42-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-42-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 41/81] tests/kms_cursor_crc: Document each
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
> Subject: [igt-dev] [V5 i-g-t 41/81] tests/kms_cursor_crc: Document each
> subtest for testplan
>=20
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM.
Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  tests/kms_cursor_crc.c | 65
> ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>=20
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c index
> 0506fd6f1..d91376fa4 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -29,6 +29,19 @@
>  #include <stdio.h>
>  #include <string.h>
>=20
> +/**
> + * TEST: kms cursor crc
> + * Category: Display
> + * Description: Use the display CRC support to validate cursor plane
> functionality.
> + *              The test will position the cursor plane either fully ons=
creen,
> + *              partially onscreen, or fully offscreen, using either a f=
ully
> + *              opaque or fully transparent surface. In each case, it en=
ables
> + *              the cursor plane and then reads the PF CRC (hardware tes=
t) and
> + *              compares it with the CRC value obtained when the cursor =
plane
> + *              was disabled and its drawing is directly inserted on the=
 PF by
> + *              software.
> + */
> +
>  IGT_TEST_DESCRIPTION(
>     "Use the display CRC support to validate cursor plane functionality. =
"
>     "The test will position the cursor plane either fully onscreen, "
> @@ -641,6 +654,27 @@ static bool require_cursor_size(data_t *data, int w,
> int h)
>  	return !!ret;
>  }
>=20
> +/**
> + * SUBTEST: cursor-%s
> + * Description: %arg[1]
> + * Driver requirement: any
> + * Functionality: cursor
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @alpha-opaque:       Validates the composition of a fully opaque curs=
or
> plane,
> + *                      i.e., alpha channel equal to 1.0.
> + * @alpha-transparent:  Validates the composition of a fully transparent
> cursor
> + *                      plane, i.e., alpha channel equal to 0.0.
> + * @dpms:               Check random placement of a cursor with DPMS.
> + * @size-change:        Create a maximum size cursor, then change the si=
ze in
> + *                      flight to smaller ones to see that the size is a=
pplied
> + *                      correctly.
> + * @suspend:            Check random placement of a cursor with suspend.
> + */
>  static void run_test(data_t *data, void (*testfunc)(data_t *), int curso=
r_w,
> int cursor_h)  {
>  	prepare_crtc(data, cursor_w, cursor_h); @@ -738,6 +772,37 @@
> static bool execution_constraint(enum pipe pipe)  }
>=20
>=20
> +/**
> + * SUBTEST: cursor-%s-%s
> + * Description: Check if a %arg[2] cursor is %arg[1].
> + * Driver requirement: any
> + * Functionality: cursor
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @offscreen:             well-positioned outside the screen
> + * @onscreen:              well-positioned inside the screen
> + * @random:                randomly placed
> + * @rapid-movement:        rapidly udates for movements
> + * @sliding:               smooth for horizontal, vertical & diagonal mo=
vements
> + *
> + * arg[2]:
> + *
> + * @128x128:               128x128 size
> + * @128x42:                128x42 size
> + * @256x256:               256x256 size
> + * @256x85:                256x85 size
> + * @32x10:                 32x10 size
> + * @32x32:                 32x32 size
> + * @512x170:               512x170 size
> + * @512x512:               512x512 size
> + * @64x21:                 64x21 size
> + * @64x64:                 64x64 size
> + * @max-size:              Max supported size
> + */
>  static void run_size_tests(data_t *data, int w, int h)  {
>  	enum pipe pipe;
> --
> 2.40.0
