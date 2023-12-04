Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E5610E3FE
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 20:38:31 +0000 (UTC)
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Mon, 4 Dec 2023 20:38:26 +0000
Message-ID: <PH0PR11MB5782103F7ACBD6A65857687B8286A@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20231204194306.12950-1-brian.welty@intel.com>
 <20231204194306.12950-3-brian.welty@intel.com>
In-Reply-To: <20231204194306.12950-3-brian.welty@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/intel/xe_exec_reset: Fix
 cm-gt-reset
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
> Sent: Monday, December 4, 2023 11:43 AM
> To: igt-dev@lists.freedesktop.org; Mishra, Pallavi <pallavi.mishra@intel.=
com>
> Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_exec_reset: Fix cm-gt-reset
>=20
> With use of GT_RESET and forcing GT reset, it is expected for the
> xe_wait_ufence to expire. Move the assertion checking into the IGT by usi=
ng
> __xe_wait_ufence().
> In addition, we cannot validate the exec operation was successful for
> GT_RESET case.
>=20
> Signed-off-by: Brian Welty <brian.welty@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)

Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>

>=20
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c in=
dex
> 195e62911f..d322cf4bdd 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -612,16 +612,27 @@ test_compute_mode(int fd, struct
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
> +		err =3D __xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
> +				       NULL, &timeout);
> +		if (flags & GT_RESET)
> +			/* exec races with reset: may timeout or complete */
> +			igt_assert(err =3D=3D -ETIME || !err);
> +		else
> +			igt_assert_eq(err, 0);
> +	}
>=20
>  	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>  	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
> THREE_SEC);
>=20
> -	for (i =3D 1; i < n_execs; i++)
> -		igt_assert_eq(data[i].data, 0xc0ffee);
> +	if (!(flags & GT_RESET)) {
> +		for (i =3D 1; i < n_execs; i++)
> +			igt_assert_eq(data[i].data, 0xc0ffee);
> +	}
>=20
>  	for (i =3D 0; i < n_exec_queues; i++)
>  		xe_exec_queue_destroy(fd, exec_queues[i]);
> --
> 2.38.0
