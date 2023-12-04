Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597ED10E22D
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 03:30:15 +0000 (UTC)
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Mon, 4 Dec 2023 03:30:09 +0000
Message-ID: <PH0PR11MB57829DF26B7BDD9912EC56468286A@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20231201210013.16147-1-brian.welty@intel.com>
 <20231201210013.16147-3-brian.welty@intel.com>
In-Reply-To: <20231201210013.16147-3-brian.welty@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/xe/exec_reset: Fix cm-gt-reset
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
> From: Welty, Brian <brian.welty@intel.com>
> Sent: Friday, December 1, 2023 1:00 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Mishra, Pallavi <pallavi.mishra@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/xe/exec_reset: Fix cm-gt-reset
>=20
> With use of GT_RESET and forcing GT reset, it is expected for the
> xe_wait_ufence to expire. Move the assertion checking into the IGT by usi=
ng
> _xe_wait_ufence().
>=20
> Signed-off-by: Brian Welty <brian.welty@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c in=
dex
> 195e62911f..6fed0dd19e 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -612,9 +612,14 @@ test_compute_mode(int fd, struct
> drm_xe_engine_class_instance *eci,
>  		return;
>  	}
>=20
> -	for (i =3D 1; i < n_execs; i++)
> -		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> -			       NULL, THREE_SEC);
> +	for (i =3D 1; i < n_execs; i++) {
> +		int64_t timeout =3D THREE_SEC;
> +		int err;
> +
> +		err =3D _xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
> +				      NULL, &timeout);
> +		igt_assert_eq(err, flags & GT_RESET ? -ETIME : 0);
> +	}

Similar condition for GT_RESET will be required for igt_assert_eq(data[i].d=
ata, 0xc0ffee);=20
>=20
>  	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> --
> 2.38.0
