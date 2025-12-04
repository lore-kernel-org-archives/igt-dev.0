Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77D4D1D89E
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 09:34:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AF610E8F4;
	Thu,  4 Dec 2025 09:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sb5N4Pn8";
	dkim-atps=neutral
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D74B10E8F4
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 09:34:15 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-3410c86070dso522240a91.1
 for <igt-dev@lists.freedesktop.org>; Thu, 04 Dec 2025 01:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764840855; x=1765445655; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/jCKR+opv97LEa75JF+A+ZsKPWqn4TfHYfEHyrbZ8+k=;
 b=Sb5N4Pn8IhpvIj0NZRZMUBvznbcAelpMohwaaShdxuZmv+4TEVw8GCAsboFkYNvmX5
 Xcf+u6f6b72MXwZ8kXkAhjxtSevryDegBa1XLMH7PjuR6+DcV+3goXNZrRpINMZl4EFO
 1xtWcwsyqwH/EVsfIYmFDsnpM2CucPMInUGfRLVmOH+JTd7jt5GJsbRXuUsAPvw1kouU
 3AiFKaYd3/4h7Eik/6SM/N3nsZNDm71xhag2kGZa5sNl3Q8/OYCW6G7yV6CBNtmtU7h1
 P4E4DZpu8tXy/FFOAJyzfFgJxQL1bjBJFEOqkoeU0jYAxxw/50+a2gcSkKS8FFJ3C/fZ
 /frg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764840855; x=1765445655;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/jCKR+opv97LEa75JF+A+ZsKPWqn4TfHYfEHyrbZ8+k=;
 b=wuv1nHuiEdaUfZhP5X0H0wws1fssTmIRYJc0FoCvC0DFV2+SnEuqkN11daVN3Wr58Y
 0WppZ1dZhRJ2fetLgO2n27nDWXZQx8ft02Bl7pjxKG1QzHHSyjxONobukyHzGvJQX+Fg
 CWRGBEgprWS2XR5WiT6a5OWUluhqQ5oluw8UlrWo67/L/qSNuD6eQBY2tlmbddHnMJMo
 xPNiZZxXZwk2rv0rB2ErruDm58J6OhA4uCUKMavpqjEpKMq8TZDBfT+8afVgIiJtKipF
 Ys6ifZFqi0k/eFtFnbBd2tg07BKI5Qu8XFhlFxF/u0ioHw0ddu7fjTyAxc5HiiGcs0D3
 AdUg==
X-Gm-Message-State: AOJu0YwWdO/Rf/O65okrvFG9yVRwip8USn+2LLwtiwmUK+DaeRSnJ0lv
 oadg6pRhCOvv+2SDrXG3wlUeNmAv7dZbp7R5cMTzwKDZZknRR9cuEC2dNwUOk1pvbAZkmMJllrM
 85xxIy4iMo+f36PIad6ZecgRPs8sfXpM=
X-Gm-Gg: ASbGncsgnOce+QsDlqDWqsUgEI2uyVNqOBKnjzkNVWCrGYubTcBGKnwSR3gHQ2gnZ+P
 OszBkvLXZcWkOaoR7k5Kd9PYq4DK23DvnR+SBUmgHSLVxnbJpyqMYyojFBw0AX/3ehdM0xaIouS
 K02xJcHKEhDdxcUvhbOKBf0sYHNxzw2tdntsqG/rh+PzkyU9z6M89Q2RBPNq6Knl8FtMxpsGG2Z
 TFvz2CH3aYEHM+YUKUM5BkLrrMj46VtHeMiqZpAHsTPAM6k47khSU2FeAGr6NqUje0ixvUHVv7x
 SepQHjQWHHg8kBS7oOifPPculRgpGw==
X-Google-Smtp-Source: AGHT+IGfvFnuHvAsQYBWg2++BxCHH1IwOhBV+83v1C51/6piERfbf/QVs+EHZPFetEhM63qF5uc3agukCNl5DgaVX7w=
X-Received: by 2002:a17:90b:2f08:b0:335:2823:3683 with SMTP id
 98e67ed59e1d1-349125be1e3mr5064811a91.9.1764840854777; Thu, 04 Dec 2025
 01:34:14 -0800 (PST)
MIME-Version: 1.0
References: <20251127140800.1379905-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251127140800.1379905-1-chaitanya.kumar.borah@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 4 Dec 2025 11:34:03 +0200
X-Gm-Features: AWmQ_bnBXYoHPH2tCvv3KYjG5De-hcQ8INVMKtHSFmvDkgideMEErh4eXS2DPWg
Message-ID: <CAJ=qYWR0y0UR1_dw8CiUhs6GAcPYv8A48NXKd0n5E9Rhr924Qw@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_plane_cursor: Use additional FB for
 reference image
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
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

look ok to me.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On Thu, Nov 27, 2025 at 4:24=E2=80=AFPM Chaitanya Kumar Borah
<chaitanya.kumar.borah@intel.com> wrote:
>
> Painting directly on the FB currently being scanned out ends up
> modifying the frontbuffer. Since the FB isn=E2=80=99t marked dirty, those
> updates never reach the actual buffer, leading to stale or incorrect
> reference images during testing.
>
> To avoid this, create a reference framebuffer in addition to the one
> created for the primary plane and  alternately flip
> between them while collecting crcs for the reference image and output
> image respectively.
>
> While at it, remove draw_color as it is no longer used.
>
> v2:
>  - Simplify implementation to use a single ref_fb instead of two
>  - Remove draw_color()
>  - Remove redundant commit
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  tests/kms_plane_cursor.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 9fa36bfd4..258b22b1a 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -78,6 +78,7 @@ typedef struct data {
>         igt_pipe_t *pipe;
>         igt_pipe_crc_t *pipe_crc;
>         drmModeModeInfo *mode;
> +       igt_fb_t ref_fb;
>         igt_fb_t pfb;
>         igt_fb_t ofb;
>         igt_fb_t cfb;
> @@ -129,16 +130,6 @@ static void test_fini(data_t *data)
>         igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  }
>
> -/* Fills a FB with the solid color given. */
> -static void draw_color(igt_fb_t *fb, double r, double g, double b)
> -{
> -       cairo_t *cr =3D igt_get_cairo_ctx(fb->fd, fb);
> -
> -       cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
> -       igt_paint_color(cr, 0, 0, fb->width, fb->height, r, g, b);
> -       igt_put_cairo_ctx(cr);
> -}
> -
>  /*
>   * Draws white and gray (if overlay FB is given) on the primary FB.
>   * Draws a magenta square where the cursor should be over top both plane=
s.
> @@ -152,6 +143,7 @@ static void test_cursor_pos(data_t *data, int x, int =
y, unsigned int flags)
>  {
>         igt_crc_t ref_crc, test_crc;
>         cairo_t *cr;
> +       igt_fb_t *ref_fb =3D &data->ref_fb;
>         igt_fb_t *pfb =3D &data->pfb;
>         igt_fb_t *ofb =3D &data->ofb;
>         igt_fb_t *cfb =3D &data->cfb;
> @@ -159,8 +151,8 @@ static void test_cursor_pos(data_t *data, int x, int =
y, unsigned int flags)
>         int ch =3D cfb->height;
>         const rect_t *or =3D &data->or;
>
> -       cr =3D igt_get_cairo_ctx(pfb->fd, pfb);
> -       igt_paint_color(cr, 0, 0, pfb->width, pfb->height, 1.0, 1.0, 1.0)=
;
> +       cr =3D igt_get_cairo_ctx(ref_fb->fd, ref_fb);
> +       igt_paint_color(cr, 0, 0, ref_fb->width, ref_fb->height, 1.0, 1.0=
, 1.0);
>
>         if (flags & TEST_OVERLAY)
>                 igt_paint_color(cr, or->x, or->y, or->w, or->h, 0.5, 0.5,=
 0.5);
> @@ -168,6 +160,7 @@ static void test_cursor_pos(data_t *data, int x, int =
y, unsigned int flags)
>         igt_paint_color(cr, x, y, cw, ch, 1.0, 0.0, 1.0);
>         igt_put_cairo_ctx(cr);
>
> +       igt_plane_set_fb(data->primary, ref_fb);
>         if (flags & TEST_OVERLAY)
>                 igt_plane_set_fb(data->overlay, NULL);
>         igt_plane_set_fb(data->cursor, NULL);
> @@ -176,7 +169,7 @@ static void test_cursor_pos(data_t *data, int x, int =
y, unsigned int flags)
>         igt_pipe_crc_start(data->pipe_crc);
>         igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &ref_crc);
>
> -       draw_color(pfb, 1.0, 1.0, 1.0);
> +       igt_plane_set_fb(data->primary, pfb);
>
>         if (flags & TEST_OVERLAY) {
>                 igt_plane_set_fb(data->overlay, ofb);
> @@ -249,6 +242,7 @@ static void test_cleanup(data_t *data)
>         igt_remove_fb(data->drm_fd, &data->cfb);
>         igt_remove_fb(data->drm_fd, &data->ofb);
>         igt_remove_fb(data->drm_fd, &data->pfb);
> +       igt_remove_fb(data->drm_fd, &data->ref_fb);
>  }
>
>  static void test_cursor(data_t *data, int size, unsigned int flags)
> @@ -263,6 +257,9 @@ static void test_cursor(data_t *data, int size, unsig=
ned int flags)
>
>         test_cleanup(data);
>
> +       igt_create_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888,
> +                     DRM_FORMAT_MOD_LINEAR, &data->ref_fb);
> +
>         igt_create_color_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888,
>                             DRM_FORMAT_MOD_LINEAR, 1.0, 1.0, 1.0, &data->=
pfb);
>
> --
> 2.25.1
>
