Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491E46E2ED
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Feb 2021 06:48:02 +0000 (UTC)
Date: Mon, 8 Feb 2021 08:48:02 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YCDeov2Pgoj81ISJ@platvala-desk.ger.corp.intel.com>
References: <20210121083432.526247-1-jigar.bhatt@intel.com>
 <20210205091522.770859-1-jigar.bhatt@intel.com>
 <20210205091522.770859-2-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205091522.770859-2-jigar.bhatt@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/i915/i915_pm_dc: Add DC9 igt
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

On Fri, Feb 05, 2021 at 02:45:22PM +0530, Jigar Bhatt wrote:
> DC9 igt test validation depends on DC9 Ready and DC{5,6} counters reset.
> When Display Engine enters to DC9, it resets DMC f/w and DC5/DC6 counter.
> We don't have a DC9 counter unlike DC{5,6}  therefore this tests uses "DC9 Ready"
> from  i915_pm_req_res_info debugfs and DC{5,6} counter reset method to validate DC9.
> 
> Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index 30c6024..957d04a 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -384,6 +384,27 @@ static void test_dc_state_dpms(data_t *data, int dc_flag)
>  	cleanup_dc_dpms(data);
>  }
>  
> +static bool check_dc9(uint32_t debugfs_fd, int prev_dc5, int prev_dc6)
> +{
> +        char buf[4096];
> +        igt_skip_on_f(!igt_debugfs_simple_read(debugfs_fd, "i915_pm_req_res_info", buf, sizeof(buf)),"skipping DC9 test");
> +        igt_assert_f(strstr(buf, "DC9 Ready : yes"),"DC9 is not ready");

These messages need to end in newline

> +        /*
> +         * since we do not have DC9 Counter,
> +         * so we rely on dc5/dc6 counter reset to check if Display Engine was in DC9.
> +         */
> +        return igt_wait((read_dc_counter(debugfs_fd, CHECK_DC5)<prev_dc5 || read_dc_counter(debugfs_fd, CHECK_DC6)<prev_dc6),3000,100);
> +}
> +static void test_dc9_dpms(data_t *data)
> +{
> +        require_dc_counter(data->debugfs_fd, CHECK_DC5);
> +        require_dc_counter(data->debugfs_fd, CHECK_DC6);
> +        int dc5_prev=read_dc_counter(data->debugfs_fd, CHECK_DC5);
> +        int dc6_prev=read_dc_counter(data->debugfs_fd, CHECK_DC6);
> +        dpms_off(data);
> +        igt_assert_f(check_dc9(data->debugfs_fd,dc5_prev,dc6_prev),"\n Not in DC9");

Same here. And why does it begin with a newline?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
