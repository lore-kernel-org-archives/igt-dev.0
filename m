Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7ACD10E850
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 10:21:52 +0000 (UTC)
Message-ID: <64a482ba-442e-0a4a-0e9b-49c5db92bd6e@intel.com>
Date: Fri, 14 Jul 2023 15:51:39 +0530
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230714094121.1446298-1-riana.tauro@intel.com>
 <20230714094121.1446298-3-riana.tauro@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230714094121.1446298-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 2/3] tests/xe: Validate GT is in C6
 on idle
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



On 14-07-2023 15:11, Riana Tauro wrote:
> Add a test that validates if GT is in C6 on idle.
> 
> v2:
>     - fix cosmetic review comments (Kamil)
>     - replace assert with igt_assert_f
>     - fix cosmetic review comments (Anshuman)
> 
> v3:
>     - use tile sysfs library functions
> 
> v4:
>     - fix cosmetic review comments (Badal, Kamil)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   tests/xe/xe_pm_residency.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
> index 4fd374933..a20c4449c 100644
> --- a/tests/xe/xe_pm_residency.c
> +++ b/tests/xe/xe_pm_residency.c
> @@ -45,6 +45,11 @@ static unsigned int measured_usleep(unsigned int usec)
>   	return igt_nsec_elapsed(&ts) / 1000;
>   }
>   
> +/**
> + * SUBTEST: gt-c6-on-idle
> + * Description: Validate GT C6 state on idle
> + * Run type: BAT
> + */
>   static bool is_gt_in_c6(int fd, int gt)
>   {
>   	char gt_c_state[16];
> @@ -102,6 +107,11 @@ igt_main
>   		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
>   	}
>   
> +	igt_describe("Validate GT C6 on idle");
> +	igt_subtest("gt-c6-on-idle")
> +		xe_for_each_gt(fd, gt)
> +			igt_assert_f(igt_wait(is_gt_in_c6(fd, gt), 1000, 1), "GT not in C6\n");
Acked-by: Badal Nilawar <badal.nilawar@intel.com>
> +
>   	igt_describe("Validate idle residency measured over a time interval is within the tolerance");
>   	igt_subtest("idle-residency")
>   		xe_for_each_gt(fd, gt)
