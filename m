Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5591D49228
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 14:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DF610E500;
	Mon, 18 Nov 2024 14:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IlD/iNyF";
	dkim-atps=neutral
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECF210E501
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 14:50:31 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2ea49a1b4c8so1096181a91.2
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 06:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731941431; x=1732546231; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ykBqa/18NEhh0vxyOqRiJ5PbeRS0Q1EGd0EuLRFrOY=;
 b=IlD/iNyFoh4ZLHkn8FCYn67LtyYqMUiaKajKhstk1+WRtq7bOGBqJoMdl2AoNMyazy
 94mKpmw5iMCfgCr1JzZoMq/xEE6Z89oWf2d0AECogUNhrcV6ooRiJX2Eu5vw7xO/tCIX
 lBnzkKncRb7mcBjIugGpI+xTxZuCMidj3uVFqki/iwkkJer78LCzh4JO9v8y8pAtypPe
 jsNKl3Y3rfsFV74L5x5/Je60LDGgQqEiCFnsHe5a2rualnFCrbmXRibYTCnbiRoj/NkP
 jOu48txrW//g6T91F1l+ltMYVu9ySHLL6W1KbDajRNx+xHTIyKPivoPOmsYd5Wd8PG48
 vA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731941431; x=1732546231;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ykBqa/18NEhh0vxyOqRiJ5PbeRS0Q1EGd0EuLRFrOY=;
 b=SGwJiXp4wzgsn34rqmc5DjKrvQlYdJ3sU1gWzfLHTx3qDApxUEMqAgqlHD3NFU1Ozs
 ZuLfutKa+s8MicBWYqXj9m85/5miV/A5LN29MR1fYgmxiHjPbHrLbM0jOTNbCzRZiVwq
 lj2yME5zj9trt0bWT6qUkRdkm4mU8VP9sEOfkUDk51aiEwKkpi31vWGy6U7Lf0oWuUsZ
 kDsqCFOr0HC/nuef0WPs0plZvhQH4d/lQLoD2TmOOHAszMZh69jxufZnoXreiYLP9Hv9
 S6p4yutloteRakfba4sSAH522m42ZtyscZdGL+iDI9P4AT8hWQSVXn+Aa6yd2kxYvrHL
 +1gw==
X-Gm-Message-State: AOJu0YyOr+A89YEF5ZMP6Rq394N2pHI5Vz4ljqU/8AEMiMMMz99X1G41
 DpPYBGJjyJFFCF60D7S8/Q8UvuaDIgwVhIGdGeokZn+5KgZ16M86zP9pcM40qqkULm9iq+R5E5o
 +5CfhMeEel6yIA21fenU7vAH1vCKvfeUnHkqbXg==
X-Google-Smtp-Source: AGHT+IF7qlvJQ0MQtdFWEeXl2PE1Ff/Wv5r5rvl7atwWY7hioLANXnmSwiRCgiN6+gCWTABIXPXHGEGJVuxRqmxPOH0=
X-Received: by 2002:a17:90b:380a:b0:2ea:5fed:4a2e with SMTP id
 98e67ed59e1d1-2ea5fed4bcemr6162772a91.6.1731941430832; Mon, 18 Nov 2024
 06:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <20241004104121.32750-13-ville.syrjala@linux.intel.com>
In-Reply-To: <20241004104121.32750-13-ville.syrjala@linux.intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Mon, 18 Nov 2024 16:50:19 +0200
Message-ID: <CAJ=qYWR6SX_0EcT7R9vTT6=g81nYKrPdyBSA0zT=0ufEdk0ehg@mail.gmail.com>
Subject: Re: [PATCH i-g-t 12/14] tests/kms_draw_crc: Test 64bpp
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

On Fri, Oct 4, 2024 at 1:41=E2=80=AFPM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
>
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Test 64bpp formats to make sure igt_draw is working correctly.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_draw_crc.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
> index e3d1c0ba9bd8..078a6f46d31a 100644
> --- a/tests/intel/kms_draw_crc.c
> +++ b/tests/intel/kms_draw_crc.c
> @@ -34,6 +34,7 @@
>
>  #include "i915/gem.h"
>  #include "igt.h"
> +#include "igt_halffloat.h"
>
>  /**
>   * SUBTEST: fill-fb
> @@ -76,6 +77,7 @@ static const uint32_t formats[] =3D {
>         DRM_FORMAT_XRGB8888,
>         DRM_FORMAT_RGB565,
>         DRM_FORMAT_XRGB2101010,
> +       DRM_FORMAT_XBGR16161616F,
>  };
>
>  static const uint64_t modifiers[] =3D {
> @@ -109,9 +111,11 @@ static void find_modeset_params(void)
>         }
>  }
>
> -static uint32_t get_color(uint32_t drm_format, bool r, bool g, bool b)
> +static uint64_t get_color(uint32_t drm_format, bool r, bool g, bool b)
>  {
> -       uint32_t color =3D 0;
> +       uint64_t color =3D 0;
> +       uint16_t h[3];
> +       float f[3];
>
>         switch (drm_format) {
>         case DRM_FORMAT_RGB565:
> @@ -129,6 +133,15 @@ static uint32_t get_color(uint32_t drm_format, bool =
r, bool g, bool b)
>                 color |=3D g ? 0x3FF << 10 : 0;
>                 color |=3D b ? 0x3FF : 0;
>                 break;
> +       case DRM_FORMAT_XBGR16161616F:
> +               f[0] =3D r ? 1.0f : 0.0f;
> +               f[1] =3D g ? 1.0f : 0.0f;
> +               f[2] =3D b ? 1.0f : 0.0f;
> +               igt_float_to_half(f, h, 3);
> +               color |=3D (uint64_t)h[2] << 32 |
> +                       (uint64_t)h[1] << 16 |
> +                       (uint64_t)h[0] << 0;
> +               break;
>         default:
>                 igt_assert(false);
>         }
> @@ -290,6 +303,8 @@ static const char *format_str(int format_index)
>                 return "xrgb8888";
>         case DRM_FORMAT_XRGB2101010:
>                 return "xrgb2101010";
> +       case DRM_FORMAT_XBGR16161616F:
> +               return "xbgr16161616f";
>         default:
>                 igt_assert(false);
>         }
> --
> 2.45.2
>
