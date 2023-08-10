Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623EF10E154
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 05:09:29 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 10 Aug 2023 05:09:25 +0000
Message-ID: <DM4PR11MB6312779A6333E56F86A4CCEB9013A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-59-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-59-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 58/81] tests/kms_pipe_crc_basic: Document
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
> Subject: [igt-dev] [V5 i-g-t 58/81] tests/kms_pipe_crc_basic: Document ea=
ch
> subtest for testplan
>=20
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>=20
> V2: - Add missing "Driver requirement" field
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM.
Jeevan B <jeevan.b@intel.com>

> ---
>  tests/kms_pipe_crc_basic.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c inde=
x
> 95cc1d7fa..9e800b285 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -23,8 +23,9 @@
>   */
>=20
>  /**
> - * TEST: Tests behaviour of CRC
> + * TEST: kms pipe crc basic
>   * Category: Display
> + * Description: Tests behaviour of CRC
>   */
>=20
>  #include "igt.h"
> @@ -64,6 +65,15 @@ static bool simulation_constraint(enum pipe pipe)
>  	return false;
>  }
>=20
> +/**
> + * SUBTEST: bad-source
> + * Description: Tests error handling when the bad source is set.
> + * Driver requirement: any
> + * Functionality: crc
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>  static void test_bad_source(data_t *data)  {
>  	errno =3D 0;
> @@ -88,6 +98,7 @@ enum {
>  /**
>   * SUBTEST: read-crc
>   * Description: Test for pipe CRC reads
> + * Driver requirement: any
>   * Test category: functionality test
>   * Run type: BAT
>   * Functionality: crc
> @@ -95,6 +106,7 @@ enum {
>   *
>   * SUBTEST: read-crc-frame-sequence
>   * Description: Tests the pipe CRC read and ensure frame sequence
> + * Driver requirement: any
>   * Test category: functionality test
>   * Run type: BAT
>   * Functionality: crc
> @@ -102,6 +114,7 @@ enum {
>   *
>   * SUBTEST: nonblocking-crc
>   * Description: Test for O_NONBLOCK CRC reads
> + * Driver requirement: any
>   * Test category: functionality test
>   * Run type: BAT
>   * Functionality: crc
> @@ -109,6 +122,7 @@ enum {
>   *
>   * SUBTEST: nonblocking-crc-frame-sequence
>   * Description: Test for O_NONBLOCK CRC reads and ensure frame sequence
> + * Driver requirement: any
>   * Test category: functionality test
>   * Run type: BAT
>   * Functionality: crc
> @@ -116,6 +130,7 @@ enum {
>   *
>   * SUBTEST: suspend-read-crc
>   * Description: Suspend test for pipe CRC reads
> + * Driver requirement: any
>   * Test category: functionality test
>   * Run type: BAT
>   * Functionality: crc
> @@ -123,12 +138,12 @@ enum {
>   *
>   * SUBTEST: hang-read-crc
>   * Description: Hang test for pipe CRC read
> + * Driver requirement: any
>   * Test category: functionality test
>   * Run type: BAT
>   * Functionality: crc
>   * Mega feature: General Display Features
>   */
> -
>  static void test_read_crc(data_t *data, enum pipe pipe,
>  			  igt_output_t *output, unsigned flags)  { @@ -229,6
> +244,7 @@ static void test_read_crc(data_t *data, enum pipe pipe,
>  /**
>   * SUBTEST: compare-crc-sanitycheck-%s
>   * Description: Basic sanity check for CRC mismatches with %arg[1]
> + * Driver requirement: any
>   * Test category: functionality test
>   * Run type: BAT
>   * Functionality: crc
> @@ -305,6 +321,16 @@ static void test_compare_crc(data_t *data, enum
> pipe pipe, igt_output_t *output,
>  	igt_remove_fb(data->drm_fd, &fb1);
>  }
>=20
> +/**
> + * SUBTEST: disable-crc-after-crtc
> + * Description: Check that disabling CRCs on a CRTC after having disable=
d the
> + *              CRTC does not cause issues.
> + * Driver requirement: any
> + * Functionality: crc
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>  static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
>  					igt_output_t *output)
>  {
> --
> 2.40.0
