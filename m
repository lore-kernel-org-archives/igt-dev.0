Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC7AC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 18:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14B610EBD1;
	Thu, 22 Aug 2024 18:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="apXukYGT";
	dkim-atps=neutral
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B374C10EBD1
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 18:45:06 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-7cd9e634ea9so593699a12.0
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 11:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724352306; x=1724957106; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iS2hBJtoW8n0eRjn0axh0bEjcsrvFHCfLmhiTy9fQ04=;
 b=apXukYGTDVkGFEE3fESEHCuk563u2lDtfSTAd8zJhqIAq96btN3vgXArJHKCXVOXAW
 xI9jBZ+xbeloiBQTs5T+anQx0B/a2HCIpO81n5rfpzNtOYM1WffBdjLJ9oB+imILtvh1
 lIp0+iVtCYr6JkJ+8bxDMiP3zDtuxFKEASy9gdQUnZbL7k5ITOCoTkBDzDRJxDlzRy4h
 Q2Axiu4QAeWTnRuqH8HL525q1S0ym3POVy1dWxFR6pt/r2MH4aHybiSCYk1vNEK9CNOm
 TyvEnJ4lqAJEjDueSIEQPAXhnYzCRZnGxdpa9lNlxjnrgNYVF/Phjl8Q8sVeoFSfdt3o
 pgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724352306; x=1724957106;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iS2hBJtoW8n0eRjn0axh0bEjcsrvFHCfLmhiTy9fQ04=;
 b=lWON64OIccmC2SWYTvhIwqKzYf7kZS/Jrx1N5bG8m6TQdiWwzZqqV3Z8cz/pUXshS0
 u9d03c1aUGon+H+ZlC9ExLYdvdeniiqfRFAeHrWmj/d03sz4Ci5AcTKhXy+s3G7/hRBp
 KGp9fUHuHjfrE+EoXVhPXwfl26sl47Ih6WYVARcJz5ZtAnRPytt5I6R4Md1h7K2BNIAc
 BuMtlJCYqRY5Sf5DJOXI+++tZuuyk2w0UViRuJwnNSyT0yIKG7s1BQ1P8im7ZkNWzB4d
 vPzHOJMYJMYID/FUYFPHE+VnoizK+f4M3SIujR/vqk+LjmuQVdMXyzGnipLZx29YWnDd
 93ug==
X-Gm-Message-State: AOJu0YzIJI4Wizvl7N/7RwOorF9j4P5zZRFcqaw4WUxtxjXxUMBMp1Tv
 XXRjJfPdNPLjk3gB1IPZB8k51z5njiwIYS4fkYkFy1SuveKGm6r9kZsVwDGDWKyAJFgHgYhujcW
 8/i1l6X6Sj2z7PZKLPl5wPVRSuD27njwNNnU=
X-Google-Smtp-Source: AGHT+IGAOXWKKKnbAmGeCDcvU5UfcOwb5j8bGRBxRo78pfINFoCMLjnCGm609IHLoqWEEC0e0yrCgQZpkf2ntzvHnIk=
X-Received: by 2002:a17:90b:4a04:b0:2d3:ce99:44b6 with SMTP id
 98e67ed59e1d1-2d5e9ec96d8mr7086293a91.29.1724352305361; Thu, 22 Aug 2024
 11:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240822112252.4148114-1-juhapekka.heikkila@gmail.com>
 <172434039842.726611.18253712584653789204@2413ebb6fbb6>
In-Reply-To: <172434039842.726611.18253712584653789204@2413ebb6fbb6>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 22 Aug 2024 21:44:51 +0300
Message-ID: <CAJ=qYWSPH-EVTw_VpTTEZsH27O13Mj8ZB=YHH86LrO0xPbUqFg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_Add_Xe2_ccs_modifiers?=
 =?UTF-8?Q?_for_Intel_hw_=28rev2=29?=
To: igt-dev@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000a0faec06204a0ead"
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

--000000000000a0faec06204a0ead
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't see these failures relating to my change. This is igt change and as
far as I see those reported failures need to be checked for kernel/hw/fw

/Juha-Pekka

On Thu, Aug 22, 2024 at 6:26=E2=80=AFPM Patchwork <patchwork@emeril.freedes=
ktop.org>
wrote:

> *Patch Details*
> *Series:* Add Xe2 ccs modifiers for Intel hw (rev2)
> *URL:* https://patchwork.freedesktop.org/series/137206/
> *State:* failure
> *Details:*
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/index.html CI Bug
> Log - changes from XEIGT_7983_full -> XEIGTPW_11617_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_11617_full absolutely need to
> be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11617_full, please notify your bug team (
> I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in C=
I.
> Participating hosts (4 -> 4)
>
> No changes in participating hosts
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> XEIGTPW_11617_full:
> IGT changes Possible regressions
>
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1 (NEW):
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/=
igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html>
>       +19 other tests skip
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-edp-1 (NEW):
>    - shard-lnl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-edp-1.html>
>       +15 other tests fail
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2 (NEW):
>    - {shard-bmg}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-8/=
igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html>
>       +44 other tests skip
>    -
>
>    igt@kms_plane@plane-panning-bottom-right-suspend:
>    - shard-lnl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/=
igt@kms_plane@plane-panning-bottom-right-suspend.html>
>       +1 other test dmesg-warn
>    -
>
>    igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
>    - shard-lnl: PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-3/igt=
@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/=
igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html>
>       +1 other test incomplete
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>    -
>
>    igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-x:
>    - {shard-bmg}: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-4/=
igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-x.html>
>       +11 other tests dmesg-warn
>    -
>
>    igt@kms_async_flips@crc@pipe-a-dp-2:
>    - {shard-bmg}: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-bmg-5/igt=
@kms_async_flips@crc@pipe-a-dp-2.html>
>       -> DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-4/=
igt@kms_async_flips@crc@pipe-a-dp-2.html>
>    -
>
>    igt@kms_async_flips@crc@pipe-b-dp-2:
>    - {shard-bmg}: DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-bmg-5/igt=
@kms_async_flips@crc@pipe-b-dp-2.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-4/=
igt@kms_async_flips@crc@pipe-b-dp-2.html>
>    -
>
>    igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>    - {shard-bmg}: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-bmg-7/igt=
@kms_flip@2x-flip-vs-rmfb-interruptible.html>
>       (Intel XE#877
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>       INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-3/=
igt@kms_flip@2x-flip-vs-rmfb-interruptible.html>
>    -
>
>    igt@kms_flip
>    @2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@bc-dp2-hdm=
i-a3
>    :
>    - {shard-bmg}: PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-bmg-4/igt=
@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@bc-dp2=
-hdmi-a3.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-2/=
igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@bc-=
dp2-hdmi-a3.html>
>       +2 other tests incomplete
>
> New tests
>
> New tests have been introduced between XEIGT_7983_full and
> XEIGTPW_11617_full:
> New IGT tests (120)
>
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>    - Statuses : 1 pass(s) 2 skip(s)
>       - Exec time: [0.0, 18.55] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.38] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.31] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-b-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.32] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-b-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.29] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-c-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.31] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-c-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.29] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-d-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.32] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.31] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>    - Statuses : 1 fail(s) 2 skip(s)
>       - Exec time: [0.0, 0.28] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-a-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-a-edp-1:
>    - Statuses : 1 fail(s)
>       - Exec time: [0.10] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-b-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-b-edp-1:
>    - Statuses : 1 fail(s)
>       - Exec time: [0.09] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-edp-1:
>    - Statuses : 1 fail(s)
>       - Exec time: [0.09] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>    - Statuses : 1 pass(s) 2 skip(s)
>       - Exec time: [0.0, 48.95] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.19] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.11] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-b-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.09] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-b-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.08] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.14] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.07] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.12] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.11] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>    - Statuses : 1 fail(s) 2 skip(s)
>       - Exec time: [0.0, 0.28] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-a-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-a-edp-1:
>    - Statuses : 1 fail(s)
>       - Exec time: [0.11] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-edp-1:
>    - Statuses : 1 fail(s)
>       - Exec time: [0.09] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-edp-1:
>    - Statuses : 1 fail(s)
>       - Exec time: [0.09] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-d-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>    - Statuses : 1 pass(s) 2 skip(s)
>       - Exec time: [0.0, 48.86] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-a-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.22] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-a-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.06] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.08] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.08] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.13] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.00] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.04] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-d-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.14] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.07] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>    - Statuses : 1 fail(s) 2 skip(s)
>       - Exec time: [0.0, 0.30] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-a-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-a-edp-1:
>    - Statuses : 1 fail(s)
>       - Exec time: [0.10] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-edp-1:
>    - Statuses : 1 fail(s)
>       - Exec time: [0.10] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-edp-1:
>    - Statuses : 1 fail(s)
>       - Exec time: [0.10] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>    - Statuses : 1 pass(s) 2 skip(s)
>       - Exec time: [0.0, 265.61] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [33.38] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.00] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [33.13] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [33.19] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.00] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [33.16] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [33.23] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.00] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [33.12] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [33.23] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [33.12] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>    - Statuses : 1 fail(s) 2 skip(s)
>       - Exec time: [0.0, 0.23] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-a-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.00] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-a-edp-1:
>    - Statuses : 1 fail(s)
>       - Exec time: [0.08] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.00] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.00] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-edp-1:
>    - Statuses : 1 fail(s)
>       - Exec time: [0.08] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.00] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-c-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.00] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-c-edp-1:
>    - Statuses : 1 fail(s)
>       - Exec time: [0.07] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-c-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.00] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.00] s
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.00] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>    - Statuses : 1 pass(s) 2 skip(s)
>       - Exec time: [0.0, 4.42] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-a-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.51] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-a-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.54] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-b-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.57] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-b-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.56] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-c-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.57] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-c-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.53] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-dp-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.57] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.55] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>    - Statuses : 1 pass(s) 2 skip(s)
>       - Exec time: [0.0, 5.84] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-edp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.73] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-edp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.23] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-edp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [1.88] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-dp-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>
> Known issues
>
> Here are the changes found in XEIGTPW_11617_full that come from known
> issues:
> IGT changes Issues hit
>
>    -
>
>    igt@intel_hwmon@hwmon-read:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/=
igt@intel_hwmon@hwmon-read.html>
>       (Intel XE#1125
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125>)
>    -
>
>    igt@kms_3d:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_3d.html>
>       (Intel XE#1465
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465>)
>    -
>
>    igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>    - shard-lnl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html>
>       (Intel XE#1701
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) +1
>       other test fail
>    -
>
>    igt@kms_atomic_transition
>    @plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
>    - shard-lnl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/=
igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe=
-a-edp-1.html>
>       (Intel XE#1426
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1
>       other test fail
>    -
>
>    igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/=
igt@kms_big_fb@4-tiled-16bpp-rotate-270.html>
>       (Intel XE#1407
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +12
>       other tests skip
>    -
>
>    igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@kms_big_fb@y-tiled-32bpp-rotate-180.html>
>       (Intel XE#1124
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +29
>       other tests skip
>    -
>
>    igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>       (Intel XE#1477
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477>)
>    -
>
>    igt@kms_big_fb@y-tiled-addfb-size-overflow:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>       (Intel XE#1428
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428>)
>    -
>
>    igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>    - shard-dg2-set2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
6/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>       (Intel XE#1124
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel
>       XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       +1 other test skip
>    -
>
>    igt@kms_big_joiner@basic:
>    - shard-dg2-set2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
5/igt@kms_big_joiner@basic.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#346 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>    -
>
>    igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>       (Intel XE#2191
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +3
>       other tests skip
>    -
>
>    igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@kms_bw@linear-tiling-3-displays-3840x2160p.html>
>       (Intel XE#367
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +4 other
>       tests skip
>    -
>
>    igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@kms_bw@linear-tiling-4-displays-2560x1440p.html>
>       (Intel XE#1512
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>) +3
>       other tests skip
>    -
>
>    igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6:
>    - shard-dg2-set2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html>
>       (Intel XE#787
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +13
>       other tests skip
>    -
>
>    igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs (NEW):
>    - shard-dg2-set2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +9
>       other tests skip
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>    - shard-dg2-set2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html>
>       (Intel XE#455
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel
>       XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>       +3 other tests skip
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html>
>       (Intel XE#1399
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399>) +48
>       other tests skip
>    -
>
>    igt@kms_cdclk@mode-transition-all-outputs:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_cdclk@mode-transition-all-outputs.html>
>       (Intel XE#314
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>)
>    -
>
>    igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>    - shard-dg2-set2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html>
>       (Intel XE#1152
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) +3
>       other tests skip
>    -
>
>    igt@kms_chamelium_color@ctm-blue-to-red:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@kms_chamelium_color@ctm-blue-to-red.html>
>       (Intel XE#306
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +4 other
>       tests skip
>    -
>
>    igt@kms_chamelium_hpd@vga-hpd:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-6/=
igt@kms_chamelium_hpd@vga-hpd.html>
>       (Intel XE#373
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +23
>       other tests skip
>    -
>
>    igt@kms_content_protection@atomic-dpms:
>    - shard-dg2-set2: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
4/igt@kms_content_protection@atomic-dpms.html>
>       (Intel XE#1178
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>       other test fail
>    -
>
>    igt@kms_content_protection@dp-mst-lic-type-0:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/=
igt@kms_content_protection@dp-mst-lic-type-0.html>
>       (Intel XE#307
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +3 other
>       tests skip
>    -
>
>    igt@kms_cursor_crc@cursor-onscreen-512x170:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>       (Intel XE#1413
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413>) +5
>       other tests skip
>    -
>
>    igt@kms_cursor_crc@cursor-random-max-size:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/=
igt@kms_cursor_crc@cursor-random-max-size.html>
>       (Intel XE#1424
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +13
>       other tests skip
>    -
>
>    igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>    - shard-dg2-set2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>       (Intel XE#308
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>    -
>
>    igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/=
igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>       (Intel XE#309
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +15
>       other tests skip
>    -
>
>    igt@kms_cursor_legacy
>    @short-busy-flip-before-cursor-atomic-transitions-varying-size:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/=
igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-vary=
ing-size.html>
>       (Intel XE#323
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1 other
>       test skip
>    -
>
>    igt@kms_feature_discovery@chamelium:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@kms_feature_discovery@chamelium.html>
>       (Intel XE#701
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>)
>    -
>
>    igt@kms_feature_discovery@display-4x:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-6/=
igt@kms_feature_discovery@display-4x.html>
>       (Intel XE#1138
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>    -
>
>    igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-hdmi-a6-dp4:
>    - shard-dg2-set2: PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-466/i=
gt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-hdmi-a6-dp4.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
3/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-hdmi-a6-dp4.html>
>       (Intel XE#1195
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1
>       other test incomplete
>    -
>
>    igt@kms_flip@2x-flip-vs-suspend-interruptible:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/=
igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>       (Intel XE#1421
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +16
>       other tests skip
>    -
>
>    igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html>
>       (Intel XE#1397
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> / Intel
>       XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>       +3 other tests skip
>    -
>
>    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling=
:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html=
>
>       (Intel XE#1401
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel
>       XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>       +15 other tests skip
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mo=
de
>    :
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling=
@pipe-a-default-mode.html>
>       (Intel XE#1401
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +16
>       other tests skip
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/=
igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-=
default-mode.html>
>       (Intel XE#1397
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>) +3
>       other tests skip
>    -
>
>    igt@kms_force_connector_basic@prune-stale-modes:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_force_connector_basic@prune-stale-modes.html>
>       (Intel XE#352
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>) +1 other
>       test skip
>    -
>
>    igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html>
>       (Intel XE#651
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +35
>       other tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>    - shard-dg2-set2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>       (Intel XE#656
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +96
>       other tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>    - shard-dg2-set2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>       (Intel XE#1469
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469>)
>    -
>
>    igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>    - shard-dg2-set2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>)
>       +3 other tests skip
>    -
>
>    igt@kms_getfb@getfb-reject-ccs:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/=
igt@kms_getfb@getfb-reject-ccs.html>
>       (Intel XE#605
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/605>)
>    -
>
>    igt@kms_getfb@getfb2-accept-ccs:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_getfb@getfb2-accept-ccs.html>
>       (Intel XE#2340
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340>)
>    -
>
>    igt@kms_hdmi_inject@inject-4k:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@kms_hdmi_inject@inject-4k.html>
>       (Intel XE#1470
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470>)
>    -
>
>    igt@kms_hdmi_inject@inject-audio:
>    - shard-dg2-set2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
4/igt@kms_hdmi_inject@inject-audio.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#417 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/417>)
>    -
>
>    igt@kms_hdr@static-toggle-dpms:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@kms_hdr@static-toggle-dpms.html>
>       (Intel XE#1503
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503> / Intel
>       XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>       +1 other test skip
>    -
>
>    igt@kms_invalid_mode@clock-too-high:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@kms_invalid_mode@clock-too-high.html>
>       (Intel XE#1450
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450> / Intel
>       XE#2568 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568>
>       / Intel XE#599
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>    -
>
>    igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html>
>       (Intel XE#1450
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450>) +1
>       other test skip
>    -
>
>    igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html>
>       (Intel XE#1450
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450> / Intel
>       XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>    -
>
>    igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>       (Intel XE#356
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
>    -
>
>    igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:
>    - shard-lnl: PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-5/igt=
@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/=
igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html>
>       (Intel XE#324
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2 other
>       tests dmesg-warn
>    -
>
>    igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/=
igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html>
>       (Intel XE#599
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +22
>       other tests skip
>    -
>
>    igt@kms_plane_scaling
>    @plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-1:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/=
igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-edp-=
1.html>
>       (Intel XE#498
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +12
>       other tests skip
>    -
>
>    igt@kms_plane_scaling
>    @planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe=
-b-edp-1.html>
>       (Intel XE#2318
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) +38
>       other tests skip
>    -
>
>    igt@kms_pm_dc@dc5-dpms-negative:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@kms_pm_dc@dc5-dpms-negative.html>
>       (Intel XE#1131
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131>)
>    -
>
>    igt@kms_pm_dc@dc6-psr:
>    - shard-lnl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-6/=
igt@kms_pm_dc@dc6-psr.html>
>       (Intel XE#1430
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>) +1
>       other test fail
>    -
>
>    igt@kms_pm_dc@deep-pkgc:
>    - shard-lnl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@kms_pm_dc@deep-pkgc.html>
>       (Intel XE#2029
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029>)
>    -
>
>    igt@kms_pm_rpm@modeset-non-lpsp:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@kms_pm_rpm@modeset-non-lpsp.html>
>       (Intel XE#1439
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439>) +1
>       other test skip
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>    - shard-dg2-set2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
5/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>    -
>
>    igt@kms_psr2_su@page_flip-nv12:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@kms_psr2_su@page_flip-nv12.html>
>       (Intel XE#1128
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128>)
>    -
>
>    igt@kms_psr@fbc-pr-cursor-plane-move:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_psr@fbc-pr-cursor-plane-move.html>
>       (Intel XE#1406
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +12
>       other tests skip
>    -
>
>    igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>    - shard-dg2-set2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html>
>       (Intel XE#929
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +1 other
>       test skip
>    -
>
>    igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html>
>       (Intel XE#1127
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>) +1
>       other test skip
>    -
>
>    igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/=
igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html>
>       (Intel XE#1437
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437>)
>    -
>
>    igt@kms_scaling_modes@scaling-mode-none:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-6/=
igt@kms_scaling_modes@scaling-mode-none.html>
>       (Intel XE#374
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/374> / Intel
>       XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>    -
>
>    igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-6/=
igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html>
>       (Intel XE#374
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/374>) +2 other
>       tests skip
>    -
>
>    igt@kms_setmode@clone-exclusive-crtc:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/=
igt@kms_setmode@clone-exclusive-crtc.html>
>       (Intel XE#1435
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>) +2
>       other tests skip
>    -
>
>    igt@kms_tv_load_detect@load-detect:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-6/=
igt@kms_tv_load_detect@load-detect.html>
>       (Intel XE#330
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>    -
>
>    igt@kms_vrr@flip-basic:
>    - shard-lnl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-6/=
igt@kms_vrr@flip-basic.html>
>       (Intel XE#2443
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) +4
>       other tests fail
>    -
>
>    igt@kms_vrr@negative-basic:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_vrr@negative-basic.html>
>       (Intel XE#1499
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499> / Intel
>       XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>       +1 other test skip
>    -
>
>    igt@kms_writeback@writeback-fb-id:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@kms_writeback@writeback-fb-id.html>
>       (Intel XE#756
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +1 other
>       test skip
>    -
>
>    igt@xe_compute@ccs-mode-basic:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@xe_compute@ccs-mode-basic.html>
>       (Intel XE#1447
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447>) +1
>       other test skip
>    -
>
>    igt@xe_copy_basic@mem-set-linear-0xfffe:
>    - shard-dg2-set2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@xe_copy_basic@mem-set-linear-0xfffe.html>
>       (Intel XE#1126
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>    -
>
>    igt@xe_create@create-big-vram:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@xe_create@create-big-vram.html>
>       (Intel XE#1062
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062>)
>    -
>
>    igt@xe_evict@evict-cm-threads-large:
>    - shard-dg2-set2: PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-435/i=
gt@xe_evict@evict-cm-threads-large.html>
>       -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
4/igt@xe_evict@evict-cm-threads-large.html>
>       (Intel XE#1473
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) +1
>       other test timeout
>    -
>
>    igt@xe_evict@evict-threads-small-multi-vm:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@xe_evict@evict-threads-small-multi-vm.html>
>       (Intel XE#688
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +24
>       other tests skip
>    -
>
>    igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html>
>       (Intel XE#1392
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +19
>       other tests skip
>    -
>
>    igt@xe_exec_fault_mode@once-userptr-rebind:
>    - shard-dg2-set2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
6/igt@xe_exec_fault_mode@once-userptr-rebind.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>)
>       +4 other tests skip
>    -
>
>    igt@xe_media_fill@media-fill:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@xe_media_fill@media-fill.html>
>       (Intel XE#560
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>)
>    -
>
>    igt@xe_mmap@vram:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@xe_mmap@vram.html>
>       (Intel XE#1416
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416>)
>    -
>
>    igt@xe_module_load@force-load:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@xe_module_load@force-load.html>
>       (Intel XE#378
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>    -
>
>    igt@xe_module_load@unload:
>    - shard-dg2-set2: PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-466/i=
gt@xe_module_load@unload.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
4/igt@xe_module_load@unload.html>
>       (Intel XE#1551
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551> / Intel
>       XE#2019 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>)
>    -
>
>    igt@xe_noexec_ping_pong:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-6/=
igt@xe_noexec_ping_pong.html>
>       (Intel XE#379
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/379>)
>    -
>
>    igt@xe_oa@mmio-triggered-reports:
>    - shard-lnl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@xe_oa@mmio-triggered-reports.html>
>       (Intel XE#2249
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>) +1
>       other test fail
>    -
>
>    igt@xe_oa@oa-regs-whitelisted@rcs-0:
>    - shard-lnl: PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-8/igt=
@xe_oa@oa-regs-whitelisted@rcs-0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/=
igt@xe_oa@oa-regs-whitelisted@rcs-0.html>
>       (Intel XE#2514
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514>) +1
>       other test fail
>    -
>
>    igt@xe_oa@unprivileged-single-ctx-counters:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@xe_oa@unprivileged-single-ctx-counters.html>
>       (Intel XE#2248
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248>)
>    -
>
>    igt@xe_pat@pat-index-xehpc:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/=
igt@xe_pat@pat-index-xehpc.html>
>       (Intel XE#1420
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420>)
>    -
>
>    igt@xe_pat@pat-index-xelp:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@xe_pat@pat-index-xelp.html>
>       (Intel XE#977
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>    -
>
>    igt@xe_pat@pat-index-xelpg:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@xe_pat@pat-index-xelpg.html>
>       (Intel XE#979
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>    -
>
>    igt@xe_peer2peer@write:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@xe_peer2peer@write.html>
>       (Intel XE#1061
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061>)
>    -
>
>    igt@xe_pm@d3cold-basic:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@xe_pm@d3cold-basic.html>
>       (Intel XE#2284
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel
>       XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>       +2 other tests skip
>    -
>
>    igt@xe_pm@d3hot-mmap-vram:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@xe_pm@d3hot-mmap-vram.html>
>       (Intel XE#1948
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948>)
>    -
>
>    igt@xe_pm@s3-mocs:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@xe_pm@s3-mocs.html>
>       (Intel XE#584
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>) +4 other
>       tests skip
>    -
>
>    igt@xe_pm@s4-d3hot-basic-exec:
>    - shard-dg2-set2: PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-435/i=
gt@xe_pm@s4-d3hot-basic-exec.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
3/igt@xe_pm@s4-d3hot-basic-exec.html>
>       (Intel XE#2019
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>)
>    -
>
>    igt@xe_pm@s4-vm-bind-unbind-all:
>    - shard-dg2-set2: PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-435/i=
gt@xe_pm@s4-vm-bind-unbind-all.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
6/igt@xe_pm@s4-vm-bind-unbind-all.html>
>       (Intel XE#2019
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019> / Intel
>       XE#2280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280>)
>    -
>
>    igt@xe_pm@s4-vm-bind-userptr:
>    - shard-lnl: NOTRUN -> ABORT
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/=
igt@xe_pm@s4-vm-bind-userptr.html>
>       (Intel XE#1794
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>    -
>
>    igt@xe_pm@vram-d3cold-threshold:
>    - shard-dg2-set2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
3/igt@xe_pm@vram-d3cold-threshold.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#579 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>    -
>
>    igt@xe_pm_residency@toggle-gt-c6:
>    - shard-lnl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/=
igt@xe_pm_residency@toggle-gt-c6.html>
>       (Intel XE#958
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>)
>    -
>
>    igt@xe_query@multigpu-query-invalid-cs-cycles:
>    - shard-lnl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/=
igt@xe_query@multigpu-query-invalid-cs-cycles.html>
>       (Intel XE#944
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +3 other
>       tests skip
>    -
>
>    igt@xe_wedged@basic-wedged:
>    - shard-lnl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@xe_wedged@basic-wedged.html>
>       (Intel XE#1760
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>)
>
> Possible fixes
>
>    -
>
>    igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>       (Intel XE#1659
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>) -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>    -
>
>    igt@kms_cursor_legacy@forked-move@pipe-b:
>    - shard-lnl: ABORT
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-1/igt=
@kms_cursor_legacy@forked-move@pipe-b.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@kms_cursor_legacy@forked-move@pipe-b.html>
>       +2 other tests pass
>    -
>
>    igt@kms_feature_discovery@display-2x:
>    - {shard-bmg}: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-bmg-1/igt=
@kms_feature_discovery@display-2x.html>
>       (Intel XE#877
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-4/=
igt@kms_feature_discovery@display-2x.html>
>    -
>
>    igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
>    - shard-dg2-set2: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-433/i=
gt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html>
>       (Intel XE#2019
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>) -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
5/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html>
>       +1 other test pass
>    -
>
>    igt@kms_flip@flip-vs-absolute-wf_vblank:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-2/igt=
@kms_flip@flip-vs-absolute-wf_vblank.html>
>       (Intel XE#886
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/=
igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>       +1 other test pass
>    -
>
>    igt@kms_hdr@invalid-hdr:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-466/i=
gt@kms_hdr@invalid-hdr.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
3/igt@kms_hdr@invalid-hdr.html>
>    -
>
>    igt@kms_lease@lease-unleased-crtc:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_lease@lease-unleased-crtc.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_lease@lease-unleased-crtc.html>
>       +23 other tests pass
>    -
>
>    igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3:
>    - {shard-bmg}: DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-bmg-8/igt=
@kms_plane@pixel-format-source-clamping@pipe-a-plane-3.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-4/=
igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3.html>
>    -
>
>    igt@kms_plane@pixel-format@pipe-b-plane-0:
>    - {shard-bmg}: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-bmg-7/igt=
@kms_plane@pixel-format@pipe-b-plane-0.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-5/=
igt@kms_plane@pixel-format@pipe-b-plane-0.html>
>       +6 other tests pass
>    -
>
>    igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:
>    - {shard-bmg}: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-bmg-6/igt=
@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-1/=
igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html>
>       +1 other test pass
>    -
>
>    igt@kms_pm_dc@dc5-dpms:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-3/igt=
@kms_pm_dc@dc5-dpms.html>
>       (Intel XE#718
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/=
igt@kms_pm_dc@dc5-dpms.html>
>    -
>
>    igt@kms_pm_rpm@basic-rte:
>    - shard-lnl: CRASH
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_pm_rpm@basic-rte.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-6/=
igt@kms_pm_rpm@basic-rte.html>
>    -
>
>    igt@kms_universal_plane@cursor-fb-leak:
>    - {shard-bmg}: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-bmg-7/igt=
@kms_universal_plane@cursor-fb-leak.html>
>       (Intel XE#899
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-4/=
igt@kms_universal_plane@cursor-fb-leak.html>
>       +1 other test pass
>       - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-4/igt=
@kms_universal_plane@cursor-fb-leak.html>
>       (Intel XE#899
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/=
igt@kms_universal_plane@cursor-fb-leak.html>
>       +1 other test pass
>    -
>
>    igt@xe_evict@evict-beng-cm-threads-large:
>    - {shard-bmg}: TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-bmg-2/igt=
@xe_evict@evict-beng-cm-threads-large.html>
>       (Intel XE#1473
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-5/=
igt@xe_evict@evict-beng-cm-threads-large.html>
>    -
>
>    igt@xe_evict@evict-beng-mixed-many-threads-small:
>    - shard-dg2-set2: TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-463/i=
gt@xe_evict@evict-beng-mixed-many-threads-small.html>
>       (Intel XE#1473
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel
>       XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>    -
>
>    igt@xe_evict@evict-mixed-many-threads-small:
>    - shard-dg2-set2: TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-466/i=
gt@xe_evict@evict-mixed-many-threads-small.html>
>       (Intel XE#1473
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
3/igt@xe_evict@evict-mixed-many-threads-small.html>
>    -
>
>    igt@xe_evict@evict-mixed-threads-large:
>    - {shard-bmg}: TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-bmg-3/igt=
@xe_evict@evict-mixed-threads-large.html>
>       (Intel XE#1473
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel
>       XE#2472 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-7/=
igt@xe_evict@evict-mixed-threads-large.html>
>    -
>
>    igt@xe_evict@evict-threads-large:
>    - shard-dg2-set2: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-433/i=
gt@xe_evict@evict-threads-large.html>
>       (Intel XE#1195
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel
>       XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
5/igt@xe_evict@evict-threads-large.html>
>    -
>
>    igt@xe_exec_fault_mode@many-rebind:
>    - {shard-bmg}: ABORT
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-bmg-6/igt=
@xe_exec_fault_mode@many-rebind.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-5/=
igt@xe_exec_fault_mode@many-rebind.html>
>       +4 other tests pass
>    -
>
>    igt@xe_exec_threads@threads-hang-userptr-rebind-err:
>    - shard-lnl: ABORT
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-5/igt=
@xe_exec_threads@threads-hang-userptr-rebind-err.html>
>       (Intel XE#2583
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583>) -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@xe_exec_threads@threads-hang-userptr-rebind-err.html>
>       +13 other tests pass
>    -
>
>    igt@xe_live_ktest@xe_bo:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-434/i=
gt@xe_live_ktest@xe_bo.html>
>       (Intel XE#1192
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> / Intel
>       XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
3/igt@xe_live_ktest@xe_bo.html>
>       +1 other test pass
>    -
>
>    igt@xe_pat@pat-index-xe2@render:
>    - shard-lnl: ABORT
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-4/igt=
@xe_pat@pat-index-xe2@render.html>
>       (Intel XE#2583
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583> / Intel
>       XE#2587 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2587>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/=
igt@xe_pat@pat-index-xe2@render.html>
>    -
>
>    igt@xe_pm@s3-d3hot-basic-exec:
>    - shard-dg2-set2: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-466/i=
gt@xe_pm@s3-d3hot-basic-exec.html>
>       (Intel XE#1551
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551> / Intel
>       XE#569 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@xe_pm@s3-d3hot-basic-exec.html>
>    -
>
>    igt@xe_vm@munmap-style-unbind-userptr-inval-end:
>    - {shard-bmg}: ABORT
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-bmg-2/igt=
@xe_vm@munmap-style-unbind-userptr-inval-end.html>
>       (Intel XE#2583
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583>) -> PASS
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-1/=
igt@xe_vm@munmap-style-unbind-userptr-inval-end.html>
>       +11 other tests pass
>
> Warnings
>
>    -
>
>    igt@kms_async_flips@invalid-async-flip:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-463/i=
gt@kms_async_flips@invalid-async-flip.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#873 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_async_flips@invalid-async-flip.html>
>       (Intel XE#873
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>    -
>
>    igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_big_fb@4-tiled-64bpp-rotate-270.html>
>       (Intel XE#316
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
4/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>       +1 other test skip
>    -
>
>    igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-433/i=
gt@kms_big_fb@4-tiled-8bpp-rotate-270.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html>
>       (Intel XE#316
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2 other
>       tests skip
>    -
>
>    igt@kms_big_fb@y-tiled-addfb-size-overflow:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-434/i=
gt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>       (Intel XE#610
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>    -
>
>    igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>       (Intel XE#1124
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>       other test skip
>    -
>
>    igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html>
>       (Intel XE#1124
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html>
>       (Intel XE#1124
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel
>       XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       +7 other tests skip
>    -
>
>    igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-434/i=
gt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>       (Intel XE#1124
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel
>       XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>       (Intel XE#1124
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +11
>       other tests skip
>    -
>
>    igt@kms_big_fb@yf-tiled-addfb:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-435/i=
gt@kms_big_fb@yf-tiled-addfb.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_big_fb@yf-tiled-addfb.html>
>       (Intel XE#619
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>    -
>
>    igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>       (Intel XE#1477
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477>)
>    -
>
>    igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-463/i=
gt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>       (Intel XE#367
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +5 other
>       tests skip
>    -
>
>    igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>       (Intel XE#2191
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
3/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>    -
>
>    igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/=
igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html>
>       (Intel XE#1512
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>    -
>
>    igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_bw@linear-tiling-1-displays-1920x1080p.html>
>       (Intel XE#367
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
3/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>    -
>
>    igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-6/=
igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>       (Intel XE#367
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>    -
>
>    igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html>
>       (Intel XE#455
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel
>       XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / =
Intel
>       XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>       +9 other tests skip
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-463/i=
gt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html>
>       (Intel XE#787
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +83
>       other tests skip
>    -
>
>    igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-435/i=
gt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / =
Intel
>       XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html>
>       (Intel XE#455
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel
>       XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>       +23 other tests skip
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html>
>       (Intel XE#1399
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399>)
>    -
>
>    igt@kms_ccs
>    @crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.htm=
l>
>       (Intel XE#787
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.=
html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>       +34 other tests skip
>    -
>
>    igt@kms_chamelium_color@ctm-0-75:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_chamelium_color@ctm-0-75.html>
>       (Intel XE#306
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
4/igt@kms_chamelium_color@ctm-0-75.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>       +1 other test skip
>    -
>
>    igt@kms_chamelium_color@ctm-green-to-red:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-435/i=
gt@kms_chamelium_color@ctm-green-to-red.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_chamelium_color@ctm-green-to-red.html>
>       (Intel XE#306
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1 other
>       test skip
>    -
>
>    igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_chamelium_hpd@dp-hpd-after-suspend.html>
>       (Intel XE#373
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
3/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>       +4 other tests skip
>    -
>
>    igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/=
igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html>
>       (Intel XE#373
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>    -
>
>    igt@kms_chamelium_hpd@vga-hpd:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-434/i=
gt@kms_chamelium_hpd@vga-hpd.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_chamelium_hpd@vga-hpd.html>
>       (Intel XE#373
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +9 other
>       tests skip
>    -
>
>    igt@kms_content_protection@dp-mst-type-1:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-463/i=
gt@kms_content_protection@dp-mst-type-1.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_content_protection@dp-mst-type-1.html>
>       (Intel XE#307
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>    -
>
>    igt@kms_cursor_crc@cursor-onscreen-512x170:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-433/i=
gt@kms_cursor_crc@cursor-onscreen-512x170.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>       (Intel XE#308
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +2 other
>       tests skip
>    -
>
>    igt@kms_cursor_crc@cursor-random-128x42:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_cursor_crc@cursor-random-128x42.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_cursor_crc@cursor-random-128x42.html>
>       (Intel XE#1424
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>    -
>
>    igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>       (Intel XE#309
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>    -
>
>    igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-466/i=
gt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>       (Intel XE#323
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>    -
>
>    igt@kms_dsc@dsc-with-output-formats-with-bpc:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>       (Intel XE#455
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>       +3 other tests skip
>    -
>
>    igt@kms_feature_discovery@display-3x:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_feature_discovery@display-3x.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-6/=
igt@kms_feature_discovery@display-3x.html>
>       (Intel XE#703
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>    -
>
>    igt@kms_feature_discovery@display-4x:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-463/i=
gt@kms_feature_discovery@display-4x.html>
>       (Intel XE#1138
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138> / Intel
>       XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_feature_discovery@display-4x.html>
>       (Intel XE#1138
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>    -
>
>    igt@kms_feature_discovery@dp-mst:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_feature_discovery@dp-mst.html>
>       (Intel XE#1137
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
6/igt@kms_feature_discovery@dp-mst.html>
>       (Intel XE#1137
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137> / Intel
>       XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>    -
>
>    igt@kms_flip@2x-flip-vs-modeset:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_flip@2x-flip-vs-modeset.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@kms_flip@2x-flip-vs-modeset.html>
>       (Intel XE#1421
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.ht=
ml>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling=
.html>
>       (Intel XE#1401
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel
>       XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>    -
>
>    igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html>
>       (Intel XE#651
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1 other
>       test skip
>    -
>
>    igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-4/igt=
@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html>
>       (Intel XE#656
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +4 other
>       tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html>
>       (Intel XE#651
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>       +19 other tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
>    - shard-lnl: ABORT
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-4/igt=
@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html>
>       (Intel XE#2583
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-6/=
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html>
>       (Intel XE#656
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>)
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-tiling-y:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>       (Intel XE#658
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>    -
>
>    igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render=
:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-434/i=
gt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.ht=
ml>
>       (Intel XE#651
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +32
>       other tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render=
:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html>
>       (Intel XE#2591
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2591>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html=
>
>       (Intel XE#656
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>)
>    -
>
>    igt@kms_frontbuffer_tracking@plane-fbc-rte:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>       (Intel XE#1158
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>       (Intel XE#1158
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158> / Intel
>       XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>    -
>
>    igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>       (Intel XE#653
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>)
>       +20 other tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-433/i=
gt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html>
>       (Intel XE#653
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +33
>       other tests skip
>    -
>
>    igt@kms_hdr@static-toggle:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_hdr@static-toggle.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/=
igt@kms_hdr@static-toggle.html>
>       (Intel XE#1503
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503> / Intel
>       XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>    -
>
>    igt@kms_plane_lowres@tiling-y:
>    - shard-lnl: ABORT
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-1/igt=
@kms_plane_lowres@tiling-y.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@kms_plane_lowres@tiling-y.html>
>       (Intel XE#599
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>    -
>
>    igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/=
igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html>
>       (Intel XE#498
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>)
>    -
>
>    igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-434/i=
gt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#2318 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html>
>       (Intel XE#2318
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) +2
>       other tests skip
>    -
>
>    igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-434/i=
gt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#2318 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>
>       / Intel XE#455
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html>
>       (Intel XE#2318
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> / Intel
>       XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>       +1 other test skip
>    -
>
>    igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html>
>       (Intel XE#2318
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>)
>    -
>
>    igt@kms_pm_backlight@fade-with-suspend:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-466/i=
gt@kms_pm_backlight@fade-with-suspend.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_pm_backlight@fade-with-suspend.html>
>       (Intel XE#870
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) +2 other
>       tests skip
>    -
>
>    igt@kms_pm_dc@dc5-psr:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-435/i=
gt@kms_pm_dc@dc5-psr.html>
>       (Intel XE#1129
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129> / Intel
>       XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_pm_dc@dc5-psr.html>
>       (Intel XE#1129
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>)
>    -
>
>    igt@kms_pm_dc@deep-pkgc:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-466/i=
gt@kms_pm_dc@deep-pkgc.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_pm_dc@deep-pkgc.html>
>       (Intel XE#908
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-463/i=
gt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>       (Intel XE#1489
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +5
>       other tests skip
>    -
>
>    igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>       (Intel XE#1489
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>       +2 other tests skip
>    -
>
>    igt@kms_psr@fbc-psr-sprite-render:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_psr@fbc-psr-sprite-render.html>
>       (Intel XE#929
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
6/igt@kms_psr@fbc-psr-sprite-render.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>       +7 other tests skip
>    -
>
>    igt@kms_psr@fbc-psr2-primary-render:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-434/i=
gt@kms_psr@fbc-psr2-primary-render.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_psr@fbc-psr2-primary-render.html>
>       (Intel XE#929
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +14
>       other tests skip
>    -
>
>    igt@kms_psr@pr-suspend:
>    - shard-lnl: ABORT
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-2/igt=
@kms_psr@pr-suspend.html>
>       (Intel XE#2583
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/=
igt@kms_psr@pr-suspend.html>
>       (Intel XE#1406
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>    -
>
>    igt@kms_rotation_crc@primary-rotation-90:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-435/i=
gt@kms_rotation_crc@primary-rotation-90.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_rotation_crc@primary-rotation-90.html>
>       (Intel XE#327
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +1 other
>       test skip
>    -
>
>    igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>       (Intel XE#327
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>       +2 other tests skip
>    -
>
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>    - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/=
igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>       (Intel XE#1437
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437>)
>    -
>
>    igt@kms_vblank@ts-continuation-suspend:
>    - shard-dg2-set2: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-463/i=
gt@kms_vblank@ts-continuation-suspend.html>
>       (Intel XE#2019
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>) ->
>       DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
5/igt@kms_vblank@ts-continuation-suspend.html>
>       (Intel XE#2019
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019> / Intel
>       XE#2226 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226>)
>       +1 other test dmesg-warn
>    -
>
>    igt@kms_vrr@flipline:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-434/i=
gt@kms_vrr@flipline.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_vrr@flipline.html>
>       (Intel XE#455
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +27
>       other tests skip
>       - shard-lnl: FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-lnl-7/igt=
@kms_vrr@flipline.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/=
igt@kms_vrr@flipline.html>
>       (Intel XE#2443
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>)
>    -
>
>    igt@kms_writeback@writeback-fb-id:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-435/i=
gt@kms_writeback@writeback-fb-id.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@kms_writeback@writeback-fb-id.html>
>       (Intel XE#756
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>    -
>
>    igt@sriov_basic@enable-vfs-autoprobe-off:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@sriov_basic@enable-vfs-autoprobe-off.html>
>       (Intel XE#1091
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
3/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>       (Intel XE#1091
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel
>       XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>    -
>
>    igt@xe_copy_basic@mem-set-linear-0xfd:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@xe_copy_basic@mem-set-linear-0xfd.html>
>       (Intel XE#1126
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
4/igt@xe_copy_basic@mem-set-linear-0xfd.html>
>       (Intel XE#1126
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> / Intel
>       XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>    -
>
>    igt@xe_evict@evict-beng-cm-threads-large:
>    - shard-dg2-set2: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-434/i=
gt@xe_evict@evict-beng-cm-threads-large.html>
>       (Intel XE#1195
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel
>       XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>       -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@xe_evict@evict-beng-cm-threads-large.html>
>       (Intel XE#1473
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>    -
>
>    igt@xe_evict@evict-mixed-many-threads-large:
>    - shard-dg2-set2: TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-466/i=
gt@xe_evict@evict-mixed-many-threads-large.html>
>       (Intel XE#1041
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041> / Intel
>       XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
4/igt@xe_evict@evict-mixed-many-threads-large.html>
>       (Intel XE#1195
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel
>       XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>    -
>
>    igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html>
>       (Intel XE#288
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>)
>       +13 other tests skip
>    -
>
>    igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-434/i=
gt@xe_exec_fault_mode@twice-userptr-invalidate-race.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html>
>       (Intel XE#288
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +25
>       other tests skip
>    -
>
>    igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html>
>       (Intel XE#2360
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
5/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>    -
>
>    igt@xe_mmap@small-bar:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@xe_mmap@small-bar.html>
>       (Intel XE#512
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
5/igt@xe_mmap@small-bar.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>    -
>
>    igt@xe_module_load@force-load:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@xe_module_load@force-load.html>
>       (Intel XE#378
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
4/igt@xe_module_load@force-load.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#378 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>    -
>
>    igt@xe_oa@polling-small-buf:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-433/i=
gt@xe_oa@polling-small-buf.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@xe_oa@polling-small-buf.html>
>       (Intel XE#2541
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +3
>       other tests skip
>    -
>
>    igt@xe_oa@privileged-forked-access-vaddr:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@xe_oa@privileged-forked-access-vaddr.html>
>       (Intel XE#2541
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
3/igt@xe_oa@privileged-forked-access-vaddr.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>)
>       +2 other tests skip
>    -
>
>    igt@xe_pat@display-vs-wb-transient:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-466/i=
gt@xe_pat@display-vs-wb-transient.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#1337 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@xe_pat@display-vs-wb-transient.html>
>       (Intel XE#1337
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>)
>    -
>
>    igt@xe_pm@d3cold-basic-exec:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-463/i=
gt@xe_pm@d3cold-basic-exec.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>
>       / Intel XE#366
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@xe_pm@d3cold-basic-exec.html>
>       (Intel XE#2284
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel
>       XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>    -
>
>    igt@xe_query@multigpu-query-hwconfig:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@xe_query@multigpu-query-hwconfig.html>
>       (Intel XE#944
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
3/igt@xe_query@multigpu-query-hwconfig.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>       +1 other test skip
>    -
>
>    igt@xe_query@multigpu-query-topology:
>    - shard-dg2-set2: SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-466/i=
gt@xe_query@multigpu-query-topology.html>
>       (Intel XE#1201
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel
>       XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
2/igt@xe_query@multigpu-query-topology.html>
>       (Intel XE#944
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other
>       test skip
>    -
>
>    igt@xe_wedged@wedged-at-any-timeout:
>    - shard-dg2-set2: DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7983/shard-dg2-432/i=
gt@xe_wedged@wedged-at-any-timeout.html>
>       (Intel XE#1760
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-43=
3/igt@xe_wedged@wedged-at-any-timeout.html>
>       (Intel XE#1130
>       <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> / Intel
>       XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>
> {name}: This element is suppressed. This means it is ignored when computi=
ng
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - IGT: IGT_7983 -> IGTPW_11617
>    - Linux: xe-1809-e0f8b8a5d8c77e94683451085c62cc54a4d9079d ->
>    xe-1812-6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8
>
> IGTPW_11617: 11617
> IGT_7983: b2e17acf37471073210221724a66d164328dee98 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1809-e0f8b8a5d8c77e94683451085c62cc54a4d9079d:
> e0f8b8a5d8c77e94683451085c62cc54a4d9079d
> xe-1812-6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8:
> 6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8
>

--000000000000a0faec06204a0ead
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I don&#39;t see these failures relating to my change.=
 This is igt change and as far as I see those reported failures need to be =
checked for kernel/hw/fw</div><div><br></div><div>/Juha-Pekka</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 22=
, 2024 at 6:26=E2=80=AFPM Patchwork &lt;<a href=3D"mailto:patchwork@emeril.=
freedesktop.org">patchwork@emeril.freedesktop.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg756721424=
4260678190">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>Add Xe2 ccs modifiers for Intel hw (r=
ev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/137206/" target=3D"_blank">https://patchwork.freedesktop.org/series/13=
7206/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_11617/index.html" target=3D"_blank">https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11617/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from XEIGT_7983_full -&gt; XEIGTPW_11617_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11617_full absolutely need t=
o be<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in XEIGTPW_11617_full, please notify your bug team (<a href=3D=
"mailto:I915-ci-infra@lists.freedesktop.org" target=3D"_blank">I915-ci-infr=
a@lists.freedesktop.org</a>) to allow them<br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11=
617_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1 (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tile=
d-bmg-ccs@pipe-c-edp-1.html" target=3D"_blank">SKIP</a> +19 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-edp-1 (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs@pipe-c-edp-1.html" target=3D"_blank">FAIL</a> +15 other tests fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2 (NEW):</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html" target=3D"_blank">SKIP</a> +44 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-2/igt@kms_plane@plane-panning-bottom-r=
ight-suspend.html" target=3D"_blank">DMESG-WARN</a> +1 other test dmesg-war=
n</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-e=
dp-1.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/igt@kms_vblank@ts-continuatio=
n-dpms-suspend@pipe-c-edp-1.html" target=3D"_blank">INCOMPLETE</a> +1 other=
 test incomplete</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br>
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-2-x:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-bmg-4/igt@kms_async_flips@async-flip-with-=
page-flip-events@pipe-c-dp-2-x.html" target=3D"_blank">DMESG-WARN</a> +11 o=
ther tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-bmg-5/igt@kms_async_flips@crc@pipe-a-dp-2.html" target=3D"=
_blank">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_11617/shard-bmg-4/igt@kms_async_flips@crc@pipe-a-dp-2.html" target=
=3D"_blank">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-bmg-5/igt@kms_async_flips@crc@pipe-b-dp-2.html" target=3D"=
_blank">DMESG-FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_11617/shard-bmg-4/igt@kms_async_flips@crc@pipe-b-dp-2.html" ta=
rget=3D"_blank">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html" tar=
get=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/877" target=3D"_blank">Intel XE#877</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-3/igt@k=
ms_flip@2x-flip-vs-rmfb-interruptible.html" target=3D"_blank">INCOMPLETE</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@=
bc-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-mo=
deset-interruptible@bc-dp2-hdmi-a3.html" target=3D"_blank">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-2=
/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@bc=
-dp2-hdmi-a3.html" target=3D"_blank">INCOMPLETE</a> +2 other tests incomple=
te</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7983_full and XEIGTPW_11617=
_full:</p>
<h3>New IGT tests (120)</h3>
<ul>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 18.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 48.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 48.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p=
>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:</p=
>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p=
>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p=
>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-hdmi-a-3:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 265.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [33.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [33.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [33.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [33.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [33.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [33.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [33.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [33.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>Statuses : 1 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 4.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 5.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11617_full that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-3/igt@intel_hwmon@hwmon-read.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1125" target=3D"_blank">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-4/igt@kms_3d.html" target=3D"_blank">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/146=
5" target=3D"_blank">Intel XE#1465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-7/igt@kms_atomic_transition@modeset-tr=
ansition-nonblocking-fencing.html" target=3D"_blank">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1701" target=3D"_blank">=
Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-2/igt@kms_atomic_transition@plane-all-=
modeset-transition-internal-panels@pipe-a-edp-1.html" target=3D"_blank">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"=
 target=3D"_blank">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-=
270.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1407" target=3D"_blank">Intel XE#1407</a>) +12 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-=
180.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124" target=3D"_blank">Intel XE#1124</a>) +29 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1477" target=3D"_blank">Intel XE#1477</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1428" target=3D"_blank">Intel XE#1428</a>)</li=
>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rota=
te-180.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124" target=3D"_blank">Intel XE#1124</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" target=
=3D"_blank">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-435/igt@kms_big_joiner@basic.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/346" target=3D"_blank">Intel X=
E#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2=
-displays-2160x1440p.html" target=3D"_blank">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2191" target=3D"_blank">Intel XE=
#2191</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-=
3840x2160p.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/367" target=3D"_blank">Intel XE#367</a>) +=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-=
2560x1440p.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1512" target=3D"_blank">Intel XE#1512</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled=
-ccs@pipe-d-hdmi-a-6.html" target=3D"_blank">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787" target=3D"_blank">Intel XE#=
787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tile=
d-bmg-ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a>) =
+9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-ti=
led-mtl-mc-ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455" target=3D"_blank">Intel XE#455</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" tar=
get=3D"_blank">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-mtl-mc-ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1399" target=3D"_blank">Intel XE#=
1399</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-4/igt@kms_cdclk@mode-transition-all-ou=
tputs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/314" target=3D"_blank">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b=
-dp-4.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1152" target=3D"_blank">Intel XE#1152</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@kms_chamelium_color@ctm-blue-to-=
red.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/306" target=3D"_blank">Intel XE#306</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-6/igt@kms_chamelium_hpd@vga-hpd.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373" target=3D"_blank">Intel XE#373</a>) +23 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-434/igt@kms_content_protection@atomic-=
dpms.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1178" target=3D"_blank">Intel XE#1178</a>) +1 ot=
her test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-3/igt@kms_content_protection@dp-mst-li=
c-type-0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/307" target=3D"_blank">Intel XE#307</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1413" target=3D"_blank">Intel XE#1413</a>) +5 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-3/igt@kms_cursor_crc@cursor-random-max=
-size.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1424" target=3D"_blank">Intel XE#1424</a>) +13 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-mo=
vement-512x512.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/308" target=3D"_blank">Intel XE#308</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-3/igt@kms_cursor_legacy@2x-nonblocking=
-modeset-vs-cursor-atomic.html" target=3D"_blank">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/309" target=3D"_blank">Inte=
l XE#309</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-2/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html" target=3D"_blank">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" =
target=3D"_blank">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-8/igt@kms_feature_discovery@chamelium.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/701" target=3D"_blank">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-6/igt@kms_feature_discovery@display-4x=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1138" target=3D"_blank">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-466/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-hdmi=
-a6-dp4.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-463/igt@kms_flip@2x-flip-vs-=
rmfb-interruptible@ab-hdmi-a6-dp4.html" target=3D"_blank">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" target=
=3D"_blank">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend-inte=
rruptible.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1421" target=3D"_blank">Intel XE#1421</a>) =
+16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-downscaling.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" target=3D"_bl=
ank">Intel XE#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1745" target=3D"_blank">Intel XE#1745</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html" target=3D"_blank">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" target=3D"_b=
lank">Intel XE#1401</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1745" target=3D"_blank">Intel XE#1745</a>) +15 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1401" target=3D"_blank">Intel XE#1401</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html" target=3D"_blank"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
397" target=3D"_blank">Intel XE#1397</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-4/igt@kms_force_connector_basic@prune-=
stale-modes.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/352" target=3D"_blank">Intel XE#352</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-shrfb-msflip-blt.html" target=3D"_blank">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651" target=3D"_blank">Int=
el XE#651</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-=
2p-primscrn-indfb-pgflip-blt.html" target=3D"_blank">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">=
Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/651" target=3D"_blank">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-shrfb-draw-mmap-wc.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" target=3D"_bla=
nk">Intel XE#656</a>) +96 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdr=
rs-tiling-y.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658" targ=
et=3D"_blank">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-y.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1469" target=3D"_blank">Intel XE#1469</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2=
p-scndscrn-pri-shrfb-draw-render.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_bl=
ank">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/653" target=3D"_blank">Intel XE#653</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-3/igt@kms_getfb@getfb-reject-ccs.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/605" target=3D"_blank">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-4/igt@kms_getfb@getfb2-accept-ccs.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2340" target=3D"_blank">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@kms_hdmi_inject@inject-4k.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1470" target=3D"_blank">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/417" target=3D"_blank"=
>Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-8/igt@kms_hdr@static-toggle-dpms.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1503" target=3D"_blank">Intel XE#1503</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/599" target=3D"_blank">Int=
el XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-8/igt@kms_invalid_mode@clock-too-high.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1450" target=3D"_blank">Intel XE#1450</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568" target=3D"_bl=
ank">Intel XE#2568</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/599" target=3D"_blank">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-8/igt@kms_invalid_mode@clock-too-high@=
pipe-a-edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1450" target=3D"_blank">Intel XE#1450</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-8/igt@kms_invalid_mode@clock-too-high@=
pipe-c-edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1450" target=3D"_blank">Intel XE#1450</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/599" tar=
get=3D"_blank">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-4/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/356" target=3D"_blank">Intel XE#356</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-=
1.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/igt@kms_plane@plane-position-hol=
e-dpms@pipe-b-plane-1.html" target=3D"_blank">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/324" target=3D"_blank">In=
tel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-2/igt@kms_plane_lowres@tiling-x@pipe-b=
-edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/599" target=3D"_blank">Intel XE#599</a>) +22 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-3/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-modifiers@pipe-b-edp-1.html" target=3D"_blank">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498" target=
=3D"_blank">Intel XE#498</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-8/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25@pipe-b-edp-1.html" target=3D"_blank">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"=
 target=3D"_blank">Intel XE#2318</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1131" target=3D"_blank">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1430" target=3D"_blank">Intel XE#1430</a>) +1 other test fail</li=
>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2029" target=3D"_blank">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1439" target=3D"_blank">Intel XE#1439</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-upda=
te-continuous-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#120=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489=
" target=3D"_blank">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@kms_psr2_su@page_flip-nv12.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1128" target=3D"_blank">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-4/igt@kms_psr@fbc-pr-cursor-plane-move=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1406" target=3D"_blank">Intel XE#1406</a>) +12 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-=
onoff.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/929" target=3D"_blank">Intel XE#929</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-180.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1127" target=3D"_blank">Intel XE#1127<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-2/igt@kms_rotation_crc@sprite-rotation=
-90-pos-100-0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1437" target=3D"_blank">Intel XE#1437</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-6/igt@kms_scaling_modes@scaling-mode-n=
one.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/374" target=3D"_blank">Intel XE#374</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/599" target=3D"_bla=
nk">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-6/igt@kms_scaling_modes@scaling-mode-n=
one@pipe-a-edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/374" target=3D"_blank">Intel XE#374<=
/a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-2/igt@kms_setmode@clone-exclusive-crtc=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1435" target=3D"_blank">Intel XE#1435</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-6/igt@kms_tv_load_detect@load-detect.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/330" target=3D"_blank">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-6/igt@kms_vrr@flip-basic.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2443" target=3D"_blank">Intel XE#2443</a>) +4 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-4/igt@kms_vrr@negative-basic.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1499" target=3D"_blank">Intel XE#1499</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/599" target=3D"_blank">Intel X=
E#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@kms_writeback@writeback-fb-id.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/756" target=3D"_blank">Intel XE#756</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@xe_compute@ccs-mode-basic.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1447" target=3D"_blank">Intel XE#1447</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0=
xfffe.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1126" target=3D"_blank">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@xe_create@create-big-vram.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1062" target=3D"_blank">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_11617/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html" ta=
rget=3D"_blank">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1473" target=3D"_blank">Intel XE#1473</a>) +1 other test t=
imeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-7/igt@xe_evict@evict-threads-small-mul=
ti-vm.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/688" target=3D"_blank">Intel XE#688</a>) +24 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-8/igt@xe_exec_basic@multigpu-once-basi=
c-defer-mmap.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392" target=3D"_blank">Intel XE#1392</a=
>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-466/igt@xe_exec_fault_mode@once-userpt=
r-rebind.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" target=
=3D"_blank">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-8/igt@xe_media_fill@media-fill.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/560" target=3D"_blank">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-8/igt@xe_mmap@vram.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1416" target=3D"_blank">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@xe_module_load@force-load.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/378" target=3D"_blank">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-466/igt@xe_module_load@unload.html" target=3D"_blank">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
1617/shard-dg2-434/igt@xe_module_load@unload.html" target=3D"_blank">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/15=
51" target=3D"_blank">Intel XE#1551</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2019" target=3D"_blank">Intel XE#2019</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-6/igt@xe_noexec_ping_pong.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/379" target=3D"_blank">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-4/igt@xe_oa@mmio-triggered-reports.htm=
l" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2249" target=3D"_blank">Intel XE#2249</a>) +1 other test=
 fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-8/igt@xe_oa@oa-regs-whitelisted@rcs-0.html" target=3D"=
_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_11617/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted@rcs-0.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2514" target=3D"_blank">Intel XE#2514</a>) +1 other test fail</li=
>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@xe_oa@unprivileged-single-ctx-co=
unters.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2248" target=3D"_blank">Intel XE#2248</a>)</li=
>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-3/igt@xe_pat@pat-index-xehpc.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1420" target=3D"_blank">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@xe_pat@pat-index-xelp.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/977" target=3D"_blank">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-8/igt@xe_pat@pat-index-xelpg.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/979" target=3D"_blank">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-7/igt@xe_peer2peer@write.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1061" target=3D"_blank">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@xe_pm@d3cold-basic.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2284" target=3D"_blank">Intel XE#2284</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/366" target=3D"_blank">Intel XE#3=
66</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-4/igt@xe_pm@d3hot-mmap-vram.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1948" target=3D"_blank">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-7/igt@xe_pm@s3-mocs.html" target=3D"_b=
lank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/584" target=3D"_blank">Intel XE#584</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-435/igt@xe_pm@s4-d3hot-basic-exec.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_11617/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.html" target=3D"_blank=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2019" target=3D"_blank">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-435/igt@xe_pm@s4-vm-bind-unbind-all.html" target=3D"_b=
lank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_11617/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html" target=3D"_b=
lank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2019" target=3D"_blank">Intel XE#2019</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2280" target=3D"_blank">Intel XE#=
2280</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html" t=
arget=3D"_blank">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1794" target=3D"_blank">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/579" target=3D"_blank">=
Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.htm=
l" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/958" target=3D"_blank">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-3/igt@xe_query@multigpu-query-invalid-=
cs-cycles.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/944" target=3D"_blank">Intel XE#944</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_11617/shard-lnl-8/igt@xe_wedged@basic-wedged.html" tar=
get=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1760" target=3D"_blank">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.=
html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1659" target=3D"_blank">Intel XE#1659</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/ig=
t@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html" target=3D"_blank">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-1/igt@kms_cursor_legacy@forked-move@pipe-b.html" targe=
t=3D"_blank">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_11617/shard-lnl-7/igt@kms_cursor_legacy@forked-move@pipe-b.htm=
l" target=3D"_blank">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-bmg-1/igt@kms_feature_discovery@display-2x.html" target=3D=
"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/877" target=3D"_blank">Intel XE#877</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-4/igt@kms_featu=
re_discovery@display-2x.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.htm=
l" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2019" target=3D"_blank">Intel XE#2019</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-4=
35/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html" target=3D"_blank">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/886" target=3D"_blank">Intel XE#886</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/igt@kms_flip@fli=
p-vs-absolute-wf_vblank.html" target=3D"_blank">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-466/igt@kms_hdr@invalid-hdr.html" target=3D"_blank">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455" target=3D"_blank">Intel XE#455</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-=
463/igt@kms_hdr@invalid-hdr.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_lease@lease-unleased-crtc.html" target=3D"_b=
lank">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_11617/shard-lnl-4/igt@kms_lease@lease-unleased-crtc.html" target=3D"_b=
lank">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping@pipe-a-pl=
ane-3.html" target=3D"_blank">DMESG-FAIL</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-4/igt@kms_plane@pixel-fo=
rmat-source-clamping@pipe-a-plane-3.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-0:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-bmg-7/igt@kms_plane@pixel-format@pipe-b-plane-0.html" targ=
et=3D"_blank">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_11617/shard-bmg-5/igt@kms_plane@pixel-format@pipe-b-plane-0.ht=
ml" target=3D"_blank">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-bmg-6/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.ht=
ml" target=3D"_blank">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_11617/shard-bmg-1/igt@kms_plane_cursor@viewport@=
pipe-a-dp-2-size-64.html" target=3D"_blank">PASS</a> +1 other test pass</li=
>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html" target=3D"_blank">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718" ta=
rget=3D"_blank">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_11617/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html" targ=
et=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_pm_rpm@basic-rte.html" target=3D"_blank">CRA=
SH</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_116=
17/shard-lnl-6/igt@kms_pm_rpm@basic-rte.html" target=3D"_blank">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-bmg-7/igt@kms_universal_plane@cursor-fb-leak.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/899" target=3D"_blank">Intel XE#899</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-4/igt@kms_universa=
l_plane@cursor-fb-leak.html" target=3D"_blank">PASS</a> +1 other test pass<=
/li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/899" target=3D"_blank">Intel XE#899</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/igt@kms_universa=
l_plane@cursor-fb-leak.html" target=3D"_blank">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-bmg-2/igt@xe_evict@evict-beng-cm-threads-large.html" targe=
t=3D"_blank">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1473" target=3D"_blank">Intel XE#1473</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-5/igt@xe_evi=
ct@evict-beng-cm-threads-large.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.h=
tml" target=3D"_blank">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1473" target=3D"_blank">Intel XE#1473</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/402" target=3D"_bla=
nk">Intel XE#402</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_11617/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-=
small.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html" =
target=3D"_blank">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1473" target=3D"_blank">Intel XE#1473</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-463/igt=
@xe_evict@evict-mixed-many-threads-small.html" target=3D"_blank">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-bmg-3/igt@xe_evict@evict-mixed-threads-large.html" target=
=3D"_blank">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1473" target=3D"_blank">Intel XE#1473</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2472" target=3D"_blank">Intel =
XE#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_11617/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html" target=3D=
"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-433/igt@xe_evict@evict-threads-large.html" target=3D"_=
blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1195" target=3D"_blank">Intel XE#1195</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1473" target=3D"_blank">Intel XE=
#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_11617/shard-dg2-435/igt@xe_evict@evict-threads-large.html" target=3D"_blan=
k">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-rebind:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-bmg-6/igt@xe_exec_fault_mode@many-rebind.html" target=3D"_=
blank">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_11617/shard-bmg-5/igt@xe_exec_fault_mode@many-rebind.html" target=3D=
"_blank">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-rebind-err:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-5/igt@xe_exec_threads@threads-hang-userptr-rebind-err.=
html" target=3D"_blank">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2583" target=3D"_blank">Intel XE#2583</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/i=
gt@xe_exec_threads@threads-hang-userptr-rebind-err.html" target=3D"_blank">=
PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-434/igt@xe_live_ktest@xe_bo.html" target=3D"_blank">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192=
" target=3D"_blank">Intel XE#1192</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg=
2-463/igt@xe_live_ktest@xe_bo.html" target=3D"_blank">PASS</a> +1 other tes=
t pass</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2@render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-4/igt@xe_pat@pat-index-xe2@render.html" target=3D"_bla=
nk">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2583" target=3D"_blank">Intel XE#2583</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2587" target=3D"_blank">Intel XE#2587</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/s=
hard-lnl-3/igt@xe_pat@pat-index-xe2@render.html" target=3D"_blank">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html" target=3D"_bla=
nk">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1551" target=3D"_blank">Intel XE#1551</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/569" target=3D"_blank">Intel XE#569=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1161=
7/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html" target=3D"_blank">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-end:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-bmg-2/igt@xe_vm@munmap-style-unbind-userptr-inval-end.html=
" target=3D"_blank">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2583" target=3D"_blank">Intel XE#2583</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-bmg-1/igt@x=
e_vm@munmap-style-unbind-userptr-inval-end.html" target=3D"_blank">PASS</a>=
 +11 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-463/igt@kms_async_flips@invalid-async-flip.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/873" target=3D"_blank">Intel XE#=
873</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
1617/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/873" target=3D"_blank">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316" target=3D"_blank">Intel XE#316</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-434/igt@kms_big_=
fb@4-tiled-64bpp-rotate-270.html" target=3D"_blank">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/316" target=3D"_blank">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/316" target=3D"_blank">Intel XE#=
316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
1617/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/316" target=3D"_blank">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/610" target=3D"_blank">Intel=
 XE#610</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_11617/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/610" target=3D"_blank">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p=
>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-=
hflip-async-flip.html" target=3D"_blank">FAIL</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/igt@kms_big_fb@y-=
tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html" target=3D"_blank"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
124" target=3D"_blank">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-=
0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124" target=3D"_blank">Intel XE#1124</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-46=
6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html" target=3D"_blan=
k">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1124" target=3D"_blank">Intel XE#1124</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a>)=
 +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124" target=3D"_blank">Intel XE#1124</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel =
XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_11617/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124" target=3D"_blank">Intel XE#1124</a>) +11 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html" target=3D"_bla=
nk">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/619" target=3D"_blank">Intel XE#619</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shar=
d-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html" target=3D"_blank">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/619" target=
=3D"_blank">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.h=
tml" target=3D"_blank">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_11617/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-=
offset-overflow.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1477" target=3D"_blank">Intel XE#1477=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160=
x1440p.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" target=3D=
"_blank">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_11617/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-d=
isplays-2160x1440p.html" target=3D"_blank">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367" target=3D"_blank">Intel XE#36=
7</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920=
x1080p.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191" target=3D"_blank">Intel XE#2191</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-d=
g2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2191" target=3D"_blank">Intel XE=
#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_bw@connected-linear-tiling-4-displays-2160x1=
440p.html" target=3D"_blank">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-2/igt@kms_bw@connected-linear-t=
iling-4-displays-2160x1440p.html" target=3D"_blank">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1512" target=3D"_blank">I=
ntel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367" target=3D"_blank">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-433/igt=
@kms_bw@linear-tiling-1-displays-1920x1080p.html" target=3D"_blank">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" tar=
get=3D"_blank">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/367" target=3D"_blank">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html"=
 target=3D"_blank">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_11617/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-384=
0x2160p.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/367" target=3D"_blank">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs=
-cc@pipe-d-dp-4.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455" target=3D"_blank">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" ta=
rget=3D"_blank">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_11617/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html" target=3D"_blank">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_b=
lank">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455" target=3D"_blank">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787" target=3D"_blank">Intel XE=
#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-c=
c@pipe-d-hdmi-a-6.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#12=
01</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787=
" target=3D"_blank">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-432/igt@kms_ccs@crc-primary-bas=
ic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html" target=3D"_blank">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" target=
=3D"_blank">Intel XE#787</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs=
@pipe-d-dp-4.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" tar=
get=3D"_blank">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/787" target=3D"_blank">Intel XE#787</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-432/ig=
t@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455" target=3D"_blank">Intel XE#455</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787" target=3D"_blank">Intel XE#787=
</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-=
ccs.html" target=3D"_blank">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_11617/shard-lnl-4/igt@kms_ccs@crc-primary-rotati=
on-180-4-tiled-dg2-rc-ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1399" target=3D"_blank">Int=
el XE#1399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-=
mc-ccs@pipe-b-hdmi-a-6.html" target=3D"_blank">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787" target=3D"_blank">Intel X=
E#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_11617/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-c=
cs@pipe-b-hdmi-a-6.html" target=3D"_blank">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1=
201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/78=
7" target=3D"_blank">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306" target=3D"_blank">Intel XE#306</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-434/igt@kms_chamelium_c=
olor@ctm-0-75.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" ta=
rget=3D"_blank">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-435/igt@kms_chamelium_color@ctm-green-to-red.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/306" target=3D"_blank">Intel X=
E#306</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_11617/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306" target=3D"_blank">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373" target=3D"_blank">Intel XE#373</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-433/igt@kms_c=
hamelium_hpd@dp-hpd-after-suspend.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_bl=
ank">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373" target=3D"_blank">Intel XE#373</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.h=
tml" target=3D"_blank">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_11617/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-enab=
le-disable-mode.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/373" target=3D"_blank">Intel XE#373</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html" target=3D"_bla=
nk">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/373" target=3D"_blank">Intel XE#373</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shar=
d-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html" target=3D"_blank">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" target=
=3D"_blank">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/307" target=3D"_blank">Intel X=
E#307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_11617/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/307" target=3D"_blank">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/308" target=3D"_blank">Intel=
 XE#308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_11617/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308" target=3D"_blank">Intel XE#308</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_cursor_crc@cursor-random-128x42.html" target=
=3D"_blank">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_11617/shard-lnl-4/igt@kms_cursor_crc@cursor-random-128x42.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1424" target=3D"_blank">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"=
 target=3D"_blank">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_11617/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip=
-legacy.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/309" target=3D"_blank">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-curso=
r-atomic.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" target=
=3D"_blank">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_11617/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-fl=
ip-before-cursor-atomic.html" target=3D"_blank">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/323" target=3D"_blank">Intel =
XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455" target=3D"_blank">Intel XE#455</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-435/igt@kms=
_dsc@dsc-with-output-formats-with-bpc.html" target=3D"_blank">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" target=3D=
"_blank">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455" target=3D"_blank">Intel XE#455</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_feature_discovery@display-3x.html" target=3D=
"_blank">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_11617/shard-lnl-6/igt@kms_feature_discovery@display-3x.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/703" target=3D"_blank">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-463/igt@kms_feature_discovery@display-4x.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1138" target=3D"_blank">Intel XE#1138</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#=
1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
11617/shard-dg2-432/igt@kms_feature_discovery@display-4x.html" target=3D"_b=
lank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1138" target=3D"_blank">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1137" target=3D"_blank">Intel XE#1137</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-466/igt@kms_feature_d=
iscovery@dp-mst.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1137" target=3D"_blank">Intel XE#1137=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
 target=3D"_blank">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_flip@2x-flip-vs-modeset.html" target=3D"_bla=
nk">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_11617/shard-lnl-5/igt@kms_flip@2x-flip-vs-modeset.html" target=3D"_blank=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1421" target=3D"_blank">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4t=
iledg2rcccs-downscaling.html" target=3D"_blank">FAIL</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1401" target=3D"_blank">Intel XE#1401</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1745" target=3D"_blank">Intel =
XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p=
>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-in=
dfb-draw-mmap-wc.html" target=3D"_blank">FAIL</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-8/igt@kms_frontbuff=
er_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html" target=3D"_blank"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
51" target=3D"_blank">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p=
>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-sh=
rfb-draw-mmap-wc.html" target=3D"_blank">FAIL</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/igt@kms_frontbuff=
er_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html" target=3D"_blank"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
56" target=3D"_blank">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-fullscreen.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651" target=3D"_blank">Intel XE#651<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617=
/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-full=
screen.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" target=3D=
"_blank">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-ind=
fb-draw-blt.html" target=3D"_blank">ABORT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2583" target=3D"_blank">Intel XE#2583</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/s=
hard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656" target=3D"_blank">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/658" target=3D"_blank">Intel XE#658</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbc-tiling-y.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_bl=
ank">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/658" target=3D"_blank">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-c=
ur-indfb-draw-render.html" target=3D"_blank">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
651" target=3D"_blank">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-432/igt@kms_frontbuffer_trac=
king@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html" target=3D"_blank">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" t=
arget=3D"_blank">Intel XE#651</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr=
-indfb-draw-render.html" target=3D"_blank">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2591" target=3D"_blank">Intel XE#2=
591</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
1617/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb=
-draw-render.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656" target=3D"_blank">Intel XE#656</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1158" target=3D"_blank">Intel XE#1158</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-433/igt@kms=
_frontbuffer_tracking@plane-fbc-rte.html" target=3D"_blank">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158" target=3D"_=
blank">Intel XE#1158</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-s=
hrfb-draw-mmap-wc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653" target=3D"_blank">Intel XE#653=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1161=
7/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw=
-mmap-wc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" target=
=3D"_blank">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-plflip-blt.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" targ=
et=3D"_blank">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_11617/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-shrfb-plflip-blt.html" target=3D"_blank">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/653" target=3D"_blank">I=
ntel XE#653</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_hdr@static-toggle.html" target=3D"_blank">FA=
IL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_116=
17/shard-lnl-4/igt@kms_hdr@static-toggle.html" target=3D"_blank">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503" target=
=3D"_blank">Intel XE#1503</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/599" target=3D"_blank">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-1/igt@kms_plane_lowres@tiling-y.html" target=3D"_blank=
">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_11617/shard-lnl-7/igt@kms_plane_lowres@tiling-y.html" target=3D"_blank">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/599=
" target=3D"_blank">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-wi=
th-modifiers.html" target=3D"_blank">FAIL</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-7/igt@kms_plane_scaling=
@plane-downscale-factor-0-25-with-modifiers.html" target=3D"_blank">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/498" targ=
et=3D"_blank">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25=
@pipe-b-hdmi-a-6.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#120=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318=
" target=3D"_blank">Intel XE#2318</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-432/igt@kms_plane_scaling@plan=
es-downscale-factor-0-25@pipe-b-hdmi-a-6.html" target=3D"_blank">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318" target=
=3D"_blank">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25=
@pipe-d-hdmi-a-6.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#120=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318=
" target=3D"_blank">Intel XE#2318</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455" target=3D"_blank">Intel XE#455</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-=
432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2318" target=3D"_blank">Intel XE#2318</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455" target=3D"_blank">In=
tel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale=
-factor-0-75.html" target=3D"_blank">FAIL</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@kms_plane_scaling=
@planes-upscale-20x20-downscale-factor-0-75.html" target=3D"_blank">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318" tar=
get=3D"_blank">Intel XE#2318</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/870" target=3D"_blank">Intel XE#=
870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
1617/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/870" target=3D"_blank">Intel XE#870</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html" target=3D"_blank">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129" =
target=3D"_blank">Intel XE#1129</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-=
432/igt@kms_pm_dc@dc5-psr.html" target=3D"_blank">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1129" target=3D"_blank">Int=
el XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html" target=3D"_blank">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/908" target=3D"_blank">Intel XE#908</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-=
432/igt@kms_pm_dc@deep-pkgc.html" target=3D"_blank">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/908" target=3D"_blank">In=
tel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" target=3D"_blank=
">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_11617/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-=
area.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489" target=3D"_blank">Intel XE#1489</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-b=
ig-fb.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489" target=3D"_blank">Intel XE#1489</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg=
2-434/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1489" target=3D"_blank">Intel XE#=
1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/929" target=3D"_blank">Intel XE#929</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-466/igt@kms_psr@fbc-ps=
r-sprite-render.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" =
target=3D"_blank">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929" target=3D"_blank">Intel XE#9=
29</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11=
617/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html" target=3D"_blan=
k">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/929" target=3D"_blank">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-2/igt@kms_psr@pr-suspend.html" target=3D"_blank">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2583" =
target=3D"_blank">Intel XE#2583</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_11617/shard-lnl-3/igt@kms_psr@pr-suspend.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1406" target=3D"_blank">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-90.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/327" target=3D"_blank">Intel X=
E#327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_11617/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/327" target=3D"_blank">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/327" target=3D"_blank">Intel XE#327</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-433/ig=
t@kms_rotation_crc@primary-y-tiled-reflect-x-90.html" target=3D"_blank">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
 target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/327" target=3D"_blank">Intel XE#327</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.=
html" target=3D"_blank">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_11617/shard-lnl-5/igt@kms_rotation_crc@primary-yf-ti=
led-reflect-x-270.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1437" target=3D"_blank">Intel XE#14=
37</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html" targe=
t=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2019" target=3D"_blank">Intel XE#2019</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-435/igt=
@kms_vblank@ts-continuation-suspend.html" target=3D"_blank">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019" targe=
t=3D"_blank">Intel XE#2019</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2226" target=3D"_blank">Intel XE#2226</a>) +1 other te=
st dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-434/igt@kms_vrr@flipline.html" target=3D"_blank">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" t=
arget=3D"_blank">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455" target=3D"_blank">Intel XE#455</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-432=
/igt@kms_vrr@flipline.html" target=3D"_blank">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455" target=3D"_blank">Intel XE=
#455</a>) +27 other tests skip</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-lnl-7/igt@kms_vrr@flipline.html" target=3D"_blank">FAIL</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/sh=
ard-lnl-8/igt@kms_vrr@flipline.html" target=3D"_blank">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443" target=3D"_blank=
">Intel XE#2443</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/756" target=3D"_blank">Intel XE#756</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/=
shard-dg2-432/igt@kms_writeback@writeback-fb-id.html" target=3D"_blank">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756" =
target=3D"_blank">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1091" target=3D"_blank">Intel XE#1091</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-433/igt@sriov=
_basic@enable-vfs-autoprobe-off.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" target=3D"_bl=
ank">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201" target=3D"_blank">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126" target=3D"_blank">Intel XE#1126</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-434/igt@xe_copy_=
basic@mem-set-linear-0xfd.html" target=3D"_blank">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1126" target=3D"_blank">Int=
el XE#1126</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1201" target=3D"_blank">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html" tar=
get=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1195" target=3D"_blank">Intel XE#1195</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" target=3D"_blank">=
Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_11617/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html"=
 target=3D"_blank">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1473" target=3D"_blank">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html" =
target=3D"_blank">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1041" target=3D"_blank">Intel XE#1041</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" target=3D"_blank">=
Intel XE#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_11617/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.ht=
ml" target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1195" target=3D"_blank">Intel XE#1195</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" target=3D"_=
blank">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-inv=
alidate-imm.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/288" target=3D"_blank">Intel XE#288</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shar=
d-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/288" target=3D"_blank">I=
ntel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-ra=
ce.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" target=3D"_bl=
ank">Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_11617/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-inval=
idate-race.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288" target=3D"_blank">Intel XE#288</a>) +=
25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2360" target=3D"_blank">Intel XE#2360</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-435/=
igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html" target=3D"_blank">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2360" target=3D"_blank">Intel XE#2360</a>)</li=
>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@xe_mmap@small-bar.html" target=3D"_blank">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512" t=
arget=3D"_blank">Intel XE#512</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_11617/shard-dg2-435/igt@xe_mmap@small-bar.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/512" target=3D"_blank">Intel =
XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@xe_module_load@force-load.html" target=3D"_bla=
nk">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/378" target=3D"_blank">Intel XE#378</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-434/igt@xe_module_load@for=
ce-load.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel XE#1201</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378" target=
=3D"_blank">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-433/igt@xe_oa@polling-small-buf.html" target=3D"_blank=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2541" target=3D"_blank">Intel XE#2541</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shar=
d-dg2-432/igt@xe_oa@polling-small-buf.html" target=3D"_blank">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541" target=3D=
"_blank">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@xe_oa@privileged-forked-access-vaddr.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2541" target=3D"_blank">Intel XE#2541</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-433/igt@xe_oa=
@privileged-forked-access-vaddr.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_bl=
ank">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2541" target=3D"_blank">Intel XE#2541</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1337" target=3D"_blank">Intel XE#133=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_116=
17/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html" target=3D"_blank"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
337" target=3D"_blank">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html" target=3D"_blank=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2284" target=3D"_blank">Intel XE#2284</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" target=
=3D"_blank">Intel XE#366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_11617/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2284" target=3D"_blank">Intel XE#2284</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/366" target=3D"_blank">Intel=
 XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944" target=3D"_blank">Intel XE#944</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-433/igt@xe_query@m=
ultigpu-query-hwconfig.html" target=3D"_blank">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201" target=3D"_blank">Intel =
XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/944" target=3D"_blank">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-466/igt@xe_query@multigpu-query-topology.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1201" target=3D"_blank">Intel XE#1201</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/944" target=3D"_blank">Intel XE#9=
44</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11=
617/shard-dg2-432/igt@xe_query@multigpu-query-topology.html" target=3D"_bla=
nk">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/944" target=3D"_blank">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_7983/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html" target=
=3D"_blank">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1760" target=3D"_blank">Intel XE#1760</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11617/shard-dg2-433/igt@xe=
_wedged@wedged-at-any-timeout.html" target=3D"_blank">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" target=3D"_blank"=
>Intel XE#1130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201" target=3D"_blank">Intel XE#1201</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7983 -&gt; IGTPW_11617</li>
<li>Linux: xe-1809-e0f8b8a5d8c77e94683451085c62cc54a4d9079d -&gt; xe-1812-6=
f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8</li>
</ul>
<p>IGTPW_11617: 11617<br>
  IGT_7983: b2e17acf37471073210221724a66d164328dee98 @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
  xe-1809-e0f8b8a5d8c77e94683451085c62cc54a4d9079d: e0f8b8a5d8c77e946834510=
85c62cc54a4d9079d<br>
  xe-1812-6f978df5045a1dfae759ebc5a5c6e3bb08a6c1f8: 6f978df5045a1dfae759ebc=
5a5c6e3bb08a6c1f8</p>

</div>

</div></blockquote></div></div>

--000000000000a0faec06204a0ead--
