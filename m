Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226CAD2E9C8
	for <igt-dev@archiver.kernel.org>; Mon, 11 Nov 2024 09:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB89E10E455;
	Mon, 11 Nov 2024 09:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T2eBKXSy";
	dkim-atps=neutral
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034AA10E455;
 Mon, 11 Nov 2024 09:27:58 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2e2eba31d3aso3218230a91.2; 
 Mon, 11 Nov 2024 01:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731317277; x=1731922077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X5TbMxKKP9+Fq2BZmF2/ZQm0YoUX87jdwxUxNe3tHKY=;
 b=T2eBKXSyCasxrQLpqYUQdWySnvuUXvLBZO6uUh7jCJOaviFjCJtuWBEWYk5rICGnoP
 UZXWJ3DFW2fYZZ0/RlpxpGppc/LC3q0wv1Rv8jsd8JABFQ+mxQortiNBDw7flnWizyHb
 88MNfuvROI7kzXDGWo54+1pTKHFrMXIXmOR/eXBqlxiEYgtv0iW89M1wYia82LRcrkAQ
 s+CbRkLdcj8dgI747V4jzR9KxUHmup5lsmCBuCvsthUPK8spJ+FLIi+5orR6iJWEyQ1w
 WmwxKmRlJZ9+KxDCuEUmn1MVnwczk2A63VnEtYIYGzB2WFCBZZEYKYg662lMw2/IM2zZ
 pOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731317277; x=1731922077;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X5TbMxKKP9+Fq2BZmF2/ZQm0YoUX87jdwxUxNe3tHKY=;
 b=mbkMn7SNlZduvk65akUCeQZBB4465MCiE2GscKBbUOIvhWIdvSzYioBdaShTbhH//O
 ikRl5WcuP6rezgyVF/6nTi8R+gxjZRNA3EjmZEe9SsErNgh3F4rusYgS0ddF0B5Y17G1
 nT2Z7imkjvYo2OgNQC7dc340Hc4DVLmz9uVWsMVkTTSaDr5PKnYGEgg9MrvqQQGaXOzq
 p/j8k9mqShaxZ8EWUA5DcF7vb6JI+vj34X0N9/+eWuguhMIS+QoAKNhG+olmNww7z++e
 W4pG6W8AlXa5xegmJAJYBGTD1TAuSE3jumOZu23k8YMqr2TzdrdakttjGRrnb4+Q44nx
 EW7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgUMdXBQPtnHb+oNpkD7flJRAWQxJlHSmAEdzrfi3jzLGBdKgE9MIVpkZ0/rt/FNB/oBYz9rTa//wdfwmP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ1nC5voKyKRN/nmAsUR3w6dkGvdkH7bK3uZNVn6P1QILKr3nU
 p5MZNe4rbwlDhRuiH7axhckUiPTM1rhREl7RMoAlopW0HWBytLtKS6MfS2OZf8wAS11dmR5bsBI
 Dlxtnk4JoonHx4b+yrSpsOofCILT9GwmE0Ac=
X-Google-Smtp-Source: AGHT+IEz0XP0+XyEG4HEC0XUNXVRc+HG5pVRN9ioLsu5cWyLVcE4s66EU+Q2Kz5HZYEbo1Mrke8RdC1CSKOJkhD1qf0=
X-Received: by 2002:a17:90b:35cf:b0:2e9:48d0:3b59 with SMTP id
 98e67ed59e1d1-2e9b16eb007mr15471543a91.8.1731317276065; Mon, 11 Nov 2024
 01:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20241105115708.682335-1-juhapekka.heikkila@gmail.com>
 <173121779166.2051074.16452102787631518023@2413ebb6fbb6>
In-Reply-To: <173121779166.2051074.16452102787631518023@2413ebb6fbb6>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Mon, 11 Nov 2024 11:27:44 +0200
Message-ID: <CAJ=qYWSarDaHPHtgwNgqO1UMY7ZqGoYbbh-kWCXKkMo1bL1RzQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests=2Fintel=2Fkms=5Fccs=3A_?=
 =?UTF-8?Q?add_suspend_tests_=28rev6=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
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

On Sun, Nov 10, 2024 at 7:49=E2=80=AFAM Patchwork
<patchwork@emeril.freedesktop.org> wrote:
>
> Patch Details
> Series:tests/intel/kms_ccs: add suspend tests (rev6)
> URL:https://patchwork.freedesktop.org/series/140731/
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12074/index.html
>
> CI Bug Log - changes from XEIGT_8101_full -> XEIGTPW_12074_full
>
> Summary
>
> FAILURE
>
> Serious unknown changes coming with XEIGTPW_12074_full absolutely need to=
 be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_12074_full, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in C=
I.
>
> Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
> Possible new issues
>
> Here are the unknown changes that may have been introduced in XEIGTPW_120=
74_full:
>
> IGT changes
>
> Possible regressions
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs (NEW):
>
> shard-bmg: NOTRUN -> SKIP +11 other tests skip
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc (NEW):
>
> shard-lnl: NOTRUN -> SKIP +14 other tests skip
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs (NEW):
>
> shard-dg2-set2: NOTRUN -> SKIP +4 other tests skip

Above kms_ccs skips are because of the new test with different
modifiers, not a regression

>
> igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
>
> shard-lnl: PASS -> FAIL
>
> igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
>
> shard-dg2-set2: NOTRUN -> INCOMPLETE

Above two do not relate to my change, I was just patching kms_ccs

>
> igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a6:
>
> shard-dg2-set2: PASS -> INCOMPLETE

This is not even incomplete, it is some problem in ci where success is
reported as incomplete

>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
> {igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp5}:
>
> shard-dg2-set2: NOTRUN -> FAIL +6 other tests fail
>

Does not relate to my change.

> New tests
>
> New tests have been introduced between XEIGT_8101_full and XEIGTPW_12074_=
full:
>
> New IGT tests (92)
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
> Statuses : 1 pass(s) 2 skip(s)
> Exec time: [0.0, 43.23] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2:
>
> Statuses : 1 pass(s)
> Exec time: [5.65] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
>
> Statuses : 1 pass(s)
> Exec time: [5.32] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:
>
> Statuses : 1 pass(s)
> Exec time: [5.39] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-edp-1:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
>
> Statuses : 1 pass(s)
> Exec time: [5.38] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
>
> Statuses : 1 pass(s)
> Exec time: [5.43] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-edp-1:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
>
> Statuses : 1 pass(s)
> Exec time: [5.27] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
>
> Statuses : 1 pass(s)
> Exec time: [5.46] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
>
> Statuses : 1 pass(s)
> Exec time: [5.31] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>
> Statuses : 1 pass(s) 2 skip(s)
> Exec time: [0.0, 24.18] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
>
> Statuses : 1 pass(s)
> Exec time: [2.98] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>
> Statuses : 1 pass(s)
> Exec time: [3.49] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
>
> Statuses : 1 pass(s)
> Exec time: [2.89] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>
> Statuses : 1 pass(s)
> Exec time: [3.00] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
>
> Statuses : 1 pass(s)
> Exec time: [2.99] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
>
> Statuses : 1 pass(s)
> Exec time: [2.93] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>
> Statuses : 1 pass(s)
> Exec time: [3.07] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
>
> Statuses : 1 pass(s)
> Exec time: [2.81] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>
> Statuses : 1 pass(s) 2 skip(s)
> Exec time: [0.0, 13.41] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>
> Statuses : 3 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
>
> Statuses : 1 pass(s)
> Exec time: [1.78] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
>
> Statuses : 1 pass(s)
> Exec time: [1.68] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
>
> Statuses : 1 pass(s)
> Exec time: [1.62] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>
> Statuses : 1 pass(s)
> Exec time: [1.72] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
>
> Statuses : 1 pass(s)
> Exec time: [1.76] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
>
> Statuses : 1 pass(s)
> Exec time: [1.55] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
>
> Statuses : 1 pass(s)
> Exec time: [1.75] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
>
> Statuses : 1 pass(s)
> Exec time: [1.53] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>
> Statuses : 1 pass(s) 1 skip(s)
> Exec time: [0.01, 24.13] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:
>
> Statuses : 1 pass(s)
> Exec time: [5.42] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-2:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
>
> Statuses : 1 pass(s)
> Exec time: [10.76] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-dp-2:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:
>
> Statuses : 1 pass(s)
> Exec time: [7.95] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-hdmi-a-3:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-dp-2:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>
> Statuses : 3 skip(s)
> Exec time: [0.0, 0.01] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-dp-4:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-dp-4:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>
> Statuses : 3 skip(s)
> Exec time: [0.0, 0.01] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
>
> Statuses : 3 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-dp-4:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>
> Statuses : 3 skip(s)
> Exec time: [0.0, 0.01] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-dp-4:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-dp-4:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-c-dp-4:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-c-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-dp-4:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
>
> Statuses : 3 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>
> Statuses : 3 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>
> Statuses : 3 skip(s)
> Exec time: [0.0, 0.01] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-5:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-5:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-dp-5:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-5:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>
> Statuses : 3 skip(s)
> Exec time: [0.0, 0.01] s
>
> igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-dp-4:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-dp-4:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-dp-4:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-dp-4:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-6:
>
> Statuses : 1 skip(s)
> Exec time: [0.0] s
>
> igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-dp5:
>
> Statuses : 1 pass(s)
> Exec time: [4.32] s
>
> Known issues
>
> Here are the changes found in XEIGTPW_12074_full that come from known iss=
ues:
>
> IGT changes
>
> Issues hit
>
> igt@core_hotunplug@unplug-rescan:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1885)
>
> igt@core_setmaster@master-drop-set-user:
>
> shard-dg2-set2: PASS -> FAIL (Intel XE#3339)
>
> igt@fbdev@nullptr:
>
> shard-dg2-set2: PASS -> SKIP (Intel XE#2134) +1 other test skip
>
> igt@kms_3d:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2423)
>
> igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#2233)
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#623)
>
> igt@kms_atomic_transition@modeset-transition-nonblocking:
>
> shard-lnl: PASS -> FAIL (Intel XE#1701) +1 other test fail
>
> igt@kms_atomic_transition@plane-toggle-modeset-transition:
>
> shard-bmg: PASS -> FAIL (Intel XE#1426) +1 other test fail
>
> igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>
> shard-lnl: NOTRUN -> SKIP (Intel XE#1407) +1 other test skip
>
> igt@kms_big_fb@4-tiled-addfb-size-overflow:
>
> shard-dg2-set2: PASS -> SKIP (Intel XE#2890) +18 other tests skip
>
> igt@kms_big_fb@linear-32bpp-rotate-270:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#316) +4 other tests skip
>
> igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#2327)
>
> igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
>
> shard-dg2-set2: PASS -> SKIP (Intel XE#2351 / Intel XE#2890) +12 other te=
sts skip
>
> igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +2 other tests skip
>
> igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2351 / Intel XE#2890) +18 other =
tests skip
>
> igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +6 other tests skip
>
> igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
> shard-lnl: NOTRUN -> SKIP (Intel XE#1124)
>
> igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#367) +3 other tests skip
>
> igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2191)
>
> igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#367)
>
> igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +4 other tests skip
>
> igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2 (NEW):
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#2652 / Intel XE#787) +8 other tests s=
kip
>
> igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
>
> shard-lnl: NOTRUN -> SKIP (Intel XE#2887) +2 other tests skip
>
> igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2907)
>
> igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6=
:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +197 other tests skip
>
> igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +47 other te=
sts skip
>
> igt@kms_chamelium_color@ctm-limited-range:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#306) +1 other test skip
>
> igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +9 other tests skip
>
> igt@kms_chamelium_edid@hdmi-edid-read:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +2 other tests skip
>
> igt@kms_chamelium_frames@dp-crc-fast:
>
> shard-lnl: NOTRUN -> SKIP (Intel XE#373)
>
> igt@kms_content_protection@dp-mst-type-0:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#307) +1 other test skip
>
> igt@kms_content_protection@legacy:
>
> shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1178) +1 other test fail
>
> igt@kms_cursor_crc@cursor-offscreen-128x42:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +1 other test skip
>
> igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#308)
>
> igt@kms_cursor_crc@cursor-sliding-512x170:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#2321)
>
> igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2423 / i915#2575) +40 other test=
s skip
> shard-bmg: NOTRUN -> SKIP (Intel XE#2286)
>
> igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>
> shard-lnl: NOTRUN -> SKIP (Intel XE#309)
>
> igt@kms_cursor_legacy@torture-bo@all-pipes:
>
> shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel XE#2932)
>
> igt@kms_cursor_legacy@torture-bo@pipe-a:
>
> shard-dg2-set2: NOTRUN -> DMESG-WARN (Intel XE#3184)
>
> igt@kms_dp_linktrain_fallback@dp-fallback:
>
> shard-lnl: NOTRUN -> SKIP (Intel XE#3070)
>
> igt@kms_dsc@dsc-with-formats:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#2244)
>
> igt@kms_feature_discovery@display-3x:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#703)
>
> igt@kms_feature_discovery@dp-mst:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1137)
>
> igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
>
> shard-bmg: PASS -> FAIL (Intel XE#301) +1 other test fail
>
> igt@kms_flip@2x-flip-vs-panning-interruptible:
>
> shard-lnl: NOTRUN -> SKIP (Intel XE#1421)
>
> igt@kms_flip@2x-flip-vs-suspend-interruptible:
>
> shard-bmg: PASS -> INCOMPLETE (Intel XE#2597)
> shard-dg2-set2: NOTRUN -> INCOMPLETE (Intel XE#2049 / Intel XE#2597)
>
> igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:
>
> shard-bmg: PASS -> INCOMPLETE (Intel XE#2597 / Intel XE#2635)
>
> igt@kms_flip@blocking-wf_vblank:
>
> shard-lnl: NOTRUN -> FAIL (Intel XE#886) +1 other test fail
>
> igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
>
> shard-dg2-set2: NOTRUN -> FAIL (Intel XE#301) +8 other tests fail
>
> igt@kms_flip@flip-vs-wf_vblank-interruptible:
>
> shard-lnl: PASS -> FAIL (Intel XE#886) +2 other tests fail
> shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#2049)
>
> igt@kms_flip@wf_vblank-ts-check-interruptible:
>
> shard-lnl: PASS -> FAIL (Intel XE#3403 / Intel XE#886)
>
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +14 other tests skip
>
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscali=
ng:
>
> shard-lnl: NOTRUN -> SKIP (Intel XE#1401 / Intel XE#1745) +1 other test s=
kip
>
> igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscali=
ng@pipe-a-default-mode:
>
> shard-lnl: NOTRUN -> SKIP (Intel XE#1401) +1 other test skip
>
> igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +8 other tests skip
>
> igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
>
> shard-bmg: NOTRUN -> FAIL (Intel XE#2333) +5 other tests fail
>
> igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2890) +37 other tests skip
>
> igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +22 other tests skip
>
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
>
> shard-lnl: NOTRUN -> SKIP (Intel XE#656) +3 other tests skip
>
> igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
>
> shard-lnl: NOTRUN -> SKIP (Intel XE#651) +1 other test skip
>
> igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#2352)
>
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +9 other tests skip
>
> igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +24 other tests skip
>
> igt@kms_hdr@invalid-hdr:
>
> shard-dg2-set2: PASS -> SKIP (Intel XE#455)
>
> igt@kms_plane_cursor@overlay:
>
> shard-lnl: PASS -> FAIL (Intel XE#1471) +1 other test fail
>
> igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
>
> shard-dg2-set2: NOTRUN -> FAIL (Intel XE#616) +4 other tests fail
>
> igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pi=
pe-d:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2763 / Intel XE#455) +4 other te=
sts skip
>
> igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#2763) +4 other tests skip
>
> igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2763) +11 other tests skip
>
> igt@kms_pm_dc@dc5-psr:
>
> shard-lnl: PASS -> FAIL (Intel XE#718)
>
> igt@kms_pm_rpm@legacy-planes:
>
> shard-lnl: PASS -> DMESG-WARN (Intel XE#3184) +1 other test dmesg-warn
>
> igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2446)
>
> igt@kms_pm_rpm@modeset-non-lpsp:
>
> shard-dg2-set2: PASS -> SKIP (Intel XE#2446) +4 other tests skip
>
> igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>
> shard-lnl: NOTRUN -> SKIP (Intel XE#2893) +1 other test skip
>
> igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#1489)
>
> igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1489) +3 other tests skip
>
> igt@kms_psr2_su@frontbuffer-xrgb8888:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1122)
>
> igt@kms_psr@psr-cursor-plane-onoff:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#2234 / Intel XE#2850) +6 other tests =
skip
>
> igt@kms_psr@psr2-basic:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2850 / Intel XE#929) +12 other t=
ests skip
>
> igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2939)
>
> igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1127)
>
> igt@kms_rotation_crc@sprite-rotation-180:
>
> shard-dg2-set2: PASS -> SKIP (Intel XE#2423 / i915#2575) +70 other tests =
skip
>
> igt@kms_setmode@invalid-clone-exclusive-crtc:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#1435)
>
> igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
>
> shard-lnl: PASS -> FAIL (Intel XE#899)
>
> igt@kms_vrr@cmrr@pipe-a-edp-1:
>
> shard-lnl: NOTRUN -> FAIL (Intel XE#2159) +1 other test fail
>
> igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>
> shard-lnl: PASS -> FAIL (Intel XE#2142) +1 other test fail
>
> igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1091 / Intel XE#2849)
>
> igt@xe_compute_preempt@compute-preempt-many:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1280 / Intel XE#455) +2 other te=
sts skip
>
> igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2905) +5 other tests skip
>
> igt@xe_evict@evict-threads-small-multi-vm:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1130) +62 other tests skip
>
> igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>
> shard-lnl: NOTRUN -> SKIP (Intel XE#688)
>
> igt@xe_exec_basic@multigpu-once-bindexecqueue:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#2322)
>
> igt@xe_exec_basic@multigpu-once-userptr-invalidate:
>
> shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +1 other test skip
>
> igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
>
> shard-lnl: PASS -> FAIL (Intel XE#3320)
>
> igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>
> shard-bmg: PASS -> FAIL (Intel XE#1630) +1 other test fail
>
> igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
>
> shard-lnl: PASS -> FAIL (Intel XE#1630) +1 other test fail
>
> igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +17 other tests skip
>
> igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2360)
>
> igt@xe_exec_sip_eudebug@breakpoint-waitsip:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#2905)
>
> igt@xe_live_ktest@xe_dma_buf:
>
> shard-lnl: PASS -> SKIP (Intel XE#1192)
>
> igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2229)
>
> igt@xe_mmap@vram:
>
> shard-lnl: NOTRUN -> SKIP (Intel XE#1416)
>
> igt@xe_oa@mmio-triggered-reports:
>
> shard-bmg: PASS -> FAIL (Intel XE#2249) +1 other test fail
> shard-lnl: PASS -> FAIL (Intel XE#2249) +1 other test fail
>
> igt@xe_oa@syncs-ufence-wait-cfg:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2541) +2 other tests skip
>
> igt@xe_pat@pat-index-xelp:
>
> shard-lnl: NOTRUN -> SKIP (Intel XE#977)
>
> igt@xe_peer2peer@read:
>
> shard-bmg: NOTRUN -> SKIP (Intel XE#2427)
> shard-lnl: NOTRUN -> SKIP (Intel XE#1061)
>
> igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>
> shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1173) +1 other test fail
>
> igt@xe_pm@d3cold-basic-exec:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2284 / Intel XE#366)
>
> igt@xe_pm_residency@toggle-gt-c6:
>
> shard-lnl: PASS -> FAIL (Intel XE#958)
>
> igt@xe_query@multigpu-query-gt-list:
>
> shard-dg2-set2: NOTRUN -> SKIP (Intel XE#944) +1 other test skip
>
> igt@xe_tlb@basic-tlb:
>
> shard-dg2-set2: NOTRUN -> FAIL (Intel XE#2922)
>
> igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:
>
> shard-dg2-set2: PASS -> SKIP (Intel XE#1130) +130 other tests skip
>
> Possible fixes
>
> igt@core_hotunplug@hotrebind-lateclose:
>
> shard-dg2-set2: SKIP (Intel XE#1885) -> PASS +1 other test pass
>
> igt@core_hotunplug@hotreplug:
>
> shard-lnl: ABORT -> PASS
>
> igt@fbdev@eof:
>
> shard-dg2-set2: SKIP (Intel XE#2134) -> PASS +1 other test pass
>
> igt@kms_async_flips@alternate-sync-async-flip:
>
> shard-bmg: FAIL (Intel XE#827) -> PASS +1 other test pass
>
> igt@kms_atomic@plane-invalid-params-fence:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> PASS +103 other tests=
 pass
>
> igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>
> shard-lnl: FAIL (Intel XE#1701) -> PASS +1 other test pass
>
> igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-p=
anels:
>
> shard-lnl: FAIL (Intel XE#1426) -> PASS +1 other test pass
>
> igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
>
> shard-bmg: INCOMPLETE (Intel XE#2613) -> PASS +1 other test pass
>
> igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
> shard-dg2-set2: INCOMPLETE (Intel XE#1195 / Intel XE#1727) -> PASS
>
> igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
>
> shard-dg2-set2: DMESG-WARN (Intel XE#3113) -> PASS
>
> igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
>
> shard-dg2-set2: INCOMPLETE (Intel XE#1195 / Intel XE#3124) -> PASS
>
> igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>
> shard-bmg: DMESG-WARN (Intel XE#877) -> PASS
>
> igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-dp2-hdmi-a3:
>
> shard-bmg: FAIL (Intel XE#2882) -> PASS +2 other tests pass
>
> igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>
> shard-bmg: FAIL (Intel XE#301) -> PASS +3 other tests pass
>
> igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
> shard-bmg: INCOMPLETE (Intel XE#2635) -> PASS
>
> igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
>
> shard-bmg: INCOMPLETE -> PASS
>
> igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
>
> shard-dg2-set2: FAIL (Intel XE#301) -> PASS +6 other tests pass
>
> igt@kms_flip@plain-flip-ts-check:
>
> shard-lnl: FAIL (Intel XE#3403 / Intel XE#886) -> PASS
>
> igt@kms_flip@plain-flip-ts-check@c-edp1:
>
> shard-lnl: FAIL (Intel XE#886) -> PASS +3 other tests pass
>
> igt@kms_frontbuffer_tracking@basic:
>
> shard-dg2-set2: SKIP (Intel XE#2351) -> PASS
>
> igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
>
> shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#2890) -> PASS +12 other te=
sts pass
>
> igt@kms_joiner@basic-force-big-joiner:
>
> shard-dg2-set2: SKIP (Intel XE#2890) -> PASS +30 other tests pass
>
> igt@kms_pm_dc@dc5-dpms:
>
> shard-lnl: FAIL (Intel XE#718) -> PASS
>
> igt@kms_pm_rpm@universal-planes:
>
> shard-dg2-set2: SKIP (Intel XE#2446) -> PASS +5 other tests pass
>
> igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>
> shard-lnl: FAIL (Intel XE#899) -> PASS
>
> igt@kms_vblank@ts-continuation-dpms-suspend:
>
> shard-dg2-set2: ABORT (Intel XE#1034 / Intel XE#2625) -> PASS
>
> igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4:
>
> shard-dg2-set2: ABORT (Intel XE#1034) -> PASS
>
> igt@xe_evict@evict-beng-mixed-many-threads-small:
>
> shard-bmg: TIMEOUT (Intel XE#1473) -> PASS
>
> igt@xe_evict@evict-mixed-threads-large:
>
> shard-bmg: FAIL (Intel XE#1000) -> PASS
>
> igt@xe_exec_balancer@twice-virtual-basic:
>
> shard-dg2-set2: SKIP (Intel XE#1130) -> PASS +173 other tests pass
>
> igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-r=
ace-prefetch:
>
> shard-lnl: FAIL (Intel XE#1630) -> PASS
>
> igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:
>
> shard-bmg: FAIL (Intel XE#1630) -> PASS +2 other tests pass
>
> igt@xe_gt_freq@freq_reset_multiple:
>
> shard-lnl: DMESG-WARN (Intel XE#3184) -> PASS
>
> igt@xe_module_load@reload:
>
> shard-dg2-set2: FAIL (Intel XE#2136) -> PASS +2 other tests pass
>
> igt@xe_pm@s3-d3hot-basic-exec:
>
> shard-dg2-set2: ABORT (Intel XE#1358 / Intel XE#1794) -> PASS
>
> igt@xe_pm@s4-vm-bind-unbind-all:
>
> shard-dg2-set2: ABORT (Intel XE#1794) -> PASS
>
> igt@xe_pm@s4-vm-bind-userptr:
>
> shard-lnl: ABORT (Intel XE#1794) -> PASS
>
> Warnings
>
> igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>
> shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#2890) -> SKIP (Intel XE#31=
6) +1 other test skip
>
> igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>
> shard-dg2-set2: SKIP (Intel XE#316) -> SKIP (Intel XE#2890) +1 other test=
 skip
>
> igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
> shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#316) +3 other test=
s skip
>
> igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>
> shard-dg2-set2: SKIP (Intel XE#607) -> SKIP (Intel XE#2351 / Intel XE#289=
0)
>
> igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
> shard-dg2-set2: SKIP (Intel XE#1124) -> SKIP (Intel XE#2351 / Intel XE#28=
90) +2 other tests skip
>
> igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
> shard-dg2-set2: SKIP (Intel XE#1124) -> SKIP (Intel XE#2890) +3 other tes=
ts skip
>
> igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>
> shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#2890) -> SKIP (Intel XE#11=
24) +5 other tests skip
>
> igt@kms_big_fb@yf-tiled-addfb:
>
> shard-dg2-set2: SKIP (Intel XE#619) -> SKIP (Intel XE#2351 / Intel XE#289=
0) +1 other test skip
>
> igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
> shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#1124) +9 other tes=
ts skip
>
> igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
>
> shard-dg2-set2: SKIP (Intel XE#367) -> SKIP (Intel XE#2423 / i915#2575) +=
1 other test skip
>
> igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel XE#367) +=
3 other tests skip
>
> igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel XE#2191)
>
> igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
>
> shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#455 / Intel XE#787=
) +6 other tests skip
>
> igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>
> shard-dg2-set2: SKIP (Intel XE#2907) -> SKIP (Intel XE#2890)
>
> igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
>
> shard-dg2-set2: SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel XE#2351=
 / Intel XE#2890) +2 other tests skip
>
> igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
>
> shard-dg2-set2: SKIP (Intel XE#455 / Intel XE#787) -> SKIP (Intel XE#2890=
) +10 other tests skip
>
> igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
>
> shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#2890) -> SKIP (Intel XE#45=
5 / Intel XE#787) +2 other tests skip
>
> igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>
> shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#2907)
>
> igt@kms_chamelium_color@ctm-blue-to-red:
>
> shard-dg2-set2: SKIP (Intel XE#306) -> SKIP (Intel XE#2423 / i915#2575)
>
> igt@kms_chamelium_color@ctm-red-to-blue:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel XE#306)
>
> igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>
> shard-dg2-set2: SKIP (Intel XE#373) -> SKIP (Intel XE#2423 / i915#2575) +=
9 other tests skip
>
> igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel XE#373) +=
10 other tests skip
>
> igt@kms_content_protection@dp-mst-type-1:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel XE#307)
>
> igt@kms_content_protection@lic-type-0:
>
> shard-dg2-set2: FAIL (Intel XE#1178) -> SKIP (Intel XE#2423 / i915#2575) =
+1 other test skip
>
> igt@kms_cursor_crc@cursor-offscreen-512x170:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel XE#308) +=
1 other test skip
>
> igt@kms_cursor_crc@cursor-offscreen-512x512:
>
> shard-dg2-set2: SKIP (Intel XE#308) -> SKIP (Intel XE#2423 / i915#2575) +=
2 other tests skip
>
> igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel XE#323)
>
> igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
> shard-dg2-set2: SKIP (Intel XE#323) -> SKIP (Intel XE#2423 / i915#2575) +=
2 other tests skip
>
> igt@kms_cursor_legacy@torture-bo:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> DMESG-WARN (Intel XE#=
2932 / Intel XE#3184)
>
> igt@kms_dsc@dsc-with-bpc:
>
> shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#455) +1 other test=
 skip
>
> igt@kms_fbcon_fbt@psr-suspend:
>
> shard-dg2-set2: SKIP (Intel XE#776) -> SKIP (Intel XE#2890) +1 other test=
 skip
>
> igt@kms_feature_discovery@chamelium:
>
> shard-dg2-set2: SKIP (Intel XE#701) -> SKIP (Intel XE#2423 / i915#2575)
>
> igt@kms_feature_discovery@psr1:
>
> shard-dg2-set2: SKIP (Intel XE#1135) -> SKIP (Intel XE#2423 / i915#2575)
>
> igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> FAIL (Intel XE#3335)
>
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>
> shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#2351 / Intel XE#289=
0) +2 other tests skip
>
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsca=
ling:
>
> shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#2890) +2 other test=
s skip
>
> igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>
> shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#2890) -> SKIP (Intel XE#45=
5)
>
> igt@kms_force_connector_basic@prune-stale-modes:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (i915#5274)
>
> igt@kms_frontbuffer_tracking@drrs-suspend:
>
> shard-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#2351 / Intel XE#289=
0) +6 other tests skip
>
> igt@kms_frontbuffer_tracking@fbc-tiling-y:
>
> shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#2890) -> SKIP (Intel XE#65=
8) +1 other test skip
>
> igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>
> shard-dg2-set2: SKIP (Intel XE#651) -> SKIP (Intel XE#2890) +18 other tes=
ts skip
>
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
>
> shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#651) +23 other tes=
ts skip
>
> igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>
> shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#2890) -> SKIP (Intel XE#65=
1) +11 other tests skip
>
> igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>
> shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#2890) -> SKIP (Intel XE#65=
3) +10 other tests skip
>
> igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>
> shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#653) +17 other tes=
ts skip
>
> igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
>
> shard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#2351 / Intel XE#289=
0) +2 other tests skip
>
> igt@kms_frontbuffer_tracking@psr-slowdraw:
>
> shard-dg2-set2: SKIP (Intel XE#653) -> SKIP (Intel XE#2890) +17 other tes=
ts skip
>
> igt@kms_hdr@brightness-with-hdr:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> FAIL (Intel XE#3312 /=
 Intel XE#3404)
>
> igt@kms_joiner@basic-force-ultra-joiner:
>
> shard-dg2-set2: SKIP (Intel XE#2925) -> SKIP (Intel XE#2890)
>
> igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
> shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#2925)
>
> igt@kms_plane_cursor@primary:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> FAIL (Intel XE#616)
>
> igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel XE#2763 /=
 Intel XE#455) +2 other tests skip
>
> igt@kms_pm_backlight@fade-with-suspend:
>
> shard-dg2-set2: SKIP (Intel XE#870) -> SKIP (Intel XE#2890)
>
> igt@kms_pm_dc@deep-pkgc:
>
> shard-dg2-set2: SKIP (Intel XE#908) -> SKIP (Intel XE#2890)
>
> igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
>
> shard-dg2-set2: SKIP (Intel XE#1489) -> SKIP (Intel XE#2890) +5 other tes=
ts skip
>
> igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
>
> shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#1489) +10 other te=
sts skip
>
> igt@kms_psr2_su@page_flip-nv12:
>
> shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#1122)
>
> igt@kms_psr2_su@page_flip-xrgb8888:
>
> shard-dg2-set2: SKIP (Intel XE#1122) -> SKIP (Intel XE#2890)
>
> igt@kms_psr@fbc-psr-no-drrs:
>
> shard-dg2-set2: SKIP (Intel XE#2351 / Intel XE#2890) -> SKIP (Intel XE#28=
50 / Intel XE#929) +4 other tests skip
>
> igt@kms_psr@fbc-psr2-sprite-plane-move:
>
> shard-dg2-set2: SKIP (Intel XE#2890) -> SKIP (Intel XE#2850 / Intel XE#92=
9) +10 other tests skip
>
> igt@kms_psr@fbc-psr2-sprite-plane-onoff:
>
> shard-dg2-set2: SKIP (Intel XE#2850 / Intel XE#929) -> SKIP (Intel XE#289=
0) +10 other tests skip
>
> igt@kms_psr@psr-dpms:
>
> shard-dg2-set2: SKIP (Intel XE#2850 / Intel XE#929) -> SKIP (Intel XE#235=
1 / Intel XE#2890) +4 other tests skip
>
> igt@kms_psr@psr-sprite-plane-onoff:
>
> shard-dg2-set2: SKIP (Intel XE#2351) -> SKIP (Intel XE#2850 / Intel XE#92=
9) +1 other test skip
>
> igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>
> shard-dg2-set2: SKIP -> SKIP (Intel XE#2423 / i915#2575)
>
> igt@kms_scaling_modes@scaling-mode-full-aspect:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel XE#455) +=
6 other tests skip
>
> igt@kms_tiled_display@basic-test-pattern:
>
> shard-bmg: SKIP (Intel XE#2426) -> FAIL (Intel XE#1729)
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> FAIL (Intel XE#1729)
>
> igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel XE#1500)
>
> igt@kms_tv_load_detect@load-detect:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel XE#330)
>
> igt@kms_vrr@flip-dpms:
>
> shard-dg2-set2: SKIP (Intel XE#455) -> SKIP (Intel XE#2423 / i915#2575) +=
7 other tests skip
>
> igt@kms_writeback@writeback-check-output-xrgb2101010:
>
> shard-dg2-set2: SKIP (Intel XE#2423 / i915#2575) -> SKIP (Intel XE#756)
>
> igt@xe_compute_preempt@compute-threadgroup-preempt:
>
> shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#1280 / Intel XE#45=
5)
>
> igt@xe_copy_basic@mem-copy-linear-0x369:
>
> shard-dg2-set2: SKIP (Intel XE#1123) -> SKIP (Intel XE#1130)
>
> igt@xe_copy_basic@mem-copy-linear-0x3fff:
>
> shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#1123) +1 other tes=
t skip
>
> igt@xe_copy_basic@mem-set-linear-0xfd:
>
> shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#1126)
>
> igt@xe_copy_basic@mem-set-linear-0xfffe:
>
> shard-dg2-set2: SKIP (Intel XE#1126) -> SKIP (Intel XE#1130) +1 other tes=
t skip
>
> igt@xe_eudebug@basic-close:
>
> shard-dg2-set2: SKIP (Intel XE#2905) -> SKIP (Intel XE#1130) +10 other te=
sts skip
>
> igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>
> shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#2905) +12 other te=
sts skip
>
> igt@xe_evict@evict-beng-mixed-many-threads-large:
>
> shard-dg2-set2: SKIP (Intel XE#1130) -> TIMEOUT (Intel XE#1473) +1 other =
test timeout
>
> igt@xe_exec_balancer@once-cm-parallel-userptr-rebind:
>
> shard-dg2-set2: INCOMPLETE (Intel XE#1195 / Intel XE#2594) -> SKIP (Intel=
 XE#1130)
>
> igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
>
> shard-dg2-set2: SKIP (Intel XE#288) -> SKIP (Intel XE#1130) +26 other tes=
ts skip
>
> igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>
> shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#288) +32 other tes=
ts skip
>
> igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>
> shard-dg2-set2: SKIP (Intel XE#2360) -> SKIP (Intel XE#1130) +1 other tes=
t skip
>
> igt@xe_live_ktest@xe_bo:
>
> shard-dg2-set2: TIMEOUT (Intel XE#2961 / Intel XE#3191) -> TIMEOUT (Intel=
 XE#3191) +1 other test timeout
>
> igt@xe_media_fill@media-fill:
>
> shard-dg2-set2: SKIP (Intel XE#560) -> SKIP (Intel XE#1130)
>
> igt@xe_mmap@small-bar:
>
> shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#512)
>
> igt@xe_oa@mi-rpc:
>
> shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#2541) +5 other tes=
ts skip
>
> igt@xe_oa@non-zero-reason:
>
> shard-dg2-set2: SKIP (Intel XE#2541) -> SKIP (Intel XE#1130) +3 other tes=
ts skip
>
> igt@xe_pm@d3cold-multiple-execs:
>
> shard-dg2-set2: SKIP (Intel XE#2284 / Intel XE#366) -> SKIP (Intel XE#113=
0)
>
> igt@xe_pm@s2idle-d3cold-basic-exec:
>
> shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#2284 / Intel XE#36=
6)
>
> igt@xe_pm@s3-basic-exec:
>
> shard-dg2-set2: ABORT (Intel XE#1358) -> SKIP (Intel XE#1130)
>
> igt@xe_pm@vram-d3cold-threshold:
>
> shard-dg2-set2: SKIP (Intel XE#579) -> SKIP (Intel XE#1130)
>
> igt@xe_query@multigpu-query-oa-units:
>
> shard-dg2-set2: SKIP (Intel XE#1130) -> SKIP (Intel XE#944) +1 other test=
 skip
>
> igt@xe_query@multigpu-query-uc-fw-version-guc:
>
> shard-dg2-set2: SKIP (Intel XE#944) -> SKIP (Intel XE#1130) +2 other test=
s skip
>
> igt@xe_wedged@wedged-mode-toggle:
>
> shard-dg2-set2: SKIP (Intel XE#1130) -> ABORT (Intel XE#3075 / Intel XE#3=
084)
>
> {name}: This element is suppressed. This means it is ignored when computi=
ng
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
> Build changes
>
> IGT: IGT_8101 -> IGTPW_12074
> Linux: xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25 -> xe-2194-009768=
33a8b163cfcad247ba2d22ea4819fd749c
>
> IGTPW_12074: 12074
> IGT_8101: 1235576931b5abdcb2c755672d194fb540fa6fb1 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git
> xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25: 5521311ecd7ffbb0adf016d=
bf83bd0165fc94d25
> xe-2194-00976833a8b163cfcad247ba2d22ea4819fd749c: 00976833a8b163cfcad247b=
a2d22ea4819fd749c
