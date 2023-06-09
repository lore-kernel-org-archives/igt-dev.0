Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9D610E0D7
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 05:44:28 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>
Date: Fri, 9 Jun 2023 05:44:22 +0000
Message-ID: <DM6PR11MB449233FD8B085B73EC3180678D51A@DM6PR11MB4492.namprd11.prod.outlook.com>
References: <20230607080352.950226-1-janga.rahul.kumar@intel.com>
 <20230607080352.950226-3-janga.rahul.kumar@intel.com>
In-Reply-To: <20230607080352.950226-3-janga.rahul.kumar@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/xe_vm.c: Add Negative test to
 VM error capture
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
> Sent: 07 June 2023 01:34 PM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>
> Subject: [igt-dev] [PATCH i-g-t 2/2] tests/xe_vm.c: Add Negative test to =
VM
> error capture
>=20
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>=20
> Add negative test to check invalid arguments.
>=20
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/xe/xe_vm.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c index 0da6c847..7f369fc4
> 100644
> --- a/tests/xe/xe_vm.c
> +++ b/tests/xe/xe_vm.c
> @@ -1638,6 +1638,31 @@ vm_error_capture_address(int fd)
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> +/**
> + * SUBTEST: vm-error-capture-address-invalid-val
> + * Description: Negative test to check vm error capture
> + * Functionality: error capture
> + * Run type: FULL
> + * TODO: change ``'Run type' =3D=3D FULL`` to a better category
> + *
> + */
> +static void
> +vm_error_capture_address_invalid_val(int fd) {
> +	struct drm_xe_ext_vm_set_property ext =3D {
> +		.base.next_extension =3D 0,
> +		.base.name =3D XE_VM_EXTENSION_SET_PROPERTY,
> +		.property =3D
> XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS,
> +		.value =3D 0,
> +	};
> +
> +	struct drm_xe_vm_create create =3D {
> +		.extensions =3D to_user_pointer(&ext),
> +		.flags =3D DRM_XE_VM_CREATE_ASYNC_BIND_OPS,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL); }
>=20
>  igt_main
>  {
> @@ -1924,6 +1949,9 @@ igt_main
>  	igt_subtest("vm-error-capture-address")
>  		vm_error_capture_address(fd);
>=20
> +	igt_subtest("vm-error-capture-address-invalid-val")
> +		vm_error_capture_address_invalid_val(fd);
> +
>  	igt_fixture {
>  		xe_device_put(fd);
>  		close(fd);
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> --
> 2.25.1
