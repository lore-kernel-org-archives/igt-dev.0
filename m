Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65AF1126AB
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jun 2022 05:36:12 +0000 (UTC)
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
To: "Latvala, Petri" <petri.latvala@intel.com>
Date: Mon, 6 Jun 2022 05:36:08 +0000
Message-ID: <PH7PR11MB60063398DB84553A1CD21ADDC5A29@PH7PR11MB6006.namprd11.prod.outlook.com>
References: <20220520011226.24017-1-nidhi1.gupta@intel.com>
 <20220520011226.24017-2-nidhi1.gupta@intel.com>
 <YocvKicRCAmZY0aR@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YocvKicRCAmZY0aR@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2] tests/kms_invalid_mode : Convert tests to
 dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri,

Thanks for the review.

We are trying to convert all the tests in IGT into dynamic tests, for bette=
r reporting and get more data just from the name of the subtest to ease the=
 debugging process.

Trying to do the same with this test, this test will be executed on every p=
ipe with valid output.



-----Original Message-----
From: Latvala, Petri <petri.latvala@intel.com>=20
Sent: Friday, May 20, 2022 11:33 AM
To: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH 1/2] tests/kms_invalid_mode : Convert tests t=
o dynamic

On Fri, May 20, 2022 at 06:42:25AM +0530, Nidhi Gupta wrote:
> Modified kms_invalid_mode to include dynamic test cases for better=20
> reporting of the results.
>=20
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>  tests/kms_invalid_mode.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c index=20
> bb92a94e..bb524037 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -296,8 +296,11 @@ static const struct {
> =20
>  static data_t data;
> =20
> -igt_main
> -{
> +igt_main {
> +
> +igt_output_t *output;
> +enum pipe pipe;
> +
>  	igt_fixture {
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> =20
> @@ -312,9 +315,15 @@ igt_main
>  	}
> =20
>  	for (int i =3D 0; i < ARRAY_SIZE(subtests); i++) {
> -		igt_subtest(subtests[i].name) {
> -			data.adjust_mode =3D subtests[i].adjust_mode;
> -			test(&data);
> +		igt_subtest_with_dynamic(subtests[i].name) {
> +			for_each_pipe(&data.display, pipe) {
> +				for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) =
{
> +						data.adjust_mode =3D subtests[i].adjust_mode;
> +						test(&data);
> +					}
> +				}

What is the goal of this change? All this does is repeat the _same_ operati=
ons n number of times.


--
Petri Latvala
