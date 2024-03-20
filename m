Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABA1C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 14:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1626F10FC4F;
	Wed, 20 Mar 2024 14:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JTjbs+2c";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2ECD10EC68
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 14:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710944383;
 bh=SxBNf4jpFxThBhMvoXgx6XbS/2ThM8+yR1K6gw4o7tc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JTjbs+2ccNlbhJdSRuJHYbJ3uzKx/Yn6KO4RR1OaAQxPq8rdElbrROp1DBbtOc3sh
 G9amNtD0DbZuODKKcEVCE452MEtvhral6HrQ+ie2F5hfWRHAKLh/+t+N1dBiSe5t6e
 EqlZbswix6U2bW5gCpTxest4NmHbBLUH6qkUi225chCE8ORSEE4VgfQGpYn5I8C+RJ
 cjFO3i5D0lpMjw9Ce5+7SB5tPrA6vcsjWaPRO5HXCOeIRb/XX0FtURyZhCNSzqRBuq
 sDejUs3ktdxiN6M0JVtGQygLWlLNGdukoXmywYV8mBsrbYIY3i5r8+47PbZHK/YwW9
 +G7r3tZUBvgYg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0C1EE3781426;
 Wed, 20 Mar 2024 14:19:43 +0000 (UTC)
Date: Wed, 20 Mar 2024 16:19:41 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>,
 Simon Ser <contact@emersion.fr>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t v3 4/5] tests/kms_atomic: Add solid fill plane
 subtest
Message-ID: <20240320161941.0a36d996.pekka.paalanen@collabora.com>
In-Reply-To: <20240301-solid-fill-v3-4-8dff68a8a566@quicinc.com>
References: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
 <20240301-solid-fill-v3-4-8dff68a8a566@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mUvQXmM3XdMow2hihtG0Qjt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--Sig_/mUvQXmM3XdMow2hihtG0Qjt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 1 Mar 2024 12:47:33 -0800
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> Add a basic test for solid fill planes.
>=20
> This test will first commit a single-color framebuffer plane then
> a solid fill plane with the same contents. It then validates the solid
> fill plane by comparing the resulting CRC with the CRC of the reference
> framebuffer commit.
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  tests/kms_atomic.c | 209 +++++++++++++++++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 191 insertions(+), 18 deletions(-)
>=20
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> old mode 100644
> new mode 100755
> index 2b6e9a8f0383..0598c5d71a85
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -43,6 +43,7 @@
>  #include <stdint.h>
>  #include <string.h>
>  #include <errno.h>
> +#include <math.h>
>  #include <xf86drmMode.h>
>  #include <cairo.h>
>  #include "drm.h"
> @@ -101,6 +102,15 @@
>   * @params-fence:     fence parameters
>   */
> =20
> +/**
> + * SUBTEST: plane-%s-solid-fill
> + * Description: Test atomic modesetting on %arg[1] using solid fill prop=
erty.
> + *
> + * arg[1]:
> + *
> + * @primary:        Primary plane
> + */
> +
>  #ifndef DRM_CAP_CURSOR_WIDTH
>  #define DRM_CAP_CURSOR_WIDTH 0x8
>  #endif
> @@ -122,18 +132,45 @@ typedef struct {
>  	igt_fb_t fb;
>  } data_t;
> =20
> +static struct {
> +	uint32_t r, g, b;
> +} colors[8] =3D {
> +	/* Basic Colors */
> +	{ .r =3D 0x00000000, .g =3D 0x00000000, .b =3D 0x00000000 },
> +	{ .r =3D 0xffffffff, .g =3D 0x00000000, .b =3D 0x00000000 },
> +	{ .r =3D 0x00000000, .g =3D 0xffffffff, .b =3D 0x00000000 },
> +	{ .r =3D 0x00000000, .g =3D 0x00000000, .b =3D 0xffffffff },
> +	{ .r =3D 0xffffffff, .g =3D 0xffffffff, .b =3D 0xffffffff },
> +
> +	/* Mid-grays */
> +	{ .r =3D 0x40000000, .g =3D 0x40000000, .b =3D 0x40000000 },
> +	{ .r =3D 0x80000000, .g =3D 0x80000000, .b =3D 0x80000000 },
> +	{ .r =3D 0xcccccccc, .g =3D 0xcccccccc, .b =3D 0xcccccccc },
> +};

Hi Jessica,

that's a nice set of color values.

> +
>  enum kms_atomic_check_relax {
>  	ATOMIC_RELAX_NONE =3D 0,
>  	CRTC_RELAX_MODE =3D (1 << 0),
>  	PLANE_RELAX_FB =3D (1 << 1)
>  };
> =20
> -static inline int damage_rect_width(struct drm_mode_rect *r)
> +/*
> + * Fixed point uint to floating point conversion based on
> + * Vulkan's UNORM conversion:
> + *
> + * https://registry.khronos.org/vulkan/specs/1.3/html/chap3.html#fundame=
ntals-fixedconv
> + */
> +static inline double unorm_to_float(uint32_t x)
> +{
> +	return x / (pow(2, 32) - 1);

That, or
	return x / (double)UINT32_MAX;

> +}
> +
> +static inline int rect_width(struct drm_mode_rect *r)
>  {
>  	return r->x2 - r->x1;
>  }
> =20
> -static inline int damage_rect_height(struct drm_mode_rect *r)
> +static inline int rect_height(struct drm_mode_rect *r)
>  {
>  	return r->y2 - r->y1;
>  }
> @@ -1156,8 +1193,8 @@ static void atomic_plane_damage(data_t *data)
> =20
>  	cr_1 =3D igt_get_cairo_ctx(data->drm_fd, &fb_1);
>  	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
> -			damage_rect_width(&damage[0]),
> -			damage_rect_height(&damage[0]), 1.0, 0, 0);
> +			rect_width(&damage[0]),
> +			rect_height(&damage[0]), 1.0, 0, 0);
>  	igt_put_cairo_ctx(cr_1);
> =20
>  	igt_plane_set_fb(data->primary, &fb_1);
> @@ -1183,8 +1220,8 @@ static void atomic_plane_damage(data_t *data)
>  	cairo_set_source_surface(cr_2, fb_1.cairo_surface, 0, 0);
>  	cairo_paint(cr_2);
>  	igt_paint_color(cr_2, damage[0].x1, damage[0].y1,
> -			damage_rect_width(&damage[0]),
> -			damage_rect_height(&damage[0]), 0, 1.0, 0);
> +			rect_width(&damage[0]),
> +			rect_height(&damage[0]), 0, 1.0, 0);
>  	igt_put_cairo_ctx(cr_1);
>  	igt_put_cairo_ctx(cr_2);
>  	igt_plane_set_fb(data->primary, &fb_2);
> @@ -1213,8 +1250,8 @@ static void atomic_plane_damage(data_t *data)
>  	cairo_set_source_surface(cr_1, fb_2.cairo_surface, 0, 0);
>  	cairo_paint(cr_1);
>  	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
> -			damage_rect_width(&damage[0]),
> -			damage_rect_height(&damage[0]), 0, 1.0, 0);
> +			rect_width(&damage[0]),
> +			rect_height(&damage[0]), 0, 1.0, 0);
>  	igt_put_cairo_ctx(cr_2);
>  	igt_put_cairo_ctx(cr_1);
>  	igt_plane_set_fb(data->primary, &fb_1);
> @@ -1238,8 +1275,8 @@ static void atomic_plane_damage(data_t *data)
> =20
>  	cr_1 =3D igt_get_cairo_ctx(data->drm_fd, &fb_1);
>  	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
> -			damage_rect_width(&damage[0]),
> -			damage_rect_height(&damage[0]), 1.0, 1.0, 0);
> +			rect_width(&damage[0]),
> +			rect_height(&damage[0]), 1.0, 1.0, 0);
>  	igt_put_cairo_ctx(cr_1);
>  	igt_plane_set_fb(data->primary, &fb_1);
>  	igt_plane_set_size(data->primary, data->fb.width, data->fb.height);
> @@ -1266,11 +1303,11 @@ static void atomic_plane_damage(data_t *data)
> =20
>  	cr_1 =3D igt_get_cairo_ctx(data->drm_fd, &fb_1);
>  	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
> -			damage_rect_width(&damage[0]),
> -			damage_rect_height(&damage[0]), 0, 1.0, 1.0);
> +			rect_width(&damage[0]),
> +			rect_height(&damage[0]), 0, 1.0, 1.0);
>  	igt_paint_color(cr_1, damage[1].x1, damage[1].y1,
> -			damage_rect_width(&damage[1]),
> -			damage_rect_height(&damage[1]), 0, 1.0, 0);
> +			rect_width(&damage[1]),
> +			rect_height(&damage[1]), 0, 1.0, 0);
>  	igt_put_cairo_ctx(cr_1);
>  	igt_plane_set_fb(data->primary, &fb_1);
>  	igt_plane_set_size(data->primary, data->fb.width, data->fb.height);
> @@ -1299,11 +1336,11 @@ static void atomic_plane_damage(data_t *data)
> =20
>  	cr_1 =3D igt_get_cairo_ctx(data->drm_fd, &fb_1);
>  	igt_paint_color(cr_1, damage[0].x1, damage[0].y1,
> -			damage_rect_width(&damage[0]),
> -			damage_rect_height(&damage[0]), 1.0, 0, 0);
> +			rect_width(&damage[0]),
> +			rect_height(&damage[0]), 1.0, 0, 0);
>  	igt_paint_color(cr_1, damage[1].x1, damage[1].y1,
> -			damage_rect_width(&damage[1]),
> -			damage_rect_height(&damage[1]), 1.0, 1.0, 1.0);
> +			rect_width(&damage[1]),
> +			rect_height(&damage[1]), 1.0, 1.0, 1.0);
>  	igt_put_cairo_ctx(cr_1);
>  	igt_plane_set_fb(data->primary, &fb_1);
>  	igt_plane_set_size(data->primary, data->fb.width, data->fb.height);
> @@ -1322,6 +1359,128 @@ static void atomic_plane_damage(data_t *data)
>  	igt_remove_fb(data->drm_fd, &fb_2);
>  }
> =20
> +static uint32_t to_argb(uint32_t r, uint32_t g, uint32_t b)
> +{
> +	uint32_t color =3D 0xff000000;
> +	uint8_t temp_r =3D r >> 24;
> +	uint8_t temp_g =3D g >> 24;
> +	uint8_t temp_b =3D b >> 24;
> +
> +	color |=3D temp_r << 16;
> +	color |=3D temp_g << 8;
> +	color |=3D temp_b;
> +
> +	return color;

This seems to be Cairo ARGB32 format, IOW on a little-endian machine
it's DRM_FORMAT_ARGB8888, and on a big-endian machine it's
DRM_FORMAT_BGRA8888. Ok per se.

> +}
> +
> +static void test_solid_fill_plane(data_t *data, igt_output_t *output, ig=
t_plane_t *plane)
> +{
> +	drmModeModeInfo *mode =3D igt_output_get_mode(output);
> +	struct drm_mode_rect rect =3D { 0 };
> +	struct igt_fb ref_fb;
> +	igt_pipe_crc_t *pipe_crc;
> +	igt_crc_t ref_crc, new_crc;
> +	enum pipe pipe =3D data->pipe->pipe;
> +	int height, width, i;
> +	int ret;
> +
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_SOLID_FILL));
> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_PIXEL_SOURCE));
> +
> +	rect.x1 =3D 0;
> +	rect.x2 =3D mode->hdisplay;
> +	rect.y1 =3D 0;
> +	rect.y2 =3D mode->vdisplay;
> +
> +	width =3D rect_width(&rect);
> +	height =3D rect_height(&rect);
> +
> +	igt_plane_set_position(plane, rect.x1, rect.y1);
> +	pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> +			    IGT_PIPE_CRC_SOURCE_AUTO);
> +
> +
> +	for (i =3D 0; i < ARRAY_SIZE(colors); i++) {
> +		uint32_t r =3D colors[i].r;
> +		uint32_t g =3D colors[i].g;
> +		uint32_t b =3D colors[i].b;
> +		cairo_format_t fmt;
> +		uint32_t *fb_data;
> +
> +		struct drm_mode_create_blob c;
> +		struct drm_mode_destroy_blob d;
> +		struct drm_mode_solid_fill blob_data =3D {
> +			.r =3D r,
> +			.g =3D g,
> +			.b =3D b,
> +			.pad =3D 0x0,
> +		};
> +
> +		c.data =3D (uintptr_t) &blob_data;
> +		c.length =3D sizeof(blob_data);
> +
> +		igt_debug("Testing color r: 0x%x (%f), g: 0x%x (%f), b: 0x%x (%f)\n",
> +				r, unorm_to_float(r),
> +				g, unorm_to_float(g),
> +				b, unorm_to_float(b));
> +
> +		/* get reference CRC */
> +		igt_create_color_fb(data->drm_fd, width, height,
> +				    DRM_FORMAT_ABGR8888, DRM_FORMAT_MOD_LINEAR,

Any particular reason to pick ABGR?

Does this format even get used, given it does not match any Cairo
format?

> +				    unorm_to_float(r),
> +				    unorm_to_float(g),
> +				    unorm_to_float(b),
> +				    &ref_fb);
> +		igt_plane_set_fb(plane, &ref_fb);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		igt_get_cairo_ctx(ref_fb.fd, &ref_fb);
> +		fb_data =3D (void *)cairo_image_surface_get_data(ref_fb.cairo_surface);
> +		fmt =3D cairo_image_surface_get_format(ref_fb.cairo_surface);
> +
> +		/*
> +		 * Check to make sure Cairo float->u8 conversion matches
> +		 * expected ARGB8888 value
> +		 */
> +		if (fmt =3D=3D CAIRO_FORMAT_ARGB32 && fb_data[0] !=3D to_argb(r, g, b)=
) {
> +			igt_warn("Resulting framebuffer data doesn't match color!\n");
> +			continue;

Should this not be a test harness failure? Whatever IGT uses to
indicate that. Not getting CAIRO_FORMAT_ARGB32 should also be a test
harness failure, because otherwise it silently stops checking the color.

The check seems good.

I see nothing else to complain about. :-)


Thanks,
pq

> +		}
> +
> +		igt_pipe_crc_start(pipe_crc);
> +		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
> +
> +		ret =3D drmIoctl(data->display.drm_fd, DRM_IOCTL_MODE_CREATEPROPBLOB, =
&c);
> +		igt_assert(ret =3D=3D 0);
> +
> +		/* test solid fill plane */
> +		igt_plane_set_solid_fill(plane, &rect, c.blob_id);
> +		igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_SOURCE, "SOLID_FILL");
> +
> +		igt_display_commit_atomic(&data->display,
> +					  DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					  NULL);
> +
> +		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &new_crc);
> +
> +		igt_assert_crc_equal(&ref_crc, &new_crc);
> +
> +		/* Switch back to FB pixel source */
> +		igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_SOURCE, "FB");
> +
> +		d.blob_id =3D c.blob_id;
> +		ret =3D drmIoctl(data->drm_fd, DRM_IOCTL_MODE_DESTROYPROPBLOB, &d);
> +		igt_assert(ret =3D=3D 0);
> +	}
> +
> +	igt_plane_set_prop_value(plane, IGT_PLANE_SOLID_FILL, 0);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	igt_pipe_crc_stop(pipe_crc);
> +	igt_pipe_crc_free(pipe_crc);
> +	igt_remove_fb(data->drm_fd, &ref_fb);
> +}
> +
>  static void atomic_setup(data_t *data, enum pipe pipe, igt_output_t *out=
put)
>  {
>  	drmModeModeInfo *mode;
> @@ -1634,6 +1793,20 @@ igt_main_args("e", NULL, help_str, opt_handler, NU=
LL)
>  		}
>  	}
> =20
> +	igt_describe("Test case for solid fill primary planes");
> +	igt_subtest_with_dynamic("plane-primary-solid-fill") {
> +		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
> +
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(=
output)) {
> +				atomic_setup(&data, pipe, output);
> +				test_solid_fill_plane(&data, output, data.primary);
> +				atomic_clear(&data, pipe, output);
> +			}
> +		}
> +	}
> +
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
>=20


--Sig_/mUvQXmM3XdMow2hihtG0Qjt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmX68H0ACgkQI1/ltBGq
qqe3/w//appvtoUINkXOzanAovW38AlGG5ARfeanJeQva0fsSNviZNqVZ/0077EJ
71DTwHEFukCpmFl9oUpIBKnxDsf02FSv9SQcLCbq46QmDkXkddBB/EPZJ8rghWW1
qyjRlCjLur5imYwSbUQx7zWr6VIsdOv9M9cxCyBQ/5C/QrCLMMNk8bNm6NizAhb0
iHiJfjG/OQbdV2fNq/KYs7nTsJWtDkBMBy2+1S83ELs2bvFKZAMS52kjoHcwnZF1
oaEVjM7C27MobtHyz2CmsnDvOHFDx/ajNfcULYMu5PK2bmnZekZ6KxYEK5RIexoq
kECLpFFxPi2qKhCpu8xPiOLGT5TIZ3sM7zSsZrxLlvRVgJgBjH9GUiBilPM3W4uJ
PhsNiibMeqy+u9DgunlSVImgqzFFJq+kIzoPyVnZ8VoSYXxY2UrIHUSOvKgt7tgw
QgsfTZS4yXMauBxzKZ4f+AJBzeFyI7HuZIas+MBx0rRiXY0ZJlDuSDHz6fNAfmHD
iBp4ImxYnGvR/ZclqNpJiqbJ3xo21w1REPZqzNfTJfHfvE2MDc8gYCa+MOP0+MQw
cpKIqUnWz51jmC7tQ6AJMxpZc5QpknEYgLq7/nU+8chqJGEn20wWAxkyHF7IQajb
DxWIJ7OHfprduPP9hOcx/yviErchqPKLQ6kZyiO8Sys8IsudHtc=
=mft8
-----END PGP SIGNATURE-----

--Sig_/mUvQXmM3XdMow2hihtG0Qjt--
