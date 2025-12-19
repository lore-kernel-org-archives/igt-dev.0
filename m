Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108FCD78769
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 12:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F54A10E486;
	Fri, 19 Dec 2025 12:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jhPybhne";
	dkim-atps=neutral
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F7710E486
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 12:56:26 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7baf61be569so1968528b3a.3
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 04:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766148986; x=1766753786; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9CraAhI5eBr8RRlqGq5hlwFUacyp4X8lhCrDpRruuV0=;
 b=jhPybhneSf6E0oUe9QwLOlk61/nKB0xS3D7RQtGEWnTQwfgwOPlAPBLv2bOV9EeRlO
 2sOfUMt58Ek4mlRmX9y7jqhDykSAcKcnK5k8zo1wPZzXcJ9bF+p8HtlzeUd4IYzcV16V
 YKw7hsT+2VR1YCIU0eXmTcMWZpl49EyBNXj+DgOvRMgip6Y7BjpIuTF92vS10+Xu0hE5
 ++6Uic/01Da7EAlDuZFVSUXNw5hT3nWnZEKkkLXQDjKJxNsEumPmCk+IfGk/e6YVp/fI
 09OC5y1ueNI5Uh6wSdccQYnXlLUDJSMGfuvGuKI8DKgaX1+8urcqW4aak017YJjK9lLs
 J0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766148986; x=1766753786;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9CraAhI5eBr8RRlqGq5hlwFUacyp4X8lhCrDpRruuV0=;
 b=Xs6vYorMwPLgIdoLcwKTyYf0iQzXj0yi6AOD2yjdmS9JZohRG4B4cGr6niyb8UUlH5
 5Sh4YEVOhvEhXoS221Q8NJ/KheTSajs5zObS4t2DgiI6nLYO+6W9CT+jUR/PUT9oR2Ve
 Vovonb2Pyx0A7SSoo6MVZYSRR4BGYpP9yXTbZgTA78o8ty4RzaSSV0zoZmwZyS1rJTTk
 XWVOFB5kFutCYJbKcRaJsQ89cGxX9Smzx5VvwxIKc56yp7v4M0K5eMRmdkbU9at58Piw
 4MBT/n6uA9LViKcM93nZCy0+KLlpfmPx1C0779Brmp1o+DRFjxQCClAKGJS4c/t3Eg7e
 Dlig==
X-Gm-Message-State: AOJu0YwMDx/U4J2HsWTT2ygbdtV21q9KQr4droiME5rvQwP+4C4fdxkt
 UYIVo2Jg3WHajFokPa6XBYH6C3TjFVtiF2RbCoABEVwvvPdneKkPqjl1ojAo+p4h67veb+HTOQh
 JnYeib1gmyRkG46kvRpGOmOkHEAp1BoM=
X-Gm-Gg: AY/fxX7oqCCF/DUi7EPiAgiBIUqutHxLhOUCQ04tsEVhU2pvY1ekus7IGtgqbZr1hN8
 gfF/l35qKUlKeOb3FElVkjOqwwMC67rfj4AOJj0IPaZnIHhQPuV0L0avjXiYY4AgZ7WijBAyeyz
 SHg+6Nf+aajZWssX5bhnk6D0e/7f4NGLYDiz3BarImr1CcWWdcJvSCAalGCJl9H7ALcQTId+I7g
 VXoq4/jG2Fg2smw8xoF9D5MrKPpZdYGdWpZtvcGmqliakTuv8Y+JOxnTWefhYj47Y7ML1p+qewc
 PZsFhMGkD4ybAgs7tbZF5KaVvszGQg==
X-Google-Smtp-Source: AGHT+IExV9UITyNu6H3jG81MKWfSt0KOZRw5q76FpXHgK0BnTQ7EPoPIYom7RCY6JMF6Pryypt2GM2/PVy4TNm0h+wA=
X-Received: by 2002:a05:6a20:3942:b0:33f:4e3d:afed with SMTP id
 adf61e73a8af0-376a94c7f8dmr3386468637.33.1766148985768; Fri, 19 Dec 2025
 04:56:25 -0800 (PST)
MIME-Version: 1.0
References: <20251216185215.1281390-1-swati2.sharma@intel.com>
 <20251216185215.1281390-4-swati2.sharma@intel.com>
In-Reply-To: <20251216185215.1281390-4-swati2.sharma@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Fri, 19 Dec 2025 14:56:14 +0200
X-Gm-Features: AQt7F2pjErBc3cIWeJWG8Um3KcIfAQHAWUlObPs-x2DMBZ9lgcWA-W3pnJKf2Eo
Message-ID: <CAJ=qYWSSCwkoGfbR6iMK+zYndCTp9W6gSPrvHMoLtw_DYc7C0w@mail.gmail.com>
Subject: Re: [PATCH i-g-t 3/7] tests/kms_plane: add test and limitations for
 odd height planar tests
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
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

Seems this patch has become bit broken somewhere on the way. I quickly
notice display_ver is left at value -1 which cannot work

My original patch back when this was created had there this

-       igt_require(intel_display_ver(devid) >=3D 9);
+       display_ver =3D intel_display_ver(devid);
+       igt_require(display_ver >=3D 9);

which is now missing; that is what I quickly noticed. Probably should
see the entire thing through it is otherwise working.

/Juha-Pekka


On Tue, Dec 16, 2025 at 8:45=E2=80=AFPM Swati Sharma <swati2.sharma@intel.c=
om> wrote:
>
> From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
>
> With NVL need to disable odd height and odd src y for semiplanar
> yuv formats. With older devices check with crc odd src y didn't
> break framebuffer on screen.
>
> Bspec: 68903
>
> Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
> ---
>  tests/kms_plane.c | 70 +++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 65 insertions(+), 5 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 5f18eac13..b6b29a98a 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1246,9 +1246,11 @@ static void test_planar_settings(data_t *data)
>  {
>         enum pipe pipe =3D PIPE_A;
>         igt_output_t *output;
> -       igt_fb_t fb;
> +       igt_fb_t fb, fb_ref;
>         igt_plane_t *primary;
> +       igt_crc_t crc, crc_ref;
>         int devid;
> +       int display_ver =3D -1;
>         int rval;
>
>         /*
> @@ -1277,14 +1279,15 @@ static void test_planar_settings(data_t *data)
>                                      DRM_FORMAT_MOD_LINEAR)) {
>                 int expected_rval =3D -EINVAL;
>
> -               if (intel_display_ver(devid) >=3D 20)
> +               if (display_ver >=3D 20)
>                         expected_rval =3D 0;
>
>                 igt_create_fb(data->drm_fd, 257, 256,
>                               DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb=
);
>                 igt_plane_set_fb(primary, &fb);
>                 rval =3D igt_display_try_commit_atomic(&data->display,
> -                                                    DRM_MODE_ATOMIC_ALLO=
W_MODESET,
> +                                                    DRM_MODE_ATOMIC_ALLO=
W_MODESET |
> +                                                    DRM_MODE_ATOMIC_TEST=
_ONLY,
>                                                      NULL);
>                 igt_remove_fb(data->drm_fd, &fb);
>                 igt_assert_f(rval =3D=3D expected_rval, "Odd width NV12 f=
ramebuffer\n");
> @@ -1297,14 +1300,15 @@ static void test_planar_settings(data_t *data)
>                                      DRM_FORMAT_MOD_LINEAR)) {
>                 int expected_rval =3D -EINVAL;
>
> -               if (intel_display_ver(devid) >=3D 20)
> +               if (display_ver >=3D 20 && display_ver < 35)
>                         expected_rval =3D 0;
>
>                 igt_create_fb(data->drm_fd, 256, 257,
>                               DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb=
);
>                 igt_plane_set_fb(primary, &fb);
>                 rval =3D igt_display_try_commit_atomic(&data->display,
> -                                                    DRM_MODE_ATOMIC_ALLO=
W_MODESET,
> +                                                    DRM_MODE_ATOMIC_ALLO=
W_MODESET |
> +                                                    DRM_MODE_ATOMIC_TEST=
_ONLY,
>                                                      NULL);
>                 igt_remove_fb(data->drm_fd, &fb);
>                 igt_assert_f(rval =3D=3D expected_rval, "Odd height NV12 =
framebuffer\n");
> @@ -1330,6 +1334,62 @@ static void test_planar_settings(data_t *data)
>         } else {
>                 igt_debug("Odd horizontal pan NV12 framebuffer test skipp=
ed\n");
>         }
> +
> +       if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
> +                                           DRM_FORMAT_MOD_LINEAR)) {
> +               int expected_rval =3D -EINVAL;
> +
> +               if (display_ver >=3D 20 && display_ver < 35)
> +                       expected_rval =3D 0;
> +
> +               igt_create_color_fb(data->drm_fd, 256, 260,
> +                             DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
> +                             0.0, 0.0, 1.0,
> +                             &fb);
> +
> +               igt_plane_set_fb(primary, &fb);
> +               igt_plane_set_position(primary, 1, 1);
> +               igt_plane_set_size(primary, 256, 256);
> +
> +               /* set odd v pan and check with crc fb didn't break */
> +               igt_fb_set_position(&fb, primary, 0, 3);
> +               igt_fb_set_size(&fb, primary, 256, 256);
> +               rval =3D igt_display_try_commit_atomic(&data->display,
> +                                                    DRM_MODE_ATOMIC_ALLO=
W_MODESET,
> +                                                    NULL);
> +               if (rval =3D=3D 0) {
> +                       set_legacy_lut(data, pipe, LUT_MASK);
> +                       igt_wait_for_vblank_count(data->drm_fd,
> +                       data->display.pipes[pipe].crtc_offset, 1);
> +                       data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd,=
 pipe,
> +                                               IGT_PIPE_CRC_SOURCE_AUTO)=
;
> +                       igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
> +
> +                       igt_create_color_fb(data->drm_fd, 256, 256,
> +                               DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEA=
R,
> +                               0.0, 0.0, 1.0,
> +                               &fb_ref);
> +
> +                       igt_plane_set_fb(primary, &fb_ref);
> +                       rval =3D igt_display_try_commit_atomic(&data->dis=
play,
> +                                                    DRM_MODE_ATOMIC_ALLO=
W_MODESET,
> +                                                    NULL);
> +
> +                       igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref=
);
> +                       set_legacy_lut(data, pipe, 0xffff);
> +
> +                       igt_pipe_crc_free(data->pipe_crc);
> +                       data->pipe_crc =3D NULL;
> +
> +                       igt_remove_fb(data->drm_fd, &fb_ref);
> +                       igt_assert_crc_equal(&crc_ref, &crc);
> +               }
> +
> +               igt_remove_fb(data->drm_fd, &fb);
> +               igt_assert_f(rval =3D=3D expected_rval, "Odd vertical pan=
 P016 framebuffer\n");
> +       } else {
> +               igt_debug("Odd vertical pan P016 framebuffer test skipped=
\n");
> +       }
>  }
>
>  static bool is_pipe_limit_reached(int count)
> --
> 2.25.1
>
