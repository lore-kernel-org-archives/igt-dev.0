Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563B86E8B0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2020 11:56:56 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Fri, 20 Nov 2020 11:56:54 +0000
Message-ID: <3f285266810a44f29f924a1c6bb15fab@intel.com>
References: <20201120093646.1340401-1-mika.kahola@intel.com>
 <20201120093646.1340401-5-mika.kahola@intel.com>
 <20201120115245.GC1589431@ideak-desk.fi.intel.com>
In-Reply-To: <20201120115245.GC1589431@ideak-desk.fi.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v10 4/4] tests/kms_ccs: CCS Clear Color
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
To: "Deak, Imre" <imre.deak@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Imre Deak <imre.deak@intel.com>
> Sent: Friday, November 20, 2020 1:53 PM
> To: Kahola, Mika <mika.kahola@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t v10 4/4] tests/kms_ccs: CCS Clear Color test
> 
> On Fri, Nov 20, 2020 at 11:36:46AM +0200, Mika Kahola wrote:
> > The patch proposes a method to test CCS with clear color capability.
> >
> > The test paints a solid color on primary fb and a small sprite fb.
> > These are cleared with fast clear feature. A crc is captured and
> > compared against the reference.
> >
> > v2: Modify _gen9_render_copyfunc to support fast clear (Matt)
> >     Enable fast clear bit on 3D sequence (Matt)
> >     Add helper function to figure out clear color modifier (Matt)
> > v3: Remove unrelated line additions/removes
> > v4: Fast clear with color (Imre)
> > v5: Write raw 32-bit color values to register (Imre)
> >     Require 32-bit color format
> > v6: Rebase to use batchbuffer without libdrm dependency
> > v7: Enable clear color (Nanley)
> > v8: Various cleanups (Imre)
> > v9: Splitting patch for smaller hunks (Imre)
> > v10: Remove switch from CCS CC modifier check (Imre)
> >      Color map conversion (Imre)
> >      Separate function to check CCS CC plane (Imre)
> >      Removed left-over comment (Imre)
> >      Replace inte_bb_reset() with intel_bb_sync() and
> >      intel_bb_destroy() when cleaning up (Imre)
> >      Fix logic to test CCS clear color only with
> >      XRGB8888 format (Imre)
> >      Move fast clear to it's own function (Imre)
> >
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> > ---
> >  tests/kms_ccs.c | 75
> > +++++++++++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 69 insertions(+), 6 deletions(-)
> >
> > diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c index
> > 53abecce..8c2d7b3d 100644
> > --- a/tests/kms_ccs.c
> > +++ b/tests/kms_ccs.c
> > @@ -120,6 +120,11 @@ static void addfb_init(struct igt_fb *fb, struct
> drm_mode_fb_cmd2 *f)
> >  	}
> >  }
> >
> > +static bool is_ccs_cc_modifier(uint64_t modifier) {
> > +	return modifier ==
> LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC;
> > +}
> > +
> >  /*
> >   * The CCS planes of compressed framebuffers contain non-zero bytes if
> the
> >   * engine compressed effectively the framebuffer. The actual encoding
> > of these @@ -155,7 +160,36 @@ static void check_ccs_plane(int drm_fd,
> igt_fb_t *fb, int plane)
> >  		     plane, igt_fb_ccs_to_main_plane(fb, plane));  }
> >
> > -static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb)
> > +static void check_ccs_cc_plane(int drm_fd, igt_fb_t *fb, int plane,
> > +const float *cc_color) {
> > +	union cc {
> > +		float f;
> > +		uint32_t d;
> > +	} *cc_p;
> > +	void *map;
> > +	uint32_t native_color;
> > +
> > +	gem_set_domain(drm_fd, fb->gem_handle,
> I915_GEM_DOMAIN_CPU, 0);
> > +
> > +	map = gem_mmap__cpu(drm_fd, fb->gem_handle, 0, fb->size,
> PROT_READ);
> > +	cc_p = map + fb->offsets[plane];
> > +
> > +	igt_assert(cc_color[0] == cc_p[0].f &&
> > +		   cc_color[1] == cc_p[1].f &&
> > +		   cc_color[2] == cc_p[2].f &&
> > +		   cc_color[3] == cc_p[3].f);
> > +
> > +	native_color = (uint8_t)(cc_color[3] * 0xff) << 24 |
> > +		       (uint8_t)(cc_color[0] * 0xff) << 16 |
> > +		       (uint8_t)(cc_color[1] * 0xff) << 8 |
> > +		       (uint8_t)(cc_color[2] * 0xff);
> > +
> > +	igt_assert(native_color == cc_p[4].d);
> > +
> > +	munmap(map, fb->size);
> > +};
> > +
> > +static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb, const
> > +float *cc_color)
> >  {
> >  	int i;
> >
> > @@ -163,6 +197,8 @@ static void check_all_ccs_planes(int drm_fd,
> igt_fb_t *fb)
> >  		if (igt_fb_is_ccs_plane(fb, i) &&
> >  		    !igt_fb_is_gen12_ccs_cc_plane(fb, i))
> >  			check_ccs_plane(drm_fd, fb, i);
> > +		else if (igt_fb_is_gen12_ccs_cc_plane(fb, i))
> > +			check_ccs_cc_plane(drm_fd, fb, i, cc_color);
> >  	}
> >  }
> >
> > @@ -176,6 +212,24 @@ static int get_ccs_plane_index(uint32_t format)
> >  	return index;
> >  }
> >
> > +static void fast_clear_fb(int drm_fd, struct igt_fb *fb, const float
> > +*cc_color) {
> > +	igt_render_clearfunc_t fast_clear =
> igt_get_render_clearfunc(intel_get_drm_devid(drm_fd));
> > +	struct intel_bb *ibb = intel_bb_create(drm_fd, 4096);
> > +	struct buf_ops *bops = buf_ops_create(drm_fd);
> > +	struct intel_buf *dst = igt_fb_create_intel_buf(drm_fd, bops, fb,
> > +"fast clear dst");
> > +
> > +	gem_set_domain(drm_fd, fb->gem_handle,
> > +		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> > +
> > +	fast_clear(ibb, dst, 0, 0, fb->width, fb->height, cc_color);
> > +
> > +	intel_bb_sync(ibb);
> > +	intel_bb_destroy(ibb);
> > +	intel_buf_destroy(dst);
> > +	buf_ops_destroy(bops);
> > +}
> > +
> >  static void generate_fb(data_t *data, struct igt_fb *fb,
> >  			int width, int height,
> >  			enum test_fb_flags fb_flags)
> > @@ -186,6 +240,7 @@ static void generate_fb(data_t *data, struct igt_fb
> *fb,
> >  	cairo_t *cr;
> >  	int index;
> >  	int ret;
> > +	const float cc_color[4] = {colors[0].r, colors[0].g, colors[0].b,
> > +1.0};
> 
> this needs to match the reference FB color, which is different in the sprite
> subtests: colors[!!data->plane]
> 
> >
> >  	/* Use either compressed or Y-tiled to test. However, given the lack
> of
> >  	 * available bandwidth, we use linear for the primary plane when
> @@
> > -246,10 +301,14 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
> >  	if (!(data->flags & TEST_BAD_PIXEL_FORMAT)) {
> >  		int c = !!data->plane;
> >
> > -		cr = igt_get_cairo_ctx(data->drm_fd, fb);
> > -		igt_paint_color(cr, 0, 0, width, height,
> > -				colors[c].r, colors[c].g, colors[c].b);
> > -		igt_put_cairo_ctx(cr);
> > +		if (is_ccs_cc_modifier(modifier)) {
> > +			fast_clear_fb(data->drm_fd, fb, cc_color);
> > +		} else {
> > +			cr = igt_get_cairo_ctx(data->drm_fd, fb);
> > +			igt_paint_color(cr, 0, 0, width, height,
> > +					colors[c].r, colors[c].g, colors[c].b);
> > +					igt_put_cairo_ctx(cr);
> > +		}
> >  	}
> >
> >  	ret = drmIoctl(data->drm_fd, LOCAL_DRM_IOCTL_MODE_ADDFB2,
> &f); @@
> > -261,7 +320,7 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
> >  		igt_assert_eq(ret, 0);
> >
> >  	if (check_ccs_planes)
> > -		check_all_ccs_planes(data->drm_fd, fb);
> > +		check_all_ccs_planes(data->drm_fd, fb, cc_color);
> >
> >  	fb->fb_id = f.fb_id;
> >  }
> > @@ -349,6 +408,10 @@ static bool try_config(data_t *data, enum
> test_fb_flags fb_flags,
> >  	if (data->flags & TEST_BAD_ROTATION_90)
> >  		igt_plane_set_rotation(primary, IGT_ROTATION_90);
> >
> > +	if (is_ccs_cc_modifier(data->ccs_modifier)
> > +	   && data->format != DRM_FORMAT_XRGB8888)
> > +		return false;
> 
> this should be checked early after igt_plane_has_format_mod() to avoid the
> overhead up to this point. Also codying style is && at the end of line.
> 
> With the above fixed, looks ok:
> Reviewed-by: Imre Deak <imre.deak@intel.com>

Thanks for the review! I will fix those two points.

Cheers,
Mika
> 
> > +
> >  	ret = igt_display_try_commit2(display, commit);
> >  	if (data->flags & TEST_BAD_ROTATION_90) {
> >  		igt_assert_eq(ret, -EINVAL);
> > --
> > 2.25.1
> >
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
