Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C2710E8AF
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 11:13:10 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>
Date: Thu, 9 Nov 2023 11:12:49 +0000
Message-ID: <CH3PR11MB8434C2FDF36495305E6C3B948DAFA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20231108112251.819141-1-janga.rahul.kumar@intel.com>
 <20231108112251.819141-4-janga.rahul.kumar@intel.com>
In-Reply-To: <20231108112251.819141-4-janga.rahul.kumar@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/intel/xe_waitfence: Add
 invalid-engine subtest
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
> janga.rahul.kumar@intel.com
> Sent: Wednesday, November 8, 2023 4:53 PM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>
> Subject: [igt-dev] [PATCH i-g-t 3/3] tests/intel/xe_waitfence: Add invali=
d-
> engine subtest
>=20
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>=20
> Negative test to check ioctl returns expected error when invalid enigne i=
s
> used.
>=20
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel/xe_waitfence.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c inde=
x
> 87e7b2284..dc662d26d 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -111,6 +111,9 @@ waitfence(int fd, enum waittype wt)
>   *
>   * SUBTEST: invalid-ops
>   * Description: Check query with invalid engine info returns expected er=
ror
> code
> + *
> + * SUBTEST: invalid-engine
> + * Description: Check query with invalid engine info returns expected
> + error code
>   */
>=20
LGTM Reviewed-by:Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
>  static void
> @@ -163,6 +166,31 @@ invalid_ops(int fd)
>  	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EINVAL);
> }
>=20
> +static void
> +invalid_engine(int fd)
> +{
> +	uint32_t bo;
> +
> +	struct drm_xe_wait_user_fence wait =3D {
> +		.addr =3D to_user_pointer(&wait_fence),
> +		.op =3D DRM_XE_UFENCE_WAIT_EQ,
> +		.flags =3D 0,
> +		.value =3D 1,
> +		.mask =3D DRM_XE_UFENCE_WAIT_U64,
> +		.timeout =3D -1,
> +		.num_engines =3D 1,
> +		.instances =3D 0,
> +	};
> +
> +	uint32_t vm =3D xe_vm_create(fd,
> DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
> +
> +	bo =3D xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
> +
> +	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EFAULT);
> }
> +
>=20
>  igt_main
>  {
> @@ -183,6 +211,9 @@ igt_main
>  	igt_subtest("invalid-ops")
>  		invalid_ops(fd);
>=20
> +	igt_subtest("invalid-engine")
> +		invalid_engine(fd);
> +
>  	igt_fixture
>  		drm_close_driver(fd);
>  }
> --
> 2.25.1
