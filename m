Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41153C02183
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 15:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0174710E6ED;
	Wed, 15 Jan 2025 15:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ChX8PDfA";
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1736C10E70C;
 Wed, 15 Jan 2025 15:03:27 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2efe25558ddso8576567a91.2; 
 Wed, 15 Jan 2025 07:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736953406; x=1737558206; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TQlfEtJd0TYjlrHryC5Hd8j4ZOEMjTXuiPTuezFwTMk=;
 b=ChX8PDfAC714Qtgjeygj7zoQjrllP6Y154aL8Ou1QzSDMxXCHsAjnh1dA9CVprfIrm
 PHLOT5XRjwHkiKIAOO2v/RnfXmeZ7GXny3xUqRvy5cutYyu7Olz5NqtzsoiWcC+P3kgG
 y+iHwiGBLOt8RmA5JqGw+8UQxXtq3Q2XwGd3apvLQ257JtZ/kda/dC7Xrqbq5kSWVOwS
 fD4PcI77pgKSgJcKhfFVClE1TkaeJmeX7Oqj8N9k9quT6Wo9k0nvEnqI5fDRjo0bd7Mj
 c93laXell8igK1WcrRh/UbxctverBwIaoFGgE3uQxKj8XJrmYR3oddZPg/jMDpWkzRgv
 bThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736953406; x=1737558206;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TQlfEtJd0TYjlrHryC5Hd8j4ZOEMjTXuiPTuezFwTMk=;
 b=QkjbfVQrmpW1ABMcL74yVOTSKpoRrjcsucN4AkfJBWcC5Y72VL5KbvDbgIooMoNmjs
 1rEzIqlnGq3E5g+sXbnsF82nsb1QfmU7uPlwk+8WbeGO32aa9yu7NQGy25kFYbtHH001
 QXI+RVXSrlDoa9/SNw+oCrpo11XXhyCeJ8S6V+iFzGydO1yyAj6NDYq59dc78dbcBd8U
 DdU21dygvFYw32yNN2Yo5fjzov86uQ2w/YmYjW5Y/ZrpzNOoyk+kt/i5BlBIdMTSmHsO
 8raUR9XViHYzHYkhojj1b6DSZJmGxPHYyI78F0S5VoaqqLjg94/PqFsKY/nJoOfqFmBt
 ErwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlo9uu2mKccNNgQoTOPLiUfU+rVGh6GbOky51kAMwZs1IltM1DM4tHfaK3KWCkn7Ke1SNSkMmO7g==@lists.freedesktop.org,
 AJvYcCWd3zmrcuKCCPUYm+y8Hb6GNAMBIciHvWvH4XnUBYi2/5P2PZ5OQpmbjjxdMN/Q3kdLC29DeJ1sI9NKGOKq@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhzqaQV9kMK+JO/FeqhkR73FBbxyrArnmhBrqZH5iLzu5FZGE4
 gvQuLe+gXiPkW3sTiZy0aLl+E9WLZXnIepr+VQPS+ORh4DkVB/Xs/bUo1jLb3J7fCSeq00C/UGf
 zHYJa7tZD+33QS3dCHlO9eqlMfbuo5v4iIF4=
X-Gm-Gg: ASbGncuOm09LP82O/YOKIr5INo61ieif2eJymyBZ2KjLIkDHuDsIBA3G85F5PErV4kN
 +wUvo3qHMo3OFTQRbXCCTHuh4EKhSLhEU2MxgfU8=
X-Google-Smtp-Source: AGHT+IHIbkXCXrVo+ZJRtSHxesgoR+PWJTkdfTx1y2KI8hJ1PRbj7erEHY4UKW8ViX8fDJMX2K6eXcZrPNga4klABCY=
X-Received: by 2002:a17:90a:d004:b0:2ea:5dea:eb0a with SMTP id
 98e67ed59e1d1-2f548e986abmr41494190a91.4.1736953406353; Wed, 15 Jan 2025
 07:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
 <173663061097.2602953.10099674755140442503@b555e5b46a47>
 <20250115114147.myzcubzcp5inqlvh@kamilkon-desk.igk.intel.com>
In-Reply-To: <20250115114147.myzcubzcp5inqlvh@kamilkon-desk.igk.intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 15 Jan 2025 17:03:14 +0200
X-Gm-Features: AbW1kvYgHrRDb6uBujNsuwNUV-vwumOpcOEcsEgJAgfO_8OnXullrAC1nGwr_Wo
Message-ID: <CAJ=qYWROgkyxJ+Qz6iP5_G8JTHZQX-x+Y=2rXWnqrt1fCyWxcg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Initial_PTL_support_?=
 =?UTF-8?Q?=28rev6=29?=
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, 
 Clint Taylor <clinton.a.taylor@intel.com>, I915-ci-infra@lists.freedesktop.org,
 Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>, 
 Tejas Upadhyay <tejas.upadhyay@intel.com>
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

I went through those newly reported kms regressions for Xe but I don't
see them relating to these changes.
On the patches there's added ptl chipset info and pat index handling
which don't cause noise. Then those test changes are limited to named
tests and there is just showing the usual noise from some of the
tests.

For kms stuff things look ok to my eye.

/Juha-Pekka


On Wed, Jan 15, 2025 at 1:42=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi igt-dev,
> On 2025-01-11 at 21:23:30 -0000, Patchwork wrote:
>
> could anyone from KMS team confirm that below kms regressions
> are not related? Thanks!
>
> Adding J-P and Jani to Cc.
> Cc: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Jani Saarinen <jani.saarinen@intel.com>
>
> As for xe_mmap - imho this SKIP is not related to this series.
> Tejas could you confirm? Thanks!
>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>
> Regards,
> Kamil
>
> > =3D=3D Series Details =3D=3D
> >
> > Series: Initial PTL support (rev6)
> > URL   : https://patchwork.freedesktop.org/series/141325/
> > State : failure
> >
> > =3D=3D Summary =3D=3D
> >
> > CI Bug Log - changes from XEIGT_8183_full -> XEIGTPW_12418_full
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >
> > Summary
> > -------
> >
> >   **FAILURE**
> >
> >   Serious unknown changes coming with XEIGTPW_12418_full absolutely nee=
d to be
> >   verified manually.
> >
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in XEIGTPW_12418_full, please notify your bug team (I915-c=
i-infra@lists.freedesktop.org) to allow them
> >   to document this new failure mode, which will reduce false positives =
in CI.
> >
> >
> >
> > Participating hosts (4 -> 4)
> > ------------------------------
> >
> >   No changes in participating hosts
> >
> > Possible new issues
> > -------------------
> >
> >   Here are the unknown changes that may have been introduced in XEIGTPW=
_12418_full:
> >
> > ### IGT changes ###
> >
> > #### Possible regressions ####
> >
> >   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-=
6:
> >     - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
> >    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8183/shard-dg2-46=
4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-6.html
> >    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12418/shard-dg2=
-436/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-6.h=
tml
> >
> >   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
> >     - shard-dg2-set2:     [PASS][3] -> [ABORT][4]
> >    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8183/shard-dg2-46=
4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
> >    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12418/shard-dg2=
-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
> >
> >   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2:
> >     - shard-dg2-set2:     NOTRUN -> [ABORT][5] +1 other test abort
> >    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12418/shard-dg2=
-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2.html
> >
> >   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a2-dp2=
:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][6] +3 other tests fail
> >    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12418/shard-dg2=
-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a2-dp2.ht=
ml
> >
> >   * igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-3:
> >     - shard-bmg:          [PASS][7] -> [INCOMPLETE][8] +3 other tests i=
ncomplete
> >    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8183/shard-bmg-4/=
igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-3.html
> >    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12418/shard-bmg=
-8/igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-3.html
> >
> >   * igt@kms_psr@psr2-suspend@edp-1:
> >     - shard-lnl:          [PASS][9] -> [FAIL][10] +1 other test fail
> >    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8183/shard-lnl-2/=
igt@kms_psr@psr2-suspend@edp-1.html
> >    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12418/shard-ln=
l-2/igt@kms_psr@psr2-suspend@edp-1.html
> >
> >   * igt@xe_mmap@pci-membarrier:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][11]
> >    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12418/shard-dg=
2-433/igt@xe_mmap@pci-membarrier.html
> >
> >
> > Known issues
> > ------------
> >
> >   Here are the changes found in XEIGTPW_12418_full that come from known=
 issues:
> >
> > ### IGT changes ###
> >
> > #### Issues hit ####
>
> ...cut...
>
> >   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
77
> >   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575
> >
> >
> > Build changes
> > -------------
> >
> >   * IGT: IGT_8183 -> IGTPW_12418
> >
> >   IGTPW_12418: 23052ace3ac04fd0203b573736255ba4919c63d3 @ https://gitla=
b.freedesktop.org/drm/igt-gpu-tools.git
> >   IGT_8183: b2dbc6f22815128c0dd5c737504f42e1f1a6ad62 @ https://gitlab.f=
reedesktop.org/drm/igt-gpu-tools.git
> >   xe-2461-14e0c4a8247c9514dc57b2231602fb6d9455802b: 14e0c4a8247c9514dc5=
7b2231602fb6d9455802b
> >
> > =3D=3D Logs =3D=3D
> >
> > For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2418/index.html
