Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FABFC282DE
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 14:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDCF892E0;
	Wed,  5 Mar 2025 14:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JvxselUK";
	dkim-atps=neutral
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6E0892E0
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 14:40:19 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2ff04f36fd2so5874802a91.1
 for <igt-dev@lists.freedesktop.org>; Wed, 05 Mar 2025 06:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741185619; x=1741790419; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qjekr/OVRa0RD53/VpHweqwm9ST10nT7z50/JGD/aew=;
 b=JvxselUK9YNmueoLVZpMxiaCyE2U+QKtpGzECpARuLYZVNDMwOMJrxRQJTxraYBThA
 IJxJ9303Yy4u1zwD4Ox8o7lMFlVDYpgJXmcTjET8jChg8aRzuSQ7z2pRnpzjxQlVq8Uy
 7arpr6VPHcs+qAh9M2sZtvo3Qt65yFb7lhX/teKqP4KnLRkYKTIdCvMNmDCI/zq/m/iq
 0RFWkL7nXtioG5gedXYkQJZiwmEPvnHNtoTD1nCA8GVVmueekGHreGQn9UH1XB0+FrMg
 ukXmtdIOMV58Zq3CFmhkz1APUvvDW4gDv9bBkWCn1m0PjemTtQ94eWxKlWohk0sIh/3b
 vaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741185619; x=1741790419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qjekr/OVRa0RD53/VpHweqwm9ST10nT7z50/JGD/aew=;
 b=dUEPbTIdYDxJhkfrO/jW8Sa8hTmDW2IN8HSkhG3kuqzEfY48wMhvrFSm1ZuS7TtweT
 fOpJm1foTMY/zZFE3si93xRV+C1TT6PqrUKCTas0DfPNswBWLD/pEXR88qCdnMaxaulZ
 UT7J+i6w0AH2dmKaoybv6w/DjQm5/oEw2IXrnktHtYL+bFHna5crjRA90ZCm/3WZEV+d
 3HrhvVR8n8TyM+p4Cqf4cIlUoEEmAtwyH5yLu2RQASt6SRVJ5HtvZxuAGtnoSHnIpft6
 iyFXD1VF1d6NOH0XxXce1u98XXeVZ5MtqY5mHSxhhbfhxKNEgCrBeiS7Dw9iiQvOPYsy
 HxwQ==
X-Gm-Message-State: AOJu0YwEFCmpAtGryJfASLJKL1UcKcSFQzkhd2hPFn1u7xwQO1wK5A4H
 vSFwggoIex/GHNxDVGM6moZp5ZlqsgUwDtPwwYEr0pBGGd1ljrCsiLrSXWWyP3XLyOMlXe/pPE5
 aE74c4nM28xNVapOKvpTIlBZZwyN7vTxbGMs=
X-Gm-Gg: ASbGnctYMt1Kq2VEjCEfmsAxNhNofCA8gjlRE4TUBwk/bc4Lw7yeUgEj9EPz7PfMaZU
 M+zGmt9GXG0jV51SxK4/XZexK/sgmvpg0FH7/IW7zMvdS7D28HN3qYYyt/wJ21pOckWB5s/wnvn
 2/6/ux1sq1UVMxf2TTFLd64Rb9dH1D
X-Google-Smtp-Source: AGHT+IEQLpQlUYX/Sz71yfwcApKNDyR5MWHxxjeRRCqWogHeu4Rt+Gf7H/8pv2SvKMt/XCtqvEx25EThEhTwStBz5ak=
X-Received: by 2002:a05:6a00:cc7:b0:736:5725:59b4 with SMTP id
 d2e1a72fcca58-73682b5a0b6mr5805474b3a.3.1741185619139; Wed, 05 Mar 2025
 06:40:19 -0800 (PST)
MIME-Version: 1.0
References: <20250303110235.15976-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250303110235.15976-1-ville.syrjala@linux.intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 5 Mar 2025 16:40:07 +0200
X-Gm-Features: AQ5f1JrcUKC8lrPCE3VlBb-SlzMQKT1ZcNKjyXpxY_MAWVUZvLudoC2NTc2JZ0w
Message-ID: <CAJ=qYWRt0KPS_SGhRRWou+iBzAttLZxRnStEeS5NMkQB-zXWoQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_draw_crc: Skip formats not
 supported by the plane
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

On Mon, Mar 3, 2025 at 1:02=E2=80=AFPM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
>
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The test only checks igt_display_has_format_mod() before
> deciding to test a specific format. But that doesn't
> mean the actual plane supports that format. Also check
> for that once we know which plane to use.
>
> Should turn the fp16 failures into skips on IVB because it
> doesn't have fp16 support on the primary plane.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_draw_crc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
> index 9c350853cfd9..62c6c64be710 100644
> --- a/tests/intel/kms_draw_crc.c
> +++ b/tests/intel/kms_draw_crc.c
> @@ -158,6 +158,8 @@ static void get_method_crc(enum igt_draw_method metho=
d, uint32_t drm_format,
>
>         primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIM=
ARY);
>
> +       igt_require(igt_plane_has_format_mod(primary, drm_format, modifie=
r));
> +
>         igt_create_fb(drm_fd, mode->hdisplay, mode->vdisplay,
>                       drm_format, modifier, &fb);
>         igt_plane_set_fb(primary, &fb);
> --
> 2.45.3
>
