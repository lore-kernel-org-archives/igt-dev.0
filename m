Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8806ED07
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Sep 2021 10:40:58 +0000 (UTC)
Date: Thu, 23 Sep 2021 13:44:16 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YUxagE1S7vRc8tiQ@platvala-desk.ger.corp.intel.com>
References: <20210923101857.1868172-1-jigar.bhatt@intel.com>
 <20210923101857.1868172-3-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210923101857.1868172-3-jigar.bhatt@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/2] tests/i915/i915_pm_dc: Fix DC9
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jigar Bhatt <jigar.bhatt@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com, nischal.varide@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 23, 2021 at 03:48:57PM +0530, Jigar Bhatt wrote:
> Subject: [igt-dev] [PATCH i-g-t v3 2/2] tests/i915/i915_pm_dc: Fix DC9 test

Describe the code changes you're doing here, rather than the effect
the changes will have. Helps reading the git history later.


> V1:
> Currently, check_dc9 is being called with reference
> (previous) counter being read after dpms_off call.
> At this time, already the counter is 0.
> We need to read the counter before dpms_off is called
> so that it holds the previous value which had
> incremented while testing shallow states (DC5 or DC6).
> 
> V2:
> Bit cleaner code.[Imre]
> dump the i915_pm_runtime_status debugfs file in case of test
> failure.[Anshuman]
> 
> V3:
> Disabling the polling during DC9 test “echo 0 >
> /sys/module/drm_kms_helper/parameters/poll”.[Anshuman]
> 
> V4:
> passing right fd to igt_sysfs_get_boolean() function,
> moving save and get part of polling to setup_dc9_dpms().
> 
> V5:
> Use macro for "/sys/module/drm_kms_helper/parameters/poll".
> Add igt_require when opening sysfs.
> Add igt_install_exit_handler(reset_kms_poll) so it will restore actual
> sysfs kms polling status.[Anshuman]
> 
> Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 49 +++++++++++++++++++++++++++++------------
>  1 file changed, 35 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index 04acf839..f3c9f6ba 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -40,6 +40,10 @@
>  #define CHECK_DC3CO	(1 << 2)
>  
>  #define PWR_DOMAIN_INFO "i915_power_domain_info"
> +#define RPM_STATUS "i915_runtime_pm_status"
> +#define KMS_POLL_PATH "/sys/module/drm_kms_helper/parameters/poll"
> +
> +bool kms_poll_saved_state;
>  
>  typedef struct {
>  	double r, g, b;
> @@ -393,23 +397,33 @@ static bool support_dc6(int debugfs_fd)
>  	return strstr(buf, "DC5 -> DC6 count");
>  }
>  
> -static bool check_dc9(uint32_t debugfs_fd, int prev_dc, bool dc6_supported, int seconds)
> +static bool dc9_wait_entry(uint32_t debugfs_fd, int dc_target, int prev_dc, int seconds)
>  {
>  	/*
>  	 * since we do not have DC9 counter,
>  	 * so we rely on dc5/dc6 counter reset to check if display engine was in DC9.
>  	 */
> -	return igt_wait(dc6_supported ? read_dc_counter(debugfs_fd, CHECK_DC6) <
> -			prev_dc : read_dc_counter(debugfs_fd, CHECK_DC5) <
> +	return igt_wait(read_dc_counter(debugfs_fd, dc_target) >
>  			prev_dc, seconds, 100);
>  }
>  
> -static void setup_dc9_dpms(data_t *data, int prev_dc, bool dc6_supported)
> +static void check_dc9(data_t *data, int dc_target, int prev_dc)
>  {
> +	igt_assert_f(dc9_wait_entry(data->debugfs_fd, dc_target, prev_dc, 3000),
> +			"DC9 state is not achieved\n%s:\n%s\n", RPM_STATUS,
> +			data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, RPM_STATUS));
> +}
> +
> +static void setup_dc9_dpms(data_t *data, int dc_target, int sysfs_fd)
> +{
> +	int prev_dc;
> +
> +	kms_poll_saved_state = igt_sysfs_get_boolean(sysfs_fd, KMS_POLL_PATH);
> +	igt_sysfs_set_boolean(sysfs_fd, KMS_POLL_PATH, 0);
> +	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
>  	setup_dc_dpms(data);
>  	dpms_off(data);
> -	igt_skip_on_f(!(igt_wait(dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) >
> -				prev_dc : read_dc_counter(data->debugfs_fd, CHECK_DC5) >
> +	igt_skip_on_f(!(igt_wait(read_dc_counter(data->debugfs_fd, dc_target) >
>  				prev_dc, 3000, 100)), "Unable to enters shallow DC states\n");
>  	dpms_on(data);
>  	cleanup_dc_dpms(data);
> @@ -417,20 +431,26 @@ static void setup_dc9_dpms(data_t *data, int prev_dc, bool dc6_supported)
>  
>  static void test_dc9_dpms(data_t *data)
>  {
> -	bool dc6_supported;
> +	int prev_dc, dc_target, sysfs_fd;
>  
> +	igt_require((sysfs_fd = open(KMS_POLL_PATH, O_WRONLY)) >= 0);
>  	require_dc_counter(data->debugfs_fd, CHECK_DC5);
> -	dc6_supported = support_dc6(data->debugfs_fd);
> -	setup_dc9_dpms(data, dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) :
> -			read_dc_counter(data->debugfs_fd, CHECK_DC5), dc6_supported);
> +	dc_target = support_dc6(data->debugfs_fd) ? CHECK_DC6 : CHECK_DC5;
> +	setup_dc9_dpms(data, dc_target, sysfs_fd);
> +	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
>  	dpms_off(data);
> -	igt_assert_f(check_dc9(data->debugfs_fd, dc6_supported ?
> -				read_dc_counter(data->debugfs_fd, CHECK_DC6) :
> -				read_dc_counter(data->debugfs_fd, CHECK_DC5),
> -				dc6_supported, 3000), "Not in DC9\n");
> +	check_dc9(data, dc_target, prev_dc);
>  	dpms_on(data);
>  }
>  
> +static void kms_poll_reset(int sig)
> +{
> +	int sysfs_fd;
> +
> +	igt_require((sysfs_fd = open(KMS_POLL_PATH, O_WRONLY)) >= 0);
> +	igt_sysfs_set_boolean(sysfs_fd, KMS_POLL_PATH, kms_poll_saved_state);

Don't call igt_require in an exit handler, there's no setjmp done for
it to jump to. You can just if () that sysfs write.


-- 
Petri Latvala


> +}
> +
>  IGT_TEST_DESCRIPTION("These tests validate Display Power DC states");
>  int main(int argc, char *argv[])
>  {
> @@ -453,6 +473,7 @@ int main(int argc, char *argv[])
>  		data.msr_fd = open("/dev/cpu/0/msr", O_RDONLY);
>  		igt_assert_f(data.msr_fd >= 0,
>  			     "Can't open /dev/cpu/0/msr.\n");
> +		igt_install_exit_handler(kms_poll_reset);
>  	}
>  
>  	igt_describe("In this test we make sure that system enters DC3CO "
> -- 
> 2.25.1
> 
