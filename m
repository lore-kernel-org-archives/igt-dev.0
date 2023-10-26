Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D23D10E070
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 07:21:50 +0000 (UTC)
Message-ID: <df628c14-8fdb-f5b5-a932-c804e910b00c@intel.com>
Date: Thu, 26 Oct 2023 12:51:22 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>,
 <vinod.govindapillai@intel.com>
References: <20231026031610.21625-1-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20231026031610.21625-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5] tests/kms_frontbuffer_tracking:
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

On Thu-26-10-2023 08:46 am, Nidhi Gupta wrote:
> Added a new subtest to validate FBC on each plane, this new subtest
> will first disable the fbc feature on all pipes and planes and then
> enable it on all plane one by one and confirm.
> 
> v2: Modify tests to disable primary and enable other plane
>      to check fbc is enabled or not. <Bhanu>
> 

Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>

> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 95 ++++++++++++++++++++++++++
>   1 file changed, 95 insertions(+)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index f90d09f9f..a3dd3f63b 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -224,6 +224,8 @@ struct fb_region {
>   	int h;
>   };
>   
> +struct igt_fb default_fb;

Unused variable, please drop it.

> +
>   struct draw_pattern_info {
>   	bool frames_stack;
>   	int n_rects;
> @@ -888,6 +890,14 @@ static bool fbc_mode_too_large(void)
>   	return strstr(buf, "FBC disabled: mode too large for compression\n");
>   }
>   
> +static bool fbc_enable_per_plane(void)
> +{
> +	char buf[128];
> +
> +	debugfs_read_crtc("i915_fbc_status", buf);
> +	return strstr(buf, "*");

Just reading the '*' is not enough, but need to make sure that the 
requested plane & FBC enabled plane are same.

Example:
# cat i915_fbc_status
* [PLANE:40:plane 2A]: FBC possible

hint: parse the plane index or id & compare with the requested plane.

> +}
> +
>   static bool drrs_wait_until_rr_switch_to_low(void)
>   {
>   	return igt_wait(is_drrs_low(), 5000, 1);
> @@ -1691,6 +1701,31 @@ static void set_region_for_test(const struct test_mode *t,
>   	do_assertions(ASSERT_NO_ACTION_CHANGE);
>   }
>   
> +static void set_plane_for_test_fbc(const struct test_mode *t, igt_plane_t *plane)
> +{
> +	//create_fb

Please drop this comment.

> +	struct igt_fb fb;
> +	uint32_t color;
> +
> +	igt_create_fb(drm.fd, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay,
> +			t->format, DRM_FORMAT_MOD_LINEAR, &fb);
> +	//fill_fb_region

Please drop this comment or use the single line comment style /* */

> +	color = pick_color(&fb, COLOR_PRIM_BG);
> +
> +	igt_draw_rect_fb(drm.fd, drm.bops, 0, &fb, IGT_DRAW_BLT,
> +			 0, 0, fb.width, fb.height,
> +			 color);
> +	set_mode_for_params(&prim_mode_params);

This api always uses primary plane only.

> +	igt_plane_set_fb(plane, &fb);
> +	igt_plane_set_position(plane, 0, 0);
> +	igt_plane_set_size(plane, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay);
> +	igt_fb_set_size(&fb, plane, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay);
> +
> +	igt_display_commit(&drm.display);
> +	igt_require(!fbc_enable_per_plane());
> +	do_assertions(ASSERT_NO_ACTION_CHANGE);
> +}
> +
>   static bool enable_features_for_test(const struct test_mode *t)
>   {
>   	bool ret = false;
> @@ -1940,6 +1975,39 @@ static void rte_subtest(const struct test_mode *t)
>   		set_region_for_test(t, &scnd_mode_params.sprite);
>   	}
>   }
> +/**
> + * SUBTEST: plane-fbc-rte
> + * Description: Sanity test to enable FBC on a plane.
> + * Driver requirement: i915, xe
> + * Functionality: fbc
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */

Please move the documentation to top of the file & just below the all 
#includes.

> +
> +/**
> + * plane-fbc-rte - the basic sanity test
> + *
> + * METHOD
> + *   Just disable all screens, assert everything is disabled, then enable all
> + *   screens  and planes  and assert that the tested feature is enabled.

Not all screens & planes together. Our intention is to test individual 
plane.

> + *
> + * EXPECTED RESULTS
> + *   Blue screens and t->feature enabled.
> + *
> + * FAILURES
> + *   A failure here means that every other subtest will probably fail too. It
> + *   probably means that the Kernel is just not enabling the feature we want.
> + */
> +static void plane_fbc_rte_subtest(const struct test_mode *t, igt_plane_t *plane)
> +{
> +	do_assertions(ASSERT_FBC_DISABLED);
> +
> +	if (plane->index == 0)
> +		enable_prim_screen_and_wait(t);
> +	if (plane->index > 0)
> +		set_plane_for_test_fbc(t, plane);

Looks, bit odd to me to read the code. I think we need to redesign the 
test as below:

1. Initialize the fb_region struct with requested plane.
2. fill_fb_region()
3. set plane params like fb, size, position etc.. and commit
4. Check for the fbc status.

> +
> +}
>   
>   static void update_wanted_crc(const struct test_mode *t, igt_crc_t *crc)
>   {
> @@ -4910,6 +4978,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   {
>   	struct test_mode t;
>   	int devid;
> +	igt_plane_t *plane;
>   
>   	igt_fixture {
>   		setup_environment();
> @@ -4936,6 +5005,32 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		}
>   	}
>   
> +	igt_subtest_with_dynamic("plane-fbc-rte") {

Dynamic subtests are not required, as we are using single pipe & output 
combination only.

> +
> +		int n_planes = 0;
> +
> +		t.pipes = PIPE_SINGLE;
> +		t.feature = FEATURE_FBC;
> +		t.screen = SCREEN_PRIM;
> +		t.fbs = FBS_INDIVIDUAL;
> +		t.format = FORMAT_DEFAULT;
> +		/* Make sure nothing is using these values. */
> +		t.flip = -1;
> +		t.method = -1;
> +		t.tiling = opt.tiling;
> +
> +		for_each_plane_on_pipe(&drm.display, prim_mode_params.pipe, plane) {
> +			n_planes++;
> +			if (n_planes == 4)
> +				break;

Better create a function (maybe is_valid_plane()) to check for the plane 
validity.

And use it as:

if (!is_valid_plane(plane))
     continue;

Example: kms_plane.c --> skip_plane();

> +			igt_dynamic_f("plane-%u-fbc-rte", plane->index) {
> +				prepare_subtest_data(&t, NULL);
> +				unset_all_crtcs();

Use it before preparing the subtest.

- Bhanu

> +				plane_fbc_rte_subtest(&t, plane);
> +			}
> +		}
> +	}
> +
>   	TEST_MODE_ITER_BEGIN(t)
>   
>   		igt_subtest_f("%s-%s-%s-%s-%s-draw-%s",
