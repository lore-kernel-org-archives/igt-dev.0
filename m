Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8BC6ED75
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 23:19:49 +0000 (UTC)
Date: Mon, 10 Feb 2020 15:19:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20200210231948.GS232048@mdroper-desk1.amr.corp.intel.com>
References: <20200207191524.19362-1-imre.deak@intel.com>
 <20200207191524.19362-6-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207191524.19362-6-imre.deak@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/8] tests/kms_frontbuffer_tracking:
 Skip GTT subtests on platforms w/o aperture
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 09:15:22PM +0200, Imre Deak wrote:
> Subtests that draw through a GTT mapping are not relevent on a platform w/o
> GTT aperture, so skip them.

Could this check be pushed down into check_test_requirements()?


Matt

> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  tests/kms_frontbuffer_tracking.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
> index 724f5d16..310c8b7b 100644
> --- a/tests/kms_frontbuffer_tracking.c
> +++ b/tests/kms_frontbuffer_tracking.c
> @@ -1934,6 +1934,9 @@ static void draw_subtest(const struct test_mode *t)
>  	struct modeset_params *params = pick_params(t);
>  	struct fb_region *target;
>  
> +	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
> +		    !gem_has_mappable_ggtt(drm.fd));
> +
>  	switch (t->screen) {
>  	case SCREEN_PRIM:
>  		if (t->method != IGT_DRAW_MMAP_GTT && t->plane == PLANE_PRI)
> @@ -2032,6 +2035,11 @@ static void multidraw_subtest(const struct test_mode *t)
>  			igt_debug("Methods %s and %s\n",
>  				  igt_draw_get_method_name(m1),
>  				  igt_draw_get_method_name(m2));
> +
> +			igt_skip_on((m1 == IGT_DRAW_MMAP_GTT ||
> +				     m2 == IGT_DRAW_MMAP_GTT) &&
> +				    !gem_has_mappable_ggtt(drm.fd));
> +
>  			for (r = 0; r < pattern->n_rects; r++) {
>  				used_method = (r % 2 == 0) ? m1 : m2;
>  
> @@ -2140,6 +2148,9 @@ static void badformat_subtest(const struct test_mode *t)
>   */
>  static void format_draw_subtest(const struct test_mode *t)
>  {
> +	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
> +		    !gem_has_mappable_ggtt(drm.fd));
> +
>  	if (format_is_valid(t->feature, t->format))
>  		draw_subtest(t);
>  	else
> @@ -2276,6 +2287,9 @@ static void flip_subtest(const struct test_mode *t)
>  	struct draw_pattern_info *pattern = &pattern1;
>  	enum color bg_color;
>  
> +	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
> +		    !gem_has_mappable_ggtt(drm.fd));
> +
>  	switch (t->screen) {
>  	case SCREEN_PRIM:
>  		assertions |= ASSERT_LAST_ACTION_CHANGED;
> @@ -2335,6 +2349,9 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
>  	struct modeset_params *params = pick_params(t);
>  	struct draw_pattern_info *pattern = &pattern1;
>  
> +	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
> +		    !gem_has_mappable_ggtt(drm.fd));
> +
>  	prepare_subtest(t, pattern);
>  
>  	create_fb(t->format, params->primary.fb->width, params->primary.fb->height,
> @@ -2383,6 +2400,9 @@ static void move_subtest(const struct test_mode *t)
>  	struct fb_region *reg = pick_target(t, params);
>  	bool repeat = false;
>  
> +	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
> +		    !gem_has_mappable_ggtt(drm.fd));
> +
>  	prepare_subtest(t, pattern);
>  
>  	/* Just paint the right color since we start at 0x0. */
> @@ -2434,6 +2454,9 @@ static void onoff_subtest(const struct test_mode *t)
>  	struct modeset_params *params = pick_params(t);
>  	struct draw_pattern_info *pattern = &pattern3;
>  
> +	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
> +		    !gem_has_mappable_ggtt(drm.fd));
> +
>  	prepare_subtest(t, pattern);
>  
>  	/* Just paint the right color since we start at 0x0. */
> @@ -2493,6 +2516,9 @@ static void fullscreen_plane_subtest(const struct test_mode *t)
>  	struct modeset_params *params = pick_params(t);
>  	int assertions;
>  
> +	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
> +		    !gem_has_mappable_ggtt(drm.fd));
> +
>  	prepare_subtest(t, pattern);
>  
>  	rect = pattern->get_rect(&params->primary, 0);
> @@ -2744,6 +2770,9 @@ static void farfromfence_subtest(const struct test_mode *t)
>  	int max_height, assertions = 0;
>  	int gen = intel_gen(intel_get_drm_devid(drm.fd));
>  
> +	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
> +		    !gem_has_mappable_ggtt(drm.fd));
> +
>  	switch (gen) {
>  	case 2:
>  		max_height = 2048;
> @@ -3025,6 +3054,9 @@ static void basic_subtest(const struct test_mode *t)
>  	fb1 = params->primary.fb;
>  
>  	for (r = 0, method = 0; method < IGT_DRAW_METHOD_COUNT; method++, r++) {
> +		igt_skip_on(method == IGT_DRAW_MMAP_GTT &&
> +			    !gem_has_mappable_ggtt(drm.fd));
> +
>  		if (r == pattern->n_rects) {
>  			params->primary.fb = (params->primary.fb == fb1) ? &fb2 : fb1;
>  
> -- 
> 2.23.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
