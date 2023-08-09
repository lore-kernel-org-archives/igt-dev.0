Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A337510E232
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 05:38:37 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 9 Aug 2023 05:38:27 +0000
Message-ID: <DM4PR11MB6312F22D0AE86C53F6BA4F899012A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-22-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-22-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 21/81] tests/i915/kms_flip_tiling: Document
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
> Subject: [igt-dev] [V5 i-g-t 21/81] tests/i915/kms_flip_tiling: Document =
each
> subtest for testplan
>=20
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM.
Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  tests/i915/kms_flip_tiling.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c =
index
> 02a5fe8e3..6cb85e9d3 100644
> --- a/tests/i915/kms_flip_tiling.c
> +++ b/tests/i915/kms_flip_tiling.c
> @@ -30,6 +30,19 @@
>  #include <string.h>
>=20
>  #include "igt.h"
> +/**
> + * TEST: kms flip tiling
> + * Category: Display
> + * Description: Test page flips and tiling scenarios
> + *
> + * SUBTEST: flip-change-tiling
> + * Description: Check pageflip between modifiers
> + * Driver requirement: any
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>=20
>  IGT_TEST_DESCRIPTION("Test page flips and tiling scenarios");
>=20
> --
> 2.40.0
