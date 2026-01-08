Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACE4D1D47C
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 15:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1553910E357;
	Thu,  8 Jan 2026 15:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cf1oBfiI";
	dkim-atps=neutral
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0836510E357
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 15:31:23 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-34c84ec3b6eso3353810a91.3
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Jan 2026 07:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767886282; x=1768491082; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ENa8H8d7qTXV/xn979HHjP9UnGAbJk8tdcrATjwYr2M=;
 b=cf1oBfiICEQy4hAIX1CmBmy+ldj1CwarxCiq+qaB0Oqqb4Q3DZOIW11HKHxd5jWaXT
 Sih/183Vo1IygCiel9sjGBraKKPRiVCt8kNQcB+6lQqZ3k1GNTVVEAPvrZz6KJ6voWTl
 OozUIgD5MQMTib5AhRt8BTFN9iLg1HwBN+PRCxu3BcfCixrdHwHPRxwZEjLX6JxiujcM
 W00klJ7jVnhJ9kOEi0F7av3MPy49NyhblwNEcgV4OuSBZtytRSfc8WDyx+JjfdQKkVmm
 L/38t1jmmTdi5s4bRgdcKqA8scXYayXQ/E8Hwa0Tv5r/NR8uMcCc29m1PY1GEy0VKh4g
 eegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767886282; x=1768491082;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ENa8H8d7qTXV/xn979HHjP9UnGAbJk8tdcrATjwYr2M=;
 b=tN+DRrigdGfNSvHvV2yf25BRNQSMGGFuVFoQuXNUwC3nk6taL7J5zlAU5WRDT3gM9s
 TXbv3QMDfKWJlVo3kTjDGE+PLPy4NCo7AnKKXpFtdKvJNLwxb0EViDunYAXLv6Iova1B
 wAS+FrnCMNLv2jDPniQ15gPPGX5bM19cPfE8diwL3xIbZBzcAHUFlOPU5vcY4eCEbza4
 1VEOOXl+YNkigOZRGDfjsoF0/9q4spqRFXUwLLsYJwTHPA7O2KVGsCm6XpPl2n8NDL5j
 t0oAk4fpZP+PkdiU1ws+e/WQWzrU5w0CmhG8xI3vVC+2TXaAwohyLEqZAimNgfhxF8J1
 w6Kw==
X-Gm-Message-State: AOJu0YxVvw1/P9sZxFPkb8qufABgFepjVNovx738BCIwk3WtDbHorrjG
 yKVIwrLgASdy+iCcAFEQiY41V3YJjoIn/92atp/Lu4tGRJvtnRPjxSH5Pdzfej8vZPb/EJ7+bzP
 rXBdcF5wQhY+L2tpTVGbCbSAW1szkuNs=
X-Gm-Gg: AY/fxX4Ohg2bQo59r755H0EVUonjHuRE8DOaBn/aMYyjXH7kQZ/ZDZ36VeZBPZN4din
 qglPHOWJtWAw4wP5l6sCF37ysNWUBvwH+TK5BLkpxChSTsclnzvtXVRVXEt2g4b6PODWR11sW7F
 1IxZHy1cpEqFDI06xVO/7shx1J8KtvRiE3H2sWQjhy+XZLHFx7cGc8F+BGFkOU69FI/5dz95GKz
 KBreyoWb0Bs0tIKRyDVAH2aIOGPwfVcoS02E2oNTmUQZeudhIWq/3lWj1GEorDm+Cpe5il41Cld
 YNAH+UuXswlc7J3WpJ4rKdjP6Tkt/w==
X-Google-Smtp-Source: AGHT+IERydFHxzIYlG4DIGya6LdJjS7Gg58vPW/IItyDXvSfnT3YBg3+dxpzTx9SPCerIAxJ4cQkvXNmMc2I60HCNZI=
X-Received: by 2002:a17:90a:e7c6:b0:32d:a0f7:fa19 with SMTP id
 98e67ed59e1d1-34f68cbf692mr6936417a91.17.1767886282139; Thu, 08 Jan 2026
 07:31:22 -0800 (PST)
MIME-Version: 1.0
References: <20260107093535.70116-1-swati2.sharma@intel.com>
 <20260107093535.70116-3-swati2.sharma@intel.com>
In-Reply-To: <20260107093535.70116-3-swati2.sharma@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 8 Jan 2026 17:31:10 +0200
X-Gm-Features: AQt7F2pf-jSOaXspoT4outXR5NxWGw-pPvgEdb1BEW4qAjMHJazXQ8bPA9JxFUU
Message-ID: <CAJ=qYWTzn6qWM6xziLjLRtL=faehLotRyzUyqvy_FKV15whM0Q@mail.gmail.com>
Subject: Re: [PATCH i-g-t, v2 2/7] tests/intel/kms_flip_scaled_crc: add flip
 to reflect-x tests
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
> Here added possibility to use rotation flags in tests, including
> reflect flags. Then use the new flags to create xrgb888, xyuv8888
> nv12 and P016 reflect-x tests.
>
> Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
> ---
>  tests/intel/kms_flip_scaled_crc.c | 158 ++++++++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)
>
> diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_sca=
led_crc.c
> index 5ffa357e0..954b46b5f 100644
> --- a/tests/intel/kms_flip_scaled_crc.c
> +++ b/tests/intel/kms_flip_scaled_crc.c
> @@ -122,6 +122,20 @@
>   * @downscaling:        Downscaled
>   * @upscaling:          Upscaled
>   */
> +/**
> + * SUBTEST: flip-32bpp-linear-to-32bpp-linear-reflect-x
> + * Description: Flip from 32bpp non scaled fb to 32bpp non scaled x mirr=
ored fb
> + *
> + * SUBTEST: flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x
> + * Description: Flip from 32bpp xyuv non scaled fb to 32bpp xyuv non sca=
led
> + *              x mirrored fb
> + *
> + * SUBTEST: flip-NV12-linear-to-NV12-linear-reflect-x
> + * Description: Flip from NV12 non scaled fb to NV12 non scaled x mirror=
ed fb
> + *
> + * SUBTEST: flip-P016-linear-to-P016-linear-reflect-x
> + * Description: Flip from P016 non scaled fb to P016 non scaled x mirror=
ed fb
> + */
>
>  IGT_TEST_DESCRIPTION("Test flipping between scaled/nonscaled framebuffer=
s");
>
> @@ -148,6 +162,8 @@ const struct {
>         const uint32_t secondformat;
>         const double firstmultiplier;
>         const double secondmultiplier;
> +       const igt_rotation_t firstrotation;
> +       const igt_rotation_t secondrotation;
>  } flip_scenario_test[] =3D {
>         {
>                 "flip-32bpp-ytile-to-64bpp-ytile-downscaling",
> @@ -156,6 +172,8 @@ const struct {
>                 I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-yftile-to-64bpp-yftile-downscaling",
> @@ -164,6 +182,8 @@ const struct {
>                 I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-xtile-to-64bpp-xtile-downscaling",
> @@ -172,6 +192,8 @@ const struct {
>                 I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-4tile-to-64bpp-4tile-downscaling",
> @@ -180,6 +202,8 @@ const struct {
>                 I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-linear-to-64bpp-linear-downscaling",
> @@ -188,6 +212,8 @@ const struct {
>                 DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-ytile-to-32bpp-ytile-downscaling",
> @@ -196,6 +222,8 @@ const struct {
>                 I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-yftile-to-32bpp-yftile-downscaling",
> @@ -204,6 +232,8 @@ const struct {
>                 I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-xtile-to-32bpp-xtile-downscaling",
> @@ -212,6 +242,8 @@ const struct {
>                 I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB8888,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-4tile-to-32bpp-4tile-downscaling",
> @@ -220,6 +252,8 @@ const struct {
>                 I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-linear-to-32bpp-linear-downscaling",
> @@ -228,6 +262,8 @@ const struct {
>                 DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-ytile-to-16bpp-ytile-downscaling",
> @@ -236,6 +272,8 @@ const struct {
>                 I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_RGB565,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-yftile-to-16bpp-yftile-downscaling",
> @@ -244,6 +282,8 @@ const struct {
>                 I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_RGB565,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-xtile-to-16bpp-xtile-downscaling",
> @@ -252,6 +292,8 @@ const struct {
>                 I915_FORMAT_MOD_X_TILED, DRM_FORMAT_RGB565,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-4tile-to-16bpp-4tile-downscaling",
> @@ -260,6 +302,8 @@ const struct {
>                 I915_FORMAT_MOD_4_TILED, DRM_FORMAT_RGB565,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-linear-to-16bpp-linear-downscaling",
> @@ -268,6 +312,8 @@ const struct {
>                 DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_RGB565,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-ytileccs-to-64bpp-ytile-downscaling",
> @@ -276,6 +322,8 @@ const struct {
>                 I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-yftileccs-to-64bpp-yftile-downscaling",
> @@ -284,6 +332,8 @@ const struct {
>                 I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling",
> @@ -292,6 +342,8 @@ const struct {
>                 I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888=
,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling",
> @@ -300,6 +352,8 @@ const struct {
>                 I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-ytile-to-32bpp-ytileccs-downscaling",
> @@ -308,6 +362,8 @@ const struct {
>                 I915_FORMAT_MOD_Y_TILED_CCS, DRM_FORMAT_XRGB8888,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-yftile-to-32bpp-yftileccs-downscaling",
> @@ -316,6 +372,8 @@ const struct {
>                 I915_FORMAT_MOD_Yf_TILED_CCS, DRM_FORMAT_XRGB8888,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling",
> @@ -324,6 +382,8 @@ const struct {
>                 I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888=
,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling",
> @@ -332,6 +392,8 @@ const struct {
>                 I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
>                 1.0,
>                 2.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-ytile-to-64bpp-ytile-upscaling",
> @@ -340,6 +402,8 @@ const struct {
>                 I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-yftile-to-64bpp-yftile-upscaling",
> @@ -348,6 +412,8 @@ const struct {
>                 I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-xtile-to-64bpp-xtile-upscaling",
> @@ -356,6 +422,8 @@ const struct {
>                 I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-4tile-to-64bpp-4tile-upscaling",
> @@ -364,6 +432,8 @@ const struct {
>                 I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-linear-to-64bpp-linear-upscaling",
> @@ -372,6 +442,8 @@ const struct {
>                 DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-ytile-to-32bpp-ytile-upscaling",
> @@ -380,6 +452,8 @@ const struct {
>                 I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-yftile-to-32bpp-yftile-upscaling",
> @@ -388,6 +462,8 @@ const struct {
>                 I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-xtile-to-32bpp-xtile-upscaling",
> @@ -396,6 +472,8 @@ const struct {
>                 I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB8888,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-4tile-to-32bpp-4tile-upscaling",
> @@ -404,6 +482,8 @@ const struct {
>                 I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-linear-to-32bpp-linear-upscaling",
> @@ -412,6 +492,8 @@ const struct {
>                 DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-ytile-to-16bpp-ytile-upscaling",
> @@ -420,6 +502,8 @@ const struct {
>                 I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_RGB565,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-yftile-to-16bpp-yftile-upscaling",
> @@ -428,6 +512,8 @@ const struct {
>                 I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_RGB565,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-xtile-to-16bpp-xtile-upscaling",
> @@ -436,6 +522,8 @@ const struct {
>                 I915_FORMAT_MOD_X_TILED, DRM_FORMAT_RGB565,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-4tile-to-16bpp-4tile-upscaling",
> @@ -444,6 +532,8 @@ const struct {
>                 I915_FORMAT_MOD_4_TILED, DRM_FORMAT_RGB565,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-linear-to-16bpp-linear-upscaling",
> @@ -452,6 +542,8 @@ const struct {
>                 DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_RGB565,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-ytileccs-to-64bpp-ytile-upscaling",
> @@ -460,6 +552,8 @@ const struct {
>                 I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-yftileccs-to-64bpp-yftile-upscaling",
> @@ -468,6 +562,8 @@ const struct {
>                 I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling",
> @@ -476,6 +572,8 @@ const struct {
>                 I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888=
,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling",
> @@ -484,6 +582,8 @@ const struct {
>                 I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-ytile-to-32bpp-ytileccs-upscaling",
> @@ -492,6 +592,8 @@ const struct {
>                 I915_FORMAT_MOD_Y_TILED_CCS, DRM_FORMAT_XRGB8888,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-32bpp-yftile-to-32bpp-yftileccs-upscaling",
> @@ -500,6 +602,8 @@ const struct {
>                 I915_FORMAT_MOD_Yf_TILED_CCS, DRM_FORMAT_XRGB8888,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling",
> @@ -508,6 +612,8 @@ const struct {
>                 I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888=
,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
>         },
>         {
>                 "flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling",
> @@ -516,6 +622,48 @@ const struct {
>                 I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
>                 0.5,
>                 1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0,
> +       },
> +       {
> +               "flip-32bpp-linear-to-32bpp-linear-reflect-x",
> +               "Flip from 32bpp non scaled fb to 32bpp non scaled x mirr=
ored fb",
> +               DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
> +               DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
> +               1.0,
> +               1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0 | IGT_REFLECT_X,
> +       },
> +       {
> +               "flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x",
> +               "Flip from 32bpp xyuv non scaled fb to 32bpp xyuv non sca=
led x mirrored fb",
> +               DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XYUV8888,
> +               DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XYUV8888,
> +               1.0,
> +               1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0 | IGT_REFLECT_X,
> +       },
> +       {
> +               "flip-NV12-linear-to-NV12-linear-reflect-x",
> +               "Flip from NV12 non scaled fb to NV12 non scaled x mirror=
ed fb",
> +               DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_NV12,
> +               DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_NV12,
> +               1.0,
> +               1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0 | IGT_REFLECT_X,
> +       },
> +       {
> +               "flip-P016-linear-to-P016-linear-reflect-x",
> +               "Flip from P016 non scaled fb to P016 non scaled x mirror=
ed fb",
> +               DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_P016,
> +               DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_P016,
> +               1.0,
> +               1.0,
> +               IGT_ROTATION_0,
> +               IGT_ROTATION_0 | IGT_REFLECT_X,
>         },
>  };
>
> @@ -642,11 +790,16 @@ static void test_flip_to_scaled(data_t *data, uint3=
2_t index,
>         igt_plane_set_fb(primary, &data->small_fb);
>         igt_plane_set_size(primary, data->attemptmodewidth,
>                            data->attemptmodeheight);
> +       igt_plane_set_rotation(primary,
> +                              flip_scenario_test[index].firstrotation);
>         ret =3D igt_display_try_commit_atomic(&data->display, DRM_MODE_AT=
OMIC_ALLOW_MODESET, NULL);
>
>         igt_skip_on_f(ret =3D=3D -ERANGE, "Platform scaling limits exceed=
ed, skipping.\n");
>         igt_skip_on_f((ret =3D=3D -EINVAL) && (!modetoset || modetoset->v=
refresh > 90),
>                       "Valid/default mode too big, cdclk limits exceeded.=
 Check next connector\n");
> +       igt_skip_on_f((ret =3D=3D -EINVAL) &&
> +                     (flip_scenario_test[index].firstrotation !=3D IGT_R=
OTATION_0),
> +                     "Unsupported rotation\n");
>         igt_assert_eq(ret, 0);
>
>         igt_pipe_crc_start(data->pipe_crc);
> @@ -655,6 +808,8 @@ static void test_flip_to_scaled(data_t *data, uint32_=
t index,
>         igt_plane_set_fb(primary, &data->big_fb);
>         igt_plane_set_size(primary, data->attemptmodewidth,
>                            data->attemptmodeheight);
> +       igt_plane_set_rotation(primary,
> +                              flip_scenario_test[index].secondrotation);
>         ret =3D igt_display_try_commit_atomic(&data->display,
>                                             DRM_MODE_ATOMIC_ALLOW_MODESET=
  |
>                                             DRM_MODE_PAGE_FLIP_EVENT, NUL=
L);
> @@ -662,6 +817,9 @@ static void test_flip_to_scaled(data_t *data, uint32_=
t index,
>         igt_skip_on_f(ret =3D=3D -ERANGE, "Platform scaling limits exceed=
ed, skipping.\n");
>         igt_skip_on_f((ret =3D=3D -EINVAL) && (!modetoset || modetoset->v=
refresh > 90),
>                       "Valid/default mode too big, cdclk limits exceeded.=
 Check next connector\n");
> +       igt_skip_on_f((ret =3D=3D -EINVAL) &&
> +                     (flip_scenario_test[index].secondrotation !=3D IGT_=
ROTATION_0),
> +                     "Unsupported rotation\n");
>         igt_assert_eq(ret, 0);
>
>         igt_assert(read(data->drm_fd, &ev, sizeof(ev)) =3D=3D sizeof(ev))=
;
> --
> 2.25.1
>
