Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EE7C4450D
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 12:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE7210E776;
	Wed, 21 Jan 2026 12:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WqRmfnyU";
	dkim-atps=neutral
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5694F10E776
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 12:01:35 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-34ab8e0df53so4896734a91.3
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 04:01:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768996895; cv=none;
 d=google.com; s=arc-20240605;
 b=fYON38X+zKS7Ly9hKuZxmR86ZMnKe9y0z6I+Dj9nv3fJi9IciBvkKByq80a/uwvlnm
 7wgvQrbT3kHXiN0ls6OPuPkMtLRC2OjV2V6p8lfo99vedAdrhKz2yIcoGp7z5DabZuaP
 DenqGi+TNUc3w+YeYLczNVAKdjGGXZ2KkR2mRVdj4Lr2qA7vMIEF2SSxep1WzXEcDt8E
 tiFWJQl1Cp9ki1ho4Ac8ZnMGBq1WeT2XhC9F9tXevE8nyAXvsED8oxqZh/9kyYu29dWC
 6dSNxLZ8Q80ywyCnA5vnWL8D5J8VKMsslG79z4Vwx1BojiAxcIH4F82CeFOIbPVfjtCT
 1/VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=nBW7Pp0O1nUHeVh8vWlEcB2Bh09GbL6ivMPNLJUzRYs=;
 fh=jiZtKjlARfrRM2yNEBasMo1wsZCckE6V/OhneC84kWQ=;
 b=l2YaguNCA/QUJE+20aurAcxHM9HKFmQ3Ghc4MsWjnZ8ORu9mNMzO8JOd4nlJ2uzHJB
 ZSr+dGCfw8fEax5uWE4Lu8IGDG7+BdYKumBccEUxx1MDj66nb/4MPywC7NnyJ651zl2Y
 s8saGDaTSG6Zj/JrFOUZL2Iigf/fhERVlgk7aW39STlOjT3SzaZ3guTlwc8UOYEiONhO
 nZtPnD4/0PXlafHOV8YqoG0Y4WQ18DQzjffgASGowYi4doKvpRbfENG09NFoD4hmM4KQ
 pYStDttSQNzsHbDOFJLvXVX4vrSkiOUXJHt9W1jjwJuaNXUM4uSYN2gzaFJAsArV/P7K
 NZjg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768996895; x=1769601695; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nBW7Pp0O1nUHeVh8vWlEcB2Bh09GbL6ivMPNLJUzRYs=;
 b=WqRmfnyUOq4jU+s3G1fQ/3MfwnD1mG5nn78EphRfSCCpoVV872kyUoXsrjRpQWZKC/
 e9qpZ0stUGVHv9vGCXx+9AwUJOJtzenKPBMTydpaEu9gdZmfbBVA3qutYZDyT8CEE+fa
 Q0gUJ1411YbRiFKmPmnFwg/2mJAEWNI7ObjWiQsEA3BIOTo4eS7+CSlAHOycW1Fa7KaZ
 Yafi2Ckt8nYXqxCn6xKQODCu2v3R689RWaA4ZgvkGvPy0IwpA0d8mzPM1TRCIVh7m5En
 99EpOHdJTm09LOQPTQEz88WFfWjA79LiSJfg8VTjsOHqnobULr1/cRHqJwqUQWb9TqVW
 WGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768996895; x=1769601695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nBW7Pp0O1nUHeVh8vWlEcB2Bh09GbL6ivMPNLJUzRYs=;
 b=KW/c7LMW2oTxLO3m4niiAACc51yJN1yWzPMuwd/993eCtP7MszQeFwb7WivJ3rcJ2M
 eCQMZR4Dkbww/gyXTeZOR05i+FbF2V+DVdhlUulpTlT0TtxVVCm1NwHZj1MdyDw9B4aP
 Z+w6UA71v91/Y1xrpmshvoZZbVUolxv1pb6V4Li3LIaZyXMG7Go5MML4EL76QNCdnjll
 XPx8oO4aGRVJWCDLQpO51RDNfo8TrbaJIwNvZxpn7EVgpZRuwKJ5ZgPCd0oPae9b6TQo
 M3WNfBMTKiYXtM4wM0tE285n7BuKU5ci2D0BCQpwinmc+4HwFvUymotsDN/2d0qkFTmK
 h+Nw==
X-Gm-Message-State: AOJu0YzpgMSUOehacbSV0WXD5w6t7cYZcwhYKHW145Zr8G0Qhv6AjSZl
 j+fIiMDD4LHvfioOsCVAH3tRY+h/DuTJVsF3a5/R9CGgSHvMV2QOlUZb3OnnSDYwGuMK7XuhI2h
 ikRaaM627as+HvqiCa8UOOO66LJA+wg4lfDLjR7JOiA==
X-Gm-Gg: AZuq6aIn5YSKIcc6ZtfByeG1K3WOou8SPtXAmuSY6AuALcwjK7HEmXCkYPU5hetpH2d
 hn9csHU/o6WZSKPBEdoLc1PKvW8YKLPlkPYXa7SrMMj+thyHupkujWK+J7LJ+fuZAEqbJbb7RMJ
 s15HF2/6cd/A1OElUeNEtTYVeDw6CcCQPCL43/F3uycoq/S9kfBz6B6gvJEuLKhIAPGAzRJnHbJ
 5PX0VxM42MzGmltvbmQxSVwJyFkstaOFlUT1ZMWW/CBlXMoIF0RwnZGA/6KSyCMVjsg8HWSHoXt
 zG2bZR6ssEfpEV/Fho/U81iWAc2kHA==
X-Received: by 2002:a17:90b:3802:b0:34c:a35d:de19 with SMTP id
 98e67ed59e1d1-35272fc4f82mr13926849a91.33.1768996894610; Wed, 21 Jan 2026
 04:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20260120045545.102676-1-ramanaidu.naladala@intel.com>
 <20260120045545.102676-3-ramanaidu.naladala@intel.com>
In-Reply-To: <20260120045545.102676-3-ramanaidu.naladala@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 21 Jan 2026 14:01:23 +0200
X-Gm-Features: AZwV_QiH8N2dMEogAaDGeiqJAPVuH1HJLyRbklM1CUhQMxySqqMW98arEwkE2CQ
Message-ID: <CAJ=qYWRySZ46vfHEKO-VCEdPr5TbSJd4X3P=At_Yw-hd5Qy=-A@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 2/3] tests/kms_plane: Speed up simulation by
 limiting YUV range tests
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevan.b@intel.com, 
 juha-pekka.heikkila@intel.com
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

On Tue, Jan 20, 2026 at 6:54=E2=80=AFAM Naladala Ramanaidu
<ramanaidu.naladala@intel.com> wrote:
>
> Optimizes the YUV format test flow by skipping all non=E2=80=93full=E2=80=
=91range
> cases when running in simulation. Previously, the test iterated
> over every supported color range, which significantly increased
> execution time in simulated environments. By restricting execution
> to the full=E2=80=91range variant during simulation, the overall runtime
> is reduced.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_plane.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 653a911ad..b71b3586f 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -968,6 +968,10 @@ static bool test_format_plane_yuv(data_t *data, enum=
 pipe pipe,
>                                                      igt_color_range_to_s=
tr(r)))
>                                 continue;
>
> +                       if (r !=3D IGT_COLOR_YCBCR_FULL_RANGE &&
> +                           igt_run_in_simulation())
> +                               continue;
> +
>                         igt_info("Testing format " IGT_FORMAT_FMT " / mod=
ifier " IGT_MODIFIER_FMT
>                                  " (%s, %s) on %s.%u\n", IGT_FORMAT_ARGS(=
format),
>                                  IGT_MODIFIER_ARGS(modifier),
> --
> 2.43.0
>
