Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B534FCD98CE
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 06:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E7310F25C;
	Fri, 12 Jun 2026 06:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Xf5fd72e";
	dkim-atps=neutral
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B0610F25C
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 06:08:08 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-bec429c2bb1so87676966b.1
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 23:08:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781244487; cv=none;
 d=google.com; s=arc-20240605;
 b=f5S8hJfSHGUVQIMO4/jGAV2PEwwHH51n4hYf4c5tFPjItBuxgcU1nOnqU8O4NQuT/e
 1f2ifr9wR5YVa11HZQlfi3beG6AriG5RIaFX22OC0SUF8wP67aquSYD5niZcSsdjI9Ld
 K3gqeRn7Xnm5gt0AdoBwqybVZSOSeyXjvSLg4Jp1mwmBzeGnUoSGzhDeQOWeLDdjXnSa
 kQBidx4DOJgPzpzwjm4T8VFTLviaup4wkUImXjHCaiw+4ue9+rOMXFIQrZjHzrpPPrbg
 clSvMc2pTlmvo6vIrGtJHwR+qOD+gTEoUF1NtPhoTmCnsInGzEjuY5KUeVOgWZEc11l3
 vEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DQMJLiBUK2t4XEsnRrIF6EJZHgv5koZdSL7QdzZu80s=;
 fh=Tc952vv6JDoBaNSrZUFpmXX0uVRXdT+vEVq50nB4PoM=;
 b=KHixdbzvEVFLAxB5bBEutOm6lD/cPTGDdh6+YFlgo8lVzw1PQG84lBr2Vx64fOr2i4
 A0w/UL79gCwpjOTwmC5eeBneMF+cgkpvJVwboSKNS+cvoUGWelxgILpRusXYiIGm5HJ9
 Y1ITRZshx8RC2dX6ek/wC57FXPfY51jbFwGE+xq7R1bMlOs+GQPG/cOuJ8BxjbFejSBT
 0hySEGQsXXTwWUZDXMntXwwPYeBpDBMVZY8Ne/cUcn79XI1mAP1mBHd8/x6kovRpjWME
 IEKuPQmFuESFhpLYDnbWvY6mOH8ypuPhPw+nge3Hle132U1Pz7VmrqJimkhpwbDHVVCj
 2gNA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1781244487; x=1781849287;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DQMJLiBUK2t4XEsnRrIF6EJZHgv5koZdSL7QdzZu80s=;
 b=Xf5fd72eOr7XrqH1lso3PCxWmcOVVAObrOrZ0WVrm1sC2klOWGXEAep4QVQFuezFoQ
 oGL5xaEzd5ZIiAzKOf6LuNmHTJIOKRYvJXWZP7verr9VLbS0xwkfSNh4TMOx9nzhUTf0
 Q5RnboAVEAEKE+ECUbB+EHtlsRHE9vKBVxaA0RpaQsUfwb+Sa6+EL3C2DE1uzdpsAewM
 YXVNvhO+OlvWOLUCAvslXnqirBCqtTSlk3ddzEJklbYDyXdZS3lfbV3+0jF3lAksMLnY
 D489+JS1I2x4EMiEapV84ifhWbVsXpcupGDMsQkWP+3MPqk1irtfB1cKznu5KOisn1t0
 mtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781244487; x=1781849287;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DQMJLiBUK2t4XEsnRrIF6EJZHgv5koZdSL7QdzZu80s=;
 b=bUbVRprOA4wskfOpayKQtPPvCvu4FYiOI926quNGyP998yuh9FWUZpyzyZmMeYr8mb
 V88FMMRQ4KM14nYAidrBFYoyDW4yleU97iNw5jW2LTgPpd4DVvymnvhj0cSVYgpWZoJX
 C0vcswcXVeZoSaWS4s3UB5h1qQthYriyS6O77UObzLfIDh90Ik9sbljsnsKjJbtuVP+F
 q2k+Qy7ospsrGA8P//nNWA7lhgi/Gh9nww+6oGGPaE6qDtimMwXKHOM6aNQRotbKiGHO
 EJ+GveLqZ6rJ3wly7wNGbTgevD7VpuFKj8genmBd+UsV3e46ieUyV1Zj7WY6rlU34JRI
 TN1A==
X-Gm-Message-State: AOJu0YxNL/k6Bf0BpIQVSXJ7TgNk8hINM4UbUGcHRWTv8PXNRElsAwmM
 g0++90DkAvIvp92AnWbP0eO2UPSM6cqIxYaMFEWAF7XI8lCC/dut6PhZ8IApLVqVQT4lsXzjl8j
 tMzV+O3nQu998d4AFT62t5BzwVHSkK0Q/i9emOlJKP00VmnIIErFlu+Yz
X-Gm-Gg: Acq92OHBuznGZTKCuR9rAQy2cHlgMm7PugqqxlwoDpzI+ay5LsTvOkDKj/RpameV7Z6
 Qx96rosKnl5zvAHSddW+ntiEEqk0SdiTVr0+cdsAsTAYuJE9C8/m38h3N2RHlAW3Qf8Q8Cnomrx
 nnh+zSnxtqbxeVYdMV7ku4YSN0H6dHrovtogvitPJB3NeOuwTBlP4QvK/fwUTtbYLqxOv+ORnwP
 wIvoO81WDT+9Y7mSBmYeO4wEWz7cPey8s8FuJ1EShSSik8bwYXgKwTqQQvoU8dDCVcP1WcAAfCP
 s7OxrMdNEFCxuX2SnDS/5+e6/GU18jDecK1uBT9M2xkU7WbulHrTtQQWhxOga4Rk/V2niHkJq/l
 3fPTmQw==
X-Received: by 2002:a17:906:5a4b:b0:bec:40f8:b54a with SMTP id
 a640c23a62f3a-bfe2aa02ad7mr33163266b.38.1781244486415; Thu, 11 Jun 2026
 23:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260608022810.48438-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260608022810.48438-1-jason-jh.lin@mediatek.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Thu, 11 Jun 2026 23:07:54 -0700
X-Gm-Features: AVVi8CeZ2zmp2yeQJmyHpN4x1cq_SDUjHDJriW9Xm3wziityEJSG9y9dfPxK9dY
Message-ID: <CAMNLLoQZUfMsijfxD4o-zpOQDgz3COWvyuKJyAeVtcAmnHoDXA@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_plane: Relax CRC frame sequence validation
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ville Syrjala <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>, 
 Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, 
 Lancelot Wu <Lancelot.Wu@mediatek.com>, Gil Dekel <gildekel@google.com>, 
 Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
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

Thanks Jason for the patch, this makes sense to me.
@Karthik B S  @Swati Sharma  could we get some reviews on this since
this is extremely critical for us.

Regards
Manasi

On Sun, Jun 7, 2026 at 7:28=E2=80=AFPM Jason-JH Lin <jason-jh.lin@mediatek.=
com> wrote:
>
> The capture_crc() function validates that the CRC frame sequence
> returned by igt_pipe_crc_get_for_frame() matches the expected value.
> The current check uses exact equality (!=3D), however the library
> function igt_pipe_crc_get_for_frame() uses >=3D comparison internally:
>
>     do {
>         read_one_crc(pipe_crc, crc);
>         ...
>     } while (igt_vblank_before(crc->frame, vblank));
>
> The function loops while crc->frame < vblank, returning the first
> CRC where crc->frame >=3D expected, not necessarily an exact match.
>
> This strict validation can cause test failures on drivers that
> report CRC entries with frame sequences larger than expected. This
> happens when drivers use internal queuing mechanisms to ensure CRC
> values are correctly correlated with their corresponding frames.
>
> Example without internal queue (continuous CRC reporting):
>   - Driver generates CRC entries continuously every frame
>   - Frame sequence increments sequentially
>   - Test finds exact matches for all expected frames =E2=86=92 PASS
>
> Example with internal queue (per-commit CRC reporting):
>   - Driver queues CRC and reports with current frame sequence
>   - Due to queue processing delay, reported sequence > expected
>   - For the last CRC, test adds +1 to expected (per IGT logic)
>   - Library's >=3D comparison returns valid CRC
>   - capture_crc's !=3D check fails on last frame =E2=86=92 FAIL
>
> Relax the validation to use < comparison instead of !=3D, which:
> 1. Aligns with igt_pipe_crc_get_for_frame() internal behavior
> 2. Accepts CRC entries with frame >=3D expected (valid cases)
> 3. Still catches real errors where frame < expected, indicating
>    CRC buffer overflow or stale data
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_plane.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index f21006784bfc..548506290c9b 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -766,9 +766,13 @@ static void capture_crc(data_t *data, unsigned int v=
blank, igt_crc_t *crc)
>  {
>         igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc, vblank, =
crc);
>
> +       /*
> +        * igt_pipe_crc_get_for_frame uses >=3D comparison, so we check t=
he same.
> +        * Getting a frame < expected indicates CRC buffer overflow or ti=
ming issue.
> +        */
>         igt_fail_on_f(!igt_skip_crc_compare && !igt_run_in_simulation() &=
&
> -                     crc->has_valid_frame && crc->frame !=3D vblank,
> -                     "Got CRC for the wrong frame (got %u, expected %u).=
 CRC buffer overflow?\n",
> +                     crc->has_valid_frame && crc->frame < vblank,
> +                     "Got CRC for the wrong frame (got %u, expected >=3D=
 %u). CRC buffer overflow?\n",
>                       crc->frame, vblank);
>  }
>
> --
> 2.43.0
>
