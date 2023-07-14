Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5932C10E7C8
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 06:41:15 +0000 (UTC)
Date: Fri, 14 Jul 2023 08:41:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 ashutosh.dixit@intel.com, vinay.belgaumkar@intel.com,
 badal.nilawar@intel.com
Message-ID: <20230714064110.2fljv7fmb7gckgxw@kamilkon-desk1>
References: <20230711065424.1210524-1-riana.tauro@intel.com>
 <20230711065424.1210524-3-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230711065424.1210524-3-riana.tauro@intel.com>
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

On 2023-07-11 at 12:24:23 +0530, Riana Tauro wrote:
> Add a test that validates if gt is in c6 on idle.
> 
> v2:
>    - fix cosmetic review comments (Kamil)
>    - replace assert with igt_assert_f
>    - fix cosmetic review comments (Anshuman)
> 
> v3:
>    - use tile sysfs library functions
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/xe/xe_pm_residency.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
> index 5e55700bf..e053affde 100644
> --- a/tests/xe/xe_pm_residency.c
> +++ b/tests/xe/xe_pm_residency.c
> @@ -45,6 +45,11 @@ static unsigned int measured_usleep(unsigned int usec)
>  	return igt_nsec_elapsed(&ts) / 1000;
>  }
>  
> +/**
> + * SUBTEST: gt-c6-on-idle
> + * Description: validate gt c6 state on idle
-------------------^------- ^^
Nilawar wrote about using "Validate", maybe it is worth also
s/gt c6/GT C6/ as you later write "GT not in C6"?

> + * Run type: BAT
> + */
>  static bool in_gt_c6(int fd, int gt)
>  {
>  	char gt_c_state[16];
> @@ -102,6 +107,11 @@ igt_main
>  		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
>  	}
>  
> +	igt_describe("validate gt c6 on idle");
--------------------- ^ ------ ^^
s/v/V/ and s/gt c6/GT C6/

Regards,
Kamil

> +	igt_subtest("gt-c6-on-idle")
> +		xe_for_each_gt(fd, gt)
> +			igt_assert_f(igt_wait(in_gt_c6(fd, gt), 1000, 1), "GT not in C6\n");
> +
>  	igt_describe("Validates idle residency measured over a time interval is within the tolerance");
>  	igt_subtest("idle-residency")
>  		xe_for_each_gt(fd, gt)
> -- 
> 2.40.0
> 
