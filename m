Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F9110E118
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 05:21:00 +0000 (UTC)
Message-ID: <6494fe71-4023-0c8b-be48-8379028f59ed@intel.com>
Date: Fri, 14 Jul 2023 10:50:46 +0530
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230711065424.1210524-1-riana.tauro@intel.com>
 <20230711065424.1210524-3-riana.tauro@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230711065424.1210524-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/3] tests/xe: validate gt is in c6
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

Hi Riana,

On 11-07-2023 12:24, Riana Tauro wrote:
> Add a test that validates if gt is in c6 on idle.
> 
> v2:
>     - fix cosmetic review comments (Kamil)
>     - replace assert with igt_assert_f
>     - fix cosmetic review comments (Anshuman)
> 
> v3:
>     - use tile sysfs library functions
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   tests/xe/xe_pm_residency.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
> index 5e55700bf..e053affde 100644
> --- a/tests/xe/xe_pm_residency.c
> +++ b/tests/xe/xe_pm_residency.c
> @@ -45,6 +45,11 @@ static unsigned int measured_usleep(unsigned int usec)
>   	return igt_nsec_elapsed(&ts) / 1000;
>   }
>   
> +/**
> + * SUBTEST: gt-c6-on-idle
> + * Description: validate gt c6 state on idle
s/validate/Validate
> + * Run type: BAT
> + */
>   static bool in_gt_c6(int fd, int gt)
>   {
>   	char gt_c_state[16];
> @@ -102,6 +107,11 @@ igt_main
>   		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
>   	}
>   
> +	igt_describe("validate gt c6 on idle");
s/validate/Validate
Regards,
Badal
> +	igt_subtest("gt-c6-on-idle")
> +		xe_for_each_gt(fd, gt)
> +			igt_assert_f(igt_wait(in_gt_c6(fd, gt), 1000, 1), "GT not in C6\n");
> +
>   	igt_describe("Validates idle residency measured over a time interval is within the tolerance");
>   	igt_subtest("idle-residency")
>   		xe_for_each_gt(fd, gt)
