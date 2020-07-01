Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AAB6E95C
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jul 2020 16:40:46 +0000 (UTC)
Date: Wed, 1 Jul 2020 12:40:34 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20200701164034.5iyx47vsv6yvmacj@outlook.office365.com>
References: <20200625103857.uwqycap3iy6yd6hk@smtp.gmail.com>
In-Reply-To: <20200625103857.uwqycap3iy6yd6hk@smtp.gmail.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC PATCH i-g-t] lib/igt_fb: remove extra parameters
 from igt_put_caito_ctx
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0891972891=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Melissa Wen <melissa.srw@gmail.com>
Cc: Petri Latvala <petri.latvala@intel.com>, kernel-usp@googlegroups.com, igt-dev@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, twoerner@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

--===============0891972891==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c4qwgbytpsdsc5cn"
Content-Disposition: inline

--c4qwgbytpsdsc5cn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Melissa,

Nice catch in this RFC :)

Everything looks good to me. I also noticed that the CI [1] did not find
any issue in this RFC which makes me confident that this change is
harmless.

Could you change the commit message, and resend it as a normal patch?

1. https://patchwork.freedesktop.org/series/78815/

On 06/25, Melissa Wen wrote:
> The function igt_put_caito_ctx has three parameters, but it looks like on=
ly
> one of them is actually used. If I'm not wrong about the unnecessary
> parameters, removing them makes the function more readable and simpler to
> understand. Since the function is used in many tests, this change is a li=
ttle
> noisy.
>=20
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> ---
>  lib/igt_fb.c                      | 18 ++++++++----------
>  lib/igt_fb.h                      |  2 +-
>  tests/amdgpu/amd_color.c          |  4 ++--
>  tests/i915/i915_pm_dc.c           |  2 +-
>  tests/kms_atomic.c                |  6 +++---
>  tests/kms_available_modes_crc.c   |  4 ++--
>  tests/kms_ccs.c                   |  2 +-
>  tests/kms_color_helper.c          |  4 ++--
>  tests/kms_concurrent.c            |  2 +-
>  tests/kms_crtc_background_color.c |  2 +-
>  tests/kms_cursor_crc.c            | 22 ++++++++++------------
>  tests/kms_cursor_edge_walk.c      |  2 +-
>  tests/kms_flip.c                  |  2 +-
>  tests/kms_hdr.c                   |  2 +-
>  tests/kms_mmap_write_crc.c        |  4 ++--
>  tests/kms_plane.c                 |  8 ++++----
>  tests/kms_plane_alpha_blend.c     | 10 +++++-----
>  tests/kms_plane_cursor.c          |  4 ++--
>  tests/kms_plane_lowres.c          |  2 +-
>  tests/kms_plane_multiple.c        |  2 +-
>  tests/kms_psr.c                   |  2 +-
>  tests/kms_psr2_su.c               |  4 ++--
>  tests/kms_rotation_crc.c          |  2 +-
>  tests/kms_setmode.c               |  2 +-
>  tests/kms_vrr.c                   |  2 +-
>  tests/testdisplay.c               |  4 ++--
>  26 files changed, 58 insertions(+), 62 deletions(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 5ed586e7..fd33907b 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -1697,7 +1697,7 @@ unsigned int igt_create_color_fb(int fd, int width,=
 int height,
> =20
>  	cr =3D igt_get_cairo_ctx(fd, fb);
>  	igt_paint_color(cr, 0, 0, width, height, r, g, b);
> -	igt_put_cairo_ctx(fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	return fb_id;
>  }
> @@ -1734,7 +1734,7 @@ unsigned int igt_create_pattern_fb(int fd, int widt=
h, int height,
> =20
>  	cr =3D igt_get_cairo_ctx(fd, fb);
>  	igt_paint_test_pattern(cr, width, height);
> -	igt_put_cairo_ctx(fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	return fb_id;
>  }
> @@ -1777,7 +1777,7 @@ unsigned int igt_create_color_pattern_fb(int fd, in=
t width, int height,
>  	cr =3D igt_get_cairo_ctx(fd, fb);
>  	igt_paint_color(cr, 0, 0, width, height, r, g, b);
>  	igt_paint_test_pattern(cr, width, height);
> -	igt_put_cairo_ctx(fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	return fb_id;
>  }
> @@ -1820,7 +1820,7 @@ unsigned int igt_create_image_fb(int fd, int width,=
 int height,
> =20
>  	cr =3D igt_get_cairo_ctx(fd, fb);
>  	igt_paint_image(cr, filename, 0, 0, width, height);
> -	igt_put_cairo_ctx(fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	return fb_id;
>  }
> @@ -1920,7 +1920,7 @@ unsigned int igt_create_stereo_fb(int drm_fd, drmMo=
deModeInfo *mode,
>  			layout.right.x, layout.right.y,
>  			layout.right.width, layout.right.height);
> =20
> -	igt_put_cairo_ctx(drm_fd, &fb, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	return fb_id;
>  }
> @@ -3578,15 +3578,13 @@ cairo_t *igt_get_cairo_ctx(int fd, struct igt_fb =
*fb)
> =20
>  /**
>   * igt_put_cairo_ctx:
> - * @fd: open i915 drm file descriptor
> - * @fb: pointer to an #igt_fb structure
>   * @cr: the cairo context returned by igt_get_cairo_ctx.
>   *
>   * This releases the cairo surface @cr returned by igt_get_cairo_ctx()
> - * for @fb, and writes the changes out to the framebuffer if cairo doesn=
't
> + * for fb, and writes the changes out to the framebuffer if cairo doesn't
>   * have native support for the format.
>   */
> -void igt_put_cairo_ctx(int fd, struct igt_fb *fb, cairo_t *cr)
> +void igt_put_cairo_ctx(cairo_t *cr)
>  {
>  	cairo_status_t ret =3D cairo_status(cr);
>  	igt_assert_f(ret =3D=3D CAIRO_STATUS_SUCCESS, "Cairo failed to draw wit=
h %s\n", cairo_status_to_string(ret));
> @@ -3657,7 +3655,7 @@ unsigned int igt_fb_convert_with_stride(struct igt_=
fb *dst, struct igt_fb *src,
>  	cr =3D igt_get_cairo_ctx(dst->fd, dst);
>  	cairo_set_source_surface(cr, surf, 0, 0);
>  	cairo_paint(cr);
> -	igt_put_cairo_ctx(dst->fd, dst, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	cairo_surface_destroy(surf);
> =20
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index 587f7a44..5ec906b7 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -178,7 +178,7 @@ int igt_fb_ccs_to_main_plane(const struct igt_fb *fb,=
 int ccs_plane);
>  cairo_surface_t *igt_get_cairo_surface(int fd, struct igt_fb *fb);
>  cairo_surface_t *igt_cairo_image_surface_create_from_png(const char *fil=
ename);
>  cairo_t *igt_get_cairo_ctx(int fd, struct igt_fb *fb);
> -void igt_put_cairo_ctx(int fd, struct igt_fb *fb, cairo_t *cr);
> +void igt_put_cairo_ctx(cairo_t *cr);
>  void igt_paint_color(cairo_t *cr, int x, int y, int w, int h,
>  			 double r, double g, double b);
>  void igt_paint_color_alpha(cairo_t *cr, int x, int y, int w, int h,
> diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
> index 0bbee43d..6d313bae 100644
> --- a/tests/amdgpu/amd_color.c
> +++ b/tests/amdgpu/amd_color.c
> @@ -134,7 +134,7 @@ static void draw_color(igt_fb_t *fb, double r, double=
 g, double b)
> =20
>  	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
>  	igt_paint_color(cr, 0, 0, fb->width, fb->height, r, g, b);
> -	igt_put_cairo_ctx(fb->fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  /* Generates the gamma test pattern. */
> @@ -148,7 +148,7 @@ static void draw_gamma_test(igt_fb_t *fb)
>  	igt_paint_color_gradient(cr, 0, gh * 2, fb->width, gh, 0, 1, 0);
>  	igt_paint_color_gradient(cr, 0, gh * 3, fb->width, gh, 0, 0, 1);
> =20
> -	igt_put_cairo_ctx(fb->fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  /* Sets the degamma LUT. */
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index 3a302729..84bcf568 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -131,7 +131,7 @@ static void paint_rectangles(data_t *data,
>  				colors[i - 1].r, colors[i - 1].g,
>  				colors[i - 1].b);
> =20
> -	igt_put_cairo_ctx(data->drm_fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  static void setup_primary(data_t *data)
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index f672f554..fa6190c9 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -309,7 +309,7 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, =
igt_output_t *output,
>  			      w_overlay / 2, h_overlay / 2,
>  			      0.0, 0.0, 0.0, 0.0);
>  	cairo_set_operator(cr, CAIRO_OPERATOR_OVER);
> -	igt_put_cairo_ctx(pipe->display->drm_fd, &fb_overlay, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	igt_plane_set_fb(primary, &fb_primary);
>  	igt_plane_set_fb(overlay, &fb_overlay);
> @@ -343,7 +343,7 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, =
igt_output_t *output,
>  			      w_overlay, h_overlay,
>  			      0.0, 0.0, 0.0, 0.5);
>  	cairo_set_operator(cr, CAIRO_OPERATOR_OVER);
> -	igt_put_cairo_ctx(pipe->display->drm_fd, &fb_primary, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	igt_info("Committing with a hole in the primary through "\
>  		 "which the underlay should be seen\n");
> @@ -398,7 +398,7 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe=
_t *pipe,
>  	igt_assert(cairo_status(cr) =3D=3D 0);
>  	igt_paint_color(cr, 0, 0, w_lower, h_lower, 0.0, 0.0, 1.0);
>  	igt_paint_color(cr, w_upper / 2, h_upper / 2, w_upper, h_upper, 1.0, 1.=
0, 0.0);
> -	igt_put_cairo_ctx(display->drm_fd, &fb_ref, cr);
> +	igt_put_cairo_ctx(cr);
>  	igt_plane_set_fb(primary, &fb_ref);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
> =20
> diff --git a/tests/kms_available_modes_crc.c b/tests/kms_available_modes_=
crc.c
> index ed43d1fb..23d035f7 100644
> --- a/tests/kms_available_modes_crc.c
> +++ b/tests/kms_available_modes_crc.c
> @@ -96,7 +96,7 @@ static void generate_comparison_crc_list(data_t *data, =
igt_output_t *output)
>  			    0.0, 0.0, 0.0);
>  	igt_paint_color(cr, 0, 0, w, h, 1.0, 1.0, 1.0);
>  	igt_assert(cairo_status(cr) =3D=3D 0);
> -	igt_put_cairo_ctx(data->gfx_fd, &data->primary_fb, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, &data->primary_fb);
> @@ -108,7 +108,7 @@ static void generate_comparison_crc_list(data_t *data=
, igt_output_t *output)
> =20
>  	cr =3D igt_get_cairo_ctx(data->gfx_fd, &data->primary_fb);
>  	igt_paint_color(cr, 0, 0, mode->hdisplay, mode->vdisplay, 1.0, 1.0, 1.0=
);
> -	igt_put_cairo_ctx(data->gfx_fd, &data->primary_fb, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	igt_plane_set_fb(primary, &data->primary_fb);
>  	igt_display_commit2(&data->display, data->commit);
> diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> index bc34aec5..b60e4908 100644
> --- a/tests/kms_ccs.c
> +++ b/tests/kms_ccs.c
> @@ -246,7 +246,7 @@ static void generate_fb(data_t *data, struct igt_fb *=
fb,
>  		cr =3D igt_get_cairo_ctx(data->drm_fd, fb);
>  		igt_paint_color(cr, 0, 0, width, height,
>  				colors[c].r, colors[c].g, colors[c].b);
> -		igt_put_cairo_ctx(data->drm_fd, fb, cr);
> +		igt_put_cairo_ctx(cr);
>  	}
> =20
>  	ret =3D drmIoctl(data->drm_fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f);
> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
> index 9cb740f2..2605146a 100644
> --- a/tests/kms_color_helper.c
> +++ b/tests/kms_color_helper.c
> @@ -57,7 +57,7 @@ void paint_gradient_rectangles(data_t *data,
>  					       colors[i-1].g,
>  					       colors[i-1].b);
> =20
> -	igt_put_cairo_ctx(data->drm_fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  void paint_rectangles(data_t *data,
> @@ -79,7 +79,7 @@ void paint_rectangles(data_t *data,
>  		igt_paint_color(cr, i * l, 0, rows_remaining, mode->vdisplay,
>  				colors[i-1].r, colors[i-1].g, colors[i-1].b);
> =20
> -	igt_put_cairo_ctx(data->drm_fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  gamma_lut_t *alloc_lut(int lut_size)
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 89016563..9a4dab24 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -126,7 +126,7 @@ create_fb_for_mode_position(data_t *data, drmModeMode=
Info *mode,
>  				rect_w[i], rect_h[i], 0.0, 0.0, 0.0);
>  	}
> =20
> -	igt_put_cairo_ctx(data->drm_fd, &data->fb[primary->index], cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  static void
> diff --git a/tests/kms_crtc_background_color.c b/tests/kms_crtc_backgroun=
d_color.c
> index aca7ac3e..b4141b0d 100644
> --- a/tests/kms_crtc_background_color.c
> +++ b/tests/kms_crtc_background_color.c
> @@ -69,7 +69,7 @@ paint_background(data_t *data, struct igt_fb *fb, drmMo=
deModeInfo *mode,
>  	b =3D (double) ((background & 0xFF0000) >> 16) / 255.0;
>  	igt_paint_color_alpha(cr, 0, 0, w, h, r, g, b, alpha);
> =20
> -	igt_put_cairo_ctx(data->gfx_fd, &data->fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe p=
ipe,
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index f105e295..7e6b24cc 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -167,8 +167,7 @@ static void restore_image(data_t *data)
>  		cairo_set_source_surface(cr, data->surface, 0, 0);
>  		cairo_rectangle(cr, 0, 0, data->screenw, data->screenh);
>  		cairo_fill(cr);
> -		igt_put_cairo_ctx(data->drm_fd,
> -				  &data->primary_fb[FRONTBUFFER], cr);
> +		igt_put_cairo_ctx(cr);
>  	}
>  	igt_dirty_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
>  }
> @@ -235,7 +234,7 @@ static void do_single_test(data_t *data, int x, int y)
>  	/* Now render the same in software and collect crc */
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
>  	draw_cursor(cr, x, y, data->curw, data->curh, 1.0);
> -	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER], cr);
> +	igt_put_cairo_ctx(cr);
>  	igt_display_commit(display);
>  	igt_dirty_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
>  	/* Extra vblank wait is because nonblocking cursor ioctl */
> @@ -451,8 +450,7 @@ static void prepare_crtc(data_t *data, igt_output_t *=
output,
>  		                       &data->primary_fb[RESTOREBUFFER]);
>  		cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
>  		igt_paint_test_pattern(cr, data->screenw, data->screenh);
> -		igt_put_cairo_ctx(data->drm_fd,
> -				  &data->primary_fb[RESTOREBUFFER], cr);
> +		igt_put_cairo_ctx(cr);
> =20
>  		data->drmibo[FRONTBUFFER] =3D gem_handle_to_libdrm_bo(data->bufmgr,
>  								    data->drm_fd,
> @@ -493,7 +491,7 @@ static void test_cursor_alpha(data_t *data, double a)
>  	igt_assert(fb_id);
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb);
>  	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
> -	igt_put_cairo_ctx(data->drm_fd, &data->fb, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	/*Hardware Test*/
>  	cursor_enable(data);
> @@ -506,7 +504,7 @@ static void test_cursor_alpha(data_t *data, double a)
>  	/*Software Test*/
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
>  	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
> -	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER], cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	igt_display_commit(display);
>  	igt_wait_for_vblank(data->drm_fd, data->pipe);
> @@ -517,7 +515,7 @@ static void test_cursor_alpha(data_t *data, double a)
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
>  	igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
>  			0.0, 0.0, 0.0);
> -	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER], cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  static void test_cursor_transparent(data_t *data)
> @@ -559,7 +557,7 @@ static void create_cursor_fb(data_t *data, int cur_w,=
 int cur_h)
> =20
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb);
>  	draw_cursor(cr, 0, 0, cur_w, cur_h, 1.0);
> -	igt_put_cairo_ctx(data->drm_fd, &data->fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  static bool has_nonsquare_cursors(data_t *data)
> @@ -605,7 +603,7 @@ static void test_cursor_size(data_t *data)
>  	/* Use a solid white rectangle as the cursor */
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb);
>  	igt_paint_color_alpha(cr, 0, 0, cursor_max_size, cursor_max_size, 1.0, =
1.0, 1.0, 1.0);
> -	igt_put_cairo_ctx(data->drm_fd, &data->fb, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	/* Hardware test loop */
>  	cursor_enable(data);
> @@ -625,7 +623,7 @@ static void test_cursor_size(data_t *data)
>  		/* Now render the same in software and collect crc */
>  		cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
>  		igt_paint_color_alpha(cr, 0, 0, size, size, 1.0, 1.0, 1.0, 1.0);
> -		igt_put_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER], cr);
> +		igt_put_cairo_ctx(cr);
> =20
>  		igt_display_commit(display);
>  		igt_wait_for_vblank(data->drm_fd, data->pipe);
> @@ -634,7 +632,7 @@ static void test_cursor_size(data_t *data)
>  		cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
>  		igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
>  				0.0, 0.0, 0.0);
> -		igt_put_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER], cr);
> +		igt_put_cairo_ctx(cr);
>  		igt_assert_crc_equal(&crc[i], &ref_crc);
>  	}
>  }
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index 6feb32a8..96a78792 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -78,7 +78,7 @@ static void create_cursor_fb(data_t *data, int cur_w, i=
nt cur_h)
>  	else
>  		igt_paint_color_alpha(cr, 0, 0, data->fb.width, data->fb.height,
>  				      0.0, 0.0, 0.0, 0.0);
> -	igt_put_cairo_ctx(data->drm_fd, &data->fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  static void cursor_move(data_t *data, int x, int y, int i)
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index b7b42f85..adf72740 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -973,7 +973,7 @@ static void paint_flip_mode(struct igt_fb *fb, bool o=
dd_frame)
>  	cairo_set_source_rgb(cr, 1, 1, 1);
>  	cairo_fill(cr);
> =20
> -	igt_put_cairo_ctx(drm_fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  static bool fb_is_bound(struct test_output *o, int fb)
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 71372556..0574d5ff 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -141,7 +141,7 @@ static void draw_hdr_pattern(igt_fb_t *fb)
>  	igt_paint_color(cr, 0, 0, fb->width, fb->height, 1.0, 1.0, 1.0);
>  	igt_paint_test_pattern(cr, fb->width, fb->height);
> =20
> -	igt_put_cairo_ctx(fb->fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  /* Prepare test data. */
> diff --git a/tests/kms_mmap_write_crc.c b/tests/kms_mmap_write_crc.c
> index 56e0c4d7..46013808 100644
> --- a/tests/kms_mmap_write_crc.c
> +++ b/tests/kms_mmap_write_crc.c
> @@ -92,7 +92,7 @@ static void test(data_t *data)
> =20
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, fb);
>  	igt_paint_test_pattern(cr, fb->width, fb->height);
> -	igt_put_cairo_ctx(data->drm_fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	/* flip to it to make it UC/WC and fully flushed */
>  	igt_plane_set_fb(data->primary, fb);
> @@ -135,7 +135,7 @@ static void test(data_t *data)
>  	 * fully flushed */
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, fb);
>  	igt_paint_test_pattern(cr, fb->width, fb->height);
> -	igt_put_cairo_ctx(data->drm_fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	igt_plane_set_fb(data->primary, fb);
>  	igt_display_commit(display);
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index c6ead813..e75c045b 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -149,7 +149,7 @@ create_fb_for_mode__position(data_t *data, drmModeMod=
eInfo *mode,
>  	igt_paint_color(cr, 0, 0, mode->hdisplay, mode->vdisplay,
>  			    0.0, 1.0, 0.0);
>  	igt_paint_color(cr, rect_x, rect_y, rect_w, rect_h, 0.0, 0.0, 0.0);
> -	igt_put_cairo_ctx(data->drm_fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  enum {
> @@ -284,7 +284,7 @@ create_fb_for_mode__panning(data_t *data, drmModeMode=
Info *mode,
>  			mode->hdisplay, mode->vdisplay,
>  			0.0, 0.0, 1.0);
> =20
> -	igt_put_cairo_ctx(data->drm_fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  enum {
> @@ -460,7 +460,7 @@ static void prepare_format_color(data_t *data, enum p=
ipe pipe,
>  		igt_paint_color(cr, 0, 0, width, height,
>  				c->red, c->green, c->blue);
> =20
> -		igt_put_cairo_ctx(data->drm_fd, fb, cr);
> +		igt_put_cairo_ctx(cr);
>  	} else {
>  		igt_create_fb_with_bo_size(data->drm_fd,
>  					   width + data->crop * 2,
> @@ -485,7 +485,7 @@ static void prepare_format_color(data_t *data, enum p=
ipe pipe,
>  				width, height,
>  				c->red, c->green, c->blue);
> =20
> -		igt_put_cairo_ctx(data->drm_fd, fb, cr);
> +		igt_put_cairo_ctx(cr);
>  	}
> =20
>  	igt_plane_set_fb(plane, fb);
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index ca7a6fa9..dd162546 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -60,7 +60,7 @@ static void draw_gradient(struct igt_fb *fb, int w, int=
 h, double a)
> =20
>  	__draw_gradient(fb, w, h, a, cr);
> =20
> -	igt_put_cairo_ctx(fb->fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  static void draw_gradient_coverage(struct igt_fb *fb, int w, int h, uint=
8_t a)
> @@ -76,7 +76,7 @@ static void draw_gradient_coverage(struct igt_fb *fb, i=
nt w, int h, uint8_t a)
>  		for (i =3D 0; i < w; i++)
>  			data[i * 4 + 3] =3D a;
> =20
> -	igt_put_cairo_ctx(fb->fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  static void draw_squares(struct igt_fb *fb, int w, int h, double a)
> @@ -90,7 +90,7 @@ static void draw_squares(struct igt_fb *fb, int w, int =
h, double a)
>  	igt_paint_color_alpha(cr, w / 2, h / 2, w / 4, h / 2, 1., 1., 1., a);
>  	igt_paint_color_alpha(cr, 3 * w / 4, h / 2, w / 4, h / 2, 0., 0., 0., a=
);
> =20
> -	igt_put_cairo_ctx(fb->fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  static void draw_squares_coverage(struct igt_fb *fb, int w, int h, uint8=
_t as)
> @@ -120,7 +120,7 @@ static void draw_squares_coverage(struct igt_fb *fb, =
int w, int h, uint8_t as)
>  			data[j * stride + i] =3D a;
>  	}
> =20
> -	igt_put_cairo_ctx(fb->fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  static void reset_alpha(igt_display_t *display, enum pipe pipe)
> @@ -200,7 +200,7 @@ static void prepare_crtc(data_t *data, igt_output_t *=
output, enum pipe pipe)
>  		cr =3D igt_get_cairo_ctx(data->gfx_fd, &data->argb_fb_0);
>  		cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
>  		igt_paint_color_alpha(cr, 0, 0, w, h, 0., 0., 0., 0.0);
> -		igt_put_cairo_ctx(data->gfx_fd, &data->argb_fb_0, cr);
> +		igt_put_cairo_ctx(cr);
> =20
>  		igt_create_fb(data->gfx_fd, w, h,
>  			      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index adcdf5e8..f7d50484 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -102,7 +102,7 @@ static void draw_color(igt_fb_t *fb, double r, double=
 g, double b)
> =20
>  	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
>  	igt_paint_color(cr, 0, 0, fb->width, fb->height, r, g, b);
> -	igt_put_cairo_ctx(fb->fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  /*
> @@ -129,7 +129,7 @@ static void test_cursor_pos(data_t *data, igt_fb_t *p=
fb, igt_fb_t *ofb,
>  		igt_paint_color(cr, or->x, or->y, or->w, or->h, 0.5, 0.5, 0.5);
> =20
>  	igt_paint_color(cr, x, y, cw, ch, 1.0, 0.0, 1.0);
> -	igt_put_cairo_ctx(pfb->fd, pfb, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	igt_plane_set_fb(data->overlay, NULL);
>  	igt_plane_set_fb(data->cursor, NULL);
> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
> index 012b25e3..94b18df6 100644
> --- a/tests/kms_plane_lowres.c
> +++ b/tests/kms_plane_lowres.c
> @@ -158,7 +158,7 @@ static void create_ref_fb(data_t *data, uint64_t modi=
fier,
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, fb);
>  	blit(data, cr, &data->fb_primary, 0, 0);
>  	blit(data, cr, &data->fb_plane[0], data->x, data->y);
> -	igt_put_cairo_ctx(data->drm_fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  static unsigned
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index 6cf060b3..29b6397b 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -159,7 +159,7 @@ create_fb_for_mode_position(data_t *data, igt_output_=
t *output, drmModeModeInfo
>  				rect_w[i], rect_h[i], 0.0, 0.0, 0.0);
>  		}
> =20
> -	igt_put_cairo_ctx(data->drm_fd, &data->fb[primary->index], cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
> =20
> diff --git a/tests/kms_psr.c b/tests/kms_psr.c
> index f40902fb..49ea446a 100644
> --- a/tests/kms_psr.c
> +++ b/tests/kms_psr.c
> @@ -88,7 +88,7 @@ static void create_cursor_fb(data_t *data)
> =20
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb_white);
>  	igt_paint_color_alpha(cr, 0, 0, 64, 64, 1.0, 1.0, 1.0, 1.0);
> -	igt_put_cairo_ctx(data->drm_fd, &data->fb_white, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  static void setup_output(data_t *data)
> diff --git a/tests/kms_psr2_su.c b/tests/kms_psr2_su.c
> index 0ee02fc8..d549d9a3 100644
> --- a/tests/kms_psr2_su.c
> +++ b/tests/kms_psr2_su.c
> @@ -132,7 +132,7 @@ static void prepare(data_t *data)
>  		/* paint a white square */
>  		igt_paint_color_alpha(cr, 0, 0, SQUARE_SIZE, SQUARE_SIZE,
>  				      1.0, 1.0, 1.0, 1.0);
> -		igt_put_cairo_ctx(data->drm_fd,  &data->fb[1], cr);
> +		igt_put_cairo_ctx(cr);
>  	} else if (data->op =3D=3D FRONTBUFFER) {
>  		data->cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb[0]);
>  	}
> @@ -226,7 +226,7 @@ static void cleanup(data_t *data)
>  	if (data->op =3D=3D PAGE_FLIP)
>  		igt_remove_fb(data->drm_fd, &data->fb[1]);
>  	else if (data->op =3D=3D FRONTBUFFER)
> -		igt_put_cairo_ctx(data->drm_fd, &data->fb[0], data->cr);
> +		igt_put_cairo_ctx(data->cr);
> =20
>  	igt_remove_fb(data->drm_fd, &data->fb[0]);
>  }
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 164eade8..ffcc2cc2 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -148,7 +148,7 @@ paint_squares(data_t *data, igt_rotation_t rotation,
>  	igt_paint_color(cr, 0, h / 2, w / 2, h / 2, RGB_COLOR(bl));
>  	igt_paint_color(cr, w / 2, h / 2, w / 2, h / 2, RGB_COLOR(br));
> =20
> -	igt_put_cairo_ctx(data->gfx_fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  static void remove_fbs(data_t *data)
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 802a9c3d..92f3ead2 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -161,7 +161,7 @@ static int paint_fb(struct igt_fb *fb, const char *te=
st_name,
>  					  crtc_str[i]);
>  	}
> =20
> -	igt_put_cairo_ctx(drm_fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	return 0;
>  }
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 73115fef..559ef203 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -186,7 +186,7 @@ static void prepare_test(data_t *data, igt_output_t *=
output, enum pipe pipe)
>  	igt_paint_color(cr, 0, 0, mode.hdisplay / 10, mode.vdisplay / 10,
>  			1.00, 0.00, 0.00);
> =20
> -	igt_put_cairo_ctx(data->drm_fd, &data->fb0, cr);
> +	igt_put_cairo_ctx(cr);
> =20
>  	/* Take care of any required modesetting before the test begins. */
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> diff --git a/tests/testdisplay.c b/tests/testdisplay.c
> index 5e2c4598..ef033dc6 100644
> --- a/tests/testdisplay.c
> +++ b/tests/testdisplay.c
> @@ -232,7 +232,7 @@ paint_color_key(struct igt_fb *fb_info)
>  	cairo_set_source_rgb(cr, .8, .8, .8);
>  	cairo_fill(cr);
> =20
> -	igt_put_cairo_ctx(drm_fd, fb_info, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  static void paint_image(cairo_t *cr, const char *file)
> @@ -317,7 +317,7 @@ static void paint_output_info(struct connector *c, st=
ruct igt_fb *fb)
>  	if (qr_code)
>  		paint_image(cr, "pass.png");
> =20
> -	igt_put_cairo_ctx(drm_fd, fb, cr);
> +	igt_put_cairo_ctx(cr);
>  }
> =20
>  static void sighandler(int signo)
> --=20
> 2.27.0
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--c4qwgbytpsdsc5cn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl78vH4ACgkQWJzP/com
vP8ykBAAqIh/N+x4OUW2AxXJboQqQi/21/yu3hUyjQamE3vc6B8gYyGawCGEADEj
FgHpaL++D9RZ1V5Z9rlfRobqV+2cGTpcP0PEh/WBa9J7JvZIJjpdYikCJjl5EQtO
vqN6tI5h3ixWuGh1bZeAJaXwsmB//RX0bqvTMgq20sxEMK298IUg4VzWXdWuNhTM
4zblZXqstuk0QueQyLkZv8bEDxtNNzBi9F58eiRa58xxIIxW3c2baJzeOo6GS9l1
bIFDlOB/4yLagdXU0eWpM+ku0crbWAE4aL5XexQM3npxf3dbK6CDrCvPqoxGI9LM
O9oXw1CgaalvpeW8hNL5knqDLLRIMSdQ+xXIDiLEs9pCXv/sQWaRzbVfxfC2yuc7
9+XXJup8iU0SG8nrFwcMKw6GG+nSY4YSVTxh5pjsZ/ira9KXSrS03Xg0jq66SUwm
7bkV06o81AIMChMHLeWBXLApOAYUb3iEylWm20/vHTeLmZGvdJwYcabj8KdWmPo6
SvvEHKDU+oBrySUhf4PAeX7h70gwDz5arj1tN4F4o5slcx/zqWIil9xqh7od1Q0t
FowWoWyS7hSButWfDr/XdN7mpfht5AySH0TMevKWD8nd6Xr1J2PIZVDXKikW9LE/
MN184fB/dEyxWnkh8C7xzeD/NC3TMVVDdTozGFCDVetXASfOyAA=
=9Dlu
-----END PGP SIGNATURE-----

--c4qwgbytpsdsc5cn--

--===============0891972891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0891972891==--
