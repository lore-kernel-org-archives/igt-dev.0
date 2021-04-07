Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6379A89F03
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Apr 2021 07:28:42 +0000 (UTC)
Date: Wed, 7 Apr 2021 10:29:30 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YG1fWtfiJteoqUpS@platvala-desk.ger.corp.intel.com>
References: <20210406160654.14094-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406160654.14094-1-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_available_modes_crc: remove
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 06, 2021 at 07:06:54PM +0300, Juha-Pekka Heikkila wrote:
> Remove kms_available_modes_crc test as this test is meaningless
> these days. This test was created back in the day when igt supported
> only 24bpp rgb format hence there was need to test packed yuv
> and nv12 did work. Now this test is duplicated by kms_plane
> pixel format tests among others.
> =

> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Acked-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/Makefile.sources          |   1 -
>  tests/kms_available_modes_crc.c | 460 --------------------------------
>  tests/meson.build               |   1 -
>  3 files changed, 462 deletions(-)
>  delete mode 100644 tests/kms_available_modes_crc.c
> =

> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> index 194df8e27..2336a48d8 100644
> --- a/tests/Makefile.sources
> +++ b/tests/Makefile.sources
> @@ -37,7 +37,6 @@ TESTS_progs =3D \
>  	kms_atomic \
>  	kms_atomic_interruptible \
>  	kms_atomic_transition \
> -	kms_available_modes_crc \
>  	kms_big_fb \
>  	kms_big_joiner \
>  	kms_busy \
> diff --git a/tests/kms_available_modes_crc.c b/tests/kms_available_modes_=
crc.c
> deleted file mode 100644
> index 17e0f2379..000000000
> --- a/tests/kms_available_modes_crc.c
> +++ /dev/null
> @@ -1,460 +0,0 @@
> -/*
> - * Copyright =A9 2018 Intel Corporation
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining=
 a
> - * copy of this software and associated documentation files (the "Softwa=
re"),
> - * to deal in the Software without restriction, including without limita=
tion
> - * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the =
next
> - * paragraph) shall be included in all copies or substantial portions of=
 the
> - * Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> - * IN THE SOFTWARE.
> - *
> - */
> -
> -#include "drm_mode.h"
> -#include "drm_fourcc.h"
> -#include "i915/gem.h"
> -#include "igt.h"
> -
> -IGT_TEST_DESCRIPTION("CRC test all different plane modes which kernel ad=
vertises.");
> -
> -#define SDR_PLANE_BASE 3
> -
> -typedef struct {
> -	int gfx_fd;
> -	igt_display_t display;
> -	enum igt_commit_style commit;
> -
> -	struct igt_fb fb;
> -	struct igt_fb primary_fb;
> -
> -	union {
> -		char name[5];
> -		uint32_t dword;
> -	} format;
> -	bool separateprimaryplane;
> -
> -	uint32_t gem_handle;
> -	unsigned int size;
> -	unsigned char* buf;
> -
> -	/*
> -	 * comparison crcs
> -	 */
> -	igt_pipe_crc_t *pipe_crc;
> -
> -	igt_crc_t cursor_crc;
> -	igt_crc_t fullscreen_crc;
> -} data_t;
> -
> -
> -static void do_write(int fd, int handle, void *buf, int size)
> -{	void *screenbuf;
> -
> -	gem_set_domain(fd, handle, I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
> -	screenbuf =3D gem_mmap__gtt(fd, handle, size, PROT_WRITE);
> -	memcpy(screenbuf, buf, size);
> -	gem_munmap(screenbuf, size);
> -	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
> -	gem_sync(fd, handle);
> -}
> -
> -
> -static void generate_comparison_crc_list(data_t *data, igt_output_t *out=
put)
> -{
> -	drmModeModeInfo *mode;
> -	uint64_t w, h;
> -	int fbid;
> -	cairo_t *cr;
> -	igt_plane_t *primary;
> -
> -	mode =3D igt_output_get_mode(output);
> -	fbid =3D igt_create_color_fb(data->gfx_fd,
> -				   mode->hdisplay,
> -				   mode->vdisplay,
> -				   DRM_FORMAT_XRGB8888,
> -				   LOCAL_DRM_FORMAT_MOD_NONE,
> -				   0, 0, 0,
> -				   &data->primary_fb);
> -
> -	igt_assert(fbid);
> -
> -	drmGetCap(data->gfx_fd, DRM_CAP_CURSOR_WIDTH, &w);
> -	drmGetCap(data->gfx_fd, DRM_CAP_CURSOR_HEIGHT, &h);
> -
> -	cr =3D igt_get_cairo_ctx(data->gfx_fd, &data->primary_fb);
> -	igt_paint_color(cr, 0, 0, mode->hdisplay, mode->vdisplay,
> -			    0.0, 0.0, 0.0);
> -	igt_paint_color(cr, 0, 0, w, h, 1.0, 1.0, 1.0);
> -	igt_assert(cairo_status(cr) =3D=3D 0);
> -	igt_put_cairo_ctx(cr);
> -
> -	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	igt_plane_set_fb(primary, &data->primary_fb);
> -	igt_display_commit2(&data->display, data->commit);
> -
> -	igt_pipe_crc_get_current(data->gfx_fd, data->pipe_crc, &data->cursor_cr=
c);
> -	igt_plane_set_fb(primary, NULL);
> -	igt_display_commit2(&data->display, data->commit);
> -
> -	cr =3D igt_get_cairo_ctx(data->gfx_fd, &data->primary_fb);
> -	igt_paint_color(cr, 0, 0, mode->hdisplay, mode->vdisplay, 1.0, 1.0, 1.0=
);
> -	igt_put_cairo_ctx(cr);
> -
> -	igt_plane_set_fb(primary, &data->primary_fb);
> -	igt_display_commit2(&data->display, data->commit);
> -
> -	igt_pipe_crc_get_current(data->gfx_fd, data->pipe_crc, &data->fullscree=
n_crc);
> -
> -	igt_remove_fb(data->gfx_fd, &data->primary_fb);
> -}
> -
> -static const struct {
> -	uint32_t	fourcc;
> -	char		zeropadding;
> -	enum		{ BYTES_PP_1 =3D 1,
> -				BYTES_PP_4 =3D 4} bpp;
> -	uint32_t	value;
> -} fillers[] =3D {
> -	{ DRM_FORMAT_XBGR2101010, 0, BYTES_PP_4, 0xffffffff},
> -	{ 0, 0, 0, 0 }
> -};
> -
> -/*
> - * fill_in_fb tell in return value if selected mode should be
> - * proceed to crc check
> - */
> -static bool fill_in_fb(data_t *data, igt_output_t *output, igt_plane_t *=
plane,
> -		       uint32_t format)
> -{
> -	signed i, c, writesize;
> -	unsigned int* ptemp_32_buf;
> -
> -	for (i =3D 0; i < ARRAY_SIZE(fillers)-1; i++) {
> -		if (fillers[i].fourcc =3D=3D format)
> -			break;
> -	}
> -
> -	switch (fillers[i].bpp) {
> -	case BYTES_PP_4:
> -		ptemp_32_buf =3D (unsigned int*)data->buf;
> -		for (c =3D 0; c < data->size/4; c++)
> -			ptemp_32_buf[c] =3D fillers[i].value;
> -		writesize =3D data->size;
> -		break;
> -	case BYTES_PP_1:
> -		memset((void *)data->buf, fillers[i].value, data->size);
> -		writesize =3D data->size;
> -		break;
> -	default:
> -		igt_assert_f(0, "unknown bpp");
> -	}
> -
> -	do_write(data->gfx_fd, data->gem_handle, (void*)data->buf, writesize);
> -	return true;
> -}
> -
> -
> -static bool setup_fb(data_t *data, igt_output_t *output, igt_plane_t *pl=
ane,
> -		     uint32_t format)
> -{
> -	drmModeModeInfo *mode;
> -	uint64_t w, h;
> -	signed ret, gemsize =3D 0;
> -	unsigned tile_width, tile_height;
> -	int num_planes =3D 1;
> -	uint64_t tiling;
> -	int bpp =3D 0;
> -	int i;
> -
> -	mode =3D igt_output_get_mode(output);
> -	if (plane->type !=3D DRM_PLANE_TYPE_CURSOR) {
> -		w =3D mode->hdisplay;
> -		h =3D mode->vdisplay;
> -		tiling =3D LOCAL_I915_FORMAT_MOD_X_TILED;
> -	} else {
> -		drmGetCap(data->gfx_fd, DRM_CAP_CURSOR_WIDTH, &w);
> -		drmGetCap(data->gfx_fd, DRM_CAP_CURSOR_HEIGHT, &h);
> -		tiling =3D LOCAL_DRM_FORMAT_MOD_NONE;
> -	}
> -
> -	for (i =3D 0; i < ARRAY_SIZE(fillers)-1; i++) {
> -		if (fillers[i].fourcc =3D=3D format)
> -			break;
> -	}
> -
> -	switch (fillers[i].bpp) {
> -	case BYTES_PP_1:
> -		bpp =3D 8;
> -		break;
> -	case BYTES_PP_4:
> -		bpp =3D 32;
> -		break;
> -	default:
> -		igt_assert_f(0, "unknown bpp");
> -	}
> -
> -	igt_get_fb_tile_size(data->gfx_fd, tiling, bpp,
> -			     &tile_width, &tile_height);
> -	data->fb.offsets[0] =3D 0;
> -	data->fb.strides[0] =3D ALIGN(w * bpp / 8, tile_width);
> -	gemsize =3D data->size =3D data->fb.strides[0] * ALIGN(h, tile_height);
> -	data->buf =3D (unsigned char *)calloc(data->size*2, 1);
> -
> -	data->gem_handle =3D gem_create(data->gfx_fd, gemsize);
> -	data->fb.gem_handle =3D data->gem_handle;
> -	data->fb.width =3D w;
> -	data->fb.height =3D h;
> -	fill_in_fb(data, output, plane, format);
> -
> -	ret =3D __kms_addfb(data->gfx_fd, data->gem_handle, w, h,
> -			  format, tiling, data->fb.strides, data->fb.offsets,
> -			  num_planes, LOCAL_DRM_MODE_FB_MODIFIERS,
> -			  &data->fb.fb_id);
> -
> -	if(ret < 0) {
> -		igt_info("Creating fb for format %s failed, return code %d\n",
> -			 (char*)&data->format.name, ret);
> -
> -		return false;
> -	}
> -
> -	return true;
> -}
> -
> -
> -static void remove_fb(data_t* data, igt_output_t* output, igt_plane_t* p=
lane)
> -{
> -	if (data->separateprimaryplane) {
> -		igt_plane_t* primary =3D igt_output_get_plane_type(output,
> -								 DRM_PLANE_TYPE_PRIMARY);
> -		igt_plane_set_fb(primary, NULL);
> -		igt_remove_fb(data->gfx_fd, &data->primary_fb);
> -		data->separateprimaryplane =3D false;
> -	}
> -
> -	igt_remove_fb(data->gfx_fd, &data->fb);
> -	free(data->buf);
> -	data->buf =3D NULL;
> -}
> -
> -
> -static bool prepare_crtc(data_t *data, igt_output_t *output,
> -			 igt_plane_t *plane, uint32_t format)
> -{
> -	drmModeModeInfo *mode;
> -	igt_plane_t *primary;
> -
> -	if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY) {
> -		mode =3D igt_output_get_mode(output);
> -		igt_create_color_fb(data->gfx_fd,
> -				    mode->hdisplay, mode->vdisplay,
> -				    DRM_FORMAT_XRGB8888,
> -				    LOCAL_DRM_FORMAT_MOD_NONE,
> -				    0, 0, 0,
> -				    &data->primary_fb);
> -
> -		primary =3D igt_output_get_plane_type(output,
> -						    DRM_PLANE_TYPE_PRIMARY);
> -
> -		igt_plane_set_fb(primary, &data->primary_fb);
> -		igt_display_commit2(&data->display, data->commit);
> -		data->separateprimaryplane =3D true;
> -	}
> -
> -	if (!setup_fb(data, output, plane, format))
> -		return false;
> -
> -	return true;
> -}
> -
> -
> -static int
> -test_one_mode(data_t* data, igt_output_t *output, igt_plane_t* plane,
> -	      int mode, enum pipe pipe)
> -{
> -	igt_crc_t current_crc;
> -	signed rVal =3D 0;
> -	int i;
> -	igt_display_t *display =3D &data->display;
> -
> -	/*
> -	 * Limit tests only to those fb formats listed in fillers table
> -	 */
> -	for (i =3D 0; i < ARRAY_SIZE(fillers)-1; i++) {
> -		if (fillers[i].fourcc =3D=3D mode)
> -			break;
> -	}
> -
> -	if (fillers[i].bpp =3D=3D 0)
> -		return false;
> -
> -	if (prepare_crtc(data, output, plane, mode)) {
> -		igt_plane_set_fb(plane, &data->fb);
> -		igt_fb_set_size(&data->fb, plane, data->fb.width, data->fb.height);
> -		igt_plane_set_size(plane, data->fb.width, data->fb.height);
> -		igt_fb_set_position(&data->fb, plane, 0, 0);
> -		igt_display_commit2(&data->display, data->commit);
> -
> -		igt_wait_for_vblank(data->gfx_fd,
> -				display->pipes[pipe].crtc_offset);
> -		igt_pipe_crc_get_current(data->gfx_fd, data->pipe_crc, &current_crc);
> -
> -		if (plane->type !=3D DRM_PLANE_TYPE_CURSOR) {
> -			if (!igt_check_crc_equal(&current_crc,
> -				&data->fullscreen_crc)) {
> -				igt_warn("crc mismatch. connector %s using pipe %s" \
> -					" plane index %d mode %.4s\n",
> -					igt_output_name(output),
> -					kmstest_pipe_name(pipe),
> -					plane->index,
> -					(char *)&mode);
> -				rVal++;
> -			}
> -		} else {
> -			if (!igt_check_crc_equal(&current_crc,
> -				&data->cursor_crc)) {
> -				igt_warn("crc mismatch. connector %s using pipe %s" \
> -					" plane index %d mode %.4s\n",
> -					igt_output_name(output),
> -					kmstest_pipe_name(pipe),
> -					plane->index,
> -					(char *)&mode);
> -				rVal++;
> -			}
> -		}
> -	}
> -	remove_fb(data, output, plane);
> -	return rVal;
> -}
> -
> -
> -static void
> -test_available_modes(data_t* data)
> -{
> -	igt_output_t *output;
> -	igt_plane_t *plane;
> -	int modeindex;
> -	enum pipe pipe;
> -	int invalids =3D 0, i, lut_size;
> -	drmModePlane *modePlane;
> -
> -	struct {
> -		uint16_t red;
> -		uint16_t green;
> -		uint16_t blue;
> -		uint16_t reserved;
> -	} *lut =3D NULL;
> -
> -	igt_display_reset(&data->display);
> -
> -	for_each_pipe_with_valid_output(&data->display, pipe, output) {
> -		igt_output_set_pipe(output, pipe);
> -		igt_display_commit2(&data->display, data->commit);
> -
> -		if (igt_pipe_obj_has_prop(&data->display.pipes[pipe], IGT_CRTC_GAMMA_L=
UT_SIZE)) {
> -			lut_size =3D igt_pipe_get_prop(&data->display, pipe,
> -						     IGT_CRTC_GAMMA_LUT_SIZE);
> -
> -			lut =3D calloc(sizeof(*lut), lut_size);
> -
> -			for (i =3D 0; i < lut_size; i++) {
> -				lut[i].red =3D (i * 0xffff / (lut_size - 1)) & 0xfc00;
> -				lut[i].green =3D (i * 0xffff / (lut_size - 1)) & 0xfc00;
> -				lut[i].blue =3D (i * 0xffff / (lut_size - 1)) & 0xfc00;
> -			}
> -
> -			igt_pipe_replace_prop_blob(&data->display, pipe,
> -						   IGT_CRTC_GAMMA_LUT,
> -						   lut, sizeof(*lut) * lut_size);
> -			igt_display_commit2(&data->display, data->commit);
> -
> -			for (i =3D 0; i < lut_size; i++) {
> -				lut[i].red =3D i * 0xffff / (lut_size - 1);
> -				lut[i].green =3D i * 0xffff / (lut_size - 1);
> -				lut[i].blue =3D i * 0xffff / (lut_size - 1);
> -			}
> -		}
> -
> -		data->pipe_crc =3D igt_pipe_crc_new(data->gfx_fd, pipe,
> -						  INTEL_PIPE_CRC_SOURCE_AUTO);
> -
> -		igt_pipe_crc_start(data->pipe_crc);
> -
> -		/*
> -		 * regenerate comparison crcs for each pipe just in case.
> -		 */
> -		generate_comparison_crc_list(data, output);
> -
> -		for_each_plane_on_pipe(&data->display, pipe, plane) {
> -			modePlane =3D drmModeGetPlane(data->gfx_fd,
> -						    plane->drm_plane->plane_id);
> -
> -			if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR
> -			    || plane->index >=3D SDR_PLANE_BASE)
> -				continue;
> -
> -			for (modeindex =3D 0;
> -			     modeindex < modePlane->count_formats;
> -			     modeindex++) {
> -				data->format.dword =3D modePlane->formats[modeindex];
> -
> -				invalids +=3D test_one_mode(data, output,
> -							  plane,
> -							  modePlane->formats[modeindex],
> -							  pipe);
> -			}
> -			drmModeFreePlane(modePlane);
> -		}
> -		igt_pipe_crc_stop(data->pipe_crc);
> -		igt_pipe_crc_free(data->pipe_crc);
> -
> -		if (lut !=3D NULL) {
> -			igt_pipe_replace_prop_blob(&data->display, pipe,
> -						   IGT_CRTC_GAMMA_LUT,
> -						   lut, sizeof(*lut) * lut_size);
> -			free(lut);
> -			lut =3D NULL;
> -		}
> -
> -		igt_output_set_pipe(output, PIPE_NONE);
> -		igt_display_commit2(&data->display, data->commit);
> -	}
> -	igt_assert(invalids =3D=3D 0);
> -}
> -
> -
> -igt_main
> -{
> -	data_t data =3D {};
> -
> -	igt_fixture {
> -		data.gfx_fd =3D drm_open_driver_master(DRIVER_INTEL);
> -		kmstest_set_vt_graphics_mode();
> -		igt_display_require(&data.display, data.gfx_fd);
> -		igt_require_pipe_crc(data.gfx_fd);
> -	}
> -
> -	data.commit =3D data.display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY;
> -
> -	igt_subtest("available_mode_test_crc") {
> -		gem_require_mappable_ggtt(data.gfx_fd);
> -		test_available_modes(&data);
> -	}
> -
> -	igt_fixture {
> -		kmstest_restore_vt_mode();
> -		igt_display_fini(&data.display);
> -	}
> -}
> diff --git a/tests/meson.build b/tests/meson.build
> index 55ea63806..b2a3ab17a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -20,7 +20,6 @@ test_progs =3D [
>  	'kms_atomic',
>  	'kms_atomic_interruptible',
>  	'kms_atomic_transition',
> -	'kms_available_modes_crc',
>  	'kms_big_fb',
>  	'kms_big_joiner' ,
>  	'kms_busy',
> -- =

> 2.28.0
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
