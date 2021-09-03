Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A336E8B2
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 16:47:57 +0000 (UTC)
Date: Fri, 3 Sep 2021 12:47:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <YTJRulPlnliV0HXs@intel.com>
References: <20210902173043.821318-1-alan.previn.teres.alexis@intel.com>
 <20210902173043.821318-10-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902173043.821318-10-alan.previn.teres.alexis@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v9 09/16] Verify PXP teardown occurred
 through suspend-resume
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 02, 2021 at 10:30:36AM -0700, Alan Previn wrote:
> During a suspend-resume cycle, the driver shall ensure the
> PXP session and keys are torn down and re-established.
> Verify that key change did occur by repeating the 3d
> rendercopy operation before and after the suspend-resume
> cycle and ensuring the encrypted output is different.

Is this aligned with the latest series from Daniele?
In the latest version we are blocking the runtime_pm if
there's active protected context. So we might do only
system-suspend tests?

Anyway, I have a feeling that those changes might impact this case.

> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  tests/i915/gem_pxp.c | 66 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
> index af40e893..b997b058 100644
> --- a/tests/i915/gem_pxp.c
> +++ b/tests/i915/gem_pxp.c
> @@ -9,6 +9,12 @@
>  IGT_TEST_DESCRIPTION("Test PXP that manages protected content through arbitrated HW-PXP-session");
>  /* Note: PXP = "Protected Xe Path" */
>  
> +/* Struct and definitions for power management. */
> +struct powermgt_data {
> +	int debugfsdir;
> +	bool has_runtime_pm;
> +};
> +
>  static int create_bo_ext(int i915, uint32_t size, bool protected_is_true, uint32_t *bo_out)
>  {
>  	int ret;
> @@ -465,7 +471,7 @@ static void test_render_baseline(int i915)
>  	buf_ops_destroy(bops);
>  }
>  
> -static void test_render_pxp_src_to_protdest(int i915)
> +static void __test_render_pxp_src_to_protdest(int i915, uint32_t *outpixels, int outsize)
>  {
>  	uint32_t ctx, srcbo, dstbo;
>  	struct intel_buf *srcbuf, *dstbuf;
> @@ -507,6 +513,10 @@ static void test_render_pxp_src_to_protdest(int i915)
>  	assert_bo_content_check(i915, dstbo, COMPARE_COLOR_UNREADIBLE,
>  				TSTSURF_SIZE, TSTSURF_FILLCOLOR2, NULL, 0);
>  
> +	if (outpixels)
> +		assert_bo_content_check(i915, dstbo, COPY_BUFFER,
> +					TSTSURF_SIZE, 0, outpixels, outsize);
> +
>  	intel_bb_destroy(ibb);
>  	intel_buf_destroy(srcbuf);
>  	gem_close(i915, srcbo);
> @@ -516,6 +526,11 @@ static void test_render_pxp_src_to_protdest(int i915)
>  	buf_ops_destroy(bops);
>  }
>  
> +static void test_render_pxp_src_to_protdest(int i915)
> +{
> +	__test_render_pxp_src_to_protdest(i915, NULL, 0);
> +}
> +
>  static void test_render_pxp_protsrc_to_protdest(int i915)
>  {
>  	uint32_t ctx, srcbo, dstbo, dstbo2;
> @@ -595,10 +610,46 @@ static void test_render_pxp_protsrc_to_protdest(int i915)
>  	buf_ops_destroy(bops);
>  }
>  
> +static void init_powermgt_resources(int i915, struct powermgt_data *pm)
> +{
> +	pm->debugfsdir = igt_debugfs_dir(i915);
> +	igt_require(pm->debugfsdir != -1);
> +	pm->has_runtime_pm = igt_setup_runtime_pm(i915);
> +	igt_require(pm->has_runtime_pm);
> +}
> +
> +static void trigger_powermgt_suspend_cycle(int i915,
> +	struct powermgt_data *pm)
> +{
> +	igt_pm_enable_sata_link_power_management();
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_DEVICES);
> +}
> +
> +static void test_pxp_pwrcycle_teardown_keychange(int i915, struct powermgt_data *pm)
> +{
> +	uint32_t encrypted_pixels_b4[TSTSURF_SIZE/TSTSURF_BYTESPP];
> +	uint32_t encrypted_pixels_aft[TSTSURF_SIZE/TSTSURF_BYTESPP];
> +	int matched_after_keychange = 0, loop = 0;
> +
> +	__test_render_pxp_src_to_protdest(i915, encrypted_pixels_b4, TSTSURF_SIZE);
> +
> +	trigger_powermgt_suspend_cycle(i915, pm);
> +
> +	__test_render_pxp_src_to_protdest(i915, encrypted_pixels_aft, TSTSURF_SIZE);
> +
> +	while (loop < (TSTSURF_SIZE/TSTSURF_BYTESPP)) {
> +		if (encrypted_pixels_b4[loop] == encrypted_pixels_aft[loop])
> +			++matched_after_keychange;
> +		++loop;
> +	}
> +	igt_assert_eq(matched_after_keychange, 0);
> +}
> +
>  igt_main
>  {
>  	int i915 = -1;
>  	bool pxp_supported = false;
> +	struct powermgt_data pm = {0};
>  	igt_render_copyfunc_t rendercopy = NULL;
>  	uint32_t devid = 0;
>  
> @@ -671,6 +722,19 @@ igt_main
>  		igt_subtest("protected-encrypted-src-copy-not-readible")
>  			test_render_pxp_protsrc_to_protdest(i915);
>  	}
> +	igt_subtest_group {
> +		igt_fixture {
> +			igt_require(pxp_supported);
> +			devid = intel_get_drm_devid(i915);
> +			igt_assert(devid);
> +			rendercopy = igt_get_render_copyfunc(devid);
> +			igt_require(rendercopy);
> +			init_powermgt_resources(i915, &pm);
> +		}
> +		igt_describe("Verify suspend-resume teardown management:");
> +		igt_subtest("verify-pxp-key-change-after-suspend-resume")
> +			test_pxp_pwrcycle_teardown_keychange(i915, &pm);
> +	}
>  
>  	igt_fixture {
>  		close(i915);
> -- 
> 2.25.1
> 
