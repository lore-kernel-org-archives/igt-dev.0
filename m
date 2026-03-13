Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C41106FD66
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 02:39:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6970088BE3;
	Fri, 13 Mar 2026 02:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HGer9gRj";
	dkim-atps=neutral
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AB588BE3
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 02:39:33 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-5ffe688cb8dso1031084137.0
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 19:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1773369572; x=1773974372;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fXbImxUJdjUvD1NoIGyTYy9oIJSqdQevEZWvefE61OA=;
 b=HGer9gRjCRNGQMJu2Df0qcdxPOptHxujL44xWYusidUnY/t8pLCN/bF8GSenSv1Ap6
 3IQ0l22EixCUDnuYr3RC98/p3ekJTBkoTGrW4hIzuICQ0oBm9tHrW4TXgdIZhyFC1sNC
 n3HpLxmMuCAI2cBBycAmvqdzWqzbTHIkqiIiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773369572; x=1773974372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fXbImxUJdjUvD1NoIGyTYy9oIJSqdQevEZWvefE61OA=;
 b=O+KzHW9yZn0SfTOg8O7nHLQvvv1y3iOtB8sOBCWVgnmuXGEg/GFN9TKkFnXf6el9Tn
 vVVqyyjZAK5T7dYB056rrfqQwOiL/A//ewDh0kSDH41/Tn6yDaj1d/bmIpwtT/zW9rek
 1zvc2+4dqI568JKf3yga319P/cyorkotJ+zcM5IKtH6QkOvVHd4pd5yoIVcjrCGN1xTd
 ohB4u2tHPmJ4iNWArWKKZwXi+LpokL4oaX2BtSMLvOl2+6WR73fzt5ck9CcRLKgqHRbN
 iiFizPsP2OwzfHaq6n35rJhVP5Q9mMvd7orzEdzQ14ubJvHljq4s4lLX8v5YmM7DPpVU
 qOGA==
X-Gm-Message-State: AOJu0YwNC8aT9QHXdiD7rCuYDDilKIkkDy51TvKtY6RPh3zwBXwNTLnb
 oN7kwgOpW8+ZGEeo6VEcEwRXsoh4T1PtsMRuqMw7NOSWSx8AXMzrSn5+c2cRM9FmeH5clSx9so6
 CfC0=
X-Gm-Gg: ATEYQzxdu1Zr0M33QoLwYoh4O3dberqyzg+qaq8zF79tsQmvyXv/OxzacYcMQ3SGgXt
 YseXrSznfx8YOBfpVrxTY3Psuf+TMzJpjs0ObFyZJ/1ldwNCt6oFmuAJUgaqKYQqWLr93yRfrD6
 5KedGP64c1dV/b6N9qM68vwljhM9/100Mj4pJXZbhx2WFLKU0wEZBwWMb788mV0WCw0nscVkybg
 EfdNE0k94kNWCcIseARH4jRjZVDVgmifmsWBeV2P7Uyi5dcazRcr/Nb2njy+kUFXb5YS+/PWJcS
 vEUTFsQ4r0sMluK3bSeaTtPwpZLmnaDWn7Cq7+FAAZ3aEW2JcW3Gs9l31ThKK32bY0uYtB4oOok
 zBh9kntka8JSll0iwlYTbu+hdA7dOsA+uc4taeVMfBzyZfTVH/X1ABYMQB3/P8F1k75OY9rHE8Q
 4RXr2n3SHPU2eYBNBkK18OPQZlDbfb8YTxUOkJpCuvFDMaeEXq+pX5xyf29g==
X-Received: by 2002:a05:6102:1621:b0:600:a2:138c with SMTP id
 ada2fe7eead31-6020e4f85c7mr779684137.23.1773369571725; 
 Thu, 12 Mar 2026 19:39:31 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-601dea9fa96sm2678013137.9.2026.03.12.19.39.30
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 19:39:30 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-5ffe688cb8dso1031058137.0
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 19:39:30 -0700 (PDT)
X-Received: by 2002:a05:6102:3eca:b0:5ff:c289:47d with SMTP id
 ada2fe7eead31-6020e4fc169mr862100137.22.1773369569830; Thu, 12 Mar 2026
 19:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260312141541.2333628-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260312141541.2333628-1-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 13 Mar 2026 10:38:53 +0800
X-Gmail-Original-Message-ID: <CAC=S1njbrk172CFZGqzUj1KRLg8PWqmhVVTNAvBHC=BzQbMRKw@mail.gmail.com>
X-Gm-Features: AaiRm50f1yHgNVD1cYPAl8O33HV9cg532eNIJaeZ1fyhExiEQ4KlpJGNb-8maoY
Message-ID: <CAC=S1njbrk172CFZGqzUj1KRLg8PWqmhVVTNAvBHC=BzQbMRKw@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_plane: Add vblank waits for MediaTek
 CRC timing
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, 
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

On Thu, Mar 12, 2026 at 10:15=E2=80=AFPM Jason-JH Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> On MediaTek hardware, CRC generation requires additional time to
> stabilize after certain operations. This patch adds targeted vblank
> waits for two specific scenarios:
>
> 1. Pixel format changes: After a format change in
>    capture_format_crcs_single(), the CRC hardware needs at least one
>    vblank to generate valid CRC values for the new format. Without
>    this wait, tests may read stale or transitional CRC values.
>
> 2. Cursor plane updates: In test_plane_position_with_output(), cursor
>    plane updates are non-blocking on MediaTek hardware. A vblank wait
>    ensures the CRC reflects the updated plane configuration.
>
> These waits are guarded by is_mtk_device() checks to avoid affecting
> other platforms.
>
> Fixes failures in:
> - pixel-format: CRC mismatch due to reading before format stabilization
> - plane-position-hole: pipe-A-plane-3 failures with cursor plane
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_plane.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Fei Shao <fshao@chromium.org>
