Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAD710E841
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 07:44:24 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Mon, 28 Mar 2022 07:44:12 +0000
Message-ID: <6ccadea06dc040ec9402e73b1e6153c9@intel.com>
References: <20220328064722.127301-1-riana.tauro@intel.com>
 <20220328064722.127301-2-riana.tauro@intel.com>
In-Reply-To: <20220328064722.127301-2-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/i915_suspend: Add
 system-suspend-without-i915 subtest
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
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Monday, March 28, 2022 12:17 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Ewins, Jon <jon.ewins@intel.com>; Dixit,
> Ashutosh <ashutosh.dixit@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/i915/i915_suspend: Add system-suspend-
> without-i915 subtest
>=20
> From: "Tauro, Riana" <riana.tauro@intel.com>
>=20
> Add a new subtest system-suspend-without-i915 to exercise suspend/resume
> cycle without i915 module to know the system wide health of suspend/resum=
e
> feature.
> This test will be part of CI fast-feedback test list.
>=20
> v2: Addressing review comments
Please mention the individual addressed comment ,  so that it is easy for i=
ncremental review.
>=20
> Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
> ---
>  tests/i915/i915_suspend.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c index
> da27ce09..a610a16d 100644
> --- a/tests/i915/i915_suspend.c
> +++ b/tests/i915/i915_suspend.c
> @@ -41,6 +41,7 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +#include "igt_kmod.h"
>  #include "igt_device.h"
>=20
>  #define OBJECT_SIZE (16*1024*1024)
> @@ -202,10 +203,25 @@ test_forcewake(int fd, bool hibernate)
>  	close (fw_fd);
>  }
>=20
> +static void
> +test_suspend_without_i915(void)
> +{
We need one more log here "Unloading i915".
> +	igt_i915_driver_unload();
Add an assertion with igt_assert(igt_i915_driver_unload() =3D=3D 0);
With all of comment addressed.
 Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Thanks,
Anshuman Gupta.
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
> +
> +	igt_kmsg(KMSG_INFO "Re-loading i915 \n");
> +	igt_assert_eq(igt_i915_driver_load(NULL), 0); }
> +
>  int fd;
>=20
>  igt_main
>  {
> +	igt_describe("Validate system suspend cycle without i915 module");
> +	igt_subtest("system-suspend-without-i915")
> +		test_suspend_without_i915();
> +
>  	igt_fixture
>  		fd =3D drm_open_driver(DRIVER_INTEL);
>=20
> --
> 2.25.1
