Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9BE10E086
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Dec 2023 06:56:54 +0000 (UTC)
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t V6 05/10] tests/kms_vrr: Fix the logic to calculate
 expected rate
Date: Mon, 11 Dec 2023 06:56:47 +0000
Message-ID: <IA1PR11MB6348EDCC54C8304F7F5A7481B28FA@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20231207064900.3328723-1-bhanuprakash.modem@intel.com>
 <20231207064900.3328723-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20231207064900.3328723-6-bhanuprakash.modem@intel.com>
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



> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Thursday, December 7, 2023 12:19 PM
> To: igt-dev@lists.freedesktop.org; ville.syrjala@linux.intel.com; Golani,
> Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t V6 05/10] tests/kms_vrr: Fix the logic to calculate expec=
ted rate
>=20
> Fix the condition check to measure the expected refresh rate.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 4540d8b4b..db82cd008
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -329,7 +329,7 @@ flip_and_measure(data_t *data, igt_output_t
> *output, enum pipe pipe,
>  		 * difference between 144Hz and 143Hz which should give
> this
>  		 * enough accuracy for most use cases.
>  		 */
> -		if ((rate_ns < vtest_ns.min) && (rate_ns >=3D vtest_ns.max))
> +		if ((rate_ns <=3D vtest_ns.min) && (rate_ns >=3D vtest_ns.max))
>  			diff_ns =3D rate_ns;
>  		else
>  			diff_ns =3D vtest_ns.max;
> --
> 2.40.0

This can be squashed to next patches, as that resembles its purpose of use.

Regards,
Mitul
