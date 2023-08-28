Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C3010E2A3
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Aug 2023 12:14:18 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Mon, 28 Aug 2023 12:14:04 +0000
Message-ID: <CY5PR11MB6211FEE9BB9D2DC6A190A23C95E0A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230825054659.1320824-1-riana.tauro@intel.com>
 <20230825054659.1320824-3-riana.tauro@intel.com>
In-Reply-To: <20230825054659.1320824-3-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/3] tests/xe: Add a test to toggle
 GT C states and validate power
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
> Sent: Friday, August 25, 2023 11:17 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Sundaresan, Sujaritha
> <sujaritha.sundaresan@intel.com>; kamil.konieczny@linux.intel.com
> Subject: [PATCH i-g-t v2 2/3] tests/xe: Add a test to toggle GT C states =
and
> validate power
>=20
> Add a test that toggles GT C states by checking if GT is in C0 when force=
wake
> is acquired and in C6 once released.
> This test also validates power consumed by GPU in GT C6 is lesser than GT=
 C0.
>=20
> v2: change test name (Suja, Anshuman)
> v3: add exit handler for closing forcewake handle
>     define a macro for number of repetitions (Vinay)
>     change forcewake open to readonly (Anshuman)
>     modify test to validate power
> v4: check if fw_handle is valid before closing it
>     change function name to close_fw_handle (Anshuman)
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/xe/xe_pm_residency.c | 68
> ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>=20
> diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
> index fd4876eaf..bdbacb149 100644
> --- a/tests/xe/xe_pm_residency.c
> +++ b/tests/xe/xe_pm_residency.c
> @@ -14,14 +14,17 @@
>=20
>  #include "igt.h"
>  #include "igt_device.h"
> +#include "igt_power.h"
>  #include "igt_sysfs.h"
>=20
>  #include "xe/xe_query.h"
>  #include "xe/xe_util.h"
>=20
> +#define NUM_REPS 16 /* No of Repetitions */
>  #define SLEEP_DURATION 3000 /* in milliseconds */
>=20
>  const double tolerance =3D 0.1;
> +int fw_handle =3D -1;
>=20
>  #define assert_within_epsilon(x, ref, tol) \
>  	igt_assert_f((double)(x) <=3D (1.0 + (tol)) * (double)(ref) && \ @@ -
> 50,9 +53,20 @@ enum test_type {
>   * Description: Validate idle residency measured over suspend(s2idle)
>   *              is greater than suspend time or within tolerance
>   * Run type: FULL
> + *
> + * SUBTEST: toggle-gt-c6
> + * Description: toggles GT C states by acquiring/releasing forcewake,
> + *		also validates power consumed by GPU in GT C6 is lesser than
> that of GT C0.
> + * Run type: FULL
>   */
>  IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>=20
> +static void close_fw_handle(int sig)
> +{
> +	if (fw_handle >=3D 0)
> +		close(fw_handle);
> +}
> +
>  static unsigned int measured_usleep(unsigned int usec)  {
>  	struct timespec ts =3D { };
> @@ -117,6 +131,54 @@ static void test_idle_residency(int fd, int gt, enum
> test_type flag)
>  	assert_within_epsilon(residency_end - residency_start, elapsed_ms,
> tolerance);  }
>=20
> +static void measure_power(struct igt_power *gpu, double *power) {
> +	struct power_sample power_sample[2];
> +
> +	igt_power_get_energy(gpu, &power_sample[0]);
> +	measured_usleep(SLEEP_DURATION * 1000);
> +	igt_power_get_energy(gpu, &power_sample[1]);
> +	*power =3D igt_power_get_mW(gpu, &power_sample[0],
> &power_sample[1]); }
> +
> +static void toggle_gt_c6(int fd, int n) {
> +	double gt_c0_power, gt_c6_power;
> +	int gt;
> +	struct igt_power gpu;
> +
> +	igt_power_open(fd, &gpu, "gpu");
> +
> +	do {
> +		fw_handle =3D igt_debugfs_open(fd, "forcewake_all",
> O_RDONLY);
> +		igt_assert(fw_handle >=3D 0);
> +		/* check if all gts are in C0 after forcewake is acquired */
> +		xe_for_each_gt(fd, gt)
> +			igt_assert_f(!xe_is_gt_in_c6(fd, gt),
> +				     "Forcewake acquired, GT should be in
> C0\n");
> +
> +		if (n =3D=3D NUM_REPS)
> +			measure_power(&gpu, &gt_c0_power);
> +
> +		close(fw_handle);
> +		/* check if all gts are in C6 after forcewake is released */
> +		xe_for_each_gt(fd, gt)
> +			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
> +				     "Forcewake released, GT should be in
> C6\n");
> +
> +		if (n =3D=3D NUM_REPS)
> +			measure_power(&gpu, &gt_c6_power);
> +	} while (n--);
> +
> +	igt_power_close(&gpu);
> +	igt_info("GPU consumed %fmW in GT C6 and %fmW in GT C0\n",
> +gt_c6_power, gt_c0_power);
> +
> +	/* FIXME: Remove dgfx check after hwmon is added */
> +	if (!xe_has_vram(fd))
> +		igt_assert_f(gt_c6_power < gt_c0_power,
> +			     "Power consumed in GT C6 should be lower than
> GT C0\n"); }
> +
>  igt_main
>  {
>  	uint32_t d3cold_allowed;
> @@ -152,6 +214,12 @@ igt_main
>  		xe_for_each_gt(fd, gt)
>  			test_idle_residency(fd, gt, TEST_IDLE);
>=20
> +	igt_describe("Toggle GT C states by acquiring/releasing forcewake
> and validate power measured");
> +	igt_subtest("toggle-gt-c6") {
> +		igt_install_exit_handler(close_fw_handle);
> +		toggle_gt_c6(fd, NUM_REPS);
> +	}
> +
>  	igt_fixture {
>  		close(fd);
>  	}
> --
> 2.40.0
