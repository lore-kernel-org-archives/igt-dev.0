Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851BE10E63D
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jul 2023 09:22:56 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 21 Jul 2023 09:22:52 +0000
Message-ID: <CY5PR11MB6211B99539C0E65F73CD4081953FA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230720043015.1677140-1-riana.tauro@intel.com>
In-Reply-To: <20230720043015.1677140-1-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe: Add a test that validates GT
 C0 on exec
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Thursday, July 20, 2023 10:00 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; kamil.konieczny@linux.intel.com
> Subject: [PATCH i-g-t] tests/xe: Add a test that validates GT C0 on exec
>=20
> Add a test that validates if GT is in C0 while running a spinner on an en=
gine of
> the gt
We should have a test as well to test opportunistic RC6 during workload exe=
cution ?
This is a negative test, not sure if this is going to fail.
Br,
Anshuman.
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/xe/xe_pm_residency.c | 39
> ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>=20
> diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
> index a20c4449c..7614af761 100644
> --- a/tests/xe/xe_pm_residency.c
> +++ b/tests/xe/xe_pm_residency.c
> @@ -14,6 +14,7 @@
>  #include "igt.h"
>  #include "igt_sysfs.h"
>=20
> +#include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>=20
>  #define SLEEP_DURATION 3000 /* in milliseconds */ @@ -76,6 +77,38 @@
> static unsigned long read_idle_residency(int fd, int gt)
>  	return residency;
>  }
>=20
> +/**
> + * SUBTEST: gt-c0-on-exec
> + * Description: Validate if GT is in C0 while running a spinner
> + *		on an engine of that GT
> + * Run type: FULL
> + */
> +static void test_c0_exec(int fd, struct drm_xe_engine_class_instance
> +*hwe) {
> +	uint64_t ahnd;
> +	unsigned int engine;
> +	uint32_t vm;
> +	igt_spin_t *spin;
> +
> +	/* Start with GT in C6 */
> +	igt_assert_f(igt_wait(is_gt_in_c6(fd, hwe->gt_id), 1000, 1), "GT is
> +not in C6\n");
> +
> +	igt_debug("Run on engine: %s:%d\n",
> +		  xe_engine_class_string(hwe->engine_class), hwe-
> >engine_instance);
> +	vm =3D xe_vm_create(fd, 0, 0);
> +	engine =3D xe_engine_create(fd, vm, hwe, 0);
> +	ahnd =3D intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +	spin =3D igt_spin_new(fd, .ahnd =3D ahnd, .engine =3D engine, .vm =3D v=
m);
> +
> +	/* GT should be in C0 when busy */
> +	igt_assert_f(!is_gt_in_c6(fd, hwe->gt_id), "GT in C6\n");
> +
> +	igt_spin_free(fd, spin);
> +	put_ahnd(ahnd);
> +	xe_engine_destroy(fd, engine);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  /**
>   * SUBTEST: idle-residency
>   * Description: basic residency test to validate idle residency @@ -101,=
12
> +134,18 @@ static void test_idle_residency(int fd, int gt)  igt_main  {
>  	int fd, gt;
> +	struct drm_xe_engine_class_instance *hwe;
>=20
>  	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_XE);
>  		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
>  	}
>=20
> +	igt_describe("Validate GT C0 on exec");
> +	igt_subtest("gt-c0-on-exec")
> +		xe_for_each_hw_engine(fd, hwe)
> +			test_c0_exec(fd, hwe);
> +
>  	igt_describe("Validate GT C6 on idle");
>  	igt_subtest("gt-c6-on-idle")
>  		xe_for_each_gt(fd, gt)
> --
> 2.40.0
