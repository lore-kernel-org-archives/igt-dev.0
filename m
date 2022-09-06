Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20ACC10E555
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 13:26:50 +0000 (UTC)
Message-ID: <301c9216-12a0-c599-b8bd-5f12e2992786@intel.com>
Date: Tue, 6 Sep 2022 16:26:42 +0300
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
 <20220823183036.5270-12-umesh.nerlige.ramappa@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220823183036.5270-12-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 11/23] i915/perf: Explicitly state
 rendercopy needs for a test
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

On 23/08/2022 21:30, Umesh Nerlige Ramappa wrote:
> Let tests explicitly require rendercopy before running. This helps in
> temporarily blocking these tests until rendercopy is available on new
> platforms.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>   tests/i915/perf.c | 25 ++++++++++++++++++++++---
>   1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index 89aa4931..ba8c3792 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -1601,6 +1601,9 @@ static void load_helper_set_load(enum load load)
>   
>   static void load_helper_run(enum load load)
>   {
> +	if (!render_copy)
> +		return;
> +
>   	/*
>   	 * FIXME fork helpers won't get cleaned up when started from within a
>   	 * subtest, so handle the case where it sticks around a bit too long.
> @@ -1633,12 +1636,20 @@ static void load_helper_run(enum load load)
>   
>   static void load_helper_stop(void)
>   {
> +	if (!render_copy)
> +		return;
> +
>   	kill(lh.igt_proc.pid, SIGUSR1);
>   	igt_assert(igt_wait_helper(&lh.igt_proc) == 0);
>   }
>   
>   static void load_helper_init(void)
>   {
> +	if (!render_copy) {
> +		igt_info("Running test without render_copy\n");
> +		return;
> +	}
> +
>   	lh.devid = intel_get_drm_devid(drm_fd);
>   
>   	/* MI_STORE_DATA can only use GTT address on gen4+/g33 and needs
> @@ -1659,7 +1670,12 @@ static void load_helper_init(void)
>   
>   static void load_helper_fini(void)
>   {
> -	int i915 = buf_ops_get_fd(lh.bops);
> +	int i915;
> +
> +	if (!render_copy)
> +		return;
> +
> +	i915 = buf_ops_get_fd(lh.bops);
>   
>   	if (lh.igt_proc.running)
>   		load_helper_stop();
> @@ -5054,7 +5070,6 @@ igt_main
>   		gt_max_freq_mhz = sysfs_read(RPS_RP0_FREQ_MHZ);
>   
>   		render_copy = igt_get_render_copyfunc(devid);
> -		igt_require_f(render_copy, "no render-copy function\n");
>   	}
>   
>   	igt_subtest("non-system-wide-paranoid")
> @@ -5157,6 +5172,7 @@ igt_main
>   
>   	igt_subtest("unprivileged-single-ctx-counters") {
>   		igt_require(IS_HASWELL(devid));
> +		igt_require_f(render_copy, "no render-copy function\n");
>   		hsw_test_single_ctx_counters();
>   	}
>   
> @@ -5170,6 +5186,7 @@ igt_main
>   		 * For gen12 implement a separate test that uses only OAR
>   		 */
>   		igt_require(intel_gen(devid) >= 8 && intel_gen(devid) < 12);
> +		igt_require_f(render_copy, "no render-copy function\n");
>   		gen8_test_single_ctx_render_target_writes_a_counter();
>   	}
>   
> @@ -5185,8 +5202,10 @@ igt_main
>   			gen12_test_oa_tlb_invalidate();
>   
>   		igt_describe("Measure performance for a specific context using OAR in Gen 12");
> -		igt_subtest("gen12-unprivileged-single-ctx-counters")
> +		igt_subtest("gen12-unprivileged-single-ctx-counters") {
> +			igt_require_f(render_copy, "no render-copy function\n");
>   			gen12_test_single_ctx_render_target_writes_a_counter();
> +		}
>   	}
>   
>   	igt_subtest("rc6-disable")

