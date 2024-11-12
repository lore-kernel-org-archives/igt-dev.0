Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40DFD42BA2
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 16:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CF910E032;
	Tue, 12 Nov 2024 16:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jtEAyBYY";
	dkim-atps=neutral
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F9910E032
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 16:08:27 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2e30fb8cb07so4538926a91.3
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 08:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731427706; x=1732032506; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EpRxLT49E5tcD5j7RUZ+ApAaD2A6EfCPPschilOW26o=;
 b=jtEAyBYYTS3Gx7qkt7FsKjG00JlXV8kPFGCRujUkFQAKy2cMELToMh/ASGAFA7UHec
 q2nH6gdsBuWz/hSVfVk3eDImdjmq1BDbmjwSs1chtlsOiB9esGMVeQkybgmSfUDSxkh3
 gTBVhkkGQwNtpRq6nFWM7SNf2z/qOjYOHSVoQh2/KQjU67ZaGnztPwmIvMlrKGJnXeAK
 GzZs2jbvfrIRU+aenUrHqBMqEyU1TEHQyqL7wMNdu0BIUK78AHJhrjhm0/aocUX99Y/f
 xMimgLFI/ucQfmUZjd4lJTYBg0SMu2XuIk0SB75m4TCch3jN6nZ3IJah2O+F8v40yTVU
 L9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731427706; x=1732032506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EpRxLT49E5tcD5j7RUZ+ApAaD2A6EfCPPschilOW26o=;
 b=YJxRcWBMdIQBhC2eIae+2Ty+n6CE6E1uh5mvaSTjSO/poTEb9Rko6Xlabd9Qj8PDMq
 lFsG5PRlIcE1RCuEGkrNfCBKJRO1mlNstA6fug9jQtwaLqYrshSgPeDfNdwLdgjml/5A
 THSqUau2XAqXbEguC9LoW1hgBmCD8L0yriOYN668nHber8b+A2aWPZR16w2qVQWZLS5C
 hGO+nTicbJR8RsEftWmuSqBSRg4QwuYLt0N7EqlWoOwCpgBgpbVP9QUCHylAYqfyQO6Q
 48FbXPwsWcCJBxWuitfD/YxfeOflsRM+4GqHBq28qwtOU8cs8r/e5khmryxc+WI8m6m6
 lrkQ==
X-Gm-Message-State: AOJu0YzLhlyt9BzrFu+CFo2vN7gFF2qzAB8jwbLrBmC+/k6igJp8yAhl
 Lt/HIe5D90dVe9hzVLwSwakJSsiipTnwbHQ7ixZ0th1WdWimwyYS1cv9l3Or2fEwl6uDYylSVpR
 N1+ihEriSysagRzwYtCJ3yvzv0h0=
X-Google-Smtp-Source: AGHT+IFe4eNz4FQ9kRr+TQClulxWUrAEaxKVVrsaUnfVf79jBIuVL8Hc1KhXzS+r6EAqAhZfFr+3rExZEjSNWLLoV78=
X-Received: by 2002:a17:90b:3c01:b0:2e0:db81:4f79 with SMTP id
 98e67ed59e1d1-2e9e4aa86bcmr4045806a91.2.1731427706352; Tue, 12 Nov 2024
 08:08:26 -0800 (PST)
MIME-Version: 1.0
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <20241004104121.32750-7-ville.syrjala@linux.intel.com>
In-Reply-To: <20241004104121.32750-7-ville.syrjala@linux.intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 12 Nov 2024 18:08:15 +0200
Message-ID: <CAJ=qYWQmGqoP9-W+sFhfJ33xnMMzfFrwBTbgRfJed=8HBa_YuA@mail.gmail.com>
Subject: Re: [PATCH i-g-t 06/14] lib/igt_draw: Add support for gen2 and i915
 tiling layouts
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
> Add the full complement of X/Y-tile<->linear conversions.
>
> Our tile formats are as follows:
> X-tile:
>  gen2:  128B x 16, made of  8B QWords
>  gen3:  512B x  8, made of 32B SWords
>  gen4+: 512B x  8, made of 16B OWords
> Y-tile:
>  gen2:  128B x 16, made of  8B QWords
>  i915:  512B x  8, made of 32B SWords
>  i945+: 128B x 32, made of 16B OWords
>
> We already had the i945+ Y-tile and i915+ X-tile
> (since the i945 OW vs. i915 SW makes no difference
> for X-tile). So just need to deal with gen2 X/Y-tile
> and i915 Y-tile.
>
> And we finish off by nuking the (technically
> incorrect) gen5+ checks so that people can use
> this.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_draw.c | 124 ++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 98 insertions(+), 26 deletions(-)
>
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index dea73aca57b5..93924ece8250 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -204,35 +204,65 @@ static void untile(int tiled_pos, int x_tile_size, =
int y_tile_size,
>  }
>
>  static int linear_x_y_to_xtiled_pos(int x, int y, uint32_t stride, int s=
wizzle,
> -                                   int bpp)
> +                                   int bpp, int x_tile_size, int y_tile_=
size)
>  {
>         int pos;
>         int pixel_size =3D bpp / 8;
>
>         x *=3D pixel_size;
> -       pos =3D tile(x, y, 512, 8, stride, true);
> +       pos =3D tile(x, y, x_tile_size, y_tile_size, stride, true);
>         pos =3D swizzle_addr(pos, swizzle);
>         return pos / pixel_size;
>  }
>
> +static int gen2_linear_x_y_to_xtiled_pos(int x, int y, uint32_t stride, =
int swizzle,
> +                                        int bpp)
> +{
> +       return linear_x_y_to_xtiled_pos(x, y, stride, swizzle, bpp, 128, =
16);
> +}
> +
> +static int gen3_linear_x_y_to_xtiled_pos(int x, int y, uint32_t stride, =
int swizzle,
> +                                        int bpp)
> +{
> +       return linear_x_y_to_xtiled_pos(x, y, stride, swizzle, bpp, 512, =
8);
> +}
> +
>  static int linear_x_y_to_ytiled_pos(int x, int y, uint32_t stride, int s=
wizzle,
> -                                   int bpp)
> +                                   int bpp, int x_tile_size, int y_tile_=
size,
> +                                   int ow_size)
>  {
>         int ow_tile_n, pos;
> -       int ow_size =3D 16;
>         int pixel_size =3D bpp / 8;
>
>         /* We have an Y tiling of OWords, so use the tile() function to g=
et the
>          * OW number, then adjust to the fact that the OW may have more t=
han one
>          * pixel. */
>         x *=3D pixel_size;
> -       ow_tile_n =3D tile(x / ow_size, y, 128 / ow_size, 32,
> -                        stride / ow_size, false);
> +       ow_tile_n =3D tile(x / ow_size, y, x_tile_size / ow_size,
> +                        y_tile_size, stride / ow_size, false);
>         pos =3D ow_tile_n * ow_size + (x % ow_size);
>         pos =3D swizzle_addr(pos, swizzle);
>         return pos / pixel_size;
>  }
>
> +static int gen2_linear_x_y_to_ytiled_pos(int x, int y, uint32_t stride, =
int swizzle,
> +                                        int bpp)
> +{
> +       return linear_x_y_to_ytiled_pos(x, y, stride, swizzle, bpp, 128, =
16, 8);
> +}
> +
> +static int i915_linear_x_y_to_ytiled_pos(int x, int y, uint32_t stride, =
int swizzle,
> +                                        int bpp)
> +{
> +       return linear_x_y_to_ytiled_pos(x, y, stride, swizzle, bpp, 512, =
8, 32);
> +}
> +
> +static int i945_linear_x_y_to_ytiled_pos(int x, int y, uint32_t stride, =
int swizzle,
> +                                        int bpp)
> +{
> +       return linear_x_y_to_ytiled_pos(x, y, stride, swizzle, bpp, 128, =
32, 16);
> +}
> +
>  #define OW_SIZE 16                     /* in bytes */
>  #define TILE_4_SUBTILE_SIZE 64         /* in bytes */
>  #define TILE_4_WIDTH 128               /* in bytes */
> @@ -299,32 +329,63 @@ static int linear_x_y_to_4tiled_pos(int x, int y, u=
int32_t stride, int swizzle,
>  }
>
>  static void xtiled_pos_to_x_y_linear(int tiled_pos, uint32_t stride,
> -                                    int swizzle, int bpp, int *x, int *y=
)
> +                                    int swizzle, int bpp, int *x, int *y=
,
> +                                    int x_tile_size, int y_tile_size)
>  {
>         int pixel_size =3D bpp / 8;
>
>         tiled_pos =3D swizzle_addr(tiled_pos, swizzle);
>
> -       untile(tiled_pos, 512, 8, stride, true, x, y);
> +       untile(tiled_pos, x_tile_size, y_tile_size, stride, true, x, y);
>         *x /=3D pixel_size;
>  }
>
> +static void gen2_xtiled_pos_to_x_y_linear(int tiled_pos, uint32_t stride=
,
> +                                         int swizzle, int bpp, int *x, i=
nt *y)
> +{
> +       return xtiled_pos_to_x_y_linear(tiled_pos, stride, swizzle, bpp, =
x, y, 128, 16);
> +}
> +
> +static void gen3_xtiled_pos_to_x_y_linear(int tiled_pos, uint32_t stride=
,
> +                                         int swizzle, int bpp, int *x, i=
nt *y)
> +{
> +       return xtiled_pos_to_x_y_linear(tiled_pos, stride, swizzle, bpp, =
x, y, 512, 8);
> +}
> +
>  static void ytiled_pos_to_x_y_linear(int tiled_pos, uint32_t stride,
> -                                    int swizzle, int bpp, int *x, int *y=
)
> +                                    int swizzle, int bpp, int *x, int *y=
,
> +                                    int x_tile_size, int y_tile_size, in=
t ow_size)
>  {
>         int ow_tile_n;
> -       int ow_size =3D 16;
>         int pixel_size =3D bpp / 8;
>
>         tiled_pos =3D swizzle_addr(tiled_pos, swizzle);
>
>         ow_tile_n =3D tiled_pos / ow_size;
> -       untile(ow_tile_n, 128 / ow_size, 32, stride / ow_size, false, x, =
y);
> +       untile(ow_tile_n, x_tile_size / ow_size, y_tile_size, stride / ow=
_size, false, x, y);
>         *x *=3D ow_size;
>         *x +=3D tiled_pos % ow_size;
>         *x /=3D pixel_size;
>  }
>
> +static void gen2_ytiled_pos_to_x_y_linear(int tiled_pos, uint32_t stride=
,
> +                                         int swizzle, int bpp, int *x, i=
nt *y)
> +{
> +       ytiled_pos_to_x_y_linear(tiled_pos, stride, swizzle, bpp, x, y, 1=
28, 16, 8);
> +}
> +
> +static void i915_ytiled_pos_to_x_y_linear(int tiled_pos, uint32_t stride=
,
> +                                         int swizzle, int bpp, int *x, i=
nt *y)
> +{
> +       ytiled_pos_to_x_y_linear(tiled_pos, stride, swizzle, bpp, x, y, 5=
12, 8, 32);
> +}
> +
> +static void i945_ytiled_pos_to_x_y_linear(int tiled_pos, uint32_t stride=
,
> +                                         int swizzle, int bpp, int *x, i=
nt *y)
> +{
> +       ytiled_pos_to_x_y_linear(tiled_pos, stride, swizzle, bpp, x, y, 1=
28, 32, 16);
> +}
> +
>  static void tile4_pos_to_x_y_linear(int tiled_pos, uint32_t stride,
>                                     int swizzle, int bpp, int *x, int *y)
>  {
> @@ -425,11 +486,22 @@ typedef int (*linear_x_y_to_tiled_pos_fn)(int x, in=
t y, uint32_t stride, int swi
>
>  static linear_x_y_to_tiled_pos_fn linear_to_tiled_fn(int fd, uint32_t ti=
ling)
>  {
> +       const struct intel_device_info *info =3D
> +               intel_get_device_info(intel_get_drm_devid(fd));
> +
>         switch (tiling) {
>         case I915_TILING_X:
> -               return linear_x_y_to_xtiled_pos;
> +               if (info->graphics_ver =3D=3D 2)
> +                       return gen2_linear_x_y_to_xtiled_pos;
> +               else
> +                       return gen3_linear_x_y_to_xtiled_pos;
>         case I915_TILING_Y:
> -               return linear_x_y_to_ytiled_pos;
> +               if (info->graphics_ver =3D=3D 2)
> +                       return gen2_linear_x_y_to_ytiled_pos;
> +               else if (info->is_grantsdale || info->is_alviso)
> +                       return i915_linear_x_y_to_ytiled_pos;
> +               else
> +                       return i945_linear_x_y_to_ytiled_pos;
>         case I915_TILING_4:
>                 return linear_x_y_to_4tiled_pos;
>         default:
> @@ -461,10 +533,6 @@ static void draw_rect_mmap_cpu(int fd, struct buf_da=
ta *buf, struct rect *rect,
>         gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_CPU,
>                        I915_GEM_DOMAIN_CPU);
>
> -       /* We didn't implement suport for the older tiling methods yet. *=
/
> -       if (tiling !=3D I915_TILING_NONE)
> -               igt_require(intel_display_ver(intel_get_drm_devid(fd)) >=
=3D 5);
> -
>         ptr =3D gem_mmap__cpu_coherent(fd, buf->handle, 0, PAGE_ALIGN(buf=
->size),
>                                      PROT_READ | PROT_WRITE);
>
> @@ -513,10 +581,6 @@ static void draw_rect_mmap_wc(int fd, struct buf_dat=
a *buf, struct rect *rect,
>                 gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_GTT,
>                                I915_GEM_DOMAIN_GTT);
>
> -               /* We didn't implement suport for the older tiling method=
s yet. */
> -               if (tiling !=3D I915_TILING_NONE)
> -                       igt_require(intel_display_ver(intel_get_drm_devid=
(fd)) >=3D 5);
> -
>                 if (gem_has_lmem(fd))
>                         ptr =3D gem_mmap_offset__fixed(fd, buf->handle, 0=
,
>                                                      PAGE_ALIGN(buf->size=
),
> @@ -572,11 +636,22 @@ typedef void (*tiled_pos_to_x_y_linear_fn)(int tile=
d_pos, uint32_t stride,
>
>  static tiled_pos_to_x_y_linear_fn tiled_to_linear_fn(int fd, uint32_t ti=
ling)
>  {
> +       const struct intel_device_info *info =3D
> +               intel_get_device_info(intel_get_drm_devid(fd));
> +
>         switch (tiling) {
>         case I915_TILING_X:
> -               return xtiled_pos_to_x_y_linear;
> +               if (info->graphics_ver =3D=3D 2)
> +                       return gen2_xtiled_pos_to_x_y_linear;
> +               else
> +                       return gen3_xtiled_pos_to_x_y_linear;
>         case I915_TILING_Y:
> -               return ytiled_pos_to_x_y_linear;
> +               if (info->graphics_ver =3D=3D 2)
> +                       return gen2_ytiled_pos_to_x_y_linear;
> +               else if (info->is_grantsdale || info->is_alviso)
> +                       return i915_ytiled_pos_to_x_y_linear;
> +               else
> +                       return i945_ytiled_pos_to_x_y_linear;
>         case I915_TILING_4:
>                 return tile4_pos_to_x_y_linear;
>         default:
> @@ -598,9 +673,6 @@ static void draw_rect_pwrite_tiled(int fd, struct buf=
_data *buf,
>         int tmp_start_pos =3D 0;
>         int pixels_written =3D 0;
>
> -       /* We didn't implement suport for the older tiling methods yet. *=
/
> -       igt_require(intel_display_ver(intel_get_drm_devid(fd)) >=3D 5);
> -
>         pixel_size =3D buf->bpp / 8;
>         tmp_size =3D sizeof(tmp) / pixel_size;
>
> --
> 2.45.2
>
