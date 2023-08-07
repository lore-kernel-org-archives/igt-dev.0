Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9ABA10E0E3
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 17:46:29 +0000 (UTC)
Message-ID: <c6b6d413-68f7-540c-3a1f-67507c945490@intel.com>
Date: Mon, 7 Aug 2023 10:46:24 -0700
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230803054810.2842880-1-riana.tauro@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20230803054810.2842880-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe: Add a test to toggle GT C
 states
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 8/2/2023 10:48 PM, Riana Tauro wrote:
> Add a test that toggles GT C states by checking if GT is in C0 when
> forcewake is acquired and in C6 once released.
>
> v2: change test name (Suja, Anshuman)
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/xe/xe_pm_residency.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
> index 4936de166..1c12113bc 100644
> --- a/tests/xe/xe_pm_residency.c
> +++ b/tests/xe/xe_pm_residency.c
> @@ -38,6 +38,10 @@ const double tolerance = 0.1;
>    * Description: basic residency test to validate idle residency
>    *		measured over a time interval is within the tolerance
>    * Run type: FULL
> + *
> + * SUBTEST: toggle-gt-c6
> + * Description: Toggle GT C states by acquiring/releasing forcewake
> + * Run type: FULL
>    */
>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>   
> @@ -85,6 +89,24 @@ static void test_idle_residency(int fd, int gt)
>   	assert_within_epsilon(residency_end - residency_start, elapsed_ms, tolerance);
>   }
>   
> +static void toggle_gt_c6(int fd, int n)
> +{
> +	int handle, gt;
> +
> +	while (n--) {
> +		handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
> +		igt_assert(handle >= 0);
> +		/* check if all gts are in C0 after forcewake is acquired */
> +		xe_for_each_gt(fd, gt)
> +			igt_assert_f(!xe_is_gt_in_c6(fd, gt), "GT in C6\n");
If it asserts here, will the test reset the force wake before exiting? 
If not, we need some kind of exit handler that does that.
> +		close(handle);

Do you need some delay here to ensure GT goes into C6?

Thanks,

Vinay.

> +		/* check if all gts are in C6 after forcewake is released */
> +		xe_for_each_gt(fd, gt)
> +			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
> +				     "GT is not in C6\n");
> +	}
> +}
> +
>   igt_main
>   {
>   	int fd, gt;
> @@ -104,6 +126,10 @@ igt_main
>   		xe_for_each_gt(fd, gt)
>   			test_idle_residency(fd, gt);
>   
> +	igt_describe("Toggle GT C states by acquiring/releasing forcewake");
> +	igt_subtest("toggle-gt-c6")
> +		toggle_gt_c6(fd, 16);
Why aren't we running this per GT? Also, please add a #define like 
NUM_REPS or something instead of using 16 here.
> +
>   	igt_fixture {
>   		close(fd);
>   	}
