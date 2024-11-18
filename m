Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2926D49228
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 14:43:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4C310E4EF;
	Mon, 18 Nov 2024 14:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KF1xnW+v";
	dkim-atps=neutral
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D417510E4EF
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 14:43:11 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7246c8b89b4so2860193b3a.1
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 06:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731940991; x=1732545791; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SbSSv1Px/zILJQUkmbH1Y7bZn2ftrS/qztqC1qdc+68=;
 b=KF1xnW+v8ynut47F72NMraipfHqmQB9eTiyB0beTmRtKBFkV89WNUc5WPViNW+3Cz1
 n7NGrmz10E2xhkP2JOiGLnolXX9Cltolb9TELeFlAwQGiWcx5L638i7IdFWOohpazZCU
 UyXH7UlnSr8x4PW/HpT8OIDgZ00I38bgERSFW48ToV1LgZIwTiiFac1YJf7l1N+j7qn8
 yHxzz1GNvD2sf2p2PxGiyYKJziYRPAJZytPun6Ec3/EP4eTh2zK0K/w5LR91eu3g33Nm
 EM+psGPOqdJL9IdtYgMO6PS2sJ5qzUnlWn3Sb1OMec/qpuopUYYJeyfHPa1ZFbPCFz6a
 j65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731940991; x=1732545791;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SbSSv1Px/zILJQUkmbH1Y7bZn2ftrS/qztqC1qdc+68=;
 b=vW3EAxJnUnPfv7BnJar0gUM9+WYn4DByr5ScdAhbRfFETtxf9OFcLnO/uFB0HfdaIr
 l1iNNo8QcBT7/Vj1a5a27yqj/jHRurxFFdUOEPPnbiUS/ntg48HFo4Bsrr+oiH9DobFU
 Vz1QZvYJp+y/e1SSrlF7u6/+sg4s4bUJkLj5oCA+A/227VvpHii3/vXFbsRZ+DjIKWfs
 kR1CkCi6DflDfnsFPNoHDhurx0BEp4hZgGyGo+oJMoBwSxtqpeZ5GCuHjuVTDTXSu3cq
 qDzT3EWAX7Ix6SrnNJxgQOWz5ocJbOGetVkV8tdunvytmG6qTrFv/ecPhR8/XXJIR/xt
 TPkQ==
X-Gm-Message-State: AOJu0YwCJgaaJzSkEIvovQiVEZ9LMmShOTNfIDyAp6dkNSeuhEoVQ2R4
 q5eutqysU0REPhgL9CCs3xLPzh4TGGvdyHqLxWMgW1/iRUQXujpNp5XGNprM1G5piVNZg4d+7fj
 3BdwJ48Ssy1nAnLINyyv8T5heRww=
X-Google-Smtp-Source: AGHT+IFvR19JHudEybLvLMmOkPf4w56YKVH0MhqooqlWeIjEa7VYNT9fewZeDTFPA1sDwKc9duHjTMp27geL9uQG0w0=
X-Received: by 2002:a17:90a:e7ca:b0:2e0:7b03:1908 with SMTP id
 98e67ed59e1d1-2e9fe63fca3mr25135136a91.10.1731940991048; Mon, 18 Nov 2024
 06:43:11 -0800 (PST)
MIME-Version: 1.0
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
 <20241004104121.32750-9-ville.syrjala@linux.intel.com>
In-Reply-To: <20241004104121.32750-9-ville.syrjala@linux.intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Mon, 18 Nov 2024 16:42:59 +0200
Message-ID: <CAJ=qYWQfF=+zQj754xOOPN+zH=ZC_p8cgXuHjVhUhA5WDtGhFw@mail.gmail.com>
Subject: Re: [PATCH i-g-t 08/14] lib/igt_draw: Add 64bpp support for the
 non-XY_FAST_COLOR_BLT path
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
> XY_COLOR_BLT can't do 64bpp since we have nowhere to store
> the other half of the color. In order to support 64bpp
> pixel formats we have to get a little bit creative and
> use XY_PAT_BLT_IMMEDIATE instead. We simply treat the
> buffer as 32bpp, double the horizontal dimensions to
> compensate, and alternate between the lower and upper
> dwords of the color value when filling the 8x8 pattern.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_draw.c  | 24 ++++++++++++++++++++++++
>  lib/intel_reg.h |  2 ++
>  2 files changed, 26 insertions(+)
>
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 2312a0c71030..81da01a6c5ad 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -833,6 +833,30 @@ static void draw_rect_blt(int fd, struct cmd_data *c=
md_data,
>                 intel_bb_out(ibb, (1 << 29) | ((pitch-1) << 14) | (buf_he=
ight-1));
>                 intel_bb_out(ibb, 0);   /* mipmap levels / qpitch */
>                 intel_bb_out(ibb, 0);   /* mipmap index / alignment */
> +       } else if (buf->bpp =3D=3D 64) {
> +               int x =3D rect->x * 2;
> +               int w =3D rect->w * 2;
> +
> +               blt_cmd_depth =3D 3 << 24; /* 32bpp */
> +               blt_cmd_len =3D ((ver >=3D 8) ?  0x4 : 0x3) + 8*8;
> +               blt_cmd_tiling =3D (tiling) ? XY_COLOR_BLT_TILED : 0;
> +               pitch =3D (ver >=3D 4 && tiling) ? buf->stride / 4 : buf-=
>stride;
> +
> +               switch_blt_tiling(ibb, tiling, true);
> +
> +               intel_bb_out(ibb, XY_PAT_BLT_IMMEDIATE_CMD_NOLEN | XY_COL=
OR_BLT_WRITE_ALPHA |
> +                            XY_COLOR_BLT_WRITE_RGB | blt_cmd_tiling | bl=
t_cmd_len);
> +               intel_bb_out(ibb, blt_cmd_depth | (0xF0 << 16) | pitch);
> +               intel_bb_out(ibb, (rect->y << 16) | x);
> +               intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (x + w));
> +               intel_bb_emit_reloc_fenced(ibb, dst->handle, 0, I915_GEM_=
DOMAIN_RENDER,
> +                                          0, dst->addr.offset);
> +               for (int i =3D 0; i < 8*8; i +=3D 2) {
> +                       intel_bb_out(ibb, color);
> +                       intel_bb_out(ibb, color >> 32);
> +               }
> +
> +               switch_blt_tiling(ibb, tiling, false);
>         } else {
>                 switch (buf->bpp) {
>                 case 8:
> diff --git a/lib/intel_reg.h b/lib/intel_reg.h
> index 26833c66f8e7..903b44b59fc3 100644
> --- a/lib/intel_reg.h
> +++ b/lib/intel_reg.h
> @@ -2545,6 +2545,8 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWA=
RE.
>  #define XY_COLOR_BLT_WRITE_RGB         (1<<20)
>  #define XY_COLOR_BLT_TILED             (1<<11)
>
> +#define XY_PAT_BLT_IMMEDIATE_CMD_NOLEN ((2<<29)|(0x72<<22))
> +
>  #define XY_SETUP_CLIP_BLT_CMD          ((2<<29)|(3<<22)|1)
>
>  #define XY_SRC_COPY_BLT_WRITE_ALPHA    (1<<21)
> --
> 2.45.2
>
