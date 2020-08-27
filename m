Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55ECD6E427
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2020 07:44:24 +0000 (UTC)
Date: Thu, 27 Aug 2020 09:46:43 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200827064643.GM7444@platvala-desk.ger.corp.intel.com>
References: <20200818192054.975370-1-lyude@redhat.com>
 <20200825210440.GA383909@dev.jcline.org>
 <f78e8d9c714e2ff2a17396b171817e2dc2ff1ef8.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f78e8d9c714e2ff2a17396b171817e2dc2ff1ef8.camel@redhat.com>
Subject: Re: [igt-dev] [i-g-t,
 v2] tests/kms_plane: Generate reference CRCs for partial coverage
 too
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
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 26, 2020 at 12:04:44PM -0400, Lyude Paul wrote:
> On Tue, 2020-08-25 at 17:04 -0400, Jeremy Cline wrote:
> > On Tue, Aug 18, 2020 at 03:20:54PM -0400, Lyude wrote:
> > > From: Lyude Paul <lyude@redhat.com>
> > > 
> > > There's been a TODO sitting in the kms_plane test suite for a while now
> > > as a placeholder for actually generating a reference CRC for
> > > plane-position-hole tests. This means we have never actually been
> > > verifying whether or not partially covering our hole with a hardware
> > > plane works displays properly, and have just simply been checking that
> > > the frame CRC doesn't change when we're not changing the display output.
> > > On nouveau at least, this has been causing us to pass these tests
> > > even when we don't correctly program our hardware plane's framebuffer.
> > > 
> > > So, get rid of that TODO and implement this by converting
> > > convert_fb_for_mode__position() to a generic convert_fb_for_mode()
> > > function that allows us to create a colored FB, either with or without a
> > > series of 64x64 rectangles, and use that in test_grab_crc() to generate
> > > reference CRCs for the plane-position-hole tests. Additionally, we move
> > > around all of the test flags into a single enumerator, and make sure
> > > none of them have overlapping bits so we can correctly tell from
> > > test_grab_crc() whether or not our reference CRC should include
> > > rectangles (otherwise, we'll accidentally add rectangles in our
> > > reference frame for the plane panning tests).
> > > 
> > > Then, we finally flip the TEST_POSITION_FULLY_COVERED enum to
> > > TEST_POSITION_PARTIALLY_COVERED, so tests which don't explicitly specify
> > > partial positioning don't get it in their reference fbs.
> > > 
> > > v2:
> > > * Rebase
> > > 
> > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > ---
> > >  tests/kms_plane.c | 164 +++++++++++++++++++++++++---------------------
> > >  1 file changed, 91 insertions(+), 73 deletions(-)
> > > 
> > > diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> > > index 430210d8..1b5e7fe9 100644
> > > --- a/tests/kms_plane.c
> > > +++ b/tests/kms_plane.c
> > > @@ -44,6 +44,11 @@ typedef struct {
> > >  	float blue;
> > >  } color_t;
> > >  
> > > +typedef struct {
> > > +	int x, y;
> > > +	color_t color;
> > > +} rectangle_t;
> > > +
> > >  typedef struct {
> > >  	int drm_fd;
> > >  	igt_display_t display;
> > > @@ -71,9 +76,52 @@ static void test_fini(data_t *data)
> > >  	igt_pipe_crc_free(data->pipe_crc);
> > >  }
> > >  
> > > +enum {
> > > +	TEST_POSITION_PARTIALLY_COVERED = 1 << 0,
> > > +	TEST_DPMS                       = 1 << 1,
> > > +	TEST_PANNING_TOP_LEFT           = 1 << 2,
> > > +	TEST_PANNING_BOTTOM_RIGHT       = 1 << 3,
> > > +	TEST_SUSPEND_RESUME             = 1 << 4,
> > > +};
> > > +
> > > +/*
> > > + * create a colored fb, possibly with a series of 64x64 colored rectangles
> > > (used
> > > + * for position tests)
> > > + */
> > > +static void
> > > +create_fb_for_mode(data_t *data, drmModeModeInfo *mode,
> > > +		   color_t *fb_color,
> > > +		   const rectangle_t *rects, int rect_cnt,
> > > +		   struct igt_fb *fb /* out */)
> > > +{
> > 
> > It looks like data is only ever used to access the data->drm_fd. It's
> > real nit-picky, but it might be nice to accept the fd to line up the API
> > with igt_create_fb() and friends for the sake of familiarity and
> > consistency. The others also return the fb_id or possible error code,
> > although it does seem to be ignored by callers so...
> > 
> > After more reviewing I notice this was the prior API so I'd consider
> > this comment even more nit-picky.
> > 
> > > +	unsigned int fb_id;
> > > +	cairo_t *cr;
> > > +
> > > +	fb_id = igt_create_fb(data->drm_fd,
> > > +			      mode->hdisplay, mode->vdisplay,
> > > +			      DRM_FORMAT_XRGB8888,
> > > +			      LOCAL_DRM_FORMAT_MOD_NONE,
> > > +			      fb);
> > > +	igt_assert_fd(fb_id);
> > > +
> > > +	cr = igt_get_cairo_ctx(data->drm_fd, fb);
> > > +	igt_paint_color(cr, 0, 0, mode->hdisplay, mode->vdisplay,
> > > +			fb_color->red, fb_color->green, fb_color->blue);
> > > +	for (int i = 0; i < rect_cnt; i++) {
> > > +		const rectangle_t *rect = &rects[i];
> > > +		igt_paint_color(cr,
> > > +				rect->x, rect->y, 64, 64,
> > > +				rect->color.red,
> > > +				rect->color.green,
> > > +				rect->color.blue);
> > > +	}
> > > +
> > > +	igt_put_cairo_ctx(cr);
> > > +}
> > > +
> > >  static void
> > >  test_grab_crc(data_t *data, igt_output_t *output, enum pipe pipe,
> > > -	      color_t *fb_color, igt_crc_t *crc /* out */)
> > > +	      color_t *fb_color, unsigned int flags, igt_crc_t *crc /* out */)
> > >  {
> > >  	struct igt_fb fb;
> > >  	drmModeModeInfo *mode;
> > > @@ -86,13 +134,19 @@ test_grab_crc(data_t *data, igt_output_t *output, enum
> > > pipe pipe,
> > >  	primary = igt_output_get_plane(output, 0);
> > >  
> > >  	mode = igt_output_get_mode(output);
> > > -	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> > > -			    DRM_FORMAT_XRGB8888,
> > > -			    LOCAL_DRM_FORMAT_MOD_NONE,
> > > -			    fb_color->red, fb_color->green, fb_color->blue,
> > > -			    &fb);
> > > -	igt_plane_set_fb(primary, &fb);
> > > +	if (flags & TEST_POSITION_PARTIALLY_COVERED) {
> > > +		static const rectangle_t rects[] = {
> > > +			{ .x = 100, .y = 100, .color = { 0.0, 0.0, 0.0 }},
> > > +			{ .x = 132, .y = 132, .color = { 0.0, 1.0, 0.0 }},
> > > +		};
> > > +
> > > +		create_fb_for_mode(data, mode, fb_color,
> > > +				   rects, ARRAY_SIZE(rects), &fb);
> > > +	} else {
> > > +		create_fb_for_mode(data, mode, fb_color, NULL, 0, &fb);
> > 
> > If I understand correctly, this is equivalent to a call to
> > igt_create_color_fb(). If that is indeed the case, it might be clearer
> > to just call that here.
> > 
> > > +	}
> > >  
> > > +	igt_plane_set_fb(primary, &fb);
> > >  	ret = igt_display_try_commit2(&data->display, COMMIT_LEGACY);
> > >  	igt_skip_on(ret != 0);
> > >  
> > > @@ -104,19 +158,24 @@ test_grab_crc(data_t *data, igt_output_t *output, enum
> > > pipe pipe,
> > >  	igt_remove_fb(data->drm_fd, &fb);
> > >  
> > >  	crc_str = igt_crc_to_string(crc);
> > > -	igt_debug("CRC for a (%.02f,%.02f,%.02f) fb: %s\n", fb_color->red,
> > > -		  fb_color->green, fb_color->blue, crc_str);
> > > +	igt_debug("CRC for a %s covered (%.02f,%.02f,%.02f) fb: %s\n",
> > > +		  flags & TEST_POSITION_PARTIALLY_COVERED ? "partially" :
> > > "fully",
> > > +		  fb_color->red, fb_color->green, fb_color->blue,
> > > +		  crc_str);
> > >  	free(crc_str);
> > >  }
> > >  
> > >  /*
> > >   * Plane position test.
> > > - *   - We start by grabbing a reference CRC of a full green fb being
> > > scanned
> > > - *     out on the primary plane
> > > + *   - For testing positions that fully cover our hole, we start by
> > > grabbing a
> > > + *     reference CRC of a full green fb being scanned out on the primary
> > > plane.
> > > + *     For testing positions that only partially cover our hole, we instead
> > > use
> > > + *     a full green fb with a partially covered black rectangle.
> > >   *   - Then we scannout 2 planes:
> > >   *      - the primary plane uses a green fb with a black rectangle
> > >   *      - a plane, on top of the primary plane, with a green fb that is
> > > set-up
> > > - *        to cover the black rectangle of the primary plane fb
> > > + *        to fully or partially cover the black rectangle of the primary
> > > plane
> > > + *        fb
> > >   *     The resulting CRC should be identical to the reference CRC
> > >   */
> > >  
> > > @@ -125,38 +184,6 @@ typedef struct {
> > >  	igt_crc_t reference_crc;
> > >  } test_position_t;
> > >  
> > > -/*
> > > - * create a green fb with a black rectangle at (rect_x,rect_y) and of size
> > > - * (rect_w,rect_h)
> > > - */
> > > -static void
> > > -create_fb_for_mode__position(data_t *data, drmModeModeInfo *mode,
> > > -			     double rect_x, double rect_y,
> > > -			     double rect_w, double rect_h,
> > > -			     struct igt_fb *fb /* out */)
> > > -{
> > > -	unsigned int fb_id;
> > > -	cairo_t *cr;
> > > -
> > > -	fb_id = igt_create_fb(data->drm_fd,
> > > -				  mode->hdisplay, mode->vdisplay,
> > > -				  DRM_FORMAT_XRGB8888,
> > > -				  LOCAL_DRM_FORMAT_MOD_NONE,
> > > -				  fb);
> > > -	igt_assert(fb_id);
> > > -
> > > -	cr = igt_get_cairo_ctx(data->drm_fd, fb);
> > > -	igt_paint_color(cr, 0, 0, mode->hdisplay, mode->vdisplay,
> > > -			    0.0, 1.0, 0.0);
> > > -	igt_paint_color(cr, rect_x, rect_y, rect_w, rect_h, 0.0, 0.0, 0.0);
> > > -	igt_put_cairo_ctx(cr);
> > > -}
> > > -
> > > -enum {
> > > -	TEST_POSITION_FULLY_COVERED = 1 << 0,
> > > -	TEST_DPMS = 1 << 1,
> > > -};
> > > -
> > >  static void
> > >  test_plane_position_with_output(data_t *data,
> > >  				enum pipe pipe,
> > > @@ -165,6 +192,7 @@ test_plane_position_with_output(data_t *data,
> > >  				igt_crc_t *reference_crc,
> > >  				unsigned int flags)
> > >  {
> > > +	rectangle_t rect = { .x = 100, .y = 100, .color = { 0.0, 0.0, 0.0 }};
> > >  	igt_plane_t *primary, *sprite;
> > >  	struct igt_fb primary_fb, sprite_fb;
> > >  	drmModeModeInfo *mode;
> > > @@ -179,26 +207,26 @@ test_plane_position_with_output(data_t *data,
> > >  	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> > >  	sprite = igt_output_get_plane(output, plane);
> > >  
> > > -	create_fb_for_mode__position(data, mode, 100, 100, 64, 64,
> > > -				     &primary_fb);
> > > +	create_fb_for_mode(data, mode, &green, &rect, 1, &primary_fb);
> > >  	igt_plane_set_fb(primary, &primary_fb);
> > >  
> > >  	igt_create_color_fb(data->drm_fd,
> > > -				64, 64, /* width, height */
> > > -				DRM_FORMAT_XRGB8888,
> > > -				LOCAL_DRM_FORMAT_MOD_NONE,
> > > -				0.0, 1.0, 0.0,
> > > -				&sprite_fb);
> > > +			    64, 64, /* width, height */
> > > +			    DRM_FORMAT_XRGB8888,
> > > +			    LOCAL_DRM_FORMAT_MOD_NONE,
> > > +			    0.0, 1.0, 0.0,
> > > +			    &sprite_fb);
> > 
> > I'd include any whitespace-only changes separately, but don't know what
> > the project's preferences are there.
> 
> FWIW - I think it's usually fine as long as you're already modifying the code
> around the changes for not-whitespace related reasons, we're not usually as
> strict about this sort of thing with igt as the linux kernel is


Correct.

-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
