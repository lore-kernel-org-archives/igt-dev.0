Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988B789A4A
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jul 2021 17:12:36 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
Date: Mon, 5 Jul 2021 17:12:32 +0000
Message-ID: <17a5abd2f16649028b22133a04e37e17@intel.com>
References: <20210705141802.16979-1-swati2.sharma@intel.com>
 <486d32e69adc4850a087b1edbb2da42a@intel.com>
In-Reply-To: <486d32e69adc4850a087b1edbb2da42a@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cdclk: Drop basic subtest
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
To: "Sharma, Swati2" <swati2.sharma@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Shankar, Uma
> Sent: Monday, July 5, 2021 8:26 PM
> To: Sharma, Swati2 <swati2.sharma@intel.com>; igt-dev@lists.freedesktop.org
> Subject: RE: [PATCH i-g-t] tests/kms_cdclk: Drop basic subtest
> 
> 
> 
> > -----Original Message-----
> > From: Sharma, Swati2 <swati2.sharma@intel.com>
> > Sent: Monday, July 5, 2021 7:48 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Shankar, Uma
> > <uma.shankar@intel.com>
> > Subject: [PATCH i-g-t] tests/kms_cdclk: Drop basic subtest
> >
> > This drops basic subtest since use case is already getting covered by
> > mode transition subtest.
> >
> > Cc: Uma Shankar <uma.shankar@intel.com>
> > Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> > ---
> >  tests/kms_cdclk.c | 61
> > +++++------------------------------------------
> >  1 file changed, 6 insertions(+), 55 deletions(-)
> >
> > diff --git a/tests/kms_cdclk.c b/tests/kms_cdclk.c index
> > b2e32d25..d2a9fa5f 100644
> > --- a/tests/kms_cdclk.c
> > +++ b/tests/kms_cdclk.c
> > @@ -26,7 +26,7 @@
> >
> >  #include "igt.h"
> >
> > -IGT_TEST_DESCRIPTION("Test cdclk features : squasher and crawling");
> > +IGT_TEST_DESCRIPTION("Test cdclk features : crawling");
> >
> >  #define HDISPLAY_4K     3840
> >  #define VDISPLAY_4K     2160
> > @@ -34,9 +34,8 @@ IGT_TEST_DESCRIPTION("Test cdclk features : squasher
> > and crawling");
> >
> >  /* Test flags */
> >  enum {
> > -	TEST_BASIC = 1 << 0,
> > -	TEST_PLANESCALING = 1 << 1,
> > -	TEST_MODETRANSITION = 1 << 2,
> > +	TEST_PLANESCALING = 1 << 0,
> > +	TEST_MODETRANSITION = 1 << 1,
> >  };
> >
> >  typedef struct {
> > @@ -132,45 +131,6 @@ static void do_cleanup_display(igt_display_t *dpy)
> >  	igt_display_commit2(dpy, dpy->is_atomic ? COMMIT_ATOMIC :
> > COMMIT_LEGACY);  }
> >
> > -static void test_basic(data_t *data, enum pipe pipe, igt_output_t *output) -{
> > -	igt_display_t *display = &data->display;
> > -	int debugfs_fd = data->debugfs_fd;
> > -	int cdclk_ref, cdclk_new;
> > -	struct igt_fb fb;
> > -	igt_plane_t *primary;
> > -	drmModeModeInfo *mode;
> > -
> > -	do_cleanup_display(display);
> > -	igt_display_reset(display);
> > -
> > -	igt_output_set_pipe(output, pipe);
> > -	mode = get_highres_mode(output);
> > -	igt_require(mode != NULL);
> > -	igt_output_override_mode(output, mode);
> > -
> > -	primary = igt_output_get_plane_type(output,
> > DRM_PLANE_TYPE_PRIMARY);
> > -
> > -	igt_create_color_pattern_fb(display->drm_fd,
> > -				    mode->hdisplay, mode->vdisplay,
> > -				    DRM_FORMAT_XRGB8888,
> > -				    I915_TILING_NONE,
> > -				    0.0, 0.0, 0.0, &fb);
> > -
> > -	igt_plane_set_fb(primary, &fb);
> > -	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
> > -	igt_display_commit_atomic(display,
> > DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> > -	cdclk_new = get_current_cdclk_freq(debugfs_fd);
> > -	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
> > -
> > -	/* cdclk should bump */
> > -	igt_assert_lt(cdclk_ref, cdclk_new);
> > -
> > -	/* cleanup */
> > -	do_cleanup_display(display);
> > -	igt_remove_fb(display->drm_fd, &fb);
> > -}
> > -
> >  static void test_plane_scaling(data_t *data, enum pipe pipe,
> > igt_output_t *output) {
> >  	igt_display_t *display = &data->display; @@ -284,8 +244,6 @@ static
> > void run_cdclk_test(data_t *data, uint32_t flags)
> >  	for_each_pipe_with_valid_output(display, pipe, output) {
> >  		igt_dynamic_f("%s-pipe-%s", output->name,
> > kmstest_pipe_name(pipe))
> >  			if (igt_pipe_connector_valid(pipe, output)) {
> > -				if (flags & TEST_BASIC)
> > -					test_basic(data, pipe, output);
> >  				if (flags & TEST_PLANESCALING)
> >  					test_plane_scaling(data, pipe, output);
> >  				if (flags & TEST_MODETRANSITION)
> > @@ -306,22 +264,15 @@ igt_main
> >  		kmstest_set_vt_graphics_mode();
> >  		data.devid = intel_get_drm_devid(data.drm_fd);
> >  		igt_require_f(hardware_supported(&data),
> > -			      "Hardware doesn't support either squashing "\
> > -			      "or crawling.\n");
> > +			      "Hardware doesn't support crawling.\n");
> 
> We can still use both, whether to use squashing or crawling depends if a PLL ratio is
> required or not. So let this test cover both crawling and squashing.
> 
> With that fixed.
> Acked-by: Uma Shankar <uma.shankar@intel.com>

You also have my:
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> 
> >  		igt_display_require(&data.display, data.drm_fd);
> >  		igt_display_require_output(&data.display);
> >  	}
> >
> > -	igt_describe("Basic test to validate cdclk frequency change w/o "\
> > -		     "requiring full modeset.");
> > -	igt_subtest_with_dynamic("basic")
> > -		run_cdclk_test(&data, TEST_BASIC);
> > -	igt_describe("Plane scaling test to validate cdclk frequency change w/o "\
> > -		     "requiring full modeset.");
> > +	igt_describe("Plane scaling test to validate cdclk frequency
> > +change");
> >  	igt_subtest_with_dynamic("plane-scaling")
> >  		run_cdclk_test(&data, TEST_PLANESCALING);
> > -	igt_describe("Mode transition (low to high) test to validate cdclk frequency
> > "\
> > -		     "change w/o requiring full modeset.");
> > +	igt_describe("Mode transition (low to high) test to validate cdclk
> > +frequency change");
> >  	igt_subtest_with_dynamic("mode-transition")
> >  		run_cdclk_test(&data, TEST_MODETRANSITION);
> >
> > --
> > 2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
