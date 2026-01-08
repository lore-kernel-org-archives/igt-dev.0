Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1F5D1D47D
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 15:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244FC10E357;
	Thu,  8 Jan 2026 15:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VFu+czsF";
	dkim-atps=neutral
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358FF10E357
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 15:33:06 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2a0c09bb78cso16902795ad.0
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Jan 2026 07:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767886386; x=1768491186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FNETwF/uXDnLR/38sOB9gvIVdk8BwOC8mlSNxb0Jh2Q=;
 b=VFu+czsF/c2BXdp0lzT0J+EoWSRzItRLfM9KR8mghFZgtqIy1FHrCMNeNmz5pcksVh
 TT0HKRF/GRQfl4tnKjYwe/ID1mep7ASXadintQZVOElEEbExIH0ATpt6RrLxgP/ju4gZ
 KPH29ffN3q3F5wn5Ly+d6biXaRV/WHOoNWz9GmJuWgWrbAwumT2Sh7LerdRjKG8VtsOP
 oY+yxsEwL/evHrnrbz037ekXo+G2zkjwbPW7J5/JnlGo4MwcTWVd+PuK9lGExaDsjg6P
 uoVU6T3avG3RwuHAMR2WTpBSa5PsGyLtrxq+dxTKkIOpuI/DGVrpyh2EIHYLi6BQA+dy
 E9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767886386; x=1768491186;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FNETwF/uXDnLR/38sOB9gvIVdk8BwOC8mlSNxb0Jh2Q=;
 b=YD7+XEOtBdYR+RABHLkX1k+YFKjJrLqBSqeHzuuIY2WIgRuYCPQC9w8EyCPA4I7wGs
 Qz/t1kD0osVghjK5ErJv35up5241rDQaEqyuh61Rsu8/NiVWKTGqpl0a8nNaRhjjzIv9
 gB4uajT4XFGHLvnW2UcvGqi5PXZUFFg44XvbIGeZ/0adBlxutYcWBZR6qivz4I87y1rl
 OMhMpVhtiE+iPrR5QDryPN34ViE8VOgooLKOBbD7UqRY36UlMZjBtbD/cLTQAYGPvhS8
 YpaEijaZ+T6RAuVc/oG8/LT2pq+utLXliVFxtNzOLaI00jZKacTma+qRSjT5x+yH/gIo
 z6LA==
X-Gm-Message-State: AOJu0Yy+tkr/zyjvodZC/ZlNIYgjMrTaD+907xMCWMJXLrGQJFC32wT4
 EvYYOZyaAsI1/t6+qyxY30S1VIh1ERUGNI20SlwkzMPB35h9PSM9a7Aohmy4WybKEdTf7eKtSiY
 C0sqcXyqrrEg0hRHqijIQZa4ZabPWE14=
X-Gm-Gg: AY/fxX5FHn1fSPA80jl9KoQJKASt6MMyTGFbclIsC28TZSZ3vFs1SN3ASsMAbKVx9Af
 Uzer08NwVth6P4WMT5ea0QVKyymMZbXU44zEgb48hiUtSepgvJ/4gVOLvvjytxV05u8ejqkF1xT
 9Hnl6zQPeLzCl71/tExZp2J5T2htUpURc0lsoS2xb21XK9aAASwYX5w5TbBwEbSEv+JW6FuU85x
 iSL5buYp1ViGINdm1Tg5Jt7VtfitAdGqxjKOviSh6mhzwpi5VksNX+mAcqAO9Cj7CGAqJbLk0yV
 DgBW/avj0Wa2ioVj5OsP8zNFRoJ7vA==
X-Google-Smtp-Source: AGHT+IFj/TrbkhRdnLIDYhjQEhf7Kqjg9o3TaafuzVjhv0b8QoAKaFoWvZ3gV5SMczJVC04Q06VlNCZ1bo/fzJA2cIY=
X-Received: by 2002:a17:903:187:b0:2a0:d527:4d07 with SMTP id
 d9443c01a7336-2a3edb73820mr67391625ad.17.1767886385604; Thu, 08 Jan 2026
 07:33:05 -0800 (PST)
MIME-Version: 1.0
References: <20260107093535.70116-1-swati2.sharma@intel.com>
 <20260107093535.70116-2-swati2.sharma@intel.com>
In-Reply-To: <20260107093535.70116-2-swati2.sharma@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 8 Jan 2026 17:32:53 +0200
X-Gm-Features: AQt7F2qWxEbbJA5Sha9CubsdsjKYLfonvKq0w_R9HK0-StpxWxgVKcA9Xgxy88I
Message-ID: <CAJ=qYWSMSkHk8_-b4ZWvuSp+5Y+mrOW=mLQfjR6NsVS-E8bkUg@mail.gmail.com>
Subject: Re: [PATCH i-g-t, v2 1/7] tests/intel/kms_big_fb: NVL supports
 horizontal flip with linear surfaces
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
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
> From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
>
> Starting NVL (display version 35), horizontal flip is supported with
> linear surfaces, thus don't skip that case.
>
> Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
> ---
>  tests/intel/kms_big_fb.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 8a9ed8042..595611c31 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -82,23 +82,24 @@
>   *              of %arg[1] modifier with max hardware stride length, %ar=
g[2]-bpp,
>   *              and %arg[3]-rotation
>   *
> + * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-hflip
> + * Description: Test maximum hardware supported stride length for given =
combination
> + *              of %arg[1] modifier with max hardware stride length, %ar=
g[2]-bpp,
> + *              and %arg[3]-rotation with H-flip mode
> + *
>   * arg[1]:
>   *
>   * @4-tiled:            TILE-4 modifier
>   * @x-tiled:            TILE-X modifier
>   * @y-tiled:            TILE-Y modifier
>   * @yf-tiled:           TILE-YF modifier
> + * @linear:             LINEAR modifier
>   *
>   * arg[2].values:       32, 64
>   * arg[3].values:       0, 180
>   */
>
>  /**
> - * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-hflip
> - * Description: Test maximum hardware supported stride length for given =
combination
> - *              of %arg[1] modifier with max hardware stride length, %ar=
g[2]-bpp,
> - *              and %arg[3]-rotation with H-flip mode
> - *
>   * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-%s
>   * Description: Test maximum hardware supported stride length for given =
combination
>   *              of %arg[1] modifier with max hardware stride length, %ar=
g[2]-bpp,
> @@ -1106,15 +1107,18 @@ int igt_main()
>                                 for (int k =3D 0; k < ARRAY_SIZE(rotation=
s); k++) {
>                                         data.rotation =3D rotations[k].ro=
tation | fliptab[l].flip;
>
> -                                       // this combination will never ha=
ppen.
> -                                       if (igt_rotation_90_or_270(data.r=
otation) ||
> -                                           (fliptab[l].flip =3D=3D IGT_R=
EFLECT_X && modifiers[i].modifier =3D=3D DRM_FORMAT_MOD_LINEAR))
> +                                       if (igt_rotation_90_or_270(data.r=
otation))
>                                                 continue;
>
>                                         igt_describe("test maximum hardwa=
re supported stride length for given bpp and modifiers.");
>                                         igt_subtest_f("%s-max-hw-stride-%=
dbpp-rotate-%d%s", modifiers[i].name,
>                                                 formats[j].bpp, rotations=
[k].angle, fliptab[l].flipname) {
>                                                 igt_require(intel_display=
_ver(intel_get_drm_devid(data.drm_fd)) >=3D 5);
> +
> +                                               if(fliptab[l].flip =3D=3D=
 IGT_REFLECT_X &&
> +                                                  modifiers[i].modifier =
=3D=3D DRM_FORMAT_MOD_LINEAR)
> +                                                       igt_require(intel=
_display_ver(data.devid) >=3D 35);
> +
>                                                 data.max_hw_fb_width =3D =
min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
>
>                                                 test_scanout(&data);
> --
> 2.25.1
>
