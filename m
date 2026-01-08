Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AB4D1D47C
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 15:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC63010E357;
	Thu,  8 Jan 2026 15:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gxSvt2io";
	dkim-atps=neutral
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A8C10E357
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 15:30:43 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-34c3cb504efso2643759a91.2
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Jan 2026 07:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767886243; x=1768491043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4AaMjWV15LPHz6TwGltRQRMpTRVwMaXchMHqv7Y3BVw=;
 b=gxSvt2io8kw6PGnexd3sU98rW8KMIxVOOTw5khZH30qmuxLKz1EVbFAXrz5sDTqjcq
 oKd7ZG5u9Y5OPJl1JxT3EvAMi5jLvB2HjUuRwm+d1kxRr81Kl0WSrlYjq/HdcNV/lA2m
 78f0Qnpi+kk4O/Xju+TTtyxvNE12WH5nDFvEnTV+xQv+pWzWbnkDkpYL465IRjnKgD40
 4UAIbWEocCmySUkC1k0hLZBRVjzy8E59TaaKFR69xtnVFA83j3NNRTyjRKhxtJdbvqha
 YA3wK+N7vk5PhlptDyY1GLOg2MLNvFy9jXKyfTd9A665cfHVmSOfvm48q9eOOUv4hFVr
 +ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767886243; x=1768491043;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4AaMjWV15LPHz6TwGltRQRMpTRVwMaXchMHqv7Y3BVw=;
 b=wGt3cqsWh7PoZCY6wtNnpE0wvG2Jb2Ddr+gFOBDBzW1ZK4yDYjXWMmRBowjKI1rwvp
 6f3AUeGKkhHwnBPr5xqYJ1OrlmCk5yPHTmJOYKkrraHiK4oI8U2BqfZQu94LyHHezltZ
 oXdPO+eRNyVsEpfMoAy/T+AeQagMn7teG8LlzX9ITJvdktn0KxM7ptUQ2ILYsU7z5bBe
 18WEmb4HT13NAbppSZhFdrB/GRGu/vlQT9dfQDVn3UJk+Fau5A1+oyS7xMJ1nLu6+jHh
 i0/XRxk6YYZlqsH2xJYyOfFUUv+1RnJoJSJmqjoO+XLW1HR1vR4hwoL539Taqd1Q5ZJm
 +48Q==
X-Gm-Message-State: AOJu0Ywei+4XmHPlh4JrRG1H4BWtsdvyGvFRvhXUvKYIXUF6AqcKlpap
 CQB2/4BgV8ple0muSDLRROICtB0oMfzyjk0tdAg3bA8VAmrngfjvSzjpYAWBfs/jE2Hv96JvV/w
 ewzM4Nb925jyBR9/3B/pZhDdm7ZQZlDwEkRRavTk=
X-Gm-Gg: AY/fxX52g5Oow14JrNHqjuLJyWNzLp60uSoIY0CrKoWTCX2meQATfGb3NkoJq96sEkR
 L7UWyg0qZ/dRyIZi/IfPHs6HjVu4h9IMM73Zmvur2y3fDbu5cx0bsnwYVNE1KVEe7kDbzlR8UG4
 cflofGByNWN/4Ne16DiyXxxAPqOdDkhaYUPolmGz0Trd2p4Ujh9Jrz5FK0CSv0fCmm/BVKUM9Kl
 V5NnHHpJ8lucMLeYoF/xxE4dNpvP/t+T2Y9Nro1xa2ALgvZirmRAiv1JFQybOlZAQat7Xikzyck
 LmlRDTu+hrk4nJahJ2V/MIFHIqABTg==
X-Google-Smtp-Source: AGHT+IGD0xohMZ7l+5UJddUc112KsYP5hLTaA561AXX7uBoqCFNeYJZqYTvodi2cEtXzVnh5Ak5HuKbngS825HNW3nA=
X-Received: by 2002:a17:90b:2dca:b0:340:ec6f:5adb with SMTP id
 98e67ed59e1d1-34f68c7a907mr6060873a91.3.1767886242990; Thu, 08 Jan 2026
 07:30:42 -0800 (PST)
MIME-Version: 1.0
References: <20260107093535.70116-1-swati2.sharma@intel.com>
 <20260107093535.70116-4-swati2.sharma@intel.com>
In-Reply-To: <20260107093535.70116-4-swati2.sharma@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 8 Jan 2026 17:30:31 +0200
X-Gm-Features: AQt7F2oxsZKA4YEOBU2RURvU-LfipfMJqYayYLdHEeG55xJ6Qp-wchp0Ryi1QDI
Message-ID: <CAJ=qYWSjWTJJkm5+FUcXpah5-_U-0kNsLRqHNBYUv1QuVJ6H0Q@mail.gmail.com>
Subject: Re: [PATCH i-g-t, v2 3/7] tests/kms_plane: add test and limitations
 for odd height planar tests
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
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

Acked-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On Wed, Jan 7, 2026 at 11:27=E2=80=AFAM Swati Sharma <swati2.sharma@intel.c=
om> wrote:
>
> From: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
>
> With NVL need to disable odd height and odd src y for semiplanar
> yuv formats. With older devices check with crc odd src y didn't
> break framebuffer on screen.
>
> Bspec: 68903
>
> v2: -initialize display_ver (JP)
>     -rebase
>
> Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
> ---
>  tests/kms_plane.c | 71 +++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 66 insertions(+), 5 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 2c083f4b7..cbc006d7e 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1245,9 +1245,11 @@ static void test_planar_settings(data_t *data)
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
> @@ -1259,6 +1261,8 @@ static void test_planar_settings(data_t *data)
>                 igt_require_intel(data->drm_fd);
>                 devid =3D intel_get_drm_devid(data->drm_fd);
>                 igt_require(intel_display_ver(devid) >=3D 9);
> +               display_ver =3D intel_display_ver(devid);
> +               igt_require(display_ver >=3D 9);
>         }
>
>         output =3D igt_get_single_output_for_pipe(&data->display, pipe);
> @@ -1276,14 +1280,15 @@ static void test_planar_settings(data_t *data)
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
> @@ -1296,14 +1301,15 @@ static void test_planar_settings(data_t *data)
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
> @@ -1329,6 +1335,61 @@ static void test_planar_settings(data_t *data)
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
> +                       igt_wait_for_vblank_count(igt_crtc_for_pipe(&data=
->display, pipe), 1);
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
