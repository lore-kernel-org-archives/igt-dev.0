Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C9410EA23
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 15:41:33 +0000 (UTC)
Message-ID: <1892fe0c-dc56-1016-65a5-275c584f0d06@intel.com>
Date: Fri, 3 Nov 2023 21:11:15 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231103032759.16202-1-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20231103032759.16202-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6] tests/kms_frontbuffer_tracking:
 Extend the test to enable FBC for each plane
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

Hi Nidhi,

On Fri-03-11-2023 08:57 am, Nidhi Gupta wrote:
> Added a new subtest to validate FBC on each plane, this new subtest
> will first disable the fbc feature on all pipes and planes and then
> enable it on all plane one by one and confirm.
> 
> v2: Modify tests to disable primary and enable other plane
>      to check fbc is enabled or not. <Bhanu>
> 
> v3: Implemented design changes as suggested <Bhanu>
> 
> v4: Fixed nitpicks (Bhanu)
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 106 +++++++++++++++++++++++++
>   1 file changed, 106 insertions(+)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index f90d09f9f..61c0dd0fd 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -43,6 +43,15 @@
>   #include "igt_sysfs.h"
>   #include "igt_psr.h"
>   
> +/**
> + * SUBTEST: plane-fbc-rte
> + * Description: Sanity test to enable FBC on a plane.
> + * Driver requirement: i915, xe
> + * Functionality: fbc
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
>   #define TIME SLOW_QUICK(1000, 10000)
>   
>   IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
> @@ -888,6 +897,17 @@ static bool fbc_mode_too_large(void)
>   	return strstr(buf, "FBC disabled: mode too large for compression\n");
>   }
>   
> +static bool fbc_enable_per_plane(int plane_index, enum pipe pipe)
> +{
> +	char buf[128];
> +	char buf_plane[128];
> +
> +	sprintf(buf_plane, "%d%s", plane_index, kmstest_pipe_name(pipe));
> +
> +	debugfs_read_crtc("i915_fbc_status", buf);
> +	return strstr(strstr(buf, "*"), buf_plane);
> +}
> +
>   static bool drrs_wait_until_rr_switch_to_low(void)
>   {
>   	return igt_wait(is_drrs_low(), 5000, 1);
> @@ -1691,6 +1711,27 @@ static void set_region_for_test(const struct test_mode *t,
>   	do_assertions(ASSERT_NO_ACTION_CHANGE);
>   }
>   
> +static void set_plane_for_test_fbc(const struct test_mode *t, igt_plane_t *plane)
> +{
> +	struct igt_fb fb;
> +	uint32_t color;
> +

Please print some plane information, as it is easy to debug the failures.

> +	create_fb(t->format, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay, t->tiling, t->plane, &fb);
> +	color = pick_color(&fb, COLOR_PRIM_BG);
> +	igt_draw_rect_fb(drm.fd, drm.bops, 0, &fb, IGT_DRAW_BLT,
> +			 0, 0, fb.width, fb.height,
> +			 color);

Code looks clumsy to me, please follow some coding standards.

Please add newline here.

> +	igt_plane_set_fb(plane, &fb);
> +	igt_plane_set_position(plane, 0, 0);
> +	igt_plane_set_size(plane, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay);
> +	igt_fb_set_size(&fb, plane, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay);
> +	igt_display_commit_atomic(&drm.display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);

Please add newline here.

> +	wanted_crc = &blue_crcs[t->format].crc;
-----------------------^
This won't change per plane, please move it to plane_fbc_rte_subtest()

> +	fbc_update_last_action();
> +	do_assertions(ASSERT_FBC_ENABLED);
----------------------------------------^
As we are checking fbc lastupdate, don't we need to check for 
ASSERT_NO_ACTION_CHANGE too?

> +	igt_assert_f(fbc_enable_per_plane(plane->index, prim_mode_params.pipe), "FBC disabled\n");
> +}
> +
>   static bool enable_features_for_test(const struct test_mode *t)
>   {
>   	bool ret = false;
> @@ -1941,6 +1982,57 @@ static void rte_subtest(const struct test_mode *t)
>   	}
>   }
>   
> +static bool is_valid_plane(igt_plane_t *plane)
> +{
> +	int index = plane->index;
> +
> +	if (plane->type == DRM_PLANE_TYPE_CURSOR)
> +		return false;
> +	/*
> +	 * Execute test only on first three planes
> +	 */
> +	return ((index >= 0) && (index < 3));
> +}
> +
> +/**
> + * plane-fbc-rte - the basic sanity test
> + *
> + * METHOD
> + *   Just disable primary screen, assert everything is disabled, then enable single
> + *   screens and single plane one by one  and assert that the tested fbc is enabled
> + *   for the particular plane.
> + *
> + * EXPECTED RESULTS
> + *   Blue screens and t->feature enabled.
> + *
> + * FAILURES
> + *   A failure here means that fbc is not getting enabled for requested plane. It means
> + *   kernel is not able to enable fbc on the requested plane.
> + */
> +
> +static void plane_fbc_rte_subtest(const struct test_mode *t)
> +{
> +	int ver;
> +	igt_plane_t *plane;
> +
> +	ver = intel_display_ver(intel_get_drm_devid(drm.fd));

I can see, we are checking display version multiple times across this 
test, need a cleanup to call it once & preserve the info in data.

Anyway that is outof context to this patch.

> +	igt_require_f((ver >= 20), "Can't test fbc for each plane\n");

Please add newline here.

> +	prepare_subtest_data(t, NULL);
> +	unset_all_crtcs();
> +	do_assertions(ASSERT_FBC_DISABLED | DONT_ASSERT_CRC);

Please add newline here.

> +	igt_output_override_mode(prim_mode_params.output, &prim_mode_params.mode);
> +	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
> +
> +	for_each_plane_on_pipe(&drm.display, prim_mode_params.pipe, plane) {
> +		if (!is_valid_plane(plane))
> +			continue;

Please add newline here.

> +		set_plane_for_test_fbc(t, plane);

We need a cleanup here or in set_plane_for_test_fbc(). Otherwise plane-0 
is always enabled even you tried to test plane-1 or 2 which causes 
unexpected result.

> +	}
> +
> +	plane = NULL;

Doesn't matter to make it NULL, as this variable stays in stack.

> +	igt_display_reset(&drm.display);

Good to have it, but not mandatory.

- Bhanu

> +}
> +
>   static void update_wanted_crc(const struct test_mode *t, igt_crc_t *crc)
>   {
>   	if (t->screen == SCREEN_PRIM)
> @@ -4936,6 +5028,20 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		}
>   	}
>   
> +	t.pipes = PIPE_SINGLE;
> +	t.feature = FEATURE_FBC;
> +	t.screen = SCREEN_PRIM;
> +	t.fbs = FBS_INDIVIDUAL;
> +	t.format = FORMAT_DEFAULT;
> +	/* Make sure nothing is using these values. */
> +	t.flip = -1;
> +	t.method = -1;
> +	t.tiling = opt.tiling;
> +
> +	igt_subtest_f("plane-fbc-rte") {
> +		plane_fbc_rte_subtest(&t);
> +	}
> +
>   	TEST_MODE_ITER_BEGIN(t)
>   
>   		igt_subtest_f("%s-%s-%s-%s-%s-draw-%s",
