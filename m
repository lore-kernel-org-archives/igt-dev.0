Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F3910E034
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jan 2024 05:54:26 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t 1/2] tests/kms_vrr: Tweak flipline subtest
Date: Tue, 9 Jan 2024 05:54:22 +0000
Message-ID: <PH7PR11MB8252BAE772F6ED966EBE3E75896A2@PH7PR11MB8252.namprd11.prod.outlook.com>
References: <20231213081652.3662325-1-bhanuprakash.modem@intel.com>
 <20231213095350.3684163-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231213095350.3684163-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Wednesday, December 13, 2023 3:24 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [i-g-t 1/2] tests/kms_vrr: Tweak flipline subtest
>=20
> As per the spec: If there is no flip request with in Vmax, Hardware will
> terminate the Vblank at Vmax.
>=20
> If we flip with the interval > Vmax, the expected refresh rate could be: =
(Vmax
> + time left for the next flip + Vmin), and it is very difficult to genera=
lize. For
> low refresh rate panels (like 40 - 60 Hz), result is not falling into the=
 threshold.
>=20
> Hence, tweak the test to increase the flip request interval.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 1ace970a5..71fc36162
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -481,11 +481,11 @@ test_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
>  	}
>=20
>  	if (flags & TEST_FLIPLINE) {
> -		rate =3D rate_from_refresh(range.min - 5);
> +		rate =3D rate_from_refresh(range.min - 10);
>  		result =3D flip_and_measure(data, output, pipe, rate,
> TEST_DURATION_NS);
>  		igt_assert_f(result < 50,
>  			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold exceeded, result was %u%%\n",
> -			     (range.min - 5), rate, result);
> +			     (range.min - 10), rate, result);
>  	}
>=20
>  	/*
> --
> 2.40.0
