Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A147410E0A5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 11:33:55 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Aug 2023 11:33:51 +0000
Message-ID: <CY5PR11MB621199319136A620C0A366E89510A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230809070640.270414-5-riana.tauro@intel.com>
 <20230811112222.421331-1-riana.tauro@intel.com>
In-Reply-To: <20230811112222.421331-1-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 4/5] tests/xe: Add a test that
 validates residency during s2idle
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
> Sent: Friday, August 11, 2023 4:52 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>
> Subject: [PATCH i-g-t v4 4/5] tests/xe: Add a test that validates residen=
cy
> during s2idle
>=20
> During s2idle, the device is powered up and GT C6 enabled so we expect th=
e
> residency to increase across suspend.
> Add a test that validates the residency over a s2idle cycle and checks if=
 it is
> greater than the autoresume delay or within tolerance.
>=20
> v2: skip d3cold disable for igfx (Anshuman)
> v3: rename test flag to TEST_IDLE
>     reorder variables (Anshuman)
> v4: check if residency is greater than autoresume delay as
>     expected. Assert only if residency is lesser than autoresume
>     delay and not within tolerance.
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Looks good to me.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/xe/xe_pm_residency.c | 58
> ++++++++++++++++++++++++++++++++++----
>  1 file changed, 53 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
> index 4936de166..fd4876eaf 100644
> --- a/tests/xe/xe_pm_residency.c
> +++ b/tests/xe/xe_pm_residency.c
> @@ -10,8 +10,10 @@
>   * Functionality: GT C States
>   * Test category: functionality test
>   */
> +#include <limits.h>
>=20
>  #include "igt.h"
> +#include "igt_device.h"
>  #include "igt_sysfs.h"
>=20
>  #include "xe/xe_query.h"
> @@ -29,6 +31,11 @@ const double tolerance =3D 0.1;
>  		     (tol) * 100.0, (tol) * 100.0, \
>  		     (double)(ref))
>=20
> +enum test_type {
> +	TEST_S2IDLE,
> +	TEST_IDLE,
> +};
> +
>  /**
>   * SUBTEST: gt-c6-on-idle
>   * Description: Validate GT C6 state on idle @@ -38,6 +45,11 @@ const
> double tolerance =3D 0.1;
>   * Description: basic residency test to validate idle residency
>   *		measured over a time interval is within the tolerance
>   * Run type: FULL
> + *
> + * SUBTEST: gt-c6-freeze
> + * Description: Validate idle residency measured over suspend(s2idle)
> + *              is greater than suspend time or within tolerance
> + * Run type: FULL
>   */
>  IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>=20
> @@ -69,15 +81,35 @@ static unsigned long read_idle_residency(int fd, int =
gt)
>  	return residency;
>  }
>=20
> -static void test_idle_residency(int fd, int gt)
> +static void test_idle_residency(int fd, int gt, enum test_type flag)
>  {
>  	unsigned long elapsed_ms, residency_start, residency_end;
>=20
>  	igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT not in
> C6\n");
>=20
> -	residency_start =3D read_idle_residency(fd, gt);
> -	elapsed_ms =3D measured_usleep(SLEEP_DURATION * 1000) / 1000;
> -	residency_end =3D read_idle_residency(fd, gt);
> +	if (flag =3D=3D TEST_S2IDLE) {
> +		/*
> +		 * elapsed time during suspend is approximately equal to
> autoresume delay
> +		 * when a full suspend cycle(SUSPEND_TEST_NONE) is used.
> +		 */
> +		elapsed_ms =3D
> igt_get_autoresume_delay(SUSPEND_STATE_FREEZE);
> +		residency_start =3D read_idle_residency(fd, gt);
> +		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE,
> SUSPEND_TEST_NONE);
> +		residency_end =3D read_idle_residency(fd, gt);
> +
> +		/*
> +		 * Idle residency may increase even after suspend, only
> assert if residency
> +		 * is lesser than autoresume delay and is not within
> tolerance.
> +		 */
> +		if ((residency_end - residency_start) >=3D elapsed_ms)
> +			return;
> +	}
> +
> +	if (flag =3D=3D TEST_IDLE) {
> +		residency_start =3D read_idle_residency(fd, gt);
> +		elapsed_ms =3D measured_usleep(SLEEP_DURATION * 1000) /
> 1000;
> +		residency_end =3D read_idle_residency(fd, gt);
> +	}
>=20
>  	igt_info("Measured %lums of idle residency in %lums\n",
>  		 residency_end - residency_start, elapsed_ms); @@ -87,7
> +119,9 @@ static void test_idle_residency(int fd, int gt)
>=20
>  igt_main
>  {
> +	uint32_t d3cold_allowed;
>  	int fd, gt;
> +	char pci_slot_name[NAME_MAX];
>=20
>  	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_XE);
> @@ -99,10 +133,24 @@ igt_main
>  		xe_for_each_gt(fd, gt)
>  			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
> "GT not in C6\n");
>=20
> +	igt_describe("Validate idle residency measured over suspend cycle is
> within the tolerance");
> +	igt_subtest("gt-c6-freeze") {
> +		if (xe_has_vram(fd)) {
> +			igt_device_get_pci_slot_name(fd, pci_slot_name);
> +			igt_pm_get_d3cold_allowed(pci_slot_name,
> &d3cold_allowed);
> +			igt_pm_set_d3cold_allowed(pci_slot_name, 0);
> +		}
> +		xe_for_each_gt(fd, gt)
> +			test_idle_residency(fd, gt, TEST_S2IDLE);
> +
> +		if (xe_has_vram(fd))
> +			igt_pm_set_d3cold_allowed(pci_slot_name,
> d3cold_allowed);
> +	}
> +
>  	igt_describe("Validate idle residency measured over a time interval is
> within the tolerance");
>  	igt_subtest("idle-residency")
>  		xe_for_each_gt(fd, gt)
> -			test_idle_residency(fd, gt);
> +			test_idle_residency(fd, gt, TEST_IDLE);
>=20
>  	igt_fixture {
>  		close(fd);
> --
> 2.40.0
