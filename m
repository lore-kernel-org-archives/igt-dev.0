Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FED510E02D
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 06:01:28 +0000 (UTC)
Message-ID: <1d811532-d254-c785-c1ea-6908f201061c@intel.com>
Date: Tue, 13 Jun 2023 11:31:09 +0530
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230612190134.2902272-1-kunal1.joshi@intel.com>
 <20230612190134.2902272-6-kunal1.joshi@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230612190134.2902272-6-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 5/6] RFC
 tests/i915/kms_frontbuffer_tracking: xe only supports MMAP_WC, BLT, RENDER
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

Hi Kunal,

On Tue-13-06-2023 12:31 am, Kunal Joshi wrote:
> xe only supports MMAP_WC, BLT and RENDER methods,
> 
> Open :- does draw method give guarantee for fb to be rendered
> on return, if not how to assure, ex for RENDER we have intel_bb_sync
> 
> v2: use igt_draw_supports_method (Bhanu)
>      Remove check from macro and put it in igt_require at test level
>      (Bhanu)
> v3: change order of basic subtest to avoid skipping early (Bhanu)
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/i915/kms_frontbuffer_tracking.c | 87 ++++++++++++++++-----------
>   1 file changed, 53 insertions(+), 34 deletions(-)
> 
> diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
> index 22d1a7df..e95c4a0d 100644
> --- a/tests/i915/kms_frontbuffer_tracking.c
> +++ b/tests/i915/kms_frontbuffer_tracking.c
> @@ -1306,11 +1306,13 @@ static void init_crcs(enum pixel_format format, enum tiling_type tiling,
>   		for (r = 0; r < pattern->n_rects; r++)
>   			for (r_ = 0; r_ <= r; r_++)
>   				draw_rect_igt_fb(pattern, &tmp_fbs[r],
> -						 IGT_DRAW_PWRITE, r_);
> +						 igt_draw_supports_method(drm.fd, IGT_DRAW_PWRITE) ?
> +						 IGT_DRAW_PWRITE : IGT_DRAW_RENDER,
> +						 r_);
>   	} else {
>   		for (r = 0; r < pattern->n_rects; r++)
> -			draw_rect_igt_fb(pattern, &tmp_fbs[r], IGT_DRAW_PWRITE,
> -					 r);
> +			draw_rect_igt_fb(pattern, &tmp_fbs[r], igt_draw_supports_method(drm.fd, IGT_DRAW_PWRITE) ?
> +					 IGT_DRAW_PWRITE : IGT_DRAW_RENDER, r);
>   	}
>   
>   	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
> @@ -2044,9 +2046,6 @@ static void draw_subtest(const struct test_mode *t)
>   	struct modeset_params *params = pick_params(t);
>   	struct fb_region *target;
>   
> -	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
> -		    !gem_has_mappable_ggtt(drm.fd));
> -
>   	switch (t->screen) {
>   	case SCREEN_PRIM:
>   		if (t->method != IGT_DRAW_MMAP_GTT && t->plane == PLANE_PRI)
> @@ -2146,9 +2145,8 @@ static void multidraw_subtest(const struct test_mode *t)
>   				  igt_draw_get_method_name(m1),
>   				  igt_draw_get_method_name(m2));
>   
> -			if ((m1 == IGT_DRAW_MMAP_GTT ||
> -			     m2 == IGT_DRAW_MMAP_GTT) &&
> -			    !gem_has_mappable_ggtt(drm.fd))
> +			if (!igt_draw_supports_method(drm.fd, m1) ||
> +			    !igt_draw_supports_method(drm.fd, m2))
>   				continue;
>   
>   			for (r = 0; r < pattern->n_rects; r++) {
> @@ -2417,9 +2415,6 @@ static void flip_subtest(const struct test_mode *t)
>   	struct draw_pattern_info *pattern = &pattern1;
>   	enum color bg_color;
>   
> -	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
> -		    !gem_has_mappable_ggtt(drm.fd));
> -
>   	switch (t->screen) {
>   	case SCREEN_PRIM:
>   		assertions |= ASSERT_LAST_ACTION_CHANGED;
> @@ -2479,9 +2474,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
>   	struct modeset_params *params = pick_params(t);
>   	struct draw_pattern_info *pattern = &pattern1;
>   
> -	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
> -		    !gem_has_mappable_ggtt(drm.fd));
> -
>   	prepare_subtest(t, pattern);
>   
>   	create_fb(t->format, params->primary.fb->width, params->primary.fb->height,
> @@ -2891,9 +2883,6 @@ static void farfromfence_subtest(const struct test_mode *t)
>   	int max_height, assertions = 0;
>   	int gen = intel_display_ver(intel_get_drm_devid(drm.fd));
>   
> -	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
> -		    !gem_has_mappable_ggtt(drm.fd));
> -
>   	switch (gen) {
>   	case 2:
>   		max_height = 2048;
> @@ -3177,8 +3166,7 @@ static void basic_subtest(const struct test_mode *t)
>   	fb1 = params->primary.fb;
>   
>   	for (r = 0, method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
> -		if (method == IGT_DRAW_MMAP_GTT &&
> -		    !gem_has_mappable_ggtt(drm.fd))
> +		if (!igt_draw_supports_method(drm.fd, method))
>   			continue;
>   
>   		if (r == pattern->n_rects) {
> @@ -3462,6 +3450,20 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		devid = intel_get_drm_devid(drm.fd);
>   	}
>   
> +        t.pipes = PIPE_SINGLE;
> +        t.screen = SCREEN_PRIM;
> +        t.plane = PLANE_PRI;
> +        t.fbs = FBS_INDIVIDUAL;
> +        t.feature = FEATURE_DEFAULT;
> +        t.format = FORMAT_DEFAULT;
> +        t.flip = FLIP_PAGEFLIP;
> +        t.tiling = opt.tiling;
> +        igt_subtest("basic") {
> +                if (!is_xe_device(drm.fd))
> +                        igt_require_gem(drm.fd);
> +                basic_subtest(&t);
> +        }

Probably, this change must be in a new patch.

With this change, this patch is
Reviewed-by: Bhanuprakash Modem <bhanupraksh.modem@intel.com>

You can use my R-b for the new patch mentioned above.

- Bhanu

> +
>   	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
>   		if (!opt.show_hidden && t.feature == FEATURE_NONE)
>   			continue;
> @@ -3483,6 +3485,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   	}
>   
>   	TEST_MODE_ITER_BEGIN(t)
> +		igt_fixture
> +			igt_require(igt_draw_supports_method(drm.fd, t.method));
> +
>   		igt_subtest_f("%s-%s-%s-%s-%s-draw-%s",
>   			      feature_str(t.feature),
>   			      pipes_str(t.pipes),
> @@ -3499,6 +3504,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		    (!opt.show_hidden && t.method != IGT_DRAW_BLT))
>   			continue;
>   
> +		igt_fixture
> +			igt_require(igt_draw_supports_method(drm.fd, t.method));
> +
>   		for (t.flip = 0; t.flip < FLIP_COUNT; t.flip++)
>   			igt_subtest_f("%s-%s-%s-%s-%sflip-%s",
>   				      feature_str(t.feature),
> @@ -3517,6 +3525,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		    (t.feature & FEATURE_FBC) == 0)
>   			continue;
>   
> +		igt_fixture
> +			igt_require(igt_draw_supports_method(drm.fd, t.method));
> +
>   		igt_subtest_f("%s-%s-%s-fliptrack-%s",
>   			      feature_str(t.feature),
>   			      pipes_str(t.pipes),
> @@ -3531,6 +3542,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		    t.plane == PLANE_PRI)
>   			continue;
>   
> +		igt_fixture
> +			igt_require(igt_draw_supports_method(drm.fd, t.method));
> +
>   		igt_subtest_f("%s-%s-%s-%s-%s-move",
>   			      feature_str(t.feature),
>   			      pipes_str(t.pipes),
> @@ -3554,6 +3568,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		    t.plane != PLANE_SPR)
>   			continue;
>   
> +		igt_fixture
> +			igt_require(igt_draw_supports_method(drm.fd, t.method));
> +
>   		igt_subtest_f("%s-%s-%s-%s-%s-fullscreen",
>   			      feature_str(t.feature),
>   			      pipes_str(t.pipes),
> @@ -3570,6 +3587,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		    (!opt.show_hidden && t.fbs != FBS_INDIVIDUAL))
>   			continue;
>   
> +		igt_fixture
> +			igt_require(igt_draw_supports_method(drm.fd, t.method));
> +
>   		igt_subtest_f("%s-%s-%s-%s-multidraw",
>   			      feature_str(t.feature),
>   			      pipes_str(t.pipes),
> @@ -3586,6 +3606,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		    t.method != IGT_DRAW_MMAP_GTT)
>   			continue;
>   
> +		igt_fixture
> +			igt_require(igt_draw_supports_method(drm.fd, t.method));
> +
>   		igt_subtest_f("%s-farfromfence-%s",
>   			      feature_str(t.feature),
>   			      igt_draw_get_method_name(t.method))
> @@ -3599,6 +3622,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		    t.fbs != FBS_INDIVIDUAL)
>   			continue;
>   
> +		igt_fixture
> +			igt_require(igt_draw_supports_method(drm.fd, t.method));
> +
>   		for (t.format = 0; t.format < FORMAT_COUNT; t.format++) {
>   			/* Skip what we already tested. */
>   			if (t.format == FORMAT_DEFAULT)
> @@ -3618,6 +3644,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		    t.plane != PLANE_PRI ||
>   		    t.method != IGT_DRAW_BLT)
>   			continue;
> +
> +		igt_fixture
> +			igt_require(igt_draw_supports_method(drm.fd, t.method));
> +
>   		igt_subtest_f("%s-%s-scaledprimary",
>   			      feature_str(t.feature),
>   			      fbs_str(t.fbs))
> @@ -3632,6 +3662,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		    t.method != IGT_DRAW_BLT)
>   			continue;
>   
> +		igt_fixture
> +			igt_require(igt_draw_supports_method(drm.fd, t.method));
> +
>   		igt_subtest_f("%s-modesetfrombusy", feature_str(t.feature))
>   			modesetfrombusy_subtest(&t);
>   
> @@ -3689,20 +3722,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   			suspend_subtest(&t);
>   	TEST_MODE_ITER_END
>   
> -	t.pipes = PIPE_SINGLE;
> -	t.screen = SCREEN_PRIM;
> -	t.plane = PLANE_PRI;
> -	t.fbs = FBS_INDIVIDUAL;
> -	t.feature = FEATURE_DEFAULT;
> -	t.format = FORMAT_DEFAULT;
> -	t.flip = FLIP_PAGEFLIP;
> -	t.tiling = opt.tiling;
> -	igt_subtest("basic") {
> -		if (!is_xe_device(drm.fd))
> -			igt_require_gem(drm.fd);
> -		basic_subtest(&t);
> -	}
> -
>   	igt_fixture
>   		teardown_environment();
>   }
