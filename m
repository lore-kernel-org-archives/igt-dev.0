Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6A510E232
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 05:27:08 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 9 Aug 2023 05:27:05 +0000
Message-ID: <DM4PR11MB63120DC474C773B593AEAF6D9012A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-45-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-45-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 44/81] tests/kms_display_modes: Document
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
> Subject: [igt-dev] [V5 i-g-t 44/81] tests/kms_display_modes: Document eac=
h
> subtest for testplan
>=20
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>=20
> V2: - Add missing documentation
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

LGTM.
Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_display_modes.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c index
> 93d91ef5b..b26a3f71a 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -24,6 +24,11 @@
>   *  Jeevan B <jeevan.b@intel.com>
>   */
>=20
> +/**
> + * TEST: kms display modes
> + * Category: Display
> + * Description: Test Display Modes
> + */
>  #include "igt.h"
>=20
>  #define HDISPLAY_4K	3840
> @@ -231,6 +236,16 @@ static void run_extendedmode_basic(data_t *data,
>  	for_each_connected_output_local((display), (output)) \
>  		for_each_if (igt_pipe_connector_valid((pipe), (output)))
>=20
> +/**
> + * SUBTEST: extended-mode-basic
> + * Description: Test for validating display extended mode with a pair of
> connected
> + *              displays
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>  static void run_extendedmode_test(data_t *data) {
>  	enum pipe pipe1, pipe2;
>  	igt_output_t *output1, *output2;
> @@ -276,6 +291,16 @@ static void run_extendedmode_test(data_t *data) {
>  	}
>  }
>=20
> +/**
> + * SUBTEST: mst-extended-mode-negative
> + * Description: Negative test for validating display extended mode with =
a
> pair
> + *		of connected 2k-4k or 4k-4k displays.
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>  static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2=
)
> {
>  	struct igt_fb fbs[2];
> --
> 2.40.0
