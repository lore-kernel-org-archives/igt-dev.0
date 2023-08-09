Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0347D10E238
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 05:36:12 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 9 Aug 2023 05:36:01 +0000
Message-ID: <DM4PR11MB6312D8EED03F61D728B5D91B9012A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-43-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-43-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 42/81] tests/kms_cursor_edge_walk: Document
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
> Sent: Thursday, June 29, 2023 8:19 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [V5 i-g-t 42/81] tests/kms_cursor_edge_walk: Document
> each subtest for testplan
>=20
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM.
Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  tests/kms_cursor_edge_walk.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index 462b51e20..9010aa0f7 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -28,6 +28,32 @@
>  #include <stdbool.h>
>  #include <stdio.h>
>  #include <string.h>
> +/**
> + * TEST: kms cursor edge walk
> + * Category: Display
> + * Description: Exercise CHV pipe C cursor fail
> + *
> + * SUBTEST: %s-%s
> + * Description: Checking cursor size %arg[1] by walking %arg[2] of
> +screen
> + * Driver requirement: any
> + * Functionality: cursor
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @128x128:          128x128
> + * @256x256:          256x256
> + * @64x64:            64x64
> + *
> + * arg[2]:
> + *
> + * @left-edge:        Left edge
> + * @right-edge:       Right edge
> + * @top-bottom:       Top to bottom
> + * @top-edge:         Top edge
> + */
>=20
>  IGT_TEST_DESCRIPTION("Exercise CHV pipe C cursor fail");
>=20
> --
> 2.40.0
