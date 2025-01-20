Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC10C02191
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2091C10E0C4;
	Mon, 20 Jan 2025 17:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f8g0RNk0";
	dkim-atps=neutral
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC8210E0C4
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 17:51:25 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-219f8263ae0so82361745ad.0
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 09:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737395425; x=1738000225; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qXYhpCFxQcK5vRqjTAT3Ya5qm2Iw6R7GX5Yi0h6jWUY=;
 b=f8g0RNk0IclVPuHEZQDAcOQ+AcEvjjz7m3hI9eyqU1vHEgCSeuLY6HTYLWKvs+rYFy
 8R8t4MV1xsavz/kui0rXpog1md4s6Gbh0Y60Vzkba11omEeDykGKenwP0ukrbgaIzr24
 W+gsmSjtHrjHFmQNPzZxpfYneKVKRKxC4tllv5eeNedJEmFG1turS14ojmEYy2ADCq6d
 RKInRQENBt8ZxMWxSWbwdtn86dMpsDGbvobWITqoVhkmSP92wpL4w8/AIOYlL0+DQyE4
 3dHgQ46c/4PkR4tXAkYgWEVRNZvH7hEILf+Cefs0ef88qnoyoyf1sfDdNd/7s/ULi+3O
 Q0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737395425; x=1738000225;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qXYhpCFxQcK5vRqjTAT3Ya5qm2Iw6R7GX5Yi0h6jWUY=;
 b=DEwtfK1nx05Vx82R3TQ8jkpZ0webawwFmMlQx+rJdZqe4ZBLVEYJxEZrOoOVGxAJki
 zVlbJR7jRqoIBWNJ5bg5UbeiJ+0AS2Yo+izkl8cHN/Bm+WQrGUZr4k/gvcfVDhJO1Sph
 4Tn/le4TTXY9+5IGgCXAVDcH3jTMAgLfGD63SZeIYkc5Y9Vy+CavxDHW/vl0TLxdy9gZ
 lq0zaSf9TyornN1T4wnpP1W9i+X6GkFKH4FNhTlrwnepRJ2LJmqOZzPyMZMD+DEEF6p7
 slnSVkLpogxw/okuZ7pD7N81s1rDoivACWQ0ofatXVPFdjAeRqk4+sU0k0xhdeeN4E4q
 E/BA==
X-Gm-Message-State: AOJu0YwZBIsztwDPLiXuFmc3Sxpn1h1IyQE145k9FVNNMofE5P9hAPHE
 HaIh0gP7QMGKWPO66N9YZ7rP3KOLaBWDxeSwR6/oDD4Ohi8cv9QQaTyJVvDHTZaaKFRtgnhd2Qo
 SqH81mwCCJHYFizsM4Fh3w1cANMk=
X-Gm-Gg: ASbGncv7TcZKZ6yL2XMw8s7haL3Yma3aFVNk+/lBsBoqpC/A9oMfD/6QfXzCoERZ/0G
 s3slNMBjlasy/hyKO1GJhA3uIGHYF05wIa9MyaB10fyI5QJCm8N1R
X-Google-Smtp-Source: AGHT+IE4RbVpgwYR/MQl4PSTuFbhw28z/llLOtgVPTOo5HoiK6f9TD6iu1Fl87sjrFgqMVjKKCvfkynNal16k+jiW4w=
X-Received: by 2002:a05:6a00:428d:b0:725:ae5f:7f06 with SMTP id
 d2e1a72fcca58-72dafadbc37mr20293644b3a.23.1737395424910; Mon, 20 Jan 2025
 09:50:24 -0800 (PST)
MIME-Version: 1.0
References: <20250120171021.1029868-1-george.zhang@amd.com>
In-Reply-To: <20250120171021.1029868-1-george.zhang@amd.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Mon, 20 Jan 2025 19:50:11 +0200
X-Gm-Features: AbW1kvY0_6ajSU9daN3eV1jZP-cAWStekTvn_R3mH26nwmuGsWhl4x3_TpKK3Ds
Message-ID: <CAJ=qYWRkHqJmMpKSKUyitcU4ikaFMfv7gL0ossRahryy-ECPVg@mail.gmail.com>
Subject: Re: [PATCH] tests/kms_addfb_basic: Fix addfb25_tests to not require
 intel
To: george.zhang@amd.com
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com, 
 Clinton.A.Taylor@intel.com
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

On Mon, Jan 20, 2025 at 7:10=E2=80=AFPM <george.zhang@amd.com> wrote:
>
> From: George Zhang <george.zhang@amd.com>
>
> This test does not require running on intel devices, so move it under
> the display_require.
>
> It was accidentally moved under the igt_require_intel fixture when
> it was meant to be moved under the igt_display_require.
>
> Fixes: 109d23b91a30 ("tests/kms_addfb_basic: fix x-tiled tests for case w=
hen there is no x-tile)
>
> Signed-off-by: George Zhang <george.zhang@amd.com>
> ---
>  tests/kms_addfb_basic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 3ba87117b..30ca8b016 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -1022,11 +1022,11 @@ igt_main
>
>                 size_tests(fd);
>
> +               addfb25_tests(fd);
> +
>                 igt_fixture
>                         igt_require_intel(fd);
>
> -               addfb25_tests(fd);
> -
>                 addfb25_ytile(fd);
>
>                 addfb25_4tile(fd);
> --
> 2.43.0
>
