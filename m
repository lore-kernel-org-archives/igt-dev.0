Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB116E48F
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Mar 2021 05:53:34 +0000 (UTC)
Date: Mon, 8 Mar 2021 11:08:20 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20210308053819.GB29018@intel.com>
References: <20210121083432.526247-1-jigar.bhatt@intel.com>
 <20210305124806.1679848-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305124806.1679848-1-jigar.bhatt@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v7] tests/i915/i915_pm_dc: Add DC9 igt
 test
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
To: Jigar Bhatt <jigar.bhatt@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2021-03-05 at 18:18:06 +0530, Jigar Bhatt wrote:
> DC9 igt test validation depends on DC{5,6} counters reset.
> When Display Engine enters to DC9, it resets DMC f/w and DC5/DC6 counter.
> We don't have a DC9 counter unlike DC{5,6},
> therefore this tests uses DC{5,6} counter reset method to validate DC9.
> 
> v7: [Anshuman]
> - Skip if no support of DC6.
> 
> v6: [Anshuman]
> - assert for DC6 counter in setup_dc9_dpms.
> - Move  dpms_off() to test_dc9_dpms().
> 
> Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index 30c6024..b6d918e 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -384,6 +384,40 @@ static void test_dc_state_dpms(data_t *data, int dc_flag)
>  	cleanup_dc_dpms(data);
>  }
>  
> +static bool check_dc9(uint32_t debugfs_fd, int prev_dc5, int prev_dc6, int seconds)
> +{
> +	/*
> +	 * since we do not have DC9 Counter,
> +	 * so we rely on dc5/dc6 counter reset to check if Display Engine was in DC9.
> +	 */
> +	return igt_wait((read_dc_counter(debugfs_fd, CHECK_DC5) > prev_dc5 ||
> +			read_dc_counter(debugfs_fd, CHECK_DC6) > prev_dc6), seconds, 100);
> +}
> +static void setup_dc9_dpms(data_t *data, int prev_dc5, int prev_dc6)
> +{
> +	igt_disable_runtime_pm();
> +	data->runtime_suspend_disabled = true;
> +	dpms_off(data);
> +	igt_skip_on_f(igt_wait((read_dc_counter(data->debugfs_fd, CHECK_DC5) > prev_dc5 ||
> +				read_dc_counter(data->debugfs_fd, CHECK_DC6) > prev_dc6),
> +				1000, 100), "No support of DC6\n");
	You requires to check whether a platform supports dc6, may be a new fucntion support_dc6()
	based upon that you should skip here either on DC5 or DC6 counters increments.
	Here read_dc_counter(data->debugfs_fd, CHECK_DC6) will fail the test in case DC6 is not
	supported. 
	igt_skip_on_f(igt_wait(dc6_supported ? dc6_counter > prev_dc : dc5_counter > prev_dc, 1000, 100), "Unable to enters shallow DC states")
> +	dpms_on(data);
> +	data->runtime_suspend_disabled = false;
> +	igt_restore_runtime_pm();
> +	igt_setup_runtime_pm(data->drm_fd);
> +
> +}
> +static void test_dc9_dpms(data_t *data)
> +{
> +	require_dc_counter(data->debugfs_fd, CHECK_DC5);
	check here if platform supports dc6 by support_dc6()
	dc6_supported =  support_dc6();
	setup_dc9_dpms(dc6_supported ? prev_dc6 : prev_dc5, dc6_supported)	
Thanks,
Anshuman Gupta.
> +	setup_dc9_dpms(data, read_dc_counter(data->debugfs_fd, CHECK_DC5),
> +			read_dc_counter(data->debugfs_fd, CHECK_DC6));
> +	dpms_off(data);
> +	igt_assert_f(!check_dc9(data->debugfs_fd, read_dc_counter(data->debugfs_fd, CHECK_DC5),
> +			read_dc_counter(data->debugfs_fd, CHECK_DC6), 3000), "Not in DC9\n");
> +	dpms_on(data);
> +}
> +
>  IGT_TEST_DESCRIPTION("These tests validate Display Power DC states");
>  int main(int argc, char *argv[])
>  {
> @@ -449,6 +483,10 @@ int main(int argc, char *argv[])
>  		test_dc_state_dpms(&data, CHECK_DC6);
>  	}
>  
> +	igt_describe("This test validates display engine entry to DC9 state");
> +	igt_subtest("dc9-dpms") {
> +		test_dc9_dpms(&data);
> +	}
>  	igt_fixture {
>  		free(data.pwr_dmn_info);
>  		close(data.debugfs_fd);
> -- 
> 2.8.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
