Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4684EC19F2E
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 13:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B9D10EAEF;
	Thu, 27 Feb 2025 13:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UZ0goQ2v";
	dkim-atps=neutral
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BE410EAEF
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 13:50:27 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2fc3db58932so1539983a91.2
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 05:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740664226; x=1741269026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jP2mbOXotXLG2ww8vL8cmg6A6Oj9qaURnkUEd2k+HQ0=;
 b=UZ0goQ2vPQEfU7X9mzYtLReJKs4W3XynSr7nBRjTSYTeXQV/rKHazx3Uw29o8oYha0
 MtCASHRGYWVfeI3E6EQA3e2jcQ9TyJCA14UNooJjTPHLrXGgLGcoixqHxdWQMHyXazUq
 Lwt71ZUQYayMYV09tZP1CcVU4D6aiTwqj1hyZBuf/KUonP/pQj5xbuAEYfQXlxE87pm9
 E+rVLCjtgKPcllSbnTH9mlBQJzkYZBeGQwFWMhRf8P4al9mJH+l8I4+PnIINI+MBYRyl
 92NyqseqlHO7SLPFh8lcslojn3xoZfeQxdVqtNVzf60IyEtF6pOEWCLjU+1vUmYRFTJT
 U+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740664226; x=1741269026;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jP2mbOXotXLG2ww8vL8cmg6A6Oj9qaURnkUEd2k+HQ0=;
 b=wlmRys0y1zd8zWFv41+F4mnFRB/160hlNBY6PLF+BgW+dj6H8Gz/SSUuw/jcysFpRn
 e8cbzJUu0ZBSOovO6qkwKWcaCRZF+QQAn7cqtUhL6X5mq2v9scNeBBpcbwsKvRsPmn8J
 ++0qhSA+89mFtbcz385faL+Y+md/xDYw6p/9kJ4OuPLtesK448l/JeVofBOjr716Evmn
 +D3rF+jeFoID36gTIWKpqopLG9x+ujMEemx7NaLsq1scO5RlaNctSO5m3AyXKo9xdlh4
 SZrKAu3y0ibOE84je36BJk/L4/I2hn2WQQe301dgm8f0IZ0GpRROdp0AlQau05asEgeU
 T2TA==
X-Gm-Message-State: AOJu0YwWUC4eAj7lQHWJz5f2wI2dMc6uu0FvYR6rlPuh3WRnQx+HfGkS
 GEAF+JDF6lXqPi1u0JrflNxA0USwzjyROmlsmSqKXnD5CMPPD7Dlwrh/2nvyUNTefi2OLNn7Tjm
 ylPvc33eDyUIOUMo5221sUhA8qdA=
X-Gm-Gg: ASbGncvHYXxnJG4p3oVLo89JOqL7phlQoIFGnlaHgYEF007NMQz3VQiPPsjgSq+Ry/D
 TgZf1rvLdxf/e6MbQUaP2TC9lQES8wFB4CJJodbAxZ8McLVwAMv/oAj4SW/qaNz/wDDKIGD+RN2
 6ypWRETkDwBg==
X-Google-Smtp-Source: AGHT+IGS2LjRCRYUvrD6Os8sqO6ckJhmKK94y2rE+GAVfR2P8fDtz0DHujMWqLJDx/JDXUKZYJRAT3kNlXUM8L6hdUs=
X-Received: by 2002:a17:90a:fe15:b0:2fe:8a84:e033 with SMTP id
 98e67ed59e1d1-2fe8a84edd4mr8905624a91.2.1740664224910; Thu, 27 Feb 2025
 05:50:24 -0800 (PST)
MIME-Version: 1.0
References: <20250220141310.229053-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250220141310.229053-1-vinod.govindapillai@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 27 Feb 2025 15:50:12 +0200
X-Gm-Features: AQ5f1Jr2E0ckSEJ4Tnvs49KY3MvASMROaQbw9cFOffDB5tncLoBrZA4MXn2Yhr4
Message-ID: <CAJ=qYWSMExP5y2KR=ae_yn2XOkaErrA7JoJOCXardKeUmg52KQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t v1] tests/intel/kms_dirty-fb: update modifier based
 on display version for fbc
To: Vinod Govindapillai <vinod.govindapillai@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com, jeevan.b@intel.com,
 jani.saarinen@intel.com
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

On Thu, Feb 20, 2025 at 4:13=E2=80=AFPM Vinod Govindapillai
<vinod.govindapillai@intel.com> wrote:
>
> FBC on display version 8 below supports only I915_FORMAT_MOD_X_TILED
> modifier. So update the FBC specific tests based on this restriction,
>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  tests/intel/kms_dirtyfb.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index f2bdd4546..e0fd84ade 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -58,6 +58,7 @@ typedef struct {
>         int debugfs_fd;
>         igt_display_t display;
>         drmModeModeInfo *mode;
> +       uint64_t modifier;
>         igt_output_t *output;
>         igt_pipe_crc_t *pipe_crc;
>         enum pipe pipe;
> @@ -238,7 +239,7 @@ static void prepare(data_t *data)
>
>         igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
>                             data->mode->vdisplay, DRM_FORMAT_XRGB8888,
> -                           DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
> +                           data->modifier, 0.0, 1.0, 0.0,
>                             &data->fbs[0]);
>
>         igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[0],
> @@ -260,7 +261,7 @@ static void prepare(data_t *data)
>
>         igt_create_color_fb(data->drm_fd,  data->mode->hdisplay,
>                             data->mode->vdisplay, DRM_FORMAT_XRGB8888,
> -                           DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
> +                           data->modifier, 0.0, 1.0, 0.0,
>                             &data->fbs[1]);
>         igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[1],
>                          data->rendercopy ? IGT_DRAW_RENDER : IGT_DRAW_BL=
T,
> @@ -268,8 +269,8 @@ static void prepare(data_t *data)
>                          data->fbs[1].height, 0xFF);
>
>         igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
> -                            data->mode->vdisplay, DRM_FORMAT_XRGB8888,
> -                           DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
> +                           data->mode->vdisplay, DRM_FORMAT_XRGB8888,
> +                           data->modifier, 0.0, 1.0, 0.0,
>                             &data->fbs[2]);
>
>         igt_plane_set_fb(primary, &data->fbs[2]);
> @@ -386,6 +387,13 @@ igt_main
>                                         igt_skip_on_f((IS_BATTLEMAGE(data=
.devid) && data.feature =3D=3D FEATURE_FBC),
>                                                        "FBC isn't support=
ed on BMG\n");
>
> +                                       /* FBC Disp_ver 8 and below suppo=
rts only I915_FORMAT_MOD_X_TILED */
> +                                       if (data.feature =3D=3D FEATURE_F=
BC &&
> +                                           intel_display_ver(intel_get_d=
rm_devid(data.drm_fd) <=3D 8))
> +                                               data.modifier =3D I915_FO=
RMAT_MOD_X_TILED;
> +                                       else
> +                                               data.modifier =3D DRM_FOR=
MAT_MOD_LINEAR;
> +
>                                         if (!check_support(&data))
>                                                 continue;
>
> --
> 2.43.0
>
