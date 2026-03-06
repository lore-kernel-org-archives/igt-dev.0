Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19540F01806
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 07:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD56A10E393;
	Fri,  6 Mar 2026 07:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XySdqspR";
	dkim-atps=neutral
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24E310E393
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 07:45:12 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-5ffd57b6fc6so313231137.1
 for <igt-dev@lists.freedesktop.org>; Thu, 05 Mar 2026 23:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1772783111; x=1773387911;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h0WEgunek7P0cWJtL/FHlRYkUeTL7ld3KkNyAQmVeKI=;
 b=XySdqspRxFE2GybhMEPlFs6d/vFWBkz49ZBBVlGRLD6TuvQ1rAYhqN0sc/m0itVlWQ
 AQa42vhGLVh1iUERz+bUVWhg2hZ5F8qWs1mmVViXFNOusZzYJEOM7mj0ElQNepefxPkq
 ENY3vkOS0YrFG1F0vG+h0fS6oqMhkKA1ihoSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772783111; x=1773387911;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=h0WEgunek7P0cWJtL/FHlRYkUeTL7ld3KkNyAQmVeKI=;
 b=xKVXGmGxv7HRLnZE+sN7ZKrWCUKda2Yq5UfAgYdR5PkU1Fr0/e1JuxOaf0gIvuD4pt
 3qYYup2cWKb7I4DVLgZ3Ayqb+wsivLfLZTJigzexpK7NpcY/sV5OqoJ+mppGHKH/wpBy
 x8NRSRIFJhzSvIvuUiwCdmgiYYn2aEjRCaIDzj2iLkvshqqMCQqZh+II8r01a/e3mXuI
 ZCBcBO8r84068R67iUSY6QCqTwMBjDvVYWL7UjkDrm2X6B4IvvHDj/rTH2OaLd06H3eL
 P9XnldArORqALL4EDZ79J0YmwEl3CB5fEFZIBoEyCED/pqjlU6Ao7MILNYGzW0hV6Y3o
 adfg==
X-Gm-Message-State: AOJu0YzVtQSCIsOCMgVlPx8pau/LubGq0RQHwgPgM7qHR3uiZ8LpKh7G
 wa3o7iGHmKSOWQqZUf1taAcEOvAYzg3NAEAoyY/ATblF+KNHQL6Q5Krr1RfrWz3P+biLZSh9IhG
 jLtc=
X-Gm-Gg: ATEYQzyzHZ3lB+ILkf1q5kH0Y2aO9ERB8Ot4yDRwbVF/fHf7lWz4rpaaPAfwTa4Ez2f
 rA64cVWEwMoRKPpq20nAGNwoRx0DIXO1cmd5KRucofzvDR4pK8rhdSwtrlGJ1FMm8Yf3GYV7Hyg
 nH53yVFnvTwXVIFW4BxNcY7XlH+dg8SCghvdXYkBINTDLXcvT8LQKpeeHwU3nXjd87OySNdYGTY
 hhQ1b6SSs4ucLiSVSG944ChlIcSOou1SfIc9+jLk1YBuEcicDz9OujKrUBD+AG4WZ9bVCh6EnNJ
 zDPq6o+5DKYOsWgxpRu4oXT3Fha7YRRAgzT37VgguJbvKFo2z1vg5+Ybc/d3IcfG8m6K4OHoD/U
 F3UktdUv4O+FhFMeV0gRqlTeDCVYNzWZt7LjPSSWm/gZS5m/3RquIsc7+trMd3YgVj9UVmS+o6T
 e+8jqiQ68xiQTRm1lT5A6SLy+jhvjWi62WaihlFQh0V4Hh2kuHLBb5zByMwNo/PFmrAsoxJOUz
X-Received: by 2002:a05:6102:944:b0:5ff:c59d:67cb with SMTP id
 ada2fe7eead31-5ffe5f5e8a3mr395494137.9.1772783110997; 
 Thu, 05 Mar 2026 23:45:10 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com.
 [209.85.221.173]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-94e7b57ec19sm656159241.14.2026.03.05.23.45.10
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 23:45:10 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-56affe9f4c4so487272e0c.2
 for <igt-dev@lists.freedesktop.org>; Thu, 05 Mar 2026 23:45:10 -0800 (PST)
X-Received: by 2002:a05:6122:8c0a:b0:56a:ff86:c91e with SMTP id
 71dfb90a1353d-56b07d4e49amr384074e0c.8.1772783109122; Thu, 05 Mar 2026
 23:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20260225160408.4116524-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260225160408.4116524-1-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 6 Mar 2026 15:44:33 +0800
X-Gmail-Original-Message-ID: <CAC=S1njW84bqLR3UvHHdPXT8yDECkd7UM9_o1oVDcWU70oy0Uw@mail.gmail.com>
X-Gm-Features: AaiRm50uMwdTq_CJUgQzHvpVmh-wwaoS3dpTeXRuHfTccTh0nxAB6W4bynK64Dk
Message-ID: <CAC=S1njW84bqLR3UvHHdPXT8yDECkd7UM9_o1oVDcWU70oy0Uw@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_bw: Skip tests when outputs don't support
 the mode
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, 
 Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
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

On Thu, Feb 26, 2026 at 12:04=E2=80=AFAM Jason-JH Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> The kms_bw test uses hardcoded display timings that may not match
> what connected panels support. This causes test failures when forcing
> unsupported modes on fixed-mode panels like DSI.
>
> Add output_mode_supported() to check if a mode exists in the
> connector's mode list before using it. Skip outputs that don't
> support the requested mode during buffer creation, CRC collection,
> and cleanup.
>
> For multi-output tests, proceed if at least one output supports
> the mode. Skip only if all outputs reject it.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_bw.c | 39 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 4 deletions(-)
>
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index 778900d8c9f1..dc79ccc001f1 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -187,6 +187,35 @@ static void force_output_mode(data_t *d, igt_output_=
t *output,
>         igt_output_override_mode(output, mode);
>  }
>
> +static bool output_mode_supported(igt_output_t *output, const drmModeMod=
eInfo *mode)
> +{
> +       drmModeConnector *connector =3D output->config.connector;
> +       int i;
> +
> +       /* Virtual/forced sinks support all modes */
> +       if (!igt_output_is_connected(output))
> +               return true;
> +
> +       for (i =3D 0; i < connector->count_modes; i++) {
> +               drmModeModeInfo *conn_mode =3D &connector->modes[i];
> +
> +               if (conn_mode->hdisplay =3D=3D mode->hdisplay &&
> +                   conn_mode->vdisplay =3D=3D mode->vdisplay &&
> +                   conn_mode->vrefresh =3D=3D mode->vrefresh) {
> +                       igt_info("Found matching mode for %dx%d@%dHz on %=
s\n",
> +                                mode->hdisplay, mode->vdisplay, mode->vr=
efresh,
> +                                igt_output_name(output));
> +                       return true;
> +               }
> +       }
> +
> +       igt_info("Mode %dx%d@%dHz not supported by %s (has %d modes)\n",
> +                mode->hdisplay, mode->vdisplay, mode->vrefresh,
> +                igt_output_name(output), connector->count_modes);
> +
> +       return false;
> +}
> +
>  static void run_test_linear_tiling(data_t *data, int pipe, const drmMode=
ModeInfo *mode, bool physical) {
>         igt_display_t *display =3D &data->display;
>         igt_output_t *output;
> @@ -194,7 +223,7 @@ static void run_test_linear_tiling(data_t *data, int =
pipe, const drmModeModeInfo
>         igt_crc_t zero, captured[IGT_MAX_PIPES];
>         int i =3D 0, num_pipes =3D 0;
>         igt_crtc_t *crtc;
> -       int ret;
> +       int ret =3D -EINVAL;
>
>         /* Cannot use igt_display_n_crtcs() due to fused pipes on i915 wh=
ere they do
>          * not give the numver of valid crtcs and always return IGT_MAX_P=
IPES */
> @@ -211,7 +240,7 @@ static void run_test_linear_tiling(data_t *data, int =
pipe, const drmModeModeInfo
>         /* create buffers */
>         for (i =3D 0; i <=3D pipe; i++) {
>                 output =3D physical ? data->connected_output[i] : data->o=
utput[i];
> -               if (!output) {
> +               if (!output || !output_mode_supported(output, mode)) {
>                         continue;
>                 }
>
> @@ -228,7 +257,9 @@ static void run_test_linear_tiling(data_t *data, int =
pipe, const drmModeModeInfo
>                 igt_plane_set_fb(data->primary[i], &buffer[i]);
>                 igt_info("Assigning pipe %s to output %s with mode %s\n",
>                          kmstest_pipe_name(i), igt_output_name(output), m=
ode->name);
> +               ret =3D 0;

I'd suggest using a dedicated flag instead of reusing `ret`, in case
another `ret =3D igt_do_something();` is added before the for loop
someday, which would overwrite the -EINVAL and invalidate the
`igt_skip_on_f()` below.

After which,
Reviewed-by: Fei Shao <fshao@chromium.org>

Regards,
Fei

>         }
> +       igt_skip_on_f(ret !=3D 0, "Unsupported mode for all pipes\n");
>
>         ret =3D igt_display_try_commit_atomic(display,
>                                             DRM_MODE_ATOMIC_ALLOW_MODESET=
 |
> @@ -240,7 +271,7 @@ static void run_test_linear_tiling(data_t *data, int =
pipe, const drmModeModeInfo
>
>         for (i =3D 0; i <=3D pipe; i++) {
>                 output =3D physical ? data->connected_output[i] : data->o=
utput[i];
> -               if (!output) {
> +               if (!output || !output_mode_supported(output, mode)) {
>                         continue;
>                 }
>
> @@ -251,7 +282,7 @@ static void run_test_linear_tiling(data_t *data, int =
pipe, const drmModeModeInfo
>
>         for (i =3D pipe; i >=3D 0; i--) {
>                 output =3D physical ? data->connected_output[i] : data->o=
utput[i];
> -               if (!output)
> +               if (!output || !output_mode_supported(output, mode))
>                         continue;
>
>                 igt_remove_fb(display->drm_fd, &buffer[i]);
> --
> 2.43.0
>
