Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50C210E17C
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 09:33:55 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 10 Aug 2023 09:33:48 +0000
Message-ID: <DM4PR11MB63128F05FA35182664917C129013A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-64-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-64-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 63/81] tests/kms_plane_multiple: Document
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
> Subject: [igt-dev] [V5 i-g-t 63/81] tests/kms_plane_multiple: Document ea=
ch
> subtest for testplan
>=20
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM.
Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  tests/kms_plane_multiple.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c inde=
x
> 1f2bd65c3..3e6f4411e 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -22,6 +22,11 @@
>   *
>   */
>=20
> +/**
> + * TEST: kms plane multiple
> + * Category: Display
> + * Description: Test atomic mode setting with multiple planes.
> + */
>  #include "igt.h"
>  #include "drmtest.h"
>  #include <errno.h>
> @@ -373,6 +378,25 @@ test_plane_position(data_t *data, enum pipe pipe,
> igt_output_t *output, uint64_t
>  					n_planes, modifier);
>  }
>=20
> +/**
> + * SUBTEST: tiling-%s
> + * Description: Check that the kernel handles atomic updates of multiple=
 planes
> + *              correctly by changing their geometry and making sure the=
 changes
> + *              are reflected immediately after each commit.
> + * Driver requirement: any
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @none:        Linear buffer (no tiling)
> + * @4:           4-tiling
> + * @x:           x-tiling
> + * @y:           y-tiling
> + * @yf:          yf-tiling
> + */
>  static void run_test(data_t *data, uint64_t modifier)  {
>  	enum pipe pipe;
> --
> 2.40.0
