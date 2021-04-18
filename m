Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBA989F38
 for <igt-dev@lists.freedesktop.org>; Sun, 18 Apr 2021 19:37:42 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
Date: Sun, 18 Apr 2021 19:37:37 +0000
Message-ID: <c8cead78c93f4e4d8f3e1c621384cc2f@intel.com>
References: <20210303050737.22056-1-anshuman.gupta@intel.com>
 <20210303050737.22056-5-anshuman.gupta@intel.com>
In-Reply-To: <20210303050737.22056-5-anshuman.gupta@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 4/5] i915/i915_pm_rpm: Add PC10
 display off test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Anshuman
> Gupta
> Sent: Wednesday, March 3, 2021 10:38 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t v3 4/5] i915/i915_pm_rpm: Add PC10 display off test
> 
> Add a test to validate PC10 residencies while all output's display is off.
> 
> v2: used optimum pc10 timeout value.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/i915/i915_pm_rpm.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c index
> 290d1223..b27c20bd 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -102,6 +102,7 @@ enum plane_type {
>   * Let's keep 3 seconds timeout for PC8 and 5 seconds for PC10.
>   */
>  #define PC8_TIMEOUT 3
> +#define PC10_TIMEOUT 5
> 
>  int drm_fd, msr_fd, pc8_status_fd;
>  int debugfs;
> @@ -187,6 +188,16 @@ static bool pc8_plus_residency_changed(unsigned int
> timeout_sec)
>  			timeout_sec * 1000, 100);
>  }
> 
> +static bool pc10_residency_changed(unsigned int timeout_sec) {
> +	uint64_t res_pc10;
> +
> +	res_pc10 = get_residency(MSR_PC10_RES);
> +
> +	return igt_wait(res_pc10 != get_residency(MSR_PC10_RES),
> +			timeout_sec * 1000, 100);
> +}
> +
>  static enum pc8_status get_pc8_status(void)  {
>  	ssize_t n_read;
> @@ -863,6 +874,19 @@ static void pc8_residency_subtest(bool display_on)
>  	}
>  }
> 
> +static void pc10_residency_subtest(bool display_on) {
> +	igt_require(has_pc8);
> +	igt_require(AT_LEAST_GEN(ms_data.devid, 9));
> +
> +	if (!display_on) {
> +		/* Make sure PC10 residencies move! */
> +		disable_all_screens_and_wait(&ms_data);
> +		igt_assert_f(pc10_residency_changed(PC10_TIMEOUT),
> +			     "Machine is not reaching PC10 state with all screens
> disabled.\n");
> +	}
> +}
> +
>  static void modeset_subtest(enum screen_type type, int rounds, int wait_flags)  {
>  	int i;
> @@ -2097,6 +2121,8 @@ igt_main_args("", long_options, help_str, opt_handler,
> NULL)
>  		pc8_residency_subtest(true);
>  	igt_subtest("pc8-residency-display-off")
>  		pc8_residency_subtest(false);
> +	igt_subtest("pc10-residency-display-off")
> +		pc10_residency_subtest(false);
>  	igt_subtest("debugfs-read")
>  		debugfs_read_subtest();
>  	igt_subtest("debugfs-forcewake-user")
> --
> 2.26.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
