Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0139C10E456
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 15:50:49 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
Date: Tue, 14 Nov 2023 15:50:11 +0000
Message-ID: <MW3PR11MB47489AAF69EA2BC1E298CD38AEB2A@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231114122810.6838-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20231114122810.6838-1-sai.gowtham.ch@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_exec_queue_property:
 Negative tests for get exec_queue property ioctl
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
> sai.gowtham.ch@intel.com
> Sent: Tuesday, November 14, 2023 5:58 PM
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [igt-dev] [PATCH i-g-t] tests/intel/xe_exec_queue_property: Nega=
tive
> tests for get exec_queue property ioctl
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Add Negative tests for get exec_queue property ioctl.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_queue_property.c | 77 +++++++++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_exec_queue_property.c
> b/tests/intel/xe_exec_queue_property.c
> index 4e32aefa5..5278304be 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -4,7 +4,7 @@
>   */
>=20
>  /**
> - * TEST: Basic tests to check exec_queue set property functionality
> + * TEST: Basic tests to check exec_queue set/get property functionality
>   * Category: Software building block
>   * Sub-category: exec queue property
>   * Functionality: exec queue set property @@ -108,6 +108,72 @@ static vo=
id
> test_property_min_max(int xe, int engine, const char **property)
>  	test_set_property(xe, property_name, min - 1, -EINVAL);  }
>=20
> +/**
> + * SUBTEST: Invalid-exec-queue
> + * Description: Negative test to check the expected behaviour with inval=
id
> exec_queue_id.
> + * Test category: functionality test
> + */
> +static void Invalid_exec_queue_id(int xe) {
> +	struct drm_xe_exec_queue_get_property args =3D {
> +		.exec_queue_id =3D 0xffff,
> +		.property =3D XE_EXEC_QUEUE_GET_PROPERTY_BAN,
> +	};
> +
> +	do_ioctl_err(xe, DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY,
> &args, ENOENT);
> +}
> +
> +/**
> + * SUBTEST: non-zero-reserved
> + * Description: Negative test to check the expected behaviour with non-z=
ero
> reserved.
> + * Test category: functionality test
> + */
> +static void non_zero_reserved(int xe)
> +{
> +	struct drm_xe_exec_queue_get_property args =3D {
> +		.reserved[0] =3D 0xffff,
> +		.property =3D XE_EXEC_QUEUE_GET_PROPERTY_BAN,
> +	};
> +	uint32_t vm;
> +	uint32_t exec_queue;
> +
> +	vm =3D xe_vm_create(xe, 0, 0);
> +	exec_queue =3D xe_exec_queue_create_class(xe, vm,
> DRM_XE_ENGINE_CLASS_COPY);
> +	args.exec_queue_id =3D exec_queue;
> +
> +	do_ioctl_err(xe, DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY,
> &args, EINVAL);
> +
> +	xe_exec_queue_destroy(xe, exec_queue);
> +	xe_vm_destroy(xe, vm);
> +}
> +
> +/**
> + * SUBTEST: invalid-value
This looks like a basic test more than a negative test. Pls update the test=
 name wherever required.
With that change,
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>


> + * Description: Check if get property value works fine.
> + * Test category: functionality test
> + */
> +static void invalid_value(int xe)
> +{
> +	struct drm_xe_exec_queue_get_property args =3D {
> +		.value =3D -1,
> +		.reserved[0] =3D 0,
> +		.property =3D XE_EXEC_QUEUE_GET_PROPERTY_BAN,
> +	};
> +
> +	uint32_t exec_queue;
> +	uint32_t vm;
> +
> +	vm =3D xe_vm_create(xe, 0, 0);
> +	exec_queue =3D xe_exec_queue_create_class(xe, vm,
> DRM_XE_ENGINE_CLASS_COPY);
> +	args.exec_queue_id =3D exec_queue;
> +
> +	do_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY, &args);
> +	igt_assert(args.value =3D=3D 0);
> +
> +	xe_exec_queue_destroy(xe, exec_queue);
> +	xe_vm_destroy(xe, vm);
> +}
> +
>  igt_main
>  {
>  	static const struct {
> @@ -182,6 +248,15 @@ igt_main
>  		}
>  	}
>=20
> +	igt_subtest("Invalid-exec-queue")
> +		Invalid_exec_queue_id(xe);
> +
> +	igt_subtest("non-zero-reserved")
> +		non_zero_reserved(xe);
> +
> +	igt_subtest("invalid-value")
> +		invalid_value(xe);
> +
>  	igt_fixture {
>  		xe_device_put(xe);
>  		drm_close_driver(xe);
> --
> 2.39.1
