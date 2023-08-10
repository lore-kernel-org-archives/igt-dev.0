Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B3110E5D0
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 17:44:31 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 10 Aug 2023 17:44:22 +0000
Message-ID: <DM4PR11MB63121BC7F718949DDA7D50B59013A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-62-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-62-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 61/81] tests/kms_plane_cursor: Document
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
> Subject: [igt-dev] [V5 i-g-t 61/81] tests/kms_plane_cursor: Document each
> subtest for testplan
>=20
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM.
Reviewed-by: Jeevan B <jeevan.b@intel.com>

> ---
>  tests/kms_plane_cursor.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c index
> a7acb18e1..bf217fbcb 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -21,6 +21,36 @@
>   */
>=20
>  #include "igt.h"
> +/**
> + * TEST: kms plane cursor
> + * Category: Display
> + * Description: Tests cursor interactions with primary and overlay plane=
s.
> + *
> + * SUBTEST: overlay
> + * Description: Tests atomic cursor positioning on primary plane and
> +overlay plane
> + * Driver requirement: any
> + * Functionality: cursor, plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: primary
> + * Description: Tests atomic cursor positioning on primary plane
> + * Driver requirement: any
> + * Functionality: cursor, plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: viewport
> + * Description: Tests atomic cursor positioning on primary plane and ove=
rlay
> plane
> + *              with buffer larger than viewport used for display
> + * Driver requirement: any
> + * Functionality: cursor, plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>=20
>  /*
>   * This file tests cursor interactions with primary and overlay planes.
> --
> 2.40.0
