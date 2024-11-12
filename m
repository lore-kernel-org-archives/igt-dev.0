Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE2BD32D82
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 10:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB10C10E5A1;
	Tue, 12 Nov 2024 10:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VJA8GWBQ";
	dkim-atps=neutral
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EC110E5A1
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 10:00:05 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-7f45ab88e7fso1408506a12.1
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 02:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731405605; x=1732010405; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NF5iCgS19Sg8kuxw5agEt1aNGyE+wawTKAecQMKnnn8=;
 b=VJA8GWBQEUMAzdcCCKB5mfU3l6AufvMAc7/xqRmf8LQhedwCNhXfsHRrFlt8sZchOj
 sgEMmqAnQx/+2Jo6MMZT4HmzwYeQm/hViaVcbPR4dLJHPgTHR7kIEbIPcfQ9rc0crjZc
 d7bAd9QyHy7RKNY/oabEY+L3L08FeD4/YoGnVTJxvI02bHBdmEmNqc9jEFNpFYONLJWP
 QhCeHAQJSu+Be7D7a7YB547KsU0Rc2M4EzotwRbxdrAs2ldv22/IqcO4j+5iyYFH23ZB
 1ap75vpAiTmBzEkFWcuqZ1jVxRoq3zNcdqmTQAqNS+SPEumlrOJuoH7RRAwYGnwfzkzh
 q6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731405605; x=1732010405;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NF5iCgS19Sg8kuxw5agEt1aNGyE+wawTKAecQMKnnn8=;
 b=OVUfcOY09kXpG/PQZTWYnxRLigs62UARTX1znLZaYNGBjtq6L9gEpqDfJt+b0I9/qq
 a39DwOpKEfA8fbueHV8W2xFyAdWKpqFFJy2AkZSLwQDYq4XeyYrDz0BFeuXXPQHhcS7G
 VO60XOOqX3KT0nGICMNeBEq0lgpTxM0BXHzVXKj2ZGaA8WDvX/Ox0XliSmAf4tdib+Hc
 s+tig8+PZNbhGESgzOHLV/sQAtVVH4UNiPC3IGXkVRbyjDQDYPzFlRQoXFSnP0gGvrP6
 Xf3mXM/y06ts7C3lvh+V0YBPlAoULEfNXeY4KiHf7MOvtvAq461KClk3A7Q0KNupF2R5
 OufQ==
X-Gm-Message-State: AOJu0YwWMh1Ja9lZDk2cZ4c1w4FHChpqMvEBPEp0ZvEWFyqGdkki4ef0
 pmwhj9fd+zjBtkmeQhFyUNa4lSBjyF4FX+Wy1laUsaeR5Z9+DHHWqT21dE9AyuxiuTmNChEtqPK
 YMjs4wJc6W59ymuyORSYGs3YYC/8=
X-Google-Smtp-Source: AGHT+IEuwuBi1viml00vlQ9lZXYxF2alRTML5DnvRld+wLIdJUamjaFGxoocPc6HjdxRjyWnXZjKpPKyXKHSCwQ0pRI=
X-Received: by 2002:a05:6a20:2588:b0:1cf:3677:1c4a with SMTP id
 adf61e73a8af0-1dc228fc6ddmr24085107637.16.1731405605194; Tue, 12 Nov 2024
 02:00:05 -0800 (PST)
MIME-Version: 1.0
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <20241004104121.32750-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20241004104121.32750-6-ville.syrjala@linux.intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 12 Nov 2024 11:59:54 +0200
Message-ID: <CAJ=qYWT3G7i7TrNg-ZtrLjg1RZo5A1-JsyeBL+uNWdRK09DS0A@mail.gmail.com>
Subject: Re: [PATCH i-g-t 05/14] lib/igt_draw: Use function pointers for the
 linear<->tiled conversion
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
> Replace the bare switch statements in the linear<->tiled
> conversions with functions pointers. This will allow us to
> more cleanly provide platform specific implementations for
> each tiling format.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_draw.c | 79 ++++++++++++++++++++++++++++----------------------
>  1 file changed, 44 insertions(+), 35 deletions(-)
>
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index b39a33dcf2cb..dea73aca57b5 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -420,30 +420,34 @@ static void draw_rect_ptr_linear(void *ptr, uint32_=
t stride,
>         }
>  }
>
> -static void draw_rect_ptr_tiled(void *ptr, uint32_t stride, uint32_t til=
ing,
> +typedef int (*linear_x_y_to_tiled_pos_fn)(int x, int y, uint32_t stride,=
 int swizzle,
> +                                         int bpp);
> +
> +static linear_x_y_to_tiled_pos_fn linear_to_tiled_fn(int fd, uint32_t ti=
ling)
> +{
> +       switch (tiling) {
> +       case I915_TILING_X:
> +               return linear_x_y_to_xtiled_pos;
> +       case I915_TILING_Y:
> +               return linear_x_y_to_ytiled_pos;
> +       case I915_TILING_4:
> +               return linear_x_y_to_4tiled_pos;
> +       default:
> +               igt_assert(false);
> +       }
> +}
> +
> +static void draw_rect_ptr_tiled(int fd, void *ptr, uint32_t stride, uint=
32_t tiling,
>                                 int swizzle, struct rect *rect, uint64_t =
color,
>                                 int bpp)
>  {
> +       linear_x_y_to_tiled_pos_fn linear_x_y_to_tiled_pos =3D
> +               linear_to_tiled_fn(fd, tiling);
>         int x, y, pos;
>
>         for (y =3D rect->y; y < rect->y + rect->h; y++) {
>                 for (x =3D rect->x; x < rect->x + rect->w; x++) {
> -                       switch (tiling) {
> -                       case I915_TILING_X:
> -                               pos =3D linear_x_y_to_xtiled_pos(x, y, st=
ride,
> -                                                              swizzle, b=
pp);
> -                               break;
> -                       case I915_TILING_Y:
> -                               pos =3D linear_x_y_to_ytiled_pos(x, y, st=
ride,
> -                                                              swizzle, b=
pp);
> -                               break;
> -                       case I915_TILING_4:
> -                               pos =3D linear_x_y_to_4tiled_pos(x, y, st=
ride,
> -                                                              swizzle, b=
pp);
> -                               break;
> -                       default:
> -                               igt_assert(false);
> -                       }
> +                       pos =3D linear_x_y_to_tiled_pos(x, y, stride, swi=
zzle, bpp);
>                         set_pixel(ptr, pos, color, bpp);
>                 }
>         }
> @@ -471,7 +475,7 @@ static void draw_rect_mmap_cpu(int fd, struct buf_dat=
a *buf, struct rect *rect,
>         case I915_TILING_X:
>         case I915_TILING_Y:
>         case I915_TILING_4:
> -               draw_rect_ptr_tiled(ptr, buf->stride, tiling, swizzle, re=
ct,
> +               draw_rect_ptr_tiled(fd, ptr, buf->stride, tiling, swizzle=
, rect,
>                                     color, buf->bpp);
>                 break;
>         default:
> @@ -536,7 +540,7 @@ static void draw_rect_mmap_wc(int fd, struct buf_data=
 *buf, struct rect *rect,
>         case I915_TILING_X:
>         case I915_TILING_Y:
>         case I915_TILING_4:
> -               draw_rect_ptr_tiled(ptr, buf->stride, tiling, swizzle, re=
ct,
> +               draw_rect_ptr_tiled(fd, ptr, buf->stride, tiling, swizzle=
, rect,
>                                     color, buf->bpp);
>                 break;
>         default:
> @@ -563,10 +567,29 @@ static void draw_rect_pwrite_untiled(int fd, struct=
 buf_data *buf,
>         }
>  }
>
> +typedef void (*tiled_pos_to_x_y_linear_fn)(int tiled_pos, uint32_t strid=
e,
> +                                          int swizzle, int bpp, int *x, =
int *y);
> +
> +static tiled_pos_to_x_y_linear_fn tiled_to_linear_fn(int fd, uint32_t ti=
ling)
> +{
> +       switch (tiling) {
> +       case I915_TILING_X:
> +               return xtiled_pos_to_x_y_linear;
> +       case I915_TILING_Y:
> +               return ytiled_pos_to_x_y_linear;
> +       case I915_TILING_4:
> +               return tile4_pos_to_x_y_linear;
> +       default:
> +               igt_assert(false);
> +       }
> +}
> +
>  static void draw_rect_pwrite_tiled(int fd, struct buf_data *buf,
>                                    uint32_t tiling, struct rect *rect,
>                                    uint64_t color, uint32_t swizzle)
>  {
> +       tiled_pos_to_x_y_linear_fn tiled_pos_to_x_y_linear =3D
> +               tiled_to_linear_fn(fd, tiling);
>         int i;
>         int tiled_pos, x, y, pixel_size;
>         uint8_t tmp[4096];
> @@ -588,22 +611,8 @@ static void draw_rect_pwrite_tiled(int fd, struct bu=
f_data *buf,
>                 set_pixel(tmp, i, color, buf->bpp);
>
>         for (tiled_pos =3D 0; tiled_pos < buf->size; tiled_pos +=3D pixel=
_size) {
> -               switch (tiling) {
> -               case I915_TILING_X:
> -                       xtiled_pos_to_x_y_linear(tiled_pos, buf->stride,
> -                                                swizzle, buf->bpp, &x, &=
y);
> -                       break;
> -               case I915_TILING_Y:
> -                       ytiled_pos_to_x_y_linear(tiled_pos, buf->stride,
> -                                                swizzle, buf->bpp, &x, &=
y);
> -                       break;
> -               case I915_TILING_4:
> -                       tile4_pos_to_x_y_linear(tiled_pos, buf->stride,
> -                                               swizzle, buf->bpp, &x, &y=
);
> -                       break;
> -               default:
> -                       igt_assert(false);
> -               }
> +               tiled_pos_to_x_y_linear(tiled_pos, buf->stride,
> +                                       swizzle, buf->bpp, &x, &y);
>
>                 if (x >=3D rect->x && x < rect->x + rect->w &&
>                     y >=3D rect->y && y < rect->y + rect->h) {
> --
> 2.45.2
>
