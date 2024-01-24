Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37BFC46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 09:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783AB10E84E;
	Wed, 24 Jan 2024 09:13:30 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEEC10E84E
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706087607;
 bh=4jhQ9Yqb8RQuDYHEbeD6NbqC7I9b7MqqmI/vWKvJ7z0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2LtUUuQ8DuqNqOPHvCyDX2xAcOlVHpSqp9/PLMgPEYh5gNvRXMIg2gwwk2mYXQfiw
 OG+q604lm4HK1+A70tCMr4pJ7pIV5XE9cn4YWqdIy3K9uw3lrkAYp54QbSFAmzd9ND
 DcpaeGORGki2rq6U6lDCZEFIqkWCied29gF1pBUyF5Fer+Kn9K05tYlh3KdjoxaBBB
 wJe9tBqyn7uJwXUki/ZBeTY78YOHMB6azr8NPe2v7z/KXXczDc55vRY7Z/11YrSRHR
 D9DVbGh2avXeKVUJcLZKyUvg4Uu2yvlkoMkbtWX9oE/6trkpNCkq05IurnAlJ6fqWR
 pl5FZeunMlWFQ==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7482C37802F2;
 Wed, 24 Jan 2024 09:13:26 +0000 (UTC)
Date: Wed, 24 Jan 2024 11:13:25 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH i-g-t v2 5/6] tests/kms_atomic: Add solid fill plane
 subtest
Message-ID: <20240124111325.179896e7.pekka.paalanen@collabora.com>
In-Reply-To: <20240123-solid-fill-v2-5-4ecd2cf767fe@quicinc.com>
References: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
 <20240123-solid-fill-v2-5-4ecd2cf767fe@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CD0E1zvWnUMRiWo/jrEff.u";
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
Cc: Simon Ser <contact@emersion.fr>, igt-dev@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--Sig_/CD0E1zvWnUMRiWo/jrEff.u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Jan 2024 15:28:58 -0800
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
>  tests/kms_atomic.c | 179 +++++++++++++++++++++++++++++++++++++++++++++++=
------
>  1 file changed, 161 insertions(+), 18 deletions(-)
>=20
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> old mode 100644
> new mode 100755
> index 2b6e9a8f0383..35ac5f198524
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

Hi,

the above looks good to me. More below.

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
> @@ -1322,6 +1359,98 @@ static void atomic_plane_damage(data_t *data)
>  	igt_remove_fb(data->drm_fd, &fb_2);
>  }
> =20
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
> +				    unorm_to_float(r),
> +				    unorm_to_float(g),
> +				    unorm_to_float(b),

I'm slightly wary of trusting a third party library (Cairo? Pixman?)
with the float->u8 conversion. If both Cairo and the kernel do the same
mistake in conversion, the test would pass. Therefore, this is actually
testing that the kernel follows Cairo's conversion, and not the UAPI
definition, should the unthinkable happen that they disagreed.

Would it at least be possible to verify the FB value against what we
expect here?

> +				    &ref_fb);
> +		igt_plane_set_fb(plane, &ref_fb);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
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

Looking good.

> +
> +		/* Switch back to FB pixel source */
> +		igt_plane_set_prop_value(plane, IGT_PLANE_SOLID_FILL, 0);
> +		igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_SOURCE, "FB");
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);

Just wondering, why set this at the end and not when you are actually
setting up the FB? Doesn't IGT sanitize KMS state before tests that
don't explicitly test boot-up state?


Thanks,
pq

> +
> +		d.blob_id =3D c.blob_id;
> +		ret =3D drmIoctl(data->drm_fd, DRM_IOCTL_MODE_DESTROYPROPBLOB, &d);
> +		igt_assert(ret =3D=3D 0);
> +	}
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
> @@ -1634,6 +1763,20 @@ igt_main_args("e", NULL, help_str, opt_handler, NU=
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


--Sig_/CD0E1zvWnUMRiWo/jrEff.u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmWw1LUACgkQI1/ltBGq
qqe7Yw/8CEOxI2R2+0+ACv3T8UHEDzNHHesquJ1r5iTHemk2A59i+LAJP+MiM1uG
+f0pKYSd8YYUY2cqusqXssIuOafFSenBdfFgCnTklt2XK1kcCK0RnPAvT5aETtED
ZX5fXBjYmtCg9/RZthIclOi/EVcDpEKHWrRJXCCkliZVyDXJIMywDFTSYV0g65WJ
qs/dATM6dKfjlQ1MO6Vb+f9MDzjk2VidJjJGvCjfYmSIlHlh5q4Km0WMstUz7sdo
TcfQVCIE4kgwkU+L0zpw9XL+QXF56Sl4iB5saFRQDrx5dlLIkqXZ3qff1Q9Q8F3z
UeOxcdKOb1JFQGbdy85VwZIsFzsajb64iDmaVyppPnGP0PRJ4Qq3M+nVxzRtsOO5
I+hQSDK1vrhWoa2uAm8hwH1/4yrfF8aZP1Fx0b+CxM/A/YglsoZRrE0aGkb1Cvkb
mhk4c3a6wh5dxMVB04URJHT7oSD33aLKlYg1uoxVGsUJnAkLaUsiMs4Z1UTkvZqI
vNekoj7uLU/CwCCdPrUlD/HFaSAFqnVdzu6qRv5nndMbrhTfzsC0MIH/C2w5tUKI
xLnmESk+BRG5sTBqt3oEiEop5qQCbJRQM0+vOuaO3u2J9IZW2UlUPLfNSZHNaUgX
e41NrmvXl6LrdEkJ12dc0LgBKEtBogcmA4NbdXCC01EmuMq/Pzo=
=0TDV
-----END PGP SIGNATURE-----

--Sig_/CD0E1zvWnUMRiWo/jrEff.u--
