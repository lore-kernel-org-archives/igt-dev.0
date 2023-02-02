Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2297E10E4F2
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Feb 2023 12:15:41 +0000 (UTC)
Date: Thu, 2 Feb 2023 14:15:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Message-ID: <Y9upad7eN8P5eQvh@intel.com>
References: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
 <20230131120646.27434-7-ville.syrjala@linux.intel.com>
 <DM6PR11MB3177FB4C74D129995D9FB495BAD69@DM6PR11MB3177.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM6PR11MB3177FB4C74D129995D9FB495BAD69@DM6PR11MB3177.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] tests/kms_async_flips: Test all
 modifiers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 02, 2023 at 11:23:09AM +0000, Murthy, Arun R wrote:
> > -----Original Message-----
> > From: Ville Syrjala <ville.syrjala@linux.intel.com>
> > Sent: Tuesday, January 31, 2023 5:37 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> > Subject: [PATCH i-g-t 6/6] tests/kms_async_flips: Test all modifiers
> > 
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Run the basic async flip test for all modifiers reported by the plane (for the
> > XRGB8888 format). The driver may not support async flip with all modifiers
> > so we allow this to fail.
> 
> Support for adding X-tile and linear for all platforms is being added as sub-test in https://patchwork.freedesktop.org/series/103137/
> 
> > 
> > TODO: probably shuould add an even more basic subtest that
> >       makes sure the driver accepts async flips with a least
> >       one format/modifier combo, if it advertises async flip
> >       support
> > 
> > Cc: Arun R Murthy <arun.r.murthy@intel.com>
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  tests/kms_async_flips.c | 54 +++++++++++++++++++++++++++++++++--------
> >  1 file changed, 44 insertions(+), 10 deletions(-)
> > 
> > diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> > 58740f6ab702..387fcff2f32c 100644
> > --- a/tests/kms_async_flips.c
> > +++ b/tests/kms_async_flips.c
> > @@ -53,6 +53,8 @@ typedef struct {
> >  	igt_output_t *output;
> >  	unsigned long flip_timestamp_us;
> >  	double flip_interval;
> > +	uint64_t modifier;
> > +	igt_plane_t *plane;
> >  	igt_pipe_crc_t *pipe_crc;
> >  	igt_crc_t ref_crc;
> >  	int flip_count;
> > @@ -61,6 +63,7 @@ typedef struct {
> >  	bool extended;
> >  	enum pipe pipe;
> >  	bool alternate_sync_async;
> > +	bool allow_fail;
> >  } data_t;
> > 
> >  static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
> > @@ -133,7 +136,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
> >  	rec_width = width / (ARRAY_SIZE(data->bufs) * 2);
> > 
> >  	igt_create_color_fb(data->drm_fd, width, height,
> > DRM_FORMAT_XRGB8888,
> > -			    default_modifier(data), 0.0, 0.0, 0.5, fb);
> > +			    data->modifier, 0.0, 0.0, 0.5, fb);
> > 
> >  	cr = igt_get_cairo_ctx(data->drm_fd, fb);
> >  	igt_paint_color_rand(cr, rec_width * 2 + rec_width * index, 0,
> > rec_width, height); @@ -159,24 +162,26 @@ static void test_init(data_t
> > *data)
> >  	data->refresh_rate = mode->vrefresh;
> > 
> >  	igt_output_set_pipe(data->output, data->pipe);
> > +
> > +	data->plane = igt_output_get_plane_type(data->output,
> > +DRM_PLANE_TYPE_PRIMARY);
> >  }
> > 
> >  static void test_init_fbs(data_t *data)  {
> >  	int i;
> >  	uint32_t width, height;
> > -	igt_plane_t *plane;
> >  	static uint32_t prev_output_id;
> > +	static uint64_t prev_modifier;
> >  	drmModeModeInfo *mode;
> > 
> >  	mode = igt_output_get_mode(data->output);
> >  	width = mode->hdisplay;
> >  	height = mode->vdisplay;
> > 
> > -	plane = igt_output_get_plane_type(data->output,
> > DRM_PLANE_TYPE_PRIMARY);
> > -
> > -	if (prev_output_id != data->output->id) {
> > +	if (prev_output_id != data->output->id ||
> > +	    prev_modifier != data->modifier) {
> >  		prev_output_id = data->output->id;
> > +		prev_modifier = data->modifier;
> > 
> >  		if (data->bufs[0].fb_id) {
> >  			for (i = 0; i < ARRAY_SIZE(data->bufs); i++) @@ -187,8
> > +192,8 @@ static void test_init_fbs(data_t *data)
> >  			make_fb(data, &data->bufs[i], width, height, i);
> >  	}
> > 
> > -	igt_plane_set_fb(plane, &data->bufs[0]);
> > -	igt_plane_set_size(plane, width, height);
> > +	igt_plane_set_fb(data->plane, &data->bufs[0]);
> > +	igt_plane_set_size(data->plane, width, height);
> > 
> >  	igt_display_commit2(&data->display, data->display.is_atomic ?
> > COMMIT_ATOMIC : COMMIT_LEGACY);  } @@ -243,8 +248,10 @@ static void
> > test_async_flip(data_t *data)
> >  		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> >  				      data->bufs[frame % 4].fb_id,
> >  				      flags, data);
> > -
> > -		igt_assert(ret == 0);
> > +		if (frame == 1 && data->allow_fail)
> > +			igt_skip_on(ret == -EINVAL);
> > +		else
> > +			igt_assert(ret == 0);
> > 
> >  		wait_flip_event(data);
> > 
> > @@ -545,6 +552,9 @@ static void run_test(data_t *data, void (*test)(data_t
> > *))
> >  	for_each_pipe_with_valid_output(&data->display, data->pipe, data-
> > >output) {
> >  		test_init(data);
> > 
> > +		data->allow_fail = false;
> > +		data->modifier = default_modifier(data);
> > +
> >  		igt_dynamic_f("pipe-%s", kmstest_pipe_name(data->pipe)) {
> >  			test_init_fbs(data);
> >  			test(data);
> > @@ -555,6 +565,30 @@ static void run_test(data_t *data, void
> > (*test)(data_t *))
> >  	}
> >  }
> > 
> > +static void run_test_with_modifiers(data_t *data, void (*test)(data_t
> > +*)) {
> > +	for_each_pipe_with_valid_output(&data->display, data->pipe, data-
> > >output) {
> > +		test_init(data);
> > +
> > +		for (int i = 0; i < data->plane->format_mod_count; i++) {
> > +			if (data->plane->formats[i] !=
> > DRM_FORMAT_XRGB8888)
> > +				continue;
> > +
> > +			data->allow_fail = true;
> If the modifier is supported by the platform and there is a failure with a bug in driver/hardware, aren't we falsely reporting here?

There is no way to query what is supported by the hw/driver, so
we just have to try them all and accept that not all may succeed.
As mentioned earlier it would be nice it we have a basic subtest to
confirm that at least one of the modifier/format combos works
when the driver advertises async flip support.

> 
> Thanks and Regards,
> Arun R Murthy
> --------------------
> > +			data->modifier = data->plane->modifiers[i];
> > +
> > +			igt_dynamic_f("pipe-%s-%s",
> > kmstest_pipe_name(data->pipe),
> > +				      igt_fb_modifier_name(data->modifier)) {
> > +				test_init_fbs(data);
> > +				test(data);
> > +			}
> > +		}
> > +
> > +		if (!data->extended)
> > +			break;
> > +	}
> > +}
> > +
> >  static int opt_handler(int opt, int opt_index, void *_data)  {
> >  	data_t *data = _data;
> > @@ -595,7 +629,7 @@ igt_main_args("e", NULL, help_str, opt_handler,
> > &data)
> >  		igt_describe("Wait for page flip events in between successive
> > asynchronous flips");
> >  		igt_subtest_with_dynamic("async-flip-with-page-flip-events")
> > {
> >  			data.alternate_sync_async = false;
> > -			run_test(&data, test_async_flip);
> > +			run_test_with_modifiers(&data, test_async_flip);
> >  		}
> > 
> >  		igt_describe("Alternate between sync and async flips");
> > --
> > 2.39.1
> 

-- 
Ville Syrjälä
Intel
