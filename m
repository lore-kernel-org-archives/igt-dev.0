Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B316FC02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 14:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7074E10ECA8;
	Fri, 14 Feb 2025 14:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gVbCCM8O";
	dkim-atps=neutral
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9186010ECBC
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 14:19:15 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2fa2eb7eb45so5243474a91.1
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 06:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739542755; x=1740147555; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4CXiAtXjoFdf+JJ+be/xJt9oghLx5kiuvsS1EtV3Vk8=;
 b=gVbCCM8OdMz3mONpyoi2PPCoSRzEfSbfkURh4rmZoSfAfATH02NiK4CblFca1iFKQI
 haKTbog6nSr6DNoa6BXJR50I7kGzI9oXTPk+kbC4n+qZ51mi7D2M/KmVj8JQJPmEswJ0
 Ci46E/Iuiw/aO3Bu/nJOiBTAWISK6ZUz1a1GYnP16chYlTW64Rryknot6aRBd7rPNhw0
 YcaOaX0mRuUeRg/Z2/vhk3s1RoPXfd5g/9oC+INBHXloZPZDyzscMysSvd6d2nStGw+T
 UZwGSQhTpjoEHuTVbYKXQcCR3uS9JWcR1Q/MIxt31mp5QRXQJwjftinOo0IaCzT9nNT2
 akKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739542755; x=1740147555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4CXiAtXjoFdf+JJ+be/xJt9oghLx5kiuvsS1EtV3Vk8=;
 b=QfFn/NJTud9SUr2IFkz1YV8kpoErv+51agyEjQGT7M8C+ICDc73mKL/XCT/EHsv7ok
 LZ6gC7znikDleXv1A9d4jxAWbZGb35r5UG0RCkpBIHicG4CiI3WHTXzC0WILLJjYiHWU
 +dG6o/MAuhAuOET5k6rlQoOEiaMFAhS0H4IC9fw89yJ6U3Mi4Xr9ViKJ6wxGiSgWdZgD
 nwsaXB1ArjFD7mTZFUjvSGHUvXCMnTzbm+xkVH9MKiMfTfldmMfVqH8BM1ybenAeelzL
 52RdQiA8d/92JPIjVN0I5jXJpix/Y1jQfEGi8d6F49vjlKaL4KGJCxmKGA7HV8etSqjt
 ybJw==
X-Gm-Message-State: AOJu0YwDhIS9rx6K5RO1Muu8VIf/3zqPG0N0kwJqSFY3qajCTHN3m+GF
 sDJD/1hthfSqRQe7QtQnh43KCPzZKLHrkOf9KMOPPToPnRYYofRGuSulpQK/8ocUxJpkjCq/SK8
 KUD652DgSSeIy9bUNhhrbxLiQIq8zigE9X8ipxQ==
X-Gm-Gg: ASbGncsfEuRmtKFGCpq8fyNPFGHrNOwcUUMlhJ4NIHssxwXW9j/n6uqv+ws5BBqdAPS
 jMIswqnxU276ZmXrq4gQ28VAEWfb9apAkLLkbeO6tjLdkHw3Uk8mYfPOb10Rizcg0Hv/OJ4JxRz
 8=
X-Google-Smtp-Source: AGHT+IGoANiVK/ufYbr54l7q2jah/UbIT6SB3Fo29w81ngY8xMMIM2CGVxPNKX5AbLtbpwug7m47R2J66I+UWeLoGMU=
X-Received: by 2002:a05:6a00:2292:b0:725:4a1b:38ec with SMTP id
 d2e1a72fcca58-7323c45aa40mr14542819b3a.3.1739542754805; Fri, 14 Feb 2025
 06:19:14 -0800 (PST)
MIME-Version: 1.0
References: <20250214091143.1265210-1-santhosh.reddy.guddati@intel.com>
 <20250214091143.1265210-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250214091143.1265210-2-santhosh.reddy.guddati@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Fri, 14 Feb 2025 16:19:03 +0200
X-Gm-Features: AWEUYZkNOLuLj_81svsKkZYn7vKdaFFzxD6lh8p1f2Hb__v1ABVojKUB8OuzeXQ
Message-ID: <CAJ=qYWSVYncNszbVroSVuK+33hHfJXhgoQAqSuG7PgnuBHUz_w@mail.gmail.com>
Subject: Re: [PATCH i-g-t v9 1/1] tests/intel/kms_dirty_fbc: Add tests to
 validate FBC dirty rectangle feature
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org, vinod.govindapillai@intel.com, 
 jeevan.b@intel.com, kunal1.joshi@intel.com, ramanaidu.naladala@intel.com, 
 swati2.sharma@intel.com
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

Hi Santosh,

some drive-by comments below

On Fri, Feb 14, 2025 at 11:14=E2=80=AFAM Santhosh Reddy Guddati
<santhosh.reddy.guddati@intel.com> wrote:
>
> This feature allows FBC to recompress a subsection of a frame.
> When the Dirty Rectangle Enable bit is set in the FBC_DIRTY_CTL register,
> and there is a sync flip indication, display will read the scanlines
> between (and including) the Dirty Rectangle Start Line and End Line,
> in FBC_DIRTY_RECTANGLE, from the uncompressed frame buffer.
>
> Utilise the FP_DAMAGE_CLIPS property in the below subtests to validate
> the feature.
>
> 1.Implement basic tests for Frame Buffer Compression (FBC) with dirty rec=
tangles.
> 2.Add tests for dirty rectangles outside the visible region.
> 3.Include tests for dirtyfb functionality.
> 4.Support different formats in FBC dirty rectangle tests.
> 5.Ensure proper CRC validation for each test case.
>
> v2: Fix typo , add version check for feature support,
>     extend support for all pipes (Rama Naidu).
>
> v3: Add new subtest to scatter dirty rectangles at differnt places in a
>     frame and commit all rectangles at once (Rama Naidu).
>     Add a negative case with invalid coordinates (Vinod)
>
> v4: Add subtest `fbc-dirty-rectangle-basic` to perform sanity checks
>     by sending multiple damaged areas with non-PSR modes.(Vinod)
>     Update `meson.build` to include the new test.
>
> v5: Include checks to ensure FBC is enabled during tests.(Vinod)
>     Add dynamic subtests for fbc-dirty-rectangle-different-formats
>     and fbc-dirty-rectangle-dirtyfb-ioctl. (Vinod)
>
> v6: Update meson.build to include kms_fbc_dirty_rect.
>
> v7: Add commit description, remove i915 check and remove
>     redundant checks (Swathi)
>     Reformat code by removing redundant usage.
>     Add new test to verify dirty rect outside-visible-region.
>
> v8: Include test description and documentation for subtests.
>     Updated framebuffer to target the specific area,
>     avoiding a full screen update and making the damage area
>     check effective (Vinod).
>     Add new subtest fbc-dirty-rectangle-dirtyfb-tests (Vinod)
>
> v9: Improve commit message and description.
>     Disable psr on supported sinks to validate fbc tests (Vinod)
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/intel/kms_fbc_dirty_rect.c | 653 +++++++++++++++++++++++++++++++
>  tests/meson.build                |   1 +
>  2 files changed, 654 insertions(+)
>  create mode 100644 tests/intel/kms_fbc_dirty_rect.c
>
> diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty=
_rect.c
> new file mode 100644
> index 000000000..a6519772d
> --- /dev/null
> +++ b/tests/intel/kms_fbc_dirty_rect.c
> @@ -0,0 +1,653 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms dirty fbc
> + * Category: Display
> + * Description: Test DIRTYFB ioctl functionality with FBC enabled.
> + * Driver requirement: i915, xe

Here says i915 but in igt_main is done drm_open_driver_master(DRIVER_XE);

> + * Functionality: dirtyfb, fbc
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
> +#include <sys/types.h>
> +
> +#include "igt.h"
> +
> +#include "igt_sysfs.h"
> +#include "i915/gem.h"
> +#include "i915/gem_create.h"
> +#include "i915/intel_drrs.h"
> +#include "igt_psr.h"
> +
> +#include "i915/intel_fbc.h"
> +#include "intel_mocs.h"
> +#include "intel_pat.h"
> +
> +#include "xe/xe_query.h"
> +
> +/**
> + * SUBTEST: fbc-dirty-rectangle-basic
> + * Description: Sanity test to verify FBC DR by sending multiple damaged=
 areas with non psr modes
> + * Functionality: fbc
> + *
> + * SUBTEST: fbc-dirty-rectangle-out-visible-area
> + * Description: Sanity test to verify FBC DR by sending multiple damaged=
 areas with non psr modes
> + * Functionality: fbc
> + *
> + * SUBTEST: fbc-dirty-rectangle-dirtyfb-tests
> + * Description: Sanity test to verify FBC DR by sending multiple damaged=
 areas with non psr modes
> + * Functionality: fbc
> + *
> + * SUBTEST: fbc-dirty-rectangle-different-formats
> + * Description: Sanity test to verify FBC DR by sending multiple
> + *              damaged areas with different formats.
> + * Functionality: fbc
> + *
> + */
> +
> +#ifndef PAGE_SIZE
> +#define PAGE_SIZE 4096
> +#endif
> +
> +#define SQUARE_SIZE 100
> +#define SQUARE_OFFSET 100
> +#define SQUARE_OFFSET_2 600
> +#define SQUARE_OFFSET_OUTSIDE_Y 1850

Look like SQUARE_OFFSET_OUTSIDE_Y is not used for anything

> +
> +typedef struct {
> +       int drm_fd;
> +       int debugfs_fd;
> +       igt_display_t display;
> +       drmModeModeInfo *mode;
> +       igt_output_t *output;
> +       igt_pipe_crc_t *pipe_crc;
> +       enum pipe pipe;
> +       u32 format;
> +
> +       igt_crc_t ref_crc;
> +
> +       enum {
> +               FEATURE_NONE  =3D 0,
> +               FEATURE_PSR   =3D 1,
> +               FEATURE_FBC   =3D 2,
> +               FEATURE_DRRS  =3D 4,
> +               FEATURE_COUNT =3D 8,
> +               FEATURE_DEFAULT =3D 8,
> +       } feature;
> +} data_t;
> +
> +enum color {
> +       BLACK,
> +       RED,
> +       GREEN,
> +       BLUE,
> +       WHITE,
> +};

Not sure what's the benefit using this enum?

> +
> +static void set_damage_clip(struct drm_mode_rect *damage, int x1, int y1=
, int x2, int y2)
> +{
> +       damage->x1 =3D x1;
> +       damage->y1 =3D y1;
> +       damage->x2 =3D x2;
> +       damage->y2 =3D y2;
> +}
> +
> +static void set_damage_clip_w(struct drm_mode_rect *damage, int x1, int =
y1, int width, int height)
> +{
> +       set_damage_clip(damage, x1, y1, x1 + width, y1 + height);
> +}
> +
> +static void dirty_rect_draw_white_rects(data_t *data, struct igt_fb *fb,
> +                                       int nrects, struct drm_mode_rect =
*rect)
> +{
> +       cairo_t *cr;
> +
> +       if (!nrects || !rect)
> +               return;
> +
> +       cr =3D igt_get_cairo_ctx(data->drm_fd, fb);
> +
> +       for (int i =3D 0; i < nrects; i++) {
> +               igt_paint_color_alpha(cr, rect[i].x1, rect[i].y1,

Why alpha paint if it's always 1?

> +                                     rect[i].x2 - rect[i].x1,
> +                                     rect[i].y2 - rect[i].y1,
> +                                     1.0, 1.0, 1.0, 1.0);
> +       }
> +
> +       igt_put_cairo_ctx(cr);
> +}
> +
> +static void dirty_rect_create_fb(data_t *data, struct igt_fb *fb, int fb=
_width,
> +                                int fb_height, enum color bg_color)
> +{

Isn't this function just indirect way to call igt_create_color_fb(..)
? You could reduce complexity by calling igt_create_color_fb directly,
if you want to keep those color names you can just define them
something like:

#define RED 1.0, 0.0, 0.0

and then call

igt_create_color_fb(data->drm_fd, fb_width, fb_height,
                                   data->format, DRM_FORMAT_MOD_LINEAR,
                                   RED, fb);

..or so.

> +       switch (bg_color) {
> +       case RED:
> +               igt_create_color_fb(data->drm_fd, fb_width, fb_height,
> +                                   data->format, DRM_FORMAT_MOD_LINEAR,
> +                                   1.0, 0.0, 0.0, fb);
> +               break;
> +       case GREEN:
> +               igt_create_color_fb(data->drm_fd, fb_width, fb_height,
> +                                   data->format, DRM_FORMAT_MOD_LINEAR,
> +                                   0.0, 1.0, 0.0, fb);
> +               break;
> +       case BLUE:
> +               igt_create_color_fb(data->drm_fd, fb_width, fb_height,
> +                                   data->format, DRM_FORMAT_MOD_LINEAR,
> +                                   0.0, 0.0, 1.0, fb);
> +               break;
> +       case WHITE:
> +               igt_create_color_fb(data->drm_fd, fb_width, fb_height,
> +                                   data->format, DRM_FORMAT_MOD_LINEAR,
> +                                   1.0, 1.0, 1.0, fb);
> +               break;
> +       default:
> +       case BLACK:
> +               igt_create_color_fb(data->drm_fd, fb_width, fb_height,
> +                                   data->format, DRM_FORMAT_MOD_LINEAR,
> +                                   0.0, 0.0, 0.0, fb);
> +               break;
> +       }
> +}
> +
> +static void
> +set_damage_area(igt_plane_t *plane,  struct drm_mode_rect *rects,
> +               size_t length)
> +{
> +       igt_plane_replace_prop_blob(plane, IGT_PLANE_FB_DAMAGE_CLIPS, rec=
ts, length);
> +}
> +
> +static void
> +set_fb_and_collect_crc(data_t *data, igt_plane_t *plane, struct igt_fb *=
fb,
> +                      igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
> +{
> +       igt_plane_set_fb(plane, fb);
> +       igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +       igt_pipe_crc_collect_crc(pipe_crc, crc);
> +       igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
> +                                         IGT_LOG_WARN),
> +                                         "FBC is not enabled\n");

I was wondering here if idea with checking FBC is it is enable while
crc is captured? That igt_pipe_crc_collect_crc(..) waste few frames
because it start crc generation, get one crc and then stop crc
generation. If you need to check fbc is enabled closer to crc capture
and you have pipe enabled already before that commit you could also
start crc capture here on your own, then commit, get one crc and do
that assert and then stop crc. Not sure if it's needed here but it
would bring that assert timewise closer to frame when crc was
captured.

> +}
> +
> +static void
> +update_rect_with_dirtyfb(data_t *data, struct igt_fb *fb1, struct igt_fb=
 *fb2,
> +                        struct drm_mode_rect *rect)
> +{
> +       struct intel_buf *src, *dst;
> +       struct intel_bb *ibb;
> +       igt_spin_t *spin;
> +       int r;
> +       struct buf_ops *bops;
> +       igt_render_copyfunc_t rendercopy;
> +
> +       bops =3D buf_ops_create(data->drm_fd);
> +       rendercopy =3D igt_get_render_copyfunc(intel_get_drm_devid(data->=
drm_fd));
> +
> +       src =3D intel_buf_create_full(bops, fb1->gem_handle, fb1->width,
> +                                   fb1->height,
> +                                   igt_drm_format_to_bpp(fb1->drm_format=
),
> +                                   0,
> +                                   igt_fb_mod_to_tiling(fb1->modifier),
> +                                   0, fb1->size, 0, system_memory(data->=
drm_fd),
> +                                   intel_get_pat_idx_uc(data->drm_fd),
> +                                   DEFAULT_MOCS_INDEX);
> +       dst =3D intel_buf_create_full(bops, fb2->gem_handle,
> +                                   fb2->width, fb2->height,
> +                                   igt_drm_format_to_bpp(fb2->drm_format=
),
> +                                   0, igt_fb_mod_to_tiling(fb2->modifier=
),
> +                                   0, fb2->size, 0, system_memory(data->=
drm_fd),
> +                                   intel_get_pat_idx_uc(data->drm_fd),
> +                                   DEFAULT_MOCS_INDEX);
> +       ibb =3D intel_bb_create(data->drm_fd, PAGE_SIZE);
> +
> +       spin =3D igt_spin_new(data->drm_fd, .ahnd =3D ibb->allocator_hand=
le);
> +       igt_spin_set_timeout(spin, NSEC_PER_SEC);
> +
> +       rendercopy(ibb, src, rect->x1, rect->y1, rect->x2 - rect->x1,
> +                  rect->y2 - rect->y1, dst, rect->x1, rect->y1);
> +
> +       /* Perfom dirtyfb right after initiating rendercopy/blitter */
> +       r =3D drmModeDirtyFB(data->drm_fd, fb2->fb_id, NULL, 0);
> +       igt_assert(r =3D=3D 0 || r =3D=3D -ENOSYS);
> +
> +       /* Ensure rendercopy/blitter is complete */
> +       intel_bb_sync(ibb);
> +
> +       igt_spin_free(data->drm_fd, spin);
> +       intel_bb_destroy(ibb);
> +       intel_buf_destroy(src);
> +       intel_buf_destroy(dst);
> +}
> +
> +static void fbc_dirty_rectangle_dirtyfb(data_t *data)
> +{
> +       igt_pipe_crc_t *pipe_crc =3D data->pipe_crc;
> +       igt_display_t *display =3D &data->display;
> +       igt_output_t *output =3D data->output;
> +       igt_plane_t *primary;
> +       drmModeModeInfo *mode;
> +       struct igt_fb main_fb, fb2, fb3, fb4;
> +       struct drm_mode_rect full_rect, rect1, rect2;
> +       igt_crc_t main_crc, fb2_crc, fb3_crc, fb4_crc, crc;
> +
> +       mode =3D igt_output_get_mode(output);
> +       igt_output_set_pipe(output, data->pipe);
> +       if (!pipe_crc) {
> +               pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
> +                                           IGT_PIPE_CRC_SOURCE_AUTO);
> +               igt_assert(pipe_crc);
> +       }
> +       primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIM=
ARY);
> +
> +       set_damage_clip_w(&full_rect, 0, 0, mode->hdisplay, mode->vdispla=
y);
> +       set_damage_clip_w(&rect1, SQUARE_OFFSET, SQUARE_OFFSET, SQUARE_SI=
ZE,
> +                         SQUARE_SIZE);
> +       set_damage_clip_w(&rect2, SQUARE_OFFSET_2, SQUARE_OFFSET_2,
> +                         SQUARE_SIZE, SQUARE_SIZE);
> +
> +       dirty_rect_create_fb(data, &main_fb, data->mode->hdisplay,
> +                            data->mode->vdisplay, BLUE);
> +
> +       dirty_rect_create_fb(data, &fb2, data->mode->hdisplay,
> +                            data->mode->vdisplay, BLUE);
> +       dirty_rect_draw_white_rects(data, &fb2, 1, &rect1);
> +
> +       dirty_rect_create_fb(data, &fb3, data->mode->hdisplay,
> +                            data->mode->vdisplay, BLUE);
> +       dirty_rect_draw_white_rects(data, &fb3, 1, &rect2);
> +
> +       dirty_rect_create_fb(data, &fb4, data->mode->hdisplay,
> +                            data->mode->vdisplay, BLUE);
> +       dirty_rect_draw_white_rects(data, &fb4, 1, &rect2);
> +
> +
> +       /* 1st screen - Empty blue screen*/
> +       set_damage_area(primary, &full_rect, sizeof(full_rect));
> +       set_fb_and_collect_crc(data, primary, &main_fb, pipe_crc, &main_c=
rc);
> +
> +       /* 2nd screen - 1st white rect at 100, 100 - using damage area */
> +       set_damage_area(primary, &rect1, sizeof(rect1));
> +       set_fb_and_collect_crc(data, primary, &fb2, pipe_crc, &fb2_crc);
> +
> +       /* 3rd screen - 2nd white rect at 600, 600 - using damage area.
> +        * Now two white rects on screen
> +        */
> +       set_damage_area(primary, &rect2, sizeof(rect2));
> +       set_fb_and_collect_crc(data, primary, &fb3, pipe_crc, &fb3_crc);
> +
> +       /* 4th screen - clear the 2nd white rect at 600,600 with dirtyfb.
> +        * Copy rect2 area from main_fb to fb3. Then fb3 becomes whole bl=
ue
> +        */
> +       update_rect_with_dirtyfb(data, &main_fb, &fb3, &rect2);
> +       /* Now the screen must match 3rd screen - with both rects */
> +       igt_pipe_crc_collect_crc(pipe_crc, &crc);
> +       igt_assert_crc_equal(&crc, &main_crc);
> +
> +       /* 5th screen - Copy the first rect at 100,100 with dirtyfb.
> +        * Copy rect1 area from fb2 to fb3. Then fb3 becomes one rect at =
100,100
> +        */
> +       update_rect_with_dirtyfb(data, &fb2, &fb3, &rect1);
> +       /* Now the screen must match 2nd screen - with one rect 1t 100,10=
0 */
> +       igt_pipe_crc_collect_crc(pipe_crc, &crc);
> +       igt_assert_crc_equal(&crc, &fb2_crc);
> +
> +       /* 6th screen - 2nd white rect at 600, 600 - using damage area.
> +        * Now two white rects on screen
> +        */
> +       set_damage_area(primary, &rect2, sizeof(rect2));
> +       set_fb_and_collect_crc(data, primary, &fb4, pipe_crc, &fb4_crc);

Look like fb4_crc is not used for anything, something missed?

> +       /* Now the screen must match 3rd screen - with both rects */
> +       igt_pipe_crc_collect_crc(pipe_crc, &crc);
> +       igt_assert_crc_equal(&crc, &fb3_crc);
> +
> +       igt_plane_set_fb(primary, NULL);
> +       igt_remove_fb(data->drm_fd, &main_fb);
> +       igt_remove_fb(data->drm_fd, &fb2);
> +       igt_remove_fb(data->drm_fd, &fb3);
> +       igt_remove_fb(data->drm_fd, &fb4);
> +       igt_display_commit2(display, COMMIT_ATOMIC);
> +}
> +
> +/**
> + * fbc_dirty_rectangle_outside_visible_region - Test dirty rectangle out=
side visible region
> + * @data: Pointer to the test data structure
> + *
> + * This test verifies the behavior of the Frame Buffer Compression (FBC)=
 when
> + * dirty rectangles are set outside the visible region of the display. I=
t creates
> + * a main framebuffer and three additional framebuffers with dirty recta=
ngles
> + * positioned horizontally, vertically, and both horizontally and vertic=
ally
> + * outside the visible region. The test then sets the damage area to the=
se
> + * rectangles and collects CRCs to ensure that the content outside the v=
isible
> + * region does not affect the main framebuffer's CRC.
> + */
> +static void fbc_dirty_rectangle_outside_visible_region(data_t *data)
> +{
> +       igt_pipe_crc_t *pipe_crc =3D data->pipe_crc;
> +       igt_display_t *display =3D &data->display;
> +       igt_output_t *output =3D data->output;
> +       igt_plane_t *primary;
> +       drmModeModeInfo *mode;
> +       struct igt_fb main_fb, rect_fb[3];
> +       struct drm_mode_rect rect[3], full_rect;
> +       igt_crc_t main_crc, rect_crc[3];
> +
> +       mode =3D igt_output_get_mode(output);

Is this same mode that you have just before coming here written into data.m=
ode ?

> +       igt_output_set_pipe(output, data->pipe);
> +       if (!pipe_crc) {
> +               pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
> +                                               IGT_PIPE_CRC_SOURCE_AUTO)=
;
> +               igt_assert(pipe_crc);
> +       }
> +       primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIM=
ARY);
> +
> +       set_damage_clip(&full_rect, 0, 0, mode->hdisplay + 200,
> +                       mode->vdisplay + 200);
> +       /* Rect Horizontally outside visible region */
> +       set_damage_clip_w(&rect[0], data->mode->hdisplay + 10, 100,
> +                         SQUARE_SIZE, SQUARE_SIZE);
> +       /* Rect vertically outside visible region */
> +       set_damage_clip_w(&rect[1], 10, data->mode->vdisplay + 50,
> +                         SQUARE_SIZE, SQUARE_SIZE);
> +       /* Rect Horizontally and vertically outside visible region */
> +       set_damage_clip_w(&rect[2], data->mode->hdisplay + 10,
> +                         data->mode->vdisplay + 50, SQUARE_SIZE, SQUARE_=
SIZE);
> +
> +       dirty_rect_create_fb(data, &main_fb, data->mode->hdisplay + 200,
> +                                data->mode->vdisplay + 200, GREEN);
> +
> +       for (int i =3D 0; i < 3; i++) {
> +               dirty_rect_create_fb(data, &rect_fb[i], data->mode->hdisp=
lay + 200,
> +                                        data->mode->vdisplay + 200, GREE=
N);
> +               dirty_rect_draw_white_rects(data, &rect_fb[i], 1, &rect[i=
]);
> +       }
> +
> +       /* Main rect */
> +       set_damage_area(primary, &full_rect, sizeof(full_rect));
> +       set_fb_and_collect_crc(data, primary, &main_fb, pipe_crc, &main_c=
rc);
> +
> +       for (int i =3D 0; i < 3; i++) {
> +               set_damage_area(primary, &rect[i], sizeof(rect[i]));
> +               set_fb_and_collect_crc(data, primary, &rect_fb[i], pipe_c=
rc, &rect_crc[i]);
> +               igt_assert_crc_equal(&rect_crc[i], &main_crc);
> +       }
> +
> +       igt_plane_set_fb(primary, NULL);
> +       igt_remove_fb(data->drm_fd, &main_fb);
> +       for (int i =3D 0; i < 3; i++)
> +               igt_remove_fb(data->drm_fd, &rect_fb[i]);
> +       igt_display_commit2(display, COMMIT_ATOMIC);
> +}
> +
> +/*
> + * fbc_dirty_rectangle_basic
> + * @data: data_t
> + *
> + * This test draws screens as full-screen updates and collects their CRC=
s
> + * as reference values. Screens are then updated using the FBC
> + * dirty rect feature and compared with the reference CRCs.
> + * Matching CRCs indicate success.
> + *
> + * Steps to Collect Reference CRCs:
> + * 1. Full Blue Screen
> + *    - Frame Buffer: main_fb
> + *    - CRC: main_fb_crc
> + * 2. White Square on Upper Left
> + *    - Frame Buffer: rect1_fb
> + *    - CRC: rect1_fb_crc
> + * 3. Second White Square Below First
> + *    - Frame Buffer: rect2_fb
> + *    - CRC: rect2_fb_crc
> + * 4. Both Rectangles
> + *    - Frame Buffer: rect_combined_fb
> + *    - CRC: rect_combined_fb_crc
> + *
> + * Steps to Update Screen with FBC Dirty Rect:
> + * 1. Full Blue Screen
> + *    - Set rect_combined_fb with Damage Area Update
> + *    - CRC should match rect_combined_fb_crc
> + * 2. Clear First Rectangle Area
> + *    - Use main_fb and damage area as rect1 coordinates
> + *    - CRC should match rect2_fb_crc
> + * 3. Clear Second Rectangle Area
> + *    - Use main_fb and damage area as rect2 coordinates
> + *    - CRC should match main_fb_crc
> + */
> +static void fbc_dirty_rectangle_basic(data_t *data)
> +{
> +       igt_pipe_crc_t *pipe_crc =3D data->pipe_crc;
> +       igt_display_t *display =3D &data->display;
> +       igt_output_t *output =3D data->output;
> +       igt_plane_t *primary;
> +       drmModeModeInfo *mode;
> +       struct igt_fb main_fb;
> +       struct igt_fb rect_1_fb;
> +       struct igt_fb rect_2_fb;
> +       struct igt_fb rect_combined_fb;
> +       struct drm_mode_rect rect1;
> +       struct drm_mode_rect rect2;
> +       struct drm_mode_rect rect_combined[2];
> +       struct drm_mode_rect full_rect;
> +       igt_crc_t main_fb_crc, rect_1_fb_crc, rect_2_fb_crc, rect_combine=
d_fb_crc, crc;
> +
> +       mode =3D igt_output_get_mode(output);
> +       igt_output_set_pipe(output, data->pipe);
> +       if (!pipe_crc) {
> +               pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe,
> +                                           IGT_PIPE_CRC_SOURCE_AUTO);
> +               igt_assert(pipe_crc);
> +       }
> +       primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIM=
ARY);
> +
> +       set_damage_clip(&full_rect, 0, 0, mode->hdisplay-1, mode->vdispla=
y-1);
> +       set_damage_clip(&rect1, SQUARE_OFFSET, SQUARE_OFFSET,
> +                       SQUARE_OFFSET + SQUARE_SIZE, SQUARE_OFFSET + SQUA=
RE_SIZE);
> +       set_damage_clip(&rect2, SQUARE_OFFSET_2, SQUARE_OFFSET_2,
> +                       SQUARE_OFFSET_2 + SQUARE_SIZE, SQUARE_OFFSET_2 + =
SQUARE_SIZE);
> +       set_damage_clip(&rect_combined[0], rect1.x1, rect1.y1, rect1.x2, =
rect1.y2);
> +       set_damage_clip(&rect_combined[1], rect2.x1, rect2.y1, rect2.x2, =
rect2.y2);
> +
> +       dirty_rect_create_fb(data, &main_fb, data->mode->hdisplay,
> +                            data->mode->vdisplay, BLUE);
> +
> +       dirty_rect_create_fb(data, &rect_1_fb, data->mode->hdisplay,
> +                            data->mode->vdisplay, BLUE);
> +       dirty_rect_draw_white_rects(data, &rect_1_fb, 1, &rect1);
> +
> +       dirty_rect_create_fb(data, &rect_2_fb, data->mode->hdisplay,
> +                            data->mode->vdisplay, BLUE);
> +       dirty_rect_draw_white_rects(data, &rect_2_fb, 1, &rect2);
> +
> +       dirty_rect_create_fb(data, &rect_combined_fb, data->mode->hdispla=
y,
> +                            data->mode->vdisplay, BLUE);
> +       dirty_rect_draw_white_rects(data, &rect_combined_fb,
> +                            ARRAY_SIZE(rect_combined), rect_combined);
> +
> +       /* main_fb blank blue screen - get and store crc*/
> +       set_fb_and_collect_crc(data, primary, &main_fb, pipe_crc, &main_f=
b_crc);
> +
> +       /* Whole blue screen with one white rect and collect crc */
> +       set_damage_area(primary, &full_rect, sizeof(full_rect));
> +       set_fb_and_collect_crc(data, primary, &rect_1_fb, pipe_crc,
> +                              &rect_1_fb_crc);
> +
> +       /* Second white rect and collect crc */
> +       set_damage_area(primary, &full_rect, sizeof(full_rect));
> +       set_fb_and_collect_crc(data, primary, &rect_2_fb, pipe_crc,
> +                              &rect_2_fb_crc);
> +
> +       /* Both rects and collect crc */
> +       set_damage_area(primary, &full_rect, sizeof(full_rect));
> +       set_fb_and_collect_crc(data, primary, &rect_combined_fb, pipe_crc=
,
> +                              &rect_combined_fb_crc);
> +
> +       /* Put full blank screen back */
> +       set_damage_area(primary, &full_rect, sizeof(full_rect));
> +       set_fb_and_collect_crc(data, primary, &main_fb, pipe_crc, &crc);
> +       igt_assert_crc_equal(&crc, &main_fb_crc);
> +
> +       /* Set combined rect - draw two white rects using damage area*/
> +       set_damage_area(primary, rect_combined, sizeof(rect_combined));
> +       set_fb_and_collect_crc(data, primary, &rect_combined_fb, pipe_crc=
, &crc);
> +       igt_assert_crc_equal(&crc, &rect_combined_fb_crc);
> +
> +       /* Clear first rect using damage area. Only the second rect shoul=
d be visible here! */
> +       set_damage_area(primary, &rect1, sizeof(rect1));
> +       set_fb_and_collect_crc(data, primary, &main_fb, pipe_crc, &crc);
> +       igt_assert_crc_equal(&crc, &rect_2_fb_crc);
> +
> +       /* Clear the second rect as well. Now back to original blank scre=
en */
> +       set_damage_area(primary, &rect2, sizeof(rect2));
> +       set_fb_and_collect_crc(data, primary, &main_fb, pipe_crc, &crc);
> +       igt_assert_crc_equal(&crc, &main_fb_crc);
> +
> +       igt_plane_set_fb(primary, NULL);
> +       igt_remove_fb(data->drm_fd, &main_fb);
> +       igt_remove_fb(data->drm_fd, &rect_1_fb);
> +       igt_remove_fb(data->drm_fd, &rect_2_fb);
> +       igt_remove_fb(data->drm_fd, &rect_combined_fb);
> +       igt_display_commit2(display, COMMIT_ATOMIC);
> +}
> +
> +static void prepare_test(data_t *data, igt_output_t *output)
> +{
> +       bool is_fbc_supported =3D false;
> +
> +       is_fbc_supported =3D intel_fbc_supported_on_chipset(data->drm_fd,=
 data->pipe);
> +       igt_require_f(is_fbc_supported, "FBC not supported on this platfo=
rm\n");

That comment for requirement look misleading. Maybe not supported on this p=
ipe?

> +
> +       if (output) {

I wouldn't expect you need to check if output exists here

> +               if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_=
MODE_1, NULL) ||
> +                       psr_sink_support(data->drm_fd, data->debugfs_fd, =
PSR_MODE_2, NULL) ||
> +                       psr_sink_support(data->drm_fd, data->debugfs_fd, =
PR_MODE, NULL)) {
> +                       igt_info("PSR is supported by the sink. Disabling=
 PSR to test Dirty FBC functionality.\n");
> +                       psr_disable(data->drm_fd, data->debugfs_fd, outpu=
t);
> +               }
> +       }
> +
> +       if (data->feature & FEATURE_FBC)
> +               intel_fbc_enable(data->drm_fd);
> +}
> +
> +static void fbc_dirty_rectangle_basic_test(data_t *data)
> +{
> +       prepare_test(data, data->output);
> +       return fbc_dirty_rectangle_basic(data);
> +}
> +
> +static void fbc_dirty_rectangle_out_visible(data_t *data)
> +{
> +       prepare_test(data, data->output);
> +       return fbc_dirty_rectangle_outside_visible_region(data);
> +}
> +
> +static void fbc_dirty_rectangle_dirtyfb_tests(data_t *data)
> +{
> +       prepare_test(data, data->output);
> +       return fbc_dirty_rectangle_dirtyfb(data);
> +}
> +
> +igt_main
> +{
> +       data_t data =3D {0};
> +       int display_ver;
> +
> +       igt_fixture {
> +               data.drm_fd =3D drm_open_driver_master(DRIVER_XE);

igt_require(data.drm_fd >=3D 0);

> +               data.debugfs_fd =3D igt_debugfs_dir(data.drm_fd);
> +               kmstest_set_vt_graphics_mode();
> +               igt_require_pipe_crc(data.drm_fd);
> +               igt_display_require(&data.display, data.drm_fd);
> +               igt_display_require_output(&data.display);
> +               display_ver =3D intel_display_ver(intel_get_drm_devid(dat=
a.drm_fd));
> +               igt_require_f(display_ver >=3D 30, "FBC with dirty region=
 is not supported\n");
> +       }
> +
> +       igt_subtest_with_dynamic("fbc-dirty-rectangle-basic") {

is this same test as is performed as part of
fbc-dirty-rectangle-different-formats?

> +               data.feature =3D FEATURE_FBC;
> +
> +               for_each_pipe(&data.display, data.pipe) {
> +                       for_each_valid_output_on_pipe(&data.display, data=
.pipe, data.output) {
> +                               data.mode =3D igt_output_get_mode(data.ou=
tput);
> +                               data.format =3D DRM_FORMAT_XRGB8888;
> +                               igt_display_reset(&data.display);
> +                               igt_output_set_pipe(data.output, data.pip=
e);
> +                               igt_dynamic_f("pipe-%s-%s",
> +                                              kmstest_pipe_name(data.pip=
e),
> +                                              igt_output_name(data.outpu=
t)) {
> +                                       fbc_dirty_rectangle_basic_test(&d=
ata);
> +                               }
> +                       }
> +               }
> +       }
> +
> +       igt_subtest_with_dynamic("fbc-dirty-rectangle-out-visible-area") =
{
> +               data.feature =3D FEATURE_FBC;
> +
> +               for_each_pipe(&data.display, data.pipe) {
> +                       for_each_valid_output_on_pipe(&data.display, data=
.pipe, data.output) {
> +                               data.mode =3D igt_output_get_mode(data.ou=
tput);
> +                               data.format =3D DRM_FORMAT_XRGB8888;
> +                               igt_display_reset(&data.display);
> +                               igt_output_set_pipe(data.output, data.pip=
e);
> +                               igt_dynamic_f("pipe-%s-%s",
> +                                              kmstest_pipe_name(data.pip=
e),
> +                                              igt_output_name(data.outpu=
t)) {
> +                                       fbc_dirty_rectangle_out_visible(&=
data);
> +                               }
> +                       }
> +               }
> +       }
> +
> +       igt_subtest_with_dynamic("fbc-dirty-rectangle-dirtyfb-tests") {
> +               data.feature =3D FEATURE_FBC;
> +
> +               for_each_pipe(&data.display, data.pipe) {
> +                       for_each_valid_output_on_pipe(&data.display, data=
.pipe, data.output) {
> +                               data.mode =3D igt_output_get_mode(data.ou=
tput);
> +                               data.format =3D DRM_FORMAT_XRGB8888;
> +                               igt_display_reset(&data.display);
> +                               igt_output_set_pipe(data.output, data.pip=
e);
> +                               igt_dynamic_f("pipe-%s-%s",
> +                                              kmstest_pipe_name(data.pip=
e),
> +                                              igt_output_name(data.outpu=
t)) {
> +                                       fbc_dirty_rectangle_dirtyfb_tests=
(&data);
> +                               }
> +                       }
> +               }
> +       }
> +
> +       igt_subtest_with_dynamic("fbc-dirty-rectangle-different-formats")=
 {
> +               uint32_t formats[] =3D {DRM_FORMAT_XRGB8888,
> +                                     DRM_FORMAT_ARGB8888,
> +                                     DRM_FORMAT_RGB565};
> +               int num_formats =3D ARRAY_SIZE(formats);
> +               data.feature =3D FEATURE_FBC;
> +
> +               for_each_pipe(&data.display, data.pipe) {
> +                       for_each_valid_output_on_pipe(&data.display, data=
.pipe, data.output) {
> +                               data.mode =3D igt_output_get_mode(data.ou=
tput);
> +                               igt_display_reset(&data.display);
> +                               igt_output_set_pipe(data.output, data.pip=
e);
> +
> +                               for (int i =3D 0; i < num_formats; i++) {
> +                                       igt_dynamic_f("pipe-%s-%s-format-=
%s",
> +                                                      kmstest_pipe_name(=
data.pipe),
> +                                                      igt_output_name(da=
ta.output),
> +                                                      igt_format_str(for=
mats[i])) {
> +                                               data.format =3D formats[i=
];
> +                                               fbc_dirty_rectangle_basic=
_test(&data);
> +                                       }
> +                               }
> +                       }
> +               }
> +       }
> +
> +       igt_fixture {
> +               igt_display_fini(&data.display);
> +               close(data.drm_fd);
> +       }
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 33dffad31..2ac5ce309 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -268,6 +268,7 @@ intel_kms_progs =3D [
>         'kms_psr2_su',
>         'kms_psr_stress_test',
>         'kms_pwrite_crc',
> +        'kms_fbc_dirty_rect',

These lists are normally in alphabetical order, you could move this
line to correct place in the list

>  ]
>
>  intel_xe_progs =3D [
> --
> 2.34.1
>
