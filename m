Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CFD6E8BB
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 06:14:56 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Date: Tue, 2 Mar 2021 06:14:51 +0000
Message-ID: <70ec6567b75a4db48f746959457b38fb@intel.com>
References: <20210121083432.526247-1-jigar.bhatt@intel.com>
 <20210301100708.1585873-1-jigar.bhatt@intel.com>
In-Reply-To: <20210301100708.1585873-1-jigar.bhatt@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5] tests/i915/i915_pm_dc: Add DC9 igt
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
To: "Bhatt, Jigar" <jigar.bhatt@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Bhatt, Jigar <jigar.bhatt@intel.com>
> Sent: Monday, March 1, 2021 3:37 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Bhatt, Jigar <jigar.bhatt@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t v5] tests/i915/i915_pm_dc: Add DC9 igt test
> 
> DC9 igt test validation depends on DC{5,6} counters reset.
> When Display Engine enters to DC9, it resets DMC f/w and DC5/DC6 counter.
> We don't have a DC9 counter unlike DC{5,6}, therefore this tests uses DC{5,6}
> counter reset method to validate DC9.
At commit log please mention review comment u had fixed for each version.
v2:
- Fix xyz cmment. [u can keep reviewer name]
> 
> Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c index
> 30c6024..a3339c1 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -384,6 +384,38 @@ static void test_dc_state_dpms(data_t *data, int
> dc_flag)
>  	cleanup_dc_dpms(data);
>  }
> 
> +static bool check_dc9(uint32_t debugfs_fd, int prev_dc5, int
> +prev_dc6,int seconds) {
> +        /*
> +         * since we do not have DC9 Counter,
> +         * so we rely on dc5/dc6 counter reset to check if Display Engine was in
> DC9.
> +         */
> +        return igt_wait((read_dc_counter(debugfs_fd,
> +CHECK_DC5)>prev_dc5 || read_dc_counter(debugfs_fd,
> +CHECK_DC6)>prev_dc6),seconds,100);
> +}
> +static void setup_dc9_dpms(data_t *data,int dc5_prev,int dc6_prev) {
> +        igt_disable_runtime_pm();
> +        data->runtime_suspend_disabled = true;
> +        dpms_off(data);
> +        igt_assert_f(check_dc9(data->debugfs_fd,dc5_prev,dc6_prev,1000),"Not
> in DC9");
Please assert for DC6 counter, this make sures both DC5 and DC6 increases.
check_dc9  is misleading here.
> +        dpms_on(data);
> +        data->runtime_suspend_disabled = false;
> +        igt_restore_runtime_pm();
> +        igt_setup_runtime_pm(data->drm_fd);
> +        dpms_off(data);
Move this dpms_off() to test_dc9_dpms()
> +
> +}
> +static void test_dc9_dpms(data_t *data) {
> +        require_dc_counter(data->debugfs_fd, CHECK_DC5);
> +        require_dc_counter(data->debugfs_fd, CHECK_DC6);
> +        int dc5_prev=read_dc_counter(data->debugfs_fd, CHECK_DC5);
> +        int dc6_prev=read_dc_counter(data->debugfs_fd, CHECK_DC6);
Require space after = assignment operator.
Please read the kernel coding guidelines and use checkpatch.pl to check warnings. 
> +        setup_dc9_dpms(data,dc5_prev,dc6_prev);
Read prev_dc5 and prev_dc6 counters again, so that it can used the increased counters.
> +        igt_assert_f(!check_dc9(data->debugfs_fd,dc5_prev,dc6_prev,3000),"Not
> in DC9");
Still u are missing '\n' terminated string , please make sure to fix every comment before
Sending an update.
Thanks,
Anshuman Gupta.

> +        dpms_on(data);
> +}
> +
>  IGT_TEST_DESCRIPTION("These tests validate Display Power DC states");  int
> main(int argc, char *argv[])  { @@ -449,6 +481,11 @@ int main(int argc, char
> *argv[])
>  		test_dc_state_dpms(&data, CHECK_DC6);
>  	}
> 
> +	igt_describe("This test validates display engine entry to DC9 state");
> +        igt_subtest("dc9-dpms"){
> +                test_dc9_dpms(&data);
> +        }
> +
>  	igt_fixture {
>  		free(data.pwr_dmn_info);
>  		close(data.debugfs_fd);
> --
> 2.8.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
