Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2735BE77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 15:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8AA10E0D4;
	Wed, 18 Dec 2024 15:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ujeuo+I2";
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7D710E0D4
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 15:09:46 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2ee50ffcf14so769708a91.0
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 07:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734534585; x=1735139385; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pWziDCR0HGgEx3RsORey+qU9r6GqzKZPL7sSysacikg=;
 b=Ujeuo+I21clHFvjEnm3GelVHfv35LRqcmHB6GhxwJod5xvwKOtOKHDa3M5EVIaAZzh
 fwNH1/iLC+9nT4jdItttYFbGnJvBQhkqthCmYV0G60WC8Jb6PqwZ3MFarkCMkKoUmlwD
 C9mw9jmKGI0d6Hths2mQ/8LerC9rrLbxTUpBgBBPDRAJjrAGT9upMDvv+BsLmQrzn/Oj
 LifnXoubVl/sRNfny7OxuEUyskgvSx/EAsFvlht+I0o0+XmESZW3OAKxlNqSUbhrJWGq
 +fMKl0k2Fnr9Fv6LjYo3Ls/fdeoS0zg0365cNfEr9RN7hjvr0JIW/UZvLDxdvPCYH6uW
 SbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734534585; x=1735139385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pWziDCR0HGgEx3RsORey+qU9r6GqzKZPL7sSysacikg=;
 b=ep65PB7xCbf2u0zYuuB8c2VHgw5f5ivIkjUhgq6ljxvU/fBBn19bR850k4S8XjlLWG
 UThDXYVfo9lfwGJmhWZyJiHX/zQqTemIqw8DoI2vuQx20TftdIqS47YYW5Y3IubflSOd
 Oml3HRzrIBNw7Hi+K3OtJ3Mqv7ZGRob+YDmF+5gmcRa4eYMCYXQC4KWhOcuUpyAsGk/N
 KwY7jlS+s0ZOT087YEw5S/g291Sk722xq10PUIwzcLDie3lra+9eVHLzM+uuA3b42xis
 o1Y3iEBIbS3vto74gdA27cKz1JAUYXE/KKdQHaS1dEVJeytzvHk5yMBmcop7uIO7CA3H
 sfag==
X-Gm-Message-State: AOJu0YzH2uNvp6tpC63ZmXRlsFl+pGcBqHYBoqC+JtdZbFkrIUorwcKG
 DM9VxT6sGuOBIiBwRc82KNo9IaYwhIqKs39oD8oyzLUi3f+wLShDni625QfVYdcYvVc2BoDZcwC
 wDE7oXkI4iUe0ZLaaiinIIZLWi2A=
X-Gm-Gg: ASbGnctxfXb9rZzOS9rFptnvMuPS+iA5WzdDY8TzeUOPMYiP93LxhUk+HoRQHG5GOMP
 hnAkJTetSB+9Qk9SNUHNNcPIsTnK+zBi583RyYhGD
X-Google-Smtp-Source: AGHT+IFDRdHba4KLcsz9kiZcG7BzLTVo1EGV8yUwLe/DbfMnK+vVbTMir1B2h3fjH76T2IkEf8dJxMA65nCrm4kaUeo=
X-Received: by 2002:a17:90b:38ca:b0:2ef:9dbc:38d1 with SMTP id
 98e67ed59e1d1-2f2d87bd3d7mr10387304a91.5.1734534585505; Wed, 18 Dec 2024
 07:09:45 -0800 (PST)
MIME-Version: 1.0
References: <20241122084804.29669-1-ville.syrjala@linux.intel.com>
 <20241122084804.29669-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20241122084804.29669-5-ville.syrjala@linux.intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 18 Dec 2024 17:09:33 +0200
Message-ID: <CAJ=qYWTmeNvM6ZR5LbZvqb106HHoLfBVPHBYQTN67SEdVDMBxw@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 4/4] tests/intel/gem_draw: Test igt_draw without
 kms
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On Fri, Nov 22, 2024 at 10:48=E2=80=AFAM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
>
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> kms_draw_crc is our only way to confirm that igt_draw
> linear<->tiled conversion routines are correct. That may
> not cover every case as we could be hitting display
> specific limitations that prevent testing everything.
>
> Introduce a new gem_draw test case that compares igt_draw
> mmap/pwrite methods against GTT mmaps. This will verify that
> the software conversion routines match the hardware (de)tiling
> peformed via the fenced region.
>
> TODO: could verify against blt/rendercopy
>       when gtt mmaps are not available...
>
> v2: Drop the "driver requirement: i915" to make it past
>     the documentation build scripts
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/gem_draw.c | 233 +++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build      |   1 +
>  2 files changed, 234 insertions(+)
>  create mode 100644 tests/intel/gem_draw.c
>
> diff --git a/tests/intel/gem_draw.c b/tests/intel/gem_draw.c
> new file mode 100644
> index 000000000000..86df7c33ff2d
> --- /dev/null
> +++ b/tests/intel/gem_draw.c
> @@ -0,0 +1,233 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: gem draw
> + * Category: GEM
> + * Description: Tests whether the igt_draw library actually works.
> + * Functionality: tiling
> + * Test category: functionality test
> + */
> +
> +/**
> + * SUBTEST: draw-method-%s
> + * Description: Verify that igt draw library works for the %arg[1] metho=
d with
> + *              different tilings and color depths.
> + *
> + * arg[1]:
> + *
> + * @mmap-cpu:     MMAP-CPU
> + * @mmap-wc:      MMAP-WC
> + * @pwrite:       PWRITE
> + */
> +
> +#include "i915/gem.h"
> +#include "i915/gem_create.h"
> +#include "igt.h"
> +#include "igt_halffloat.h"
> +#include "igt_primes.h"
> +
> +int drm_fd;
> +struct buf_ops *bops;
> +
> +static const enum igt_draw_method draw_methods[] =3D {
> +       IGT_DRAW_MMAP_CPU,
> +       IGT_DRAW_MMAP_WC,
> +       IGT_DRAW_PWRITE,
> +};
> +
> +static const uint32_t tilings[] =3D {
> +       I915_TILING_NONE,
> +       I915_TILING_X,
> +       I915_TILING_Y,
> +};
> +
> +static uint64_t read_pixel(const void *ptr, int stride, int x, int y, in=
t bpp)
> +{
> +       ptr +=3D y * stride + x * bpp / 8;
> +
> +       switch (bpp) {
> +       case 8:
> +               return *(const uint8_t*)ptr;
> +       case 16:
> +               return *(const uint16_t*)ptr;
> +       case 32:
> +               return *(const uint32_t*)ptr;
> +       case 64:
> +               return *(const uint64_t*)ptr;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static void check_rect(const void *ptr, int stride,
> +                      int x0, int y0, int w, int h,
> +                      uint64_t color, int bpp)
> +{
> +       int x1 =3D x0 + w - 1;
> +       int y1 =3D y0 + h - 1;
> +
> +       if (bpp < 64)
> +               color &=3D (1ull << bpp) - 1;
> +
> +       /* only check the corners to speed this up a bit */
> +       igt_assert_eq(read_pixel(ptr, stride, x0, y0, bpp), color);
> +       igt_assert_eq(read_pixel(ptr, stride, x0, y1, bpp), color);
> +       igt_assert_eq(read_pixel(ptr, stride, x1, y0, bpp), color);
> +       igt_assert_eq(read_pixel(ptr, stride, x1, y1, bpp), color);
> +}
> +
> +static void draw(enum igt_draw_method method,
> +                int width, int height,
> +                uint32_t stride, int bpp, uint32_t tiling)
> +{
> +       uint64_t size =3D stride * height;
> +       uint64_t color;
> +       uint32_t handle;
> +       void *ptr;
> +
> +       igt_require(buf_ops_has_tiling_support(bops, tiling));
> +
> +       handle =3D gem_create(drm_fd, size);
> +       gem_set_tiling(drm_fd, handle, tiling, stride);
> +
> +       color =3D 0x0123456789abcdef;
> +       for (int y =3D 0 ; y < height;) {
> +               int y_next =3D min(height, (int)igt_next_prime_number(y))=
;
> +               int h =3D y_next - y;
> +
> +               for (int x =3D 0; x < width; ) {
> +                       int x_next =3D min(width, (int)igt_next_prime_num=
ber(x));
> +                       int w =3D x_next - x;
> +
> +                       igt_draw_rect(drm_fd, bops, 0, handle, size, stri=
de,
> +                                     width, height, tiling, method,
> +                                     x, y, w, h, color, bpp);
> +
> +                       color =3D igt_ror(color, 1, 64);
> +
> +                       x =3D x_next;
> +               }
> +
> +               y =3D y_next;
> +       }
> +
> +       gem_set_domain(drm_fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMA=
IN_GTT);
> +
> +       ptr =3D gem_mmap__gtt(drm_fd, handle, size, PROT_READ);
> +
> +       color =3D 0x0123456789abcdef;
> +       for (int y =3D 0 ; y < height;) {
> +               int y_next =3D min(height, (int)igt_next_prime_number(y))=
;
> +               int h =3D y_next - y;
> +
> +               for (int x =3D 0; x < width; ) {
> +                       int x_next =3D min(width, (int)igt_next_prime_num=
ber(x));
> +                       int w =3D x_next - x;
> +
> +                       check_rect(ptr, stride, x, y, w, h, color, bpp);
> +
> +                       color =3D igt_ror(color, 1, 64);
> +
> +                       x =3D x_next;
> +               }
> +
> +               y =3D y_next;
> +       }
> +
> +       munmap(ptr, size);
> +
> +       gem_close(drm_fd, handle);
> +}
> +
> +static void draw_method_subtest(enum igt_draw_method method,
> +                               int bpp, uint32_t tiling)
> +{
> +       const struct intel_device_info *info =3D
> +               intel_get_device_info(intel_get_drm_devid(drm_fd));
> +       int width, height, stride;
> +       int tile_w, tile_h;
> +
> +       if (info->graphics_ver =3D=3D 2) {
> +               tile_w =3D 128;
> +               tile_h =3D 16;
> +       } else if (tiling =3D=3D I915_TILING_X ||
> +                  info->is_grantsdale || info->is_alviso) {
> +               tile_w =3D 512;
> +               tile_h =3D 8;
> +       } else {
> +               tile_w =3D 128;
> +               tile_h =3D 32;
> +       }
> +
> +       stride =3D 4 * tile_w;
> +       width =3D stride * 8 / bpp;
> +       height =3D 4 * tile_h;
> +
> +       draw(method, width, height, stride, bpp, tiling);
> +}
> +
> +static void setup_environment(void)
> +{
> +       drm_fd =3D drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> +       igt_require(drm_fd >=3D 0);
> +       bops =3D buf_ops_create(drm_fd);
> +
> +       /* need hardware to untile for verification */
> +       gem_require_mappable_ggtt(drm_fd);
> +}
> +
> +static void teardown_environment(void)
> +{
> +       buf_ops_destroy(bops);
> +       drm_close_driver(drm_fd);
> +}
> +
> +static const char *tiling_str(uint32_t tiling)
> +{
> +       switch (tiling) {
> +       case I915_TILING_NONE :
> +               return "untiled";
> +       case I915_TILING_X :
> +               return "xtiled";
> +       case I915_TILING_Y :
> +               return "ytiled";
> +       default:
> +               igt_assert(false);
> +       }
> +}
> +
> +igt_main
> +{
> +       int method_idx, tiling_idx;
> +
> +       igt_fixture
> +               setup_environment();
> +
> +       for (method_idx =3D 0; method_idx < ARRAY_SIZE(draw_methods); met=
hod_idx++) {
> +               enum igt_draw_method method =3D draw_methods[method_idx];
> +
> +               igt_describe_f("Verify that igt draw library works for th=
e draw "
> +                              "method (%s) with different tilings and co=
lor depths.",
> +                              igt_draw_get_method_name(method));
> +
> +               igt_subtest_with_dynamic_f("draw-method-%s", igt_draw_get=
_method_name(method)) {
> +                       if (!igt_draw_supports_method(drm_fd, method))
> +                               continue;
> +
> +                       for (tiling_idx =3D 0; tiling_idx < ARRAY_SIZE(ti=
lings); tiling_idx++) {
> +                               uint32_t tiling =3D tilings[tiling_idx];
> +
> +                               for (int bpp =3D 8; bpp <=3D 64; bpp *=3D=
 2) {
> +                                       igt_dynamic_f("%dbpp-%s", bpp, ti=
ling_str(tiling))
> +                                               draw_method_subtest(metho=
d, bpp, tiling);
> +                               }
> +                       }
> +               }
> +       }
> +
> +       igt_fixture
> +               teardown_environment();
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 2724c7a9a6e6..9bcace851c33 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -118,6 +118,7 @@ intel_i915_progs =3D [
>         'gem_ctx_shared',
>         'gem_ctx_sseu',
>         'gem_ctx_switch',
> +       'gem_draw',
>         'gem_eio',
>         'gem_evict_alignment',
>         'gem_evict_everything',
> --
> 2.45.2
>
