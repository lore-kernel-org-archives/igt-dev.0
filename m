Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803506E2E1
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2020 10:08:23 +0000 (UTC)
Date: Fri, 24 Jan 2020 12:07:54 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200124100754.GN25209@platvala-desk.ger.corp.intel.com>
References: <1579766442-20285-1-git-send-email-kunal1.joshi@intel.com>
 <1579766442-20285-3-git-send-email-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579766442-20285-3-git-send-email-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 2/4] Moved common function in
 kms_color and kms_color_chamelium to kms_color_helper.c
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: ville.syrjala@intel.com, igt-dev@lists.freedesktop.org, daniel.vetter@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 23, 2020 at 01:30:40PM +0530, Kunal Joshi wrote:
> kms_color and kms_color_chamelium shared common functions.
> Moved them to tests/kms_color_helper.c to avoid code duplication.
> =

> (v4)
>         Made a library kms_color_helper.c which is specific to
>         kms_color and kms_color_chamelium.
> =

> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Suggested-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  tests/Makefile.am        |   3 +
>  tests/Makefile.sources   |  13 +-
>  tests/kms_color.c        | 383 +----------------------------------------=
-----
>  tests/kms_color.h        | 105 +++++++++++++
>  tests/kms_color_helper.c | 386 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  tests/meson.build        |  19 ++-
>  6 files changed, 525 insertions(+), 384 deletions(-)
>  create mode 100644 tests/kms_color.h
>  create mode 100644 tests/kms_color_helper.c
> =

> diff --git a/tests/Makefile.am b/tests/Makefile.am
> index fc30524..87ffec2 100644
> --- a/tests/Makefile.am
> +++ b/tests/Makefile.am
> @@ -13,11 +13,14 @@ endif
>  if HAVE_CHAMELIUM
>  TESTS_progs +=3D \
>  	kms_chamelium \
> +	kms_color_chamelium \
>  	$(NULL)
>  endif
>  =

>  TESTS_progs +=3D testdisplay
>  =

> +TESTS_progs +=3D kms_color
> +
>  if BUILD_TESTS
>  test-list.txt: Makefile
>  	@echo TESTLIST > $@
> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> index 806eb02..c9b7aea 100644
> --- a/tests/Makefile.sources
> +++ b/tests/Makefile.sources
> @@ -35,7 +35,6 @@ TESTS_progs =3D \
>  	kms_big_fb \
>  	kms_busy \
>  	kms_ccs \
> -	kms_color \
>  	kms_concurrent \
>  	kms_content_protection\
>  	kms_crtc_background_color \
> @@ -590,6 +589,18 @@ testdisplay_SOURCES =3D \
>  	testdisplay_hotplug.c \
>  	$(NULL)
>  =

> +kms_color_SOURCES =3D \
> +        kms_color.c \
> +        kms_color.h \
> +        kms_color_helper.c \
> +        $(NULL)
> +
> +kms_color_chamelium_SOURCES =3D \
> +        kms_color_chamelium.c \
> +        kms_color.h \
> +        kms_color_helper.c \
> +        $(NULL)
> +
>  check_SCRIPTS =3D igt_command_line.sh \
>  	$(NULL)
>  =

> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index b4b578a..864f42a 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -22,252 +22,10 @@
>   *
>   */
>  =

> -#include <math.h>
> -#include <unistd.h>
> -
> -#include "drm.h"
> -#include "drmtest.h"
> -#include "igt.h"
> +#include "kms_color.h"
>  =

>  IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
>  =

> -/* Internal */
> -typedef struct {
> -	double r, g, b;
> -} color_t;
> -
> -typedef struct {
> -	int drm_fd;
> -	uint32_t devid;
> -	igt_display_t display;
> -	igt_pipe_crc_t *pipe_crc;
> -
> -	uint32_t color_depth;
> -	uint64_t degamma_lut_size;
> -	uint64_t gamma_lut_size;
> -} data_t;
> -
> -typedef struct {
> -	int size;
> -	double coeffs[];
> -} gamma_lut_t;
> -
> -static void paint_gradient_rectangles(data_t *data,
> -				      drmModeModeInfo *mode,
> -				      color_t *colors,
> -				      struct igt_fb *fb)
> -{
> -	cairo_t *cr =3D igt_get_cairo_ctx(data->drm_fd, fb);
> -	int i, l =3D mode->hdisplay / 3;
> -	int rows_remaining =3D mode->hdisplay % 3;
> -
> -	/* Paint 3 gradient rectangles with red/green/blue between 1.0 and
> -	 * 0.5. We want to avoid 0 so each max LUTs only affect their own
> -	 * rectangle.
> -	 */
> -	for (i =3D 0 ; i < 3; i++) {
> -		igt_paint_color_gradient_range(cr, i * l, 0, l, mode->vdisplay,
> -					       colors[i].r !=3D 0 ? 0.2 : 0,
> -					       colors[i].g !=3D 0 ? 0.2 : 0,
> -					       colors[i].b !=3D 0 ? 0.2 : 0,
> -					       colors[i].r,
> -					       colors[i].g,
> -					       colors[i].b);
> -	}
> -
> -	if (rows_remaining > 0)
> -		igt_paint_color_gradient_range(cr, i * l, 0, rows_remaining,
> -					       mode->vdisplay,
> -					       colors[i-1].r !=3D 0 ? 0.2 : 0,
> -					       colors[i-1].g !=3D 0 ? 0.2 : 0,
> -					       colors[i-1].b !=3D 0 ? 0.2 : 0,
> -					       colors[i-1].r,
> -					       colors[i-1].g,
> -					       colors[i-1].b);
> -
> -	igt_put_cairo_ctx(data->drm_fd, fb, cr);
> -}
> -
> -static void paint_rectangles(data_t *data,
> -			     drmModeModeInfo *mode,
> -			     color_t *colors,
> -			     struct igt_fb *fb)
> -{
> -	cairo_t *cr =3D igt_get_cairo_ctx(data->drm_fd, fb);
> -	int i, l =3D mode->hdisplay / 3;
> -	int rows_remaining =3D mode->hdisplay % 3;
> -
> -	/* Paint 3 solid rectangles. */
> -	for (i =3D 0 ; i < 3; i++) {
> -		igt_paint_color(cr, i * l, 0, l, mode->vdisplay,
> -				colors[i].r, colors[i].g, colors[i].b);
> -	}
> -
> -	if (rows_remaining > 0)
> -		igt_paint_color(cr, i * l, 0, rows_remaining, mode->vdisplay,
> -				colors[i-1].r, colors[i-1].g, colors[i-1].b);
> -
> -	igt_put_cairo_ctx(data->drm_fd, fb, cr);
> -}
> -
> -static gamma_lut_t *alloc_lut(int lut_size)
> -{
> -	gamma_lut_t *gamma;
> -
> -	igt_assert_lt(0, lut_size);
> -
> -	gamma =3D malloc(sizeof(*gamma) + lut_size * sizeof(gamma->coeffs[0]));
> -	igt_assert(gamma);
> -	gamma->size =3D lut_size;
> -
> -	return gamma;
> -}
> -
> -static void free_lut(gamma_lut_t *gamma)
> -{
> -	if (!gamma)
> -		return;
> -
> -	free(gamma);
> -}
> -
> -static gamma_lut_t *generate_table(int lut_size, double exp)
> -{
> -	gamma_lut_t *gamma =3D alloc_lut(lut_size);
> -	int i;
> -
> -	gamma->coeffs[0] =3D 0.0;
> -	for (i =3D 1; i < lut_size; i++)
> -		gamma->coeffs[i] =3D pow(i * 1.0 / (lut_size - 1), exp);
> -
> -	return gamma;
> -}
> -
> -static gamma_lut_t *generate_table_max(int lut_size)
> -{
> -	gamma_lut_t *gamma =3D alloc_lut(lut_size);
> -	int i;
> -
> -	gamma->coeffs[0] =3D 0.0;
> -	for (i =3D 1; i < lut_size; i++)
> -		gamma->coeffs[i] =3D 1.0;
> -
> -	return gamma;
> -}
> -
> -static gamma_lut_t *generate_table_zero(int lut_size)
> -{
> -	gamma_lut_t *gamma =3D alloc_lut(lut_size);
> -	int i;
> -
> -	for (i =3D 0; i < lut_size; i++)
> -		gamma->coeffs[i] =3D 0.0;
> -
> -	return gamma;
> -}
> -
> -static struct drm_color_lut *coeffs_to_lut(data_t *data,
> -					   const gamma_lut_t *gamma,
> -					   uint32_t color_depth,
> -					   int off)
> -{
> -	struct drm_color_lut *lut;
> -	int i, lut_size =3D gamma->size;
> -	uint32_t max_value =3D (1 << 16) - 1;
> -	uint32_t mask;
> -
> -	if (is_i915_device(data->drm_fd))
> -		mask =3D ((1 << color_depth) - 1) << 8;
> -	else
> -		mask =3D max_value;
> -
> -	lut =3D malloc(sizeof(struct drm_color_lut) * lut_size);
> -
> -	if (IS_CHERRYVIEW(data->devid))
> -		lut_size -=3D 1;
> -	for (i =3D 0; i < lut_size; i++) {
> -		uint32_t v =3D (gamma->coeffs[i] * max_value);
> -
> -		/*
> -		 * Hardware might encode colors on a different number of bits
> -		 * than what is in our framebuffer (10 or 12bits for example).
> -		 * Mask the lower bits not provided by the framebuffer so we
> -		 * can do CRC comparisons.
> -		 */
> -		v &=3D mask;
> -
> -		lut[i].red =3D v;
> -		lut[i].green =3D v;
> -		lut[i].blue =3D v;
> -	}
> -
> -	if (IS_CHERRYVIEW(data->devid))
> -		lut[lut_size].red =3D
> -			lut[lut_size].green =3D
> -			lut[lut_size].blue =3D lut[lut_size - 1].red;
> -
> -	return lut;
> -}
> -
> -static void set_degamma(data_t *data,
> -			igt_pipe_t *pipe,
> -			const gamma_lut_t *gamma)
> -{
> -	size_t size =3D sizeof(struct drm_color_lut) * gamma->size;
> -	struct drm_color_lut *lut =3D coeffs_to_lut(data, gamma,
> -						  data->color_depth, 0);
> -
> -	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_DEGAMMA_LUT, lut, size);
> -
> -	free(lut);
> -}
> -
> -static void set_gamma(data_t *data,
> -		      igt_pipe_t *pipe,
> -		      const gamma_lut_t *gamma)
> -{
> -	size_t size =3D sizeof(struct drm_color_lut) * gamma->size;
> -	struct drm_color_lut *lut =3D coeffs_to_lut(data, gamma,
> -						  data->color_depth, 0);
> -
> -	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, lut, size);
> -
> -	free(lut);
> -}
> -
> -static void set_ctm(igt_pipe_t *pipe, const double *coefficients)
> -{
> -	struct drm_color_ctm ctm;
> -	int i;
> -
> -	for (i =3D 0; i < ARRAY_SIZE(ctm.matrix); i++) {
> -		if (coefficients[i] < 0) {
> -			ctm.matrix[i] =3D
> -				(int64_t) (-coefficients[i] * ((int64_t) 1L << 32));
> -			ctm.matrix[i] |=3D 1ULL << 63;
> -		} else
> -			ctm.matrix[i] =3D
> -				(int64_t) (coefficients[i] * ((int64_t) 1L << 32));
> -	}
> -
> -	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_CTM, &ctm, sizeof(ctm));
> -}
> -
> -static void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properti=
es prop)
> -{
> -	if (igt_pipe_obj_has_prop(pipe, prop))
> -		igt_pipe_obj_replace_prop_blob(pipe, prop, NULL, 0);
> -}
> -
> -#define disable_degamma(pipe) disable_prop(pipe, IGT_CRTC_DEGAMMA_LUT)
> -#define disable_gamma(pipe) disable_prop(pipe, IGT_CRTC_GAMMA_LUT)
> -#define disable_ctm(pipe) disable_prop(pipe, IGT_CRTC_CTM)
> -
> -/*
> - * Draw 3 gradient rectangles in red, green and blue, with a maxed out
> - * degamma LUT and verify we have the same CRC as drawing solid color
> - * rectangles with linear degamma LUT.
> - */
>  static void test_pipe_degamma(data_t *data,
>  			      igt_plane_t *primary)
>  {
> @@ -532,19 +290,6 @@ static void test_pipe_legacy_gamma(data_t *data,
>  	free(blue_lut);
>  }
>  =

> -static drmModePropertyBlobPtr
> -get_blob(data_t *data, igt_pipe_t *pipe, enum igt_atomic_crtc_properties=
 prop)
> -{
> -	uint64_t prop_value;
> -
> -	prop_value =3D igt_pipe_obj_get_prop(pipe, prop);
> -
> -	if (prop_value =3D=3D 0)
> -		return NULL;
> -
> -	return drmModeGetPropertyBlob(data->drm_fd, prop_value);
> -}
> -
>  /*
>   * Verify that setting the legacy gamma LUT resets the gamma LUT set
>   * through the GAMMA_LUT property.
> @@ -663,11 +408,6 @@ static void test_pipe_legacy_gamma_reset(data_t *dat=
a,
>  	free_lut(gamma_zero);
>  }
>  =

> -static bool crc_equal(igt_crc_t *a, igt_crc_t *b)
> -{
> -  return memcmp(a->crc, b->crc, sizeof(a->crc[0]) * a->n_words) =3D=3D 0;
> -}
> -
>  /*
>   * Draw 3 rectangles using before colors with the ctm matrix apply and v=
erify
>   * the CRC is equal to using after colors with an identify ctm matrix.
> @@ -1086,127 +826,6 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>  	}
>  }
>  =

> -static int
> -pipe_set_property_blob_id(igt_pipe_t *pipe, enum igt_atomic_crtc_propert=
ies prop, uint32_t blob_id)
> -{
> -	int ret;
> -
> -	igt_pipe_obj_replace_prop_blob(pipe, prop, NULL, 0);
> -
> -	igt_pipe_obj_set_prop_value(pipe, prop, blob_id);
> -
> -	ret =3D igt_display_try_commit2(pipe->display, pipe->display->is_atomic=
 ? COMMIT_ATOMIC : COMMIT_LEGACY);
> -
> -	igt_pipe_obj_set_prop_value(pipe, prop, 0);
> -
> -	return ret;
> -}
> -
> -static int
> -pipe_set_property_blob(igt_pipe_t *pipe, enum igt_atomic_crtc_properties=
 prop, void *ptr, size_t length)
> -{
> -	igt_pipe_obj_replace_prop_blob(pipe, prop, ptr, length);
> -
> -	return igt_display_try_commit2(pipe->display, pipe->display->is_atomic =
? COMMIT_ATOMIC : COMMIT_LEGACY);
> -}
> -
> -static void
> -invalid_gamma_lut_sizes(data_t *data)
> -{
> -	igt_display_t *display =3D &data->display;
> -	igt_pipe_t *pipe =3D &display->pipes[0];
> -	size_t gamma_lut_size =3D data->gamma_lut_size * sizeof(struct drm_colo=
r_lut);
> -	struct drm_color_lut *gamma_lut;
> -
> -	igt_require(igt_pipe_obj_has_prop(pipe, IGT_CRTC_GAMMA_LUT));
> -
> -	gamma_lut =3D malloc(gamma_lut_size * 2);
> -
> -	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
> -
> -	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_GAMMA_LUT,
> -					     gamma_lut, 1),
> -		      -EINVAL);
> -	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_GAMMA_LUT,
> -					     gamma_lut, gamma_lut_size + 1),
> -		      -EINVAL);
> -	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_GAMMA_LUT,
> -					     gamma_lut, gamma_lut_size - 1),
> -		      -EINVAL);
> -	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_GAMMA_LUT,
> -					     gamma_lut, gamma_lut_size + sizeof(struct drm_color_lut)),
> -		      -EINVAL);
> -	igt_assert_eq(pipe_set_property_blob_id(pipe, IGT_CRTC_GAMMA_LUT, pipe-=
>crtc_id),
> -		      -EINVAL);
> -	igt_assert_eq(pipe_set_property_blob_id(pipe, IGT_CRTC_GAMMA_LUT, 4096 =
* 4096),
> -		      -EINVAL);
> -
> -	free(gamma_lut);
> -}
> -
> -static void
> -invalid_degamma_lut_sizes(data_t *data)
> -{
> -	igt_display_t *display =3D &data->display;
> -	igt_pipe_t *pipe =3D &display->pipes[0];
> -	size_t degamma_lut_size =3D data->degamma_lut_size * sizeof(struct drm_=
color_lut);
> -	struct drm_color_lut *degamma_lut;
> -
> -	igt_require(igt_pipe_obj_has_prop(pipe, IGT_CRTC_DEGAMMA_LUT));
> -
> -	degamma_lut =3D malloc(degamma_lut_size * 2);
> -
> -	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMI=
T_LEGACY);
> -
> -	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_DEGAMMA_LUT,
> -					     degamma_lut, 1), -EINVAL);
> -	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_DEGAMMA_LUT,
> -					     degamma_lut, degamma_lut_size + 1),
> -		      -EINVAL);
> -	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_DEGAMMA_LUT,
> -					     degamma_lut, degamma_lut_size - 1),
> -		      -EINVAL);
> -	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_DEGAMMA_LUT,
> -					     degamma_lut, degamma_lut_size + sizeof(struct drm_color_lut)),
> -		      -EINVAL);
> -	igt_assert_eq(pipe_set_property_blob_id(pipe, IGT_CRTC_DEGAMMA_LUT, pip=
e->crtc_id),
> -		      -EINVAL);
> -	igt_assert_eq(pipe_set_property_blob_id(pipe, IGT_CRTC_DEGAMMA_LUT, 409=
6 * 4096),
> -		      -EINVAL);
> -
> -	free(degamma_lut);
> -}
> -
> -static void
> -invalid_ctm_matrix_sizes(data_t *data)
> -{
> -	igt_display_t *display =3D &data->display;
> -	igt_pipe_t *pipe =3D &display->pipes[0];
> -	void *ptr;
> -
> -	igt_require(igt_pipe_obj_has_prop(pipe, IGT_CRTC_CTM));
> -
> -	ptr =3D malloc(sizeof(struct drm_color_ctm) * 4);
> -
> -	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_CTM, ptr, 1),
> -		      -EINVAL);
> -	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_CTM, ptr,
> -					     sizeof(struct drm_color_ctm) + 1),
> -		      -EINVAL);
> -	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_CTM, ptr,
> -					     sizeof(struct drm_color_ctm) - 1),
> -		      -EINVAL);
> -	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_CTM, ptr,
> -					     sizeof(struct drm_color_ctm) * 2),
> -		      -EINVAL);
> -	igt_assert_eq(pipe_set_property_blob_id(pipe, IGT_CRTC_CTM, pipe->crtc_=
id),
> -		      -EINVAL);
> -	igt_assert_eq(pipe_set_property_blob_id(pipe, IGT_CRTC_CTM, 4096 * 4096=
),
> -		      -EINVAL);
> -
> -	free(ptr);
> -}
> -
>  igt_main
>  {
>  	data_t data =3D {};
> diff --git a/tests/kms_color.h b/tests/kms_color.h
> new file mode 100644
> index 0000000..cee3859
> --- /dev/null
> +++ b/tests/kms_color.h

Hmm, this header should maybe be called kms_color_helper.h

> @@ -0,0 +1,105 @@
> +/*
> + * Copyright =A9 2020 Intel Corporation

It's a new file but the licensed work inside isn't changed. This year
should be the same as in old kms_color.c, 2015.


> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#ifndef COLOR
> +#define COLOR

This is bound to collide at something at some point. IGT_KMS_COLOR_H instea=
d.

We could use a comment here that explains what this header file is
for: Shared code for the two kms_color tests.



With those fixed,

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
