Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EE06EBA7
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Sep 2021 16:11:26 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Thu, 30 Sep 2021 16:07:47 +0000
Message-ID: <MWHPR11MB1312DFEC790ADDD08A01963589AA9@MWHPR11MB1312.namprd11.prod.outlook.com>
References: <20210916135955.17270-1-vidya.srinivas@intel.com>
 <20210930152253.32192-1-vidya.srinivas@intel.com>
In-Reply-To: <20210930152253.32192-1-vidya.srinivas@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr2_sf: Skip tests if
 selected fetch is not available
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B,
 Jeevan" <jeevan.b@intel.com>
Cc: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, "markyacoub@google.com" <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

Apologies @B, Jeevan, previous version BAT was failing. I have changed the =
igt_require similar to previous igt_assert.
Could you kindly help review once again. Thank you.

Regards
Vidya

> -----Original Message-----
> From: Srinivas, Vidya <vidya.srinivas@intel.com>
> Sent: Thursday, September 30, 2021 8:53 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>;
> markyacoub@google.com; B, Jeevan <jeevan.b@intel.com>; Srinivas, Vidya
> <vidya.srinivas@intel.com>
> Subject: [PATCH i-g-t] tests/kms_psr2_sf: Skip tests if selected fetch is=
 not
> available
>=20
> Currently the tests are failing on systems where selected fetch feature i=
s not
> availble. Kernel returns -EINVAL when the test executes reporting "Invali=
d
> debug mask 4".
> Patch skips if selected fetch feature is not available in the kernel.
>=20
> v2: Incorportated Mark Yacoub's comments.
> Changed igt_skip to igt_require_f
>=20
> v3: Changing to igt_require(ret > 0) which is equivalent to original
> igt_assert(ret > 0)
>=20
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  lib/igt_psr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c index 68240f9a33b4..857eb591c6=
93
> 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -167,7 +167,7 @@ static bool psr_set(int device, int debugfs_fd, int
> mode)
>  		}
>=20
>  		ret =3D psr_write(debugfs_fd, debug_val);
> -		igt_assert(ret > 0);
> +		igt_require_f(ret > 0, "PSR2 SF feature not available\n");
>  	}
>=20
>  	/* Restore original value on exit */
> --
> 2.33.0
