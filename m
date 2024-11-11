Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989B5D2E9C7
	for <igt-dev@archiver.kernel.org>; Mon, 11 Nov 2024 09:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1353B10E448;
	Mon, 11 Nov 2024 09:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xe/jSAXG";
	dkim-atps=neutral
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C3610E447;
 Mon, 11 Nov 2024 09:09:55 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-7e6cbf6cd1dso2791144a12.3; 
 Mon, 11 Nov 2024 01:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731316194; x=1731920994; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PWPlAT7FswSYAcI7jYMhCmI/AYPeehRPB7gk4OEXWsw=;
 b=Xe/jSAXGd6Zq2+It6mcE2+t8+hIoJkpIIRKVt9XXAyUUx3F/h50snkxLGanVb1J8Gz
 bbXE3evRArpI3bUmuBhV8npHb/VkD46Da+6CoiOhnwvx0v+rXkYt0jV3b1ndMePt22aN
 tkYsS/GIRuouIvyIzCIdbfwYhXqSFrvgWFWFB/dH8YZBA0peTcnFKnelnUJo4EVx3atN
 UIpz9RPflI1O+P20/SKNueaIauNkamJ1XTJqyWCAQ/IJWiFQbIAivjJR/CIOvX8iY4ht
 CQ7tP6nwktDzvCGvQ6vNHv1WmzNsWonAx/9S7lGoiRuK46JH5oHAXqBTtamk13a4cDZO
 qiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731316194; x=1731920994;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PWPlAT7FswSYAcI7jYMhCmI/AYPeehRPB7gk4OEXWsw=;
 b=nhiE26N90tzNn9Q8iO4fYzVgPRTBJqWyYYCEJDsjOSqD/OJEczS3UwZ6m0LmitEVLw
 67clsvazhwTYKlvwNzkD2K/UKRbEfJ+9sACtviJfIFqUfttDUBQM1GwLxUltW4xWIrAQ
 D1JxhQ0X6ciXQRwfBSgFxN9wYMROnvmooPyjPhmRD0ULpyAETdJbSzwC6PSO+xeDry9Y
 7UotSBPiMc+P84iMZuuJF/kmSP/Ue3FB79bvKYz76tWuEDdDL+tJlD05MLd7VoM7bdBO
 yeIAKU5BaHQkv0NrBuhsGWVjXuxwekso/XYL9hCNLHr5goDkoWySrwIvzRmGrXGfoBnh
 XvlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6apXxxWDxkY1pbL5wd1dfNiRpowrgkp+Pe5bf01SKj9UZCZrDT7eRAzBDOAHTLRFHW2bkuDKUm7PtBIlQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHN3FFen9CR/m+DU73e5KZFSQgUeRUlAqSSZ/wJ+lqLMSNcf9A
 /OzkoHSDMESO4PfV9vufJJxzjlk51OP7+c1rqnIz20hORJqG4JT2FPVLzI92Y5gqRkUfVm1xt6y
 uFI2Wqs4/21yj0iNGlRi80fz3OUy4jMcNJoE=
X-Google-Smtp-Source: AGHT+IHaokFKAbryqjQpReTcVGJki01Cnvdx+9QxgFPQWBrG8mXaETdX2LneOyu0E+u6/jvof1bvY4raBsUqlWO9Vjk=
X-Received: by 2002:a05:6a20:7488:b0:1d8:a67b:9224 with SMTP id
 adf61e73a8af0-1dc22b4f026mr17303385637.34.1731316193543; Mon, 11 Nov 2024
 01:09:53 -0800 (PST)
MIME-Version: 1.0
References: <20241105115708.682335-1-juhapekka.heikkila@gmail.com>
 <173116165066.1767557.1659282498379575510@2413ebb6fbb6>
In-Reply-To: <173116165066.1767557.1659282498379575510@2413ebb6fbb6>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Mon, 11 Nov 2024 11:09:41 +0200
Message-ID: <CAJ=qYWR+y_EK4rU9xt3A+8szaUqs_8R4j4EcYDfiuMjNcfx67Q@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests=2Fintel=2Fkms=5Fccs=3A_?=
 =?UTF-8?Q?add_suspend_tests_=28rev6=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000b5d3c706269f7685"
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

--000000000000b5d3c706269f7685
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

These regressions not regressions

On Sat, Nov 9, 2024 at 4:14=E2=80=AFPM Patchwork <patchwork@emeril.freedesk=
top.org>
wrote:

> *Patch Details*
> *Series:* tests/intel/kms_ccs: add suspend tests (rev6)
> *URL:* https://patchwork.freedesktop.org/series/140731/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/index.htm=
l CI
> Bug Log - changes from CI_DRM_15662_full -> IGTPW_12074_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_12074_full absolutely need to b=
e
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_12074_full, please notify your bug team (
> I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in C=
I.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/index.html
> Participating hosts (9 -> 9)
>
> Additional (1): shard-glk-0
> Missing (1): shard-glk
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_12074_full:
> IGT changes Possible regressions
>
>    - igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs (NEW):
>       - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-11/=
igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>       +3 other tests skip
>       - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-3/i=
gt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>       +1 other test skip
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-14/=
igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>       +1 other test skip
>       - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-5/=
igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>       +1 other test skip
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-2/=
igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>       +1 other test skip
>
> These tests are newly added and just don't run on all platforms because o=
f
missing modifiers.


>
>    -
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>    - igt@kms_rotation_crc@primary-rotation-90:
>       - {shard-dg2-9}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-9/i=
gt@kms_rotation_crc@primary-rotation-90.html>
>       +1 other test skip
>
> This anyway is not a regression, dg2 will never do any 90/270 degree
rotation on display part.


>
>    -
>
> New tests
>
> New tests have been introduced between CI_DRM_15662_full and
> IGTPW_12074_full:
> New IGT tests (167)
>
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>    - Statuses : 6 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>    - Statuses : 1 pass(s) 5 skip(s)
>       - Exec time: [0.0, 29.25] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
>    - Statuses : 2 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-3:
>    - Statuses : 1 pass(s) 1 skip(s)
>       - Exec time: [0.0, 8.06] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
>    - Statuses : 2 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-3:
>    - Statuses : 1 pass(s) 1 skip(s)
>       - Exec time: [0.0, 6.99] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3:
>    - Statuses : 1 pass(s) 1 skip(s)
>       - Exec time: [0.0, 7.09] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:
>    - Statuses : 1 pass(s) 1 skip(s)
>       - Exec time: [0.0, 7.10] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>    - Statuses : 2 skip(s)
>       - Exec time: [0.0, 0.01] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>    - Statuses : 1 pass(s) 5 skip(s)
>       - Exec time: [0.0, 14.58] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
>    - Statuses : 2 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.93] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
>    - Statuses : 2 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.69] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.52] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-3:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.44] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>    - Statuses : 6 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>    - Statuses : 1 pass(s) 5 skip(s)
>       - Exec time: [0.0, 12.55] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-edp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.45] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:
>    - Statuses : 3 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.51] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
>    - Statuses : 3 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.32] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
>    - Statuses : 2 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.26] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
>    - Statuses : 2 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>    - Statuses : 1 pass(s) 5 skip(s)
>       - Exec time: [0.0, 8.76] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
>    - Statuses : 1 pass(s) 5 skip(s)
>       - Exec time: [0.0, 7.87] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-edp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [1.26] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.25] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.19] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-edp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.16] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-edp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.14] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-edp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.28] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.17] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-dp-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.17] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>    - Statuses : 6 skip(s)
>       - Exec time: [0.0, 0.01] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
>    - Statuses : 3 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-hdmi-a-1:
>    - Statuses : 3 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-c-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-c-hdmi-a-1:
>    - Statuses : 2 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-c-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1:
>    - Statuses : 2 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
>    - Statuses : 6 skip(s)
>       - Exec time: [0.0, 0.01] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
>    - Statuses : 2 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
>    - Statuses : 2 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-c-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>    - Statuses : 3 pass(s) 3 skip(s)
>       - Exec time: [0.0, 34.15] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>    - Statuses : 3 pass(s) 3 skip(s)
>       - Exec time: [0.0, 33.97] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-=
1
>    :
>    - Statuses : 2 pass(s)
>       - Exec time: [1.24, 17.02] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-=
3
>    :
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-=
4
>    :
>    - Statuses : 1 pass(s)
>       - Exec time: [7.96] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-=
1
>    :
>    - Statuses : 2 pass(s)
>       - Exec time: [1.24, 16.94] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-=
3
>    :
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-=
4
>    :
>    - Statuses : 1 pass(s)
>       - Exec time: [7.58] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-=
1
>    :
>    - Statuses : 1 pass(s)
>       - Exec time: [1.17] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-=
3
>    :
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-=
4
>    :
>    - Statuses : 1 pass(s)
>       - Exec time: [7.67] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-=
1
>    :
>    - Statuses : 1 pass(s)
>       - Exec time: [1.19] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-=
3
>    :
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-=
4
>    :
>    - Statuses : 1 pass(s)
>       - Exec time: [7.62] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
>    - Statuses : 2 pass(s)
>       - Exec time: [1.22, 16.95] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-3:
>    - Statuses : 1 pass(s) 1 skip(s)
>       - Exec time: [0.0, 7.95] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
>    - Statuses : 2 pass(s)
>       - Exec time: [1.16, 17.20] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-3:
>    - Statuses : 1 pass(s) 1 skip(s)
>       - Exec time: [0.0, 7.54] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [1.13] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-3:
>    - Statuses : 1 pass(s) 1 skip(s)
>       - Exec time: [0.0, 7.54] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [1.14] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:
>    - Statuses : 1 pass(s) 1 skip(s)
>       - Exec time: [0.0, 7.54] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>    - Statuses : 6 skip(s)
>       - Exec time: [0.0, 0.01] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-2:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-edp-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-1:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-3:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>
> Known issues
>
> Here are the changes found in IGTPW_12074_full that come from known issue=
s:
> IGT changes Issues hit
>
>    -
>
>    igt@api_intel_bb@blit-reloc-keep-cache:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-3/i=
gt@api_intel_bb@blit-reloc-keep-cache.html>
>       ([i915#8411])
>    -
>
>    igt@api_intel_bb@object-reloc-purge-cache:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-17/=
igt@api_intel_bb@object-reloc-purge-cache.html>
>       ([i915#8411])
>    -
>
>    igt@device_reset@cold-reset-bound:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@device_reset@cold-reset-bound.html>
>       ([i915#11078])
>    -
>
>    igt@drm_fdinfo@virtual-busy:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-12/=
igt@drm_fdinfo@virtual-busy.html>
>       ([i915#8414])
>    -
>
>    igt@drm_fdinfo@virtual-busy-hang:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-1/i=
gt@drm_fdinfo@virtual-busy-hang.html>
>       ([i915#8414]) +1 other test skip
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-3/=
igt@drm_fdinfo@virtual-busy-hang.html>
>       ([i915#8414]) +2 other tests skip
>    -
>
>    igt@gem_close_race@multigpu-basic-process:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-4/i=
gt@gem_close_race@multigpu-basic-process.html>
>       ([i915#7697])
>    -
>
>    igt@gem_create@create-ext-cpu-access-big:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-1/=
igt@gem_create@create-ext-cpu-access-big.html>
>       ([i915#6335])
>    -
>
>    igt@gem_create@create-ext-cpu-access-sanity-check:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@gem_create@create-ext-cpu-access-sanity-check.html>
>       ([i915#6335])
>    -
>
>    igt@gem_create@create-ext-set-pat:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@gem_create@create-ext-set-pat.html>
>       ([i915#8562])
>    -
>
>    igt@gem_ctx_persistence@heartbeat-stop:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-14/=
igt@gem_ctx_persistence@heartbeat-stop.html>
>       ([i915#8555])
>    -
>
>    igt@gem_ctx_persistence@hostile:
>    - shard-mtlp: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-3/=
igt@gem_ctx_persistence@hostile.html>
>       ([i915#11980] / [i915#12580])
>    -
>
>    igt@gem_ctx_persistence@saturated-hostile-nopreempt:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-4/i=
gt@gem_ctx_persistence@saturated-hostile-nopreempt.html>
>       ([i915#5882]) +7 other tests skip
>    -
>
>    igt@gem_ctx_sseu@invalid-sseu:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-4/i=
gt@gem_ctx_sseu@invalid-sseu.html>
>       ([i915#280])
>       - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-4/i=
gt@gem_ctx_sseu@invalid-sseu.html>
>       ([i915#280])
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-12/=
igt@gem_ctx_sseu@invalid-sseu.html>
>       ([i915#280])
>       - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-7/=
igt@gem_ctx_sseu@invalid-sseu.html>
>       ([i915#280])
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-7/=
igt@gem_ctx_sseu@invalid-sseu.html>
>       ([i915#280])
>    -
>
>    igt@gem_ctx_sseu@mmap-args:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@gem_ctx_sseu@mmap-args.html>
>       ([i915#280])
>    -
>
>    igt@gem_eio@reset-stress:
>    - shard-dg1: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-dg1-12=
/igt@gem_eio@reset-stress.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-19/=
igt@gem_eio@reset-stress.html>
>       ([i915#12543] / [i915#5784])
>    -
>
>    igt@gem_eio@unwedge-stress:
>    - shard-dg1: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-dg1-16=
/igt@gem_eio@unwedge-stress.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-14/=
igt@gem_eio@unwedge-stress.html>
>       ([i915#12714] / [i915#5784])
>    -
>
>    igt@gem_exec_balancer@noheartbeat:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-5/i=
gt@gem_exec_balancer@noheartbeat.html>
>       ([i915#8555])
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-1/=
igt@gem_exec_balancer@noheartbeat.html>
>       ([i915#8555]) +1 other test skip
>    -
>
>    igt@gem_exec_balancer@parallel-bb-first:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-7/i=
gt@gem_exec_balancer@parallel-bb-first.html>
>       ([i915#4525]) +1 other test skip
>    -
>
>    igt@gem_exec_balancer@sliced:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-6/=
igt@gem_exec_balancer@sliced.html>
>       ([i915#4812])
>    -
>
>    igt@gem_exec_capture@capture:
>    - shard-mtlp: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-7/=
igt@gem_exec_capture@capture.html>
>       ([i915#11965] / [i915#12558]) +1 other test fail
>    -
>
>    igt@gem_exec_capture@capture@vecs0-lmem0:
>    - shard-dg2: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-4/i=
gt@gem_exec_capture@capture@vecs0-lmem0.html>
>       ([i915#11965] / [i915#12558]) +2 other tests fail
>       - shard-dg1: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-12/=
igt@gem_exec_capture@capture@vecs0-lmem0.html>
>       ([i915#11965] / [i915#12558]) +2 other tests fail
>    -
>
>    igt@gem_exec_capture@capture@vecs1-smem:
>    - shard-dg2: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-4/i=
gt@gem_exec_capture@capture@vecs1-smem.html>
>       ([i915#11965]) +1 other test fail
>    -
>
>    igt@gem_exec_fair@basic-deadline:
>    - shard-rkl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-rkl-2/=
igt@gem_exec_fair@basic-deadline.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-2/i=
gt@gem_exec_fair@basic-deadline.html>
>       ([i915#2846])
>    -
>
>    igt@gem_exec_fair@basic-none-share@rcs0:
>    - shard-tglu: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-5/=
igt@gem_exec_fair@basic-none-share@rcs0.html>
>       ([i915#2842]) +1 other test fail
>    -
>
>    igt@gem_exec_fair@basic-pace-solo@rcs0:
>    - shard-rkl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-rkl-3/=
igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-5/i=
gt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       ([i915#2842]) +4 other tests fail
>    -
>
>    igt@gem_exec_fair@basic-throttle:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-8/i=
gt@gem_exec_fair@basic-throttle.html>
>       ([i915#3539]) +1 other test skip
>    -
>
>    igt@gem_exec_fence@submit3:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-4/i=
gt@gem_exec_fence@submit3.html>
>       ([i915#4812]) +3 other tests skip
>    -
>
>    igt@gem_exec_flush@basic-uc-ro-default:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-11/=
igt@gem_exec_flush@basic-uc-ro-default.html>
>       ([i915#3539] / [i915#4852]) +2 other tests skip
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-14/=
igt@gem_exec_flush@basic-uc-ro-default.html>
>       ([i915#3539] / [i915#4852]) +1 other test skip
>    -
>
>    igt@gem_exec_params@rsvd2-dirt:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-2/=
igt@gem_exec_params@rsvd2-dirt.html>
>       ([i915#5107])
>       - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-11/=
igt@gem_exec_params@rsvd2-dirt.html>
>       ([i915#5107])
>    -
>
>    igt@gem_exec_reloc@basic-cpu-wc-noreloc:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-6/=
igt@gem_exec_reloc@basic-cpu-wc-noreloc.html>
>       ([i915#3281]) +9 other tests skip
>    -
>
>    igt@gem_exec_reloc@basic-wc-cpu-noreloc:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-13/=
igt@gem_exec_reloc@basic-wc-cpu-noreloc.html>
>       ([i915#3281]) +10 other tests skip
>    -
>
>    igt@gem_exec_reloc@basic-write-read-active:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-11/=
igt@gem_exec_reloc@basic-write-read-active.html>
>       ([i915#3281]) +16 other tests skip
>       - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-3/i=
gt@gem_exec_reloc@basic-write-read-active.html>
>       ([i915#3281]) +8 other tests skip
>    -
>
>    igt@gem_exec_schedule@pi-common:
>    - shard-tglu: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-3/=
igt@gem_exec_schedule@pi-common.html>
>       ([i915#12296]) +5 other tests fail
>    -
>
>    igt@gem_exec_schedule@preempt-queue-contexts:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-15/=
igt@gem_exec_schedule@preempt-queue-contexts.html>
>       ([i915#4812]) +1 other test skip
>    -
>
>    igt@gem_exec_schedule@reorder-wide:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-4/i=
gt@gem_exec_schedule@reorder-wide.html>
>       ([i915#4537] / [i915#4812]) +1 other test skip
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-7/=
igt@gem_exec_schedule@reorder-wide.html>
>       ([i915#4537] / [i915#4812])
>    -
>
>    igt@gem_fenced_exec_thrash@no-spare-fences:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-17/=
igt@gem_fenced_exec_thrash@no-spare-fences.html>
>       ([i915#4860])
>    -
>
>    igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-1/i=
gt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html>
>       ([i915#4860]) +1 other test skip
>    -
>
>    igt@gem_huc_copy@huc-copy:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-2/i=
gt@gem_huc_copy@huc-copy.html>
>       ([i915#2190])
>    -
>
>    igt@gem_lmem_swapping@heavy-random:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-6/=
igt@gem_lmem_swapping@heavy-random.html>
>       ([i915#4613])
>    -
>
>    igt@gem_lmem_swapping@parallel-random-verify:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-5/i=
gt@gem_lmem_swapping@parallel-random-verify.html>
>       ([i915#4613])
>       - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@gem_lmem_swapping@parallel-random-verify.html>
>       ([i915#4613]) +1 other test skip
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-5/=
igt@gem_lmem_swapping@parallel-random-verify.html>
>       ([i915#4613]) +1 other test skip
>    -
>
>    igt@gem_mmap@bad-size:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-5/=
igt@gem_mmap@bad-size.html>
>       ([i915#4083]) +4 other tests skip
>    -
>
>    igt@gem_mmap_gtt@cpuset-big-copy-odd:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-1/i=
gt@gem_mmap_gtt@cpuset-big-copy-odd.html>
>       ([i915#4077]) +19 other tests skip
>    -
>
>    igt@gem_mmap_gtt@flink-race:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-15/=
igt@gem_mmap_gtt@flink-race.html>
>       ([i915#4077]) +9 other tests skip
>    -
>
>    igt@gem_mmap_wc@copy:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-1/i=
gt@gem_mmap_wc@copy.html>
>       ([i915#4083]) +7 other tests skip
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-13/=
igt@gem_mmap_wc@copy.html>
>       ([i915#4083]) +4 other tests skip
>    -
>
>    igt@gem_partial_pwrite_pread@reads-uncached:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-4/i=
gt@gem_partial_pwrite_pread@reads-uncached.html>
>       ([i915#3282]) +3 other tests skip
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-6/=
igt@gem_partial_pwrite_pread@reads-uncached.html>
>       ([i915#3282]) +2 other tests skip
>    -
>
>    igt@gem_partial_pwrite_pread@write:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-17/=
igt@gem_partial_pwrite_pread@write.html>
>       ([i915#3282]) +1 other test skip
>    -
>
>    igt@gem_pxp@display-protected-crc:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-1/i=
gt@gem_pxp@display-protected-crc.html>
>       ([i915#4270]) +4 other tests skip
>    -
>
>    igt@gem_pxp@reject-modify-context-protection-off-2:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@gem_pxp@reject-modify-context-protection-off-2.html>
>       ([i915#4270])
>    -
>
>    igt@gem_pxp@verify-pxp-stale-buf-execution:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-2/=
igt@gem_pxp@verify-pxp-stale-buf-execution.html>
>       ([i915#4270]) +1 other test skip
>       - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-2/i=
gt@gem_pxp@verify-pxp-stale-buf-execution.html>
>       ([i915#4270]) +1 other test skip
>    -
>
>    igt@gem_pxp@verify-pxp-stale-ctx-execution:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-18/=
igt@gem_pxp@verify-pxp-stale-ctx-execution.html>
>       ([i915#4270]) +1 other test skip
>       - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-6/=
igt@gem_pxp@verify-pxp-stale-ctx-execution.html>
>       ([i915#4270]) +2 other tests skip
>    -
>
>    igt@gem_readwrite@beyond-eob:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-5/i=
gt@gem_readwrite@beyond-eob.html>
>       ([i915#3282]) +7 other tests skip
>    -
>
>    igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-2/=
igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html>
>       ([i915#8428]) +2 other tests skip
>    -
>
>    igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-1/i=
gt@gem_render_copy@y-tiled-to-vebox-y-tiled.html>
>       ([i915#5190] / [i915#8428]) +9 other tests skip
>    -
>
>    igt@gem_render_tiled_blits@basic:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-5/i=
gt@gem_render_tiled_blits@basic.html>
>       ([i915#4079]) +2 other tests skip
>    -
>
>    igt@gem_tiled_blits@basic:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-1/=
igt@gem_tiled_blits@basic.html>
>       ([i915#4077]) +5 other tests skip
>    -
>
>    igt@gem_unfence_active_buffers:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-3/i=
gt@gem_unfence_active_buffers.html>
>       ([i915#4879])
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-16/=
igt@gem_unfence_active_buffers.html>
>       ([i915#4879])
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-1/=
igt@gem_unfence_active_buffers.html>
>       ([i915#4879])
>    -
>
>    igt@gem_userptr_blits@coherency-unsync:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@gem_userptr_blits@coherency-unsync.html>
>       ([i915#3297])
>    -
>
>    igt@gem_userptr_blits@create-destroy-unsync:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-4/i=
gt@gem_userptr_blits@create-destroy-unsync.html>
>       ([i915#3297])
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-14/=
igt@gem_userptr_blits@create-destroy-unsync.html>
>       ([i915#3297])
>       - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-6/=
igt@gem_userptr_blits@create-destroy-unsync.html>
>       ([i915#3297])
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-6/=
igt@gem_userptr_blits@create-destroy-unsync.html>
>       ([i915#3297])
>    -
>
>    igt@gem_userptr_blits@dmabuf-unsync:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-10/=
igt@gem_userptr_blits@dmabuf-unsync.html>
>       ([i915#3297]) +2 other tests skip
>    -
>
>    igt@gem_userptr_blits@forbidden-operations:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-3/i=
gt@gem_userptr_blits@forbidden-operations.html>
>       ([i915#3282] / [i915#3297])
>    -
>
>    igt@gem_userptr_blits@relocations:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-1/i=
gt@gem_userptr_blits@relocations.html>
>       ([i915#3281] / [i915#3297])
>    -
>
>    igt@gen9_exec_parse@allowed-all:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-5/=
igt@gen9_exec_parse@allowed-all.html>
>       ([i915#2856])
>    -
>
>    igt@gen9_exec_parse@bb-start-cmd:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-19/=
igt@gen9_exec_parse@bb-start-cmd.html>
>       ([i915#2527]) +1 other test skip
>       - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-3/=
igt@gen9_exec_parse@bb-start-cmd.html>
>       ([i915#2527] / [i915#2856]) +1 other test skip
>    -
>
>    igt@gen9_exec_parse@secure-batches:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-5/i=
gt@gen9_exec_parse@secure-batches.html>
>       ([i915#2856]) +4 other tests skip
>    -
>
>    igt@gen9_exec_parse@unaligned-jump:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-3/i=
gt@gen9_exec_parse@unaligned-jump.html>
>       ([i915#2527])
>    -
>
>    igt@i915_module_load@load:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-2/i=
gt@i915_module_load@load.html>
>       ([i915#6227])
>    -
>
>    igt@i915_pm_freq_api@freq-reset:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@i915_pm_freq_api@freq-reset.html>
>       ([i915#8399])
>    -
>
>    igt@i915_pm_freq_api@freq-reset-multiple:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-4/=
igt@i915_pm_freq_api@freq-reset-multiple.html>
>       ([i915#8399])
>    -
>
>    igt@i915_pm_rc6_residency@rc6-fence:
>    - shard-tglu: NOTRUN -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-4/=
igt@i915_pm_rc6_residency@rc6-fence.html>
>       ([i915#2681]) +1 other test warn
>    -
>
>    igt@i915_pm_rps@basic-api:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-17/=
igt@i915_pm_rps@basic-api.html>
>       ([i915#11681] / [i915#6621])
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-5/=
igt@i915_pm_rps@basic-api.html>
>       ([i915#11681] / [i915#6621])
>       - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-2/i=
gt@i915_pm_rps@basic-api.html>
>       ([i915#11681] / [i915#6621])
>    -
>
>    igt@i915_pm_rps@thresholds-park:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-16/=
igt@i915_pm_rps@thresholds-park.html>
>       ([i915#11681])
>    -
>
>    igt@i915_pm_sseu@full-enable:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-5/=
igt@i915_pm_sseu@full-enable.html>
>       ([i915#4387])
>    -
>
>    igt@i915_power@sanity:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-2/i=
gt@i915_power@sanity.html>
>       ([i915#7984])
>    -
>
>    igt@i915_query@query-topology-coherent-slice-mask:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-2/i=
gt@i915_query@query-topology-coherent-slice-mask.html>
>       ([i915#6188])
>    -
>
>    igt@intel_hwmon@hwmon-write:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-4/=
igt@intel_hwmon@hwmon-write.html>
>       ([i915#7707])
>    -
>
>    igt@kms_addfb_basic@clobberred-modifier:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-5/i=
gt@kms_addfb_basic@clobberred-modifier.html>
>       ([i915#4212])
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-13/=
igt@kms_addfb_basic@clobberred-modifier.html>
>       ([i915#4212])
>    -
>
>    igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>       ([i915#12454] / [i915#12712])
>    -
>
>    igt@kms_addfb_basic@tile-pitch-mismatch:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-3/=
igt@kms_addfb_basic@tile-pitch-mismatch.html>
>       ([i915#4212]) +1 other test skip
>    -
>
>    igt@kms_async_flips
>    @async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-2/i=
gt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-cc=
s-cc.html>
>       ([i915#8709]) +3 other tests skip
>    -
>
>    igt@kms_async_flips
>    @async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-5/i=
gt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-cc=
s.html>
>       ([i915#8709]) +11 other tests skip
>    -
>
>    igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>       ([i915#9531])
>    -
>
>    igt@kms_atomic_transition
>    @plane-all-modeset-transition-fencing-internal-panels:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-2/=
igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-pan=
els.html>
>       ([i915#1769] / [i915#3555])
>    -
>
>    igt@kms_atomic_transition
>    @plane-toggle-modeset-transition@pipe-a-hdmi-a-4:
>    - shard-dg1: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-dg1-16=
/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-4.=
html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-14/=
igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-4.h=
tml>
>       ([i915#5956]) +1 other test fail
>    -
>
>    igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_big_fb@4-tiled-32bpp-rotate-270.html>
>       ([i915#5286]) +3 other tests skip
>    -
>
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-2/i=
gt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>       ([i915#5286]) +3 other tests skip
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-18/=
igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>       ([i915#4538] / [i915#5286]) +5 other tests skip
>    -
>
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-3/=
igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>       ([i915#5286]) +5 other tests skip
>    -
>
>    igt@kms_big_fb@linear-8bpp-rotate-270:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-15/=
igt@kms_big_fb@linear-8bpp-rotate-270.html>
>       ([i915#3638]) +3 other tests skip
>    -
>
>    igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-7/i=
gt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>       ([i915#3638]) +2 other tests skip
>    -
>
>    igt@kms_big_fb@y-tiled-addfb-size-overflow:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-1/i=
gt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>       ([i915#5190]) +2 other tests skip
>    -
>
>    igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-5/i=
gt@kms_big_fb@yf-tiled-16bpp-rotate-270.html>
>       +20 other tests skip
>    -
>
>    igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-7/i=
gt@kms_big_fb@yf-tiled-16bpp-rotate-90.html>
>       ([i915#4538] / [i915#5190]) +18 other tests skip
>    -
>
>    igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-16/=
igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html>
>       ([i915#4538]) +6 other tests skip
>    -
>
>    igt@kms_big_fb
>    @yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-8/=
igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.htm=
l>
>       +16 other tests skip
>    -
>
>    igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-17/=
igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html>
>       ([i915#6095]) +182 other tests skip
>    -
>
>    igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-5/=
igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1.html>
>       ([i915#6095]) +79 other tests skip
>    -
>
>    igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-16/=
igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html>
>       ([i915#12313])
>       - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-4/=
igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html>
>       ([i915#12313])
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-3/i=
gt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html>
>       ([i915#12313])
>    -
>
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-=
2
>    :
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-1/i=
gt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html=
>
>       ([i915#6095]) +112 other tests skip
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1
>    (NEW):
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-2/=
igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html>
>       ([i915#6095]) +89 other tests skip
>    -
>
>    igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-dp-4 (NEW):
>    - {shard-dg2-9}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-9/i=
gt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html>
>       ([i915#6095]) +4 other tests skip
>    -
>
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs (NEW):
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-2/i=
gt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html>
>       ([i915#6095]) +34 other tests skip
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3=
:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-2/i=
gt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html>
>       ([i915#10307] / [i915#6095]) +160 other tests skip
>    -
>
>    igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1.html>
>       ([i915#6095]) +39 other tests skip
>    -
>
>    igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html>
>       ([i915#12313])
>    -
>
>    igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-4/i=
gt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html>
>       ([i915#10307] / [i915#10434] / [i915#6095]) +5 other tests skip
>    -
>
>    igt@kms_cdclk@mode-transition-all-outputs:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-5/i=
gt@kms_cdclk@mode-transition-all-outputs.html>
>       ([i915#11616] / [i915#7213])
>    -
>
>    igt@kms_chamelium_edid@dp-edid-resolution-list:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-12/=
igt@kms_chamelium_edid@dp-edid-resolution-list.html>
>       ([i915#7828]) +5 other tests skip
>    -
>
>    igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-2/i=
gt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html>
>       ([i915#7828]) +2 other tests skip
>    -
>
>    igt@kms_chamelium_frames@dp-crc-fast:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-7/=
igt@kms_chamelium_frames@dp-crc-fast.html>
>       ([i915#7828]) +6 other tests skip
>    -
>
>    igt@kms_chamelium_frames@dp-crc-single:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_chamelium_frames@dp-crc-single.html>
>       ([i915#7828]) +4 other tests skip
>    -
>
>    igt@kms_chamelium_frames@hdmi-crc-multiple:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-4/i=
gt@kms_chamelium_frames@hdmi-crc-multiple.html>
>       ([i915#7828]) +11 other tests skip
>    -
>
>    igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-5/=
igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html>
>       ([i915#7828]) +4 other tests skip
>    -
>
>    igt@kms_color@deep-color:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-7/i=
gt@kms_color@deep-color.html>
>       ([i915#3555]) +7 other tests skip
>    -
>
>    igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
>    - shard-dg2: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-10/=
igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html>
>       ([i915#7173])
>    -
>
>    igt@kms_content_protection@content-type-change:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-18/=
igt@kms_content_protection@content-type-change.html>
>       ([i915#9424]) +1 other test skip
>    -
>
>    igt@kms_content_protection@dp-mst-lic-type-0:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_content_protection@dp-mst-lic-type-0.html>
>       ([i915#3116] / [i915#3299])
>    -
>
>    igt@kms_content_protection@dp-mst-lic-type-1:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-4/i=
gt@kms_content_protection@dp-mst-lic-type-1.html>
>       ([i915#3116])
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-6/=
igt@kms_content_protection@dp-mst-lic-type-1.html>
>       ([i915#3299])
>    -
>
>    igt@kms_content_protection@dp-mst-type-1:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-7/=
igt@kms_content_protection@dp-mst-type-1.html>
>       ([i915#3116] / [i915#3299])
>    -
>
>    igt@kms_content_protection@legacy:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-8/=
igt@kms_content_protection@legacy.html>
>       ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>    -
>
>    igt@kms_content_protection@lic-type-0:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-9/=
igt@kms_content_protection@lic-type-0.html>
>       ([i915#6944] / [i915#9424]) +1 other test skip
>       - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-7/i=
gt@kms_content_protection@lic-type-0.html>
>       ([i915#9424])
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen-512x512:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-7/i=
gt@kms_cursor_crc@cursor-offscreen-512x512.html>
>       ([i915#11453] / [i915#3359]) +1 other test skip
>    -
>
>    igt@kms_cursor_crc@cursor-onscreen-512x512:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-2/=
igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>       ([i915#11453] / [i915#3359]) +1 other test skip
>    -
>
>    igt@kms_cursor_crc@cursor-random-512x170:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-11/=
igt@kms_cursor_crc@cursor-random-512x170.html>
>       ([i915#11453] / [i915#3359]) +4 other tests skip
>    -
>
>    igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-6/=
igt@kms_cursor_crc@cursor-rapid-movement-128x42.html>
>       ([i915#8814]) +1 other test skip
>    -
>
>    igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-8/=
igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>       ([i915#11453] / [i915#3359])
>    -
>
>    igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-7/i=
gt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>       ([i915#4103])
>       - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-7/i=
gt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>       ([i915#4103] / [i915#4213])
>    -
>
>    igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-4/=
igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html>
>       ([i915#9809]) +4 other tests skip
>    -
>
>    igt@kms_cursor_legacy
>    @short-busy-flip-before-cursor-atomic-transitions-varying-size:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-vary=
ing-size.html>
>       ([i915#4103])
>    -
>
>    igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-4/i=
gt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>       ([i915#9723])
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-5/=
igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>       ([i915#9833])
>    -
>
>    igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-4/i=
gt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>       ([i915#9833]) +1 other test skip
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-19/=
igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>       ([i915#9723])
>    -
>
>    igt@kms_dp_linktrain_fallback@dp-fallback:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-12/=
igt@kms_dp_linktrain_fallback@dp-fallback.html>
>       ([i915#12402])
>       - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-9/=
igt@kms_dp_linktrain_fallback@dp-fallback.html>
>       ([i915#12402])
>    -
>
>    igt@kms_dsc@dsc-basic:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-5/i=
gt@kms_dsc@dsc-basic.html>
>       ([i915#3555] / [i915#3840])
>    -
>
>    igt@kms_fbcon_fbt@psr:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-2/i=
gt@kms_fbcon_fbt@psr.html>
>       ([i915#3469]) +1 other test skip
>       - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_fbcon_fbt@psr.html>
>       ([i915#3469])
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-17/=
igt@kms_fbcon_fbt@psr.html>
>       ([i915#3469])
>    -
>
>    igt@kms_feature_discovery@chamelium:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-3/=
igt@kms_feature_discovery@chamelium.html>
>       ([i915#2065] / [i915#4854])
>    -
>
>    igt@kms_feature_discovery@display-2x:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-2/i=
gt@kms_feature_discovery@display-2x.html>
>       ([i915#1839])
>    -
>
>    igt@kms_feature_discovery@display-3x:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-14/=
igt@kms_feature_discovery@display-3x.html>
>       ([i915#1839]) +1 other test skip
>       - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-6/=
igt@kms_feature_discovery@display-3x.html>
>       ([i915#1839]) +2 other tests skip
>    -
>
>    igt@kms_feature_discovery@dp-mst:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-3/i=
gt@kms_feature_discovery@dp-mst.html>
>       ([i915#9337])
>    -
>
>    igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-1/=
igt@kms_flip@2x-flip-vs-rmfb-interruptible.html>
>       ([i915#3637]) +2 other tests skip
>    -
>
>    igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-17/=
igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html>
>       ([i915#9934]) +5 other tests skip
>    -
>
>    igt@kms_flip@2x-plain-flip-interruptible:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-4/=
igt@kms_flip@2x-plain-flip-interruptible.html>
>       ([i915#3637]) +5 other tests skip
>    -
>
>    igt@kms_flip@2x-wf_vblank-ts-check:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_flip@2x-wf_vblank-ts-check.html>
>       ([i915#3637]) +4 other tests skip
>    -
>
>    igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1:
>    - shard-snb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-snb7/i=
gt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-snb2/ig=
t@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1.html>
>       ([i915#2122]) +3 other tests fail
>    -
>
>    igt@kms_flip@blocking-wf_vblank:
>    - shard-rkl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-rkl-2/=
igt@kms_flip@blocking-wf_vblank.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-7/i=
gt@kms_flip@blocking-wf_vblank.html>
>       ([i915#11961] / [i915#2122])
>    -
>
>    igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:
>    - shard-rkl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-rkl-2/=
igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-7/i=
gt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html>
>       ([i915#2122]) +1 other test fail
>    -
>
>    igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:
>    - shard-tglu: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-tglu-2=
/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-4/=
igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html>
>       ([i915#2122]) +3 other tests fail
>    -
>
>    igt@kms_flip@flip-vs-suspend-interruptible:
>    - shard-dg1: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-dg1-17=
/igt@kms_flip@flip-vs-suspend-interruptible.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-16/=
igt@kms_flip@flip-vs-suspend-interruptible.html>
>       ([i915#4839] / [i915#6113])
>       - shard-mtlp: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-mtlp-3=
/igt@kms_flip@flip-vs-suspend-interruptible.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-1/=
igt@kms_flip@flip-vs-suspend-interruptible.html>
>       ([i915#6113]) +1 other test incomplete
>    -
>
>    igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4:
>    - shard-dg1: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-dg1-17=
/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-16/=
igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4.html>
>       ([i915#6113])
>    -
>
>    igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>    - shard-snb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-snb2/i=
gt@kms_flip@flip-vs-suspend@b-hdmi-a1.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-snb4/ig=
t@kms_flip@flip-vs-suspend@b-hdmi-a1.html>
>       ([i915#4839]) +3 other tests incomplete
>    -
>
>    igt@kms_flip@plain-flip-fb-recreate-interruptible:
>    - shard-dg1: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-12/=
igt@kms_flip@plain-flip-fb-recreate-interruptible.html>
>       ([i915#2122])
>    -
>
>    igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:
>    - shard-dg1: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-12/=
igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html>
>       ([i915#12457])
>    -
>
>    igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1:
>    - shard-dg2: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-4/i=
gt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1.html>
>       ([i915#2122]) +3 other tests fail
>    -
>
>    igt@kms_flip@plain-flip-ts-check-interruptible:
>    - shard-mtlp: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-mtlp-8=
/igt@kms_flip@plain-flip-ts-check-interruptible.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-2/=
igt@kms_flip@plain-flip-ts-check-interruptible.html>
>       ([i915#11989] / [i915#2122])
>    -
>
>    igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1:
>    - shard-mtlp: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-mtlp-8=
/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-2/=
igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html>
>       ([i915#2122])
>    -
>
>    igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
>    - shard-tglu: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-7/=
igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html>
>       ([i915#2122]) +1 other test fail
>    -
>
>    igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling=
:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-5/=
igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html=
>
>       ([i915#2672] / [i915#3555]) +2 other tests skip
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-2/=
igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html=
>
>       ([i915#2672] / [i915#3555] / [i915#8813]) +4 other tests skip
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-2/=
igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe=
-a-default-mode.html>
>       ([i915#2672] / [i915#8813]) +2 other tests skip
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-2/i=
gt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-=
a-valid-mode.html>
>       ([i915#2672]) +3 other tests skip
>    -
>
>    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-17/=
igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html>
>       ([i915#2587] / [i915#2672] / [i915#3555])
>       - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-9/=
igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html>
>       ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-7/i=
gt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-=
valid-mode.html>
>       ([i915#2672]) +8 other tests skip
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-17/=
igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a=
-valid-mode.html>
>       ([i915#2587] / [i915#2672]) +2 other tests skip
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-3/=
igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode.html>
>       ([i915#2587] / [i915#2672]) +4 other tests skip
>    -
>
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html>
>       ([i915#2672] / [i915#3555])
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-=
valid-mode.html>
>       ([i915#2587] / [i915#2672])
>    -
>
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-1/i=
gt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html>
>       ([i915#2672] / [i915#3555]) +3 other tests skip
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-12/=
igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html>
>       ([i915#2672] / [i915#3555]) +1 other test skip
>    -
>
>    igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-3/i=
gt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html>
>       ([i915#2672] / [i915#3555]) +6 other tests skip
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-1/i=
gt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.htm=
l>
>       ([i915#2672] / [i915#3555] / [i915#5190]) +3 other tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-17/=
igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html>
>       ([i915#8708]) +11 other tests skip
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-5/=
igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html>
>       ([i915#8708]) +6 other tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-7/i=
gt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html>
>       ([i915#5354]) +68 other tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-12/=
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html>
>       +25 other tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-1/i=
gt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html>
>       ([i915#1825]) +23 other tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-7/i=
gt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html>
>       ([i915#3458]) +26 other tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-6/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html>
>       +67 other tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-7/i=
gt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html>
>       ([i915#8708]) +24 other tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-18/=
igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html>
>       ([i915#3458]) +19 other tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html>
>       +47 other tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-8/=
igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html>
>       ([i915#1825]) +21 other tests skip
>    -
>
>    igt@kms_frontbuffer_tracking@psr-suspend:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-3/i=
gt@kms_frontbuffer_tracking@psr-suspend.html>
>       ([i915#3023]) +16 other tests skip
>    -
>
>    igt@kms_getfb@getfb-reject-ccs:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-7/i=
gt@kms_getfb@getfb-reject-ccs.html>
>       ([i915#6118])
>    -
>
>    igt@kms_hdmi_inject@inject-audio:
>    - shard-dg2: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-dg2-7/=
igt@kms_hdmi_inject@inject-audio.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-1/i=
gt@kms_hdmi_inject@inject-audio.html>
>       ([i915#433])
>       - shard-rkl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-rkl-5/=
igt@kms_hdmi_inject@inject-audio.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-7/i=
gt@kms_hdmi_inject@inject-audio.html>
>       ([i915#433])
>       - shard-dg1: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-dg1-17=
/igt@kms_hdmi_inject@inject-audio.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-13/=
igt@kms_hdmi_inject@inject-audio.html>
>       ([i915#433])
>       - shard-snb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-snb4/i=
gt@kms_hdmi_inject@inject-audio.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-snb2/ig=
t@kms_hdmi_inject@inject-audio.html>
>       - shard-tglu: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-tglu-5=
/igt@kms_hdmi_inject@inject-audio.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-8/=
igt@kms_hdmi_inject@inject-audio.html>
>       ([i915#433])
>       - shard-mtlp: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-mtlp-3=
/igt@kms_hdmi_inject@inject-audio.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-3/=
igt@kms_hdmi_inject@inject-audio.html>
>       ([i915#433])
>    -
>
>    igt@kms_hdr@bpc-switch-dpms:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-4/i=
gt@kms_hdr@bpc-switch-dpms.html>
>       ([i915#3555] / [i915#8228]) +1 other test skip
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-14/=
igt@kms_hdr@bpc-switch-dpms.html>
>       ([i915#3555] / [i915#8228]) +1 other test skip
>       - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-6/=
igt@kms_hdr@bpc-switch-dpms.html>
>       ([i915#3555] / [i915#8228])
>    -
>
>    igt@kms_hdr@brightness-with-hdr@pipe-a-dp-4:
>    - shard-dg2: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-10/=
igt@kms_hdr@brightness-with-hdr@pipe-a-dp-4.html>
>       ([i915#12701])
>    -
>
>    igt@kms_hdr@invalid-hdr:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-5/i=
gt@kms_hdr@invalid-hdr.html>
>       ([i915#3555] / [i915#8228])
>    -
>
>    igt@kms_hdr@static-toggle-suspend:
>    - shard-dg2: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-dg2-10=
/igt@kms_hdr@static-toggle-suspend.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-3/i=
gt@kms_hdr@static-toggle-suspend.html>
>       ([i915#3555] / [i915#8228]) +1 other test skip
>    -
>
>    igt@kms_joiner@basic-big-joiner:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-3/=
igt@kms_joiner@basic-big-joiner.html>
>       ([i915#10656])
>    -
>
>    igt@kms_joiner@basic-force-big-joiner:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_joiner@basic-force-big-joiner.html>
>       ([i915#12388])
>    -
>
>    igt@kms_joiner@invalid-modeset-big-joiner:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-7/i=
gt@kms_joiner@invalid-modeset-big-joiner.html>
>       ([i915#10656])
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-17/=
igt@kms_joiner@invalid-modeset-big-joiner.html>
>       ([i915#10656])
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-5/=
igt@kms_joiner@invalid-modeset-big-joiner.html>
>       ([i915#10656])
>    -
>
>    igt@kms_joiner@invalid-modeset-force-big-joiner:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-5/=
igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>       ([i915#12388])
>    -
>
>    igt@kms_panel_fitting@atomic-fastset:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-2/i=
gt@kms_panel_fitting@atomic-fastset.html>
>       ([i915#6301])
>       - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_panel_fitting@atomic-fastset.html>
>       ([i915#6301])
>    -
>
>    igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-7/i=
gt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html>
>       +18 other tests skip
>    -
>
>    igt@kms_plane_alpha_blend@constant-alpha-min:
>    - shard-dg1: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-dg1-15=
/igt@kms_plane_alpha_blend@constant-alpha-min.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-16/=
igt@kms_plane_alpha_blend@constant-alpha-min.html>
>       ([i915#4423])
>    -
>
>    igt@kms_plane_lowres@tiling-yf:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-5/i=
gt@kms_plane_lowres@tiling-yf.html>
>       ([i915#3555] / [i915#8821])
>    -
>
>    igt@kms_plane_scaling@2x-scaler-multi-pipe:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-5/i=
gt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>       ([i915#5354] / [i915#9423])
>    -
>
>    igt@kms_plane_scaling@intel-max-src-size:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-1/i=
gt@kms_plane_scaling@intel-max-src-size.html>
>       ([i915#6953] / [i915#9423])
>       - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-5/i=
gt@kms_plane_scaling@intel-max-src-size.html>
>       ([i915#6953])
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-16/=
igt@kms_plane_scaling@intel-max-src-size.html>
>       ([i915#6953])
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-3/=
igt@kms_plane_scaling@intel-max-src-size.html>
>       ([i915#6953])
>    -
>
>    igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>    - shard-tglu: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-8/=
igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html>
>       ([i915#8292]) +1 other test fail
>    -
>
>    igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-=
d
>    :
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-17/=
igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.htm=
l>
>       ([i915#12247]) +3 other tests skip
>    -
>
>    igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-=
a
>    :
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-7/=
igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.htm=
l>
>       ([i915#12247]) +17 other tests skip
>    -
>
>    igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-=
b
>    :
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-1/i=
gt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html=
>
>       ([i915#12247]) +5 other tests skip
>    -
>
>    igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25=
:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-5/=
igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html=
>
>       ([i915#12247] / [i915#6953]) +1 other test skip
>    -
>
>    igt@kms_plane_scaling
>    @planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-5/=
igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe=
-d.html>
>       ([i915#12247]) +17 other tests skip
>    -
>
>    igt@kms_plane_scaling@planes-downscale-factor-0-5:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-5/=
igt@kms_plane_scaling@planes-downscale-factor-0-5.html>
>       ([i915#12247] / [i915#6953]) +1 other test skip
>    -
>
>    igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-=
b
>    :
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-7/i=
gt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html=
>
>       ([i915#12247]) +7 other tests skip
>    -
>
>    igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25=
:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-7/i=
gt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html>
>       ([i915#12247] / [i915#6953] / [i915#9423]) +1 other test skip
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-17/=
igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html=
>
>       ([i915#12247] / [i915#6953]) +1 other test skip
>    -
>
>    igt@kms_plane_scaling
>    @planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-17/=
igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe=
-b.html>
>       ([i915#12247] / [i915#12504]) +13 other tests skip
>    -
>
>    igt@kms_pm_backlight@brightness-with-dpms:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-4/i=
gt@kms_pm_backlight@brightness-with-dpms.html>
>       ([i915#12343])
>    -
>
>    igt@kms_pm_backlight@fade-with-dpms:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-3/i=
gt@kms_pm_backlight@fade-with-dpms.html>
>       ([i915#5354]) +1 other test skip
>    -
>
>    igt@kms_pm_backlight@fade-with-suspend:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-4/=
igt@kms_pm_backlight@fade-with-suspend.html>
>       ([i915#9812])
>    -
>
>    igt@kms_pm_dc@dc5-retention-flops:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_pm_dc@dc5-retention-flops.html>
>       ([i915#3828])
>    -
>
>    igt@kms_pm_dc@dc6-dpms:
>    - shard-tglu: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-tglu-6=
/igt@kms_pm_dc@dc6-dpms.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-7/=
igt@kms_pm_dc@dc6-dpms.html>
>       ([i915#9295])
>    -
>
>    igt@kms_pm_dc@dc6-psr:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-1/i=
gt@kms_pm_dc@dc6-psr.html>
>       ([i915#9685]) +2 other tests skip
>       - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_pm_dc@dc6-psr.html>
>       ([i915#9685])
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-19/=
igt@kms_pm_dc@dc6-psr.html>
>       ([i915#9685]) +1 other test skip
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-3/=
igt@kms_pm_dc@dc6-psr.html>
>       ([i915#10139])
>    -
>
>    igt@kms_pm_rpm@dpms-lpsp:
>    - shard-rkl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-rkl-4/=
igt@kms_pm_rpm@dpms-lpsp.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-3/i=
gt@kms_pm_rpm@dpms-lpsp.html>
>       ([i915#9519]) +2 other tests skip
>    -
>
>    igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-14/=
igt@kms_pm_rpm@dpms-mode-unset-lpsp.html>
>       ([i915#9519])
>    -
>
>    igt@kms_pm_rpm@modeset-lpsp-stress:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-1/i=
gt@kms_pm_rpm@modeset-lpsp-stress.html>
>       ([i915#9519]) +1 other test skip
>    -
>
>    igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-2/i=
gt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>       ([i915#9519]) +1 other test skip
>       - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-9/=
igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>       ([i915#9519])
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-5/=
igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>       ([i915#9519])
>    -
>
>    igt@kms_prime@basic-crc-hybrid:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-4/i=
gt@kms_prime@basic-crc-hybrid.html>
>       ([i915#6524])
>    -
>
>    igt@kms_prime@basic-modeset-hybrid:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-3/=
igt@kms_prime@basic-modeset-hybrid.html>
>       ([i915#6524])
>    -
>
>    igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-6/=
igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html>
>       ([i915#12316]) +3 other tests skip
>    -
>
>    igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html>
>       ([i915#11520]) +4 other tests skip
>    -
>
>    igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-3/i=
gt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html>
>       ([i915#11520]) +14 other tests skip
>    -
>
>    igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-4/i=
gt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html>
>       ([i915#11520]) +3 other tests skip
>    -
>
>    igt@kms_psr2_sf
>    @fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-1/=
igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp=
-1.html>
>       ([i915#9808])
>    -
>
>    igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-7/=
igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html>
>       ([i915#11520]) +5 other tests skip
>    -
>
>    igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-19/=
igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html>
>       ([i915#11520]) +6 other tests skip
>    -
>
>    igt@kms_psr2_su@page_flip-xrgb8888:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-7/i=
gt@kms_psr2_su@page_flip-xrgb8888.html>
>       ([i915#9683]) +1 other test skip
>    -
>
>    igt@kms_psr@fbc-pr-sprite-render:
>    - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-15/=
igt@kms_psr@fbc-pr-sprite-render.html>
>       ([i915#1072] / [i915#9732]) +16 other tests skip
>    -
>
>    igt@kms_psr@fbc-psr-sprite-render:
>    - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-1/=
igt@kms_psr@fbc-psr-sprite-render.html>
>       ([i915#9688]) +14 other tests skip
>    -
>
>    igt@kms_psr@fbc-psr2-primary-mmap-gtt:
>    - shard-tglu: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-2/=
igt@kms_psr@fbc-psr2-primary-mmap-gtt.html>
>       ([i915#9732]) +16 other tests skip
>    -
>
>    igt@kms_psr@pr-cursor-mmap-cpu:
>    - shard-dg2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-2/i=
gt@kms_psr@pr-cursor-mmap-cpu.html>
>       ([i915#1072] / [i915#9732]) +25 other tests skip
>    -
>
>    igt@kms_psr@pr-cursor-plane-onoff:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-3/i=
gt@kms_psr@pr-cursor-plane-onoff.html>
>       ([i915#1072] / [i915#9732]) +11 other tests skip
>    -
>
>    igt@kms_psr@psr2-cursor-mmap-gtt:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_psr@psr2-cursor-mmap-gtt.html>
>       ([i915#9732]) +14 other tests skip
>    -
>
>    igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-3/i=
gt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html>
>       ([i915#5289])
>    -
>
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>       ([i915#5289]) +1 other test skip
>    -
>
>    igt@kms_scaling_modes@scaling-mode-none:
>    - shard-tglu-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-tglu-1/=
igt@kms_scaling_modes@scaling-mode-none.html>
>       ([i915#3555]) +2 other tests skip
>    -
>
>    igt@kms_setmode@basic:
>    - shard-dg1: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-dg1-12=
/igt@kms_setmode@basic.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-18/=
igt@kms_setmode@basic.html>
>       ([i915#12317] / [i915#5465])
>       - shard-rkl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15662/shard-rkl-5/=
igt@kms_setmode@basic.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-2/i=
gt@kms_setmode@basic.html>
>       ([i915#12317])
>    -
>
>    igt@kms_setmode@basic@pipe-a-hdmi-a-4:
>    - shard-dg1: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-18/=
igt@kms_setmode@basic@pipe-a-hdmi-a-4.html>
>       ([i915#12317])
>    -
>
>    igt@kms_setmode@basic@pipe-b-hdmi-a-1:
>    - shard-rkl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-2/i=
gt@kms_setmode@basic@pipe-b-hdmi-a-1.html>
>       ([i915#12317])
>    -
>
>    igt@kms_setmode@basic@pipe-b-hdmi-a-3:
>    - shard-dg2: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg2-2/i=
gt@kms_setmode@basic@pipe-b-hdmi-a-3.html>
>       ([i915#5465]) +2 other tests fail
>    -
>
>    igt@kms_setmode@basic@pipe-b-hdmi-a-4:
>    - shard-dg1: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-18/=
igt@kms_setmode@basic@pipe-b-hdmi-a-4.html>
>       ([i915#5465])
>    -
>
>    igt@kms_setmode@invalid-clone-exclusive-crtc:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-4/i=
gt@kms_setmode@invalid-clone-exclusive-crtc.html>
>       ([i915#3555]) +2 other tests skip
>       - shard-dg1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-19/=
igt@kms_setmode@invalid-clone-exclusive-crtc.html>
>       ([i915#3555]) +1 other test skip
>       - shard-mtlp: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-4/=
igt@kms_setmode@invalid-clone-exclusive-crtc.html>
>       ([i915#3555] / [i915#8809] / [i915#8823])
>    -
>
>    igt@kms_tiled_display@basic-test-pattern:
>    - shard-rkl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-rkl-1/i=
gt@kms_tiled_display@basic-test-pattern.html>
>       ([i915#8623])
>    -
>
>    igt@kms_vrr@flip-basic-fastset:
>    -
>
>

--000000000000b5d3c706269f7685
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>These regressions not regressions</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 9, 2024 =
at 4:14=E2=80=AFPM Patchwork &lt;<a href=3D"mailto:patchwork@emeril.freedes=
ktop.org">patchwork@emeril.freedesktop.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg6100671786501316=
084">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>tests/intel/kms_ccs: add suspend test=
s (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/140731/" target=3D"_blank">https://patchwork.freedesktop.org/series/14=
0731/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_12074/index.html" target=3D"_blank">https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_12074/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_15662_full -&gt; IGTPW_12074_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12074_full absolutely need to =
be<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_12074_full, please notify your bug team (<a href=3D"m=
ailto:I915-ci-infra@lists.freedesktop.org" target=3D"_blank">I915-ci-infra@=
lists.freedesktop.org</a>) to allow them<br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
12074/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_12074/index.html</a></p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>Additional (1): shard-glk-0 <br>
  Missing    (1): shard-glk </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1207=
4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs (NEW):<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-11/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html" target=3D"_blank">SKIP</a> +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-til=
ed-bmg-ccs.html" target=3D"_blank">SKIP</a> +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html" target=3D"_blank">SKIP</a> +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-5/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html" target=3D"_blank">SKIP</a> +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html" target=3D"_blank">SKIP</a> +1 other test skip</li></ul></=
li></ul></div></div></blockquote><div>These tests are newly added and just =
don&#39;t run on all platforms because of missing modifiers.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"ms=
g6100671786501316084"><div><ul><li><ul>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br>
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_rotation_crc@primary-rotation-90:<ul>
<li>{shard-dg2-9}:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-9/igt@kms_rotation_crc@primary-rotation=
-90.html" target=3D"_blank">SKIP</a> +1 other test skip</li></ul></li></ul>=
</div></div></blockquote><div>This anyway is not a regression, dg2 will nev=
er do any 90/270 degree rotation on display part.</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg61006717865=
01316084"><div><ul><li><ul>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15662_full and IGTPW_12074=
_full:</p>
<h3>New IGT tests (167)</h3>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 29.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 8.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 6.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 14.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-3:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-4:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-3:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-4:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-3:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-4:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-3:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-4:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 12.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 8.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 7.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-2:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-3:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-4:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-4:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:</p=
>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-4:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p=
>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-3:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-4:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-3:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-4:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-3:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-4:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 34.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 33.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-edp-1:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.24, 17.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-3:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-4:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-edp-1:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.24, 16.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-4:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-edp-1:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-4:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-edp-1:</p=
>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-3:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-4:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:</p=
>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.22, 16.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-3:</p=
>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:</p=
>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.16, 17.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-3:</p=
>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:</p=
>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-3:</p=
>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p=
>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:</p=
>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 7.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12074_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-3/igt@api_intel_bb@blit-reloc-keep-cach=
e.html" target=3D"_blank">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-17/igt@api_intel_bb@object-reloc-purge-=
cache.html" target=3D"_blank">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@device_reset@cold-reset-bound.ht=
ml" target=3D"_blank">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-12/igt@drm_fdinfo@virtual-busy.html" ta=
rget=3D"_blank">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-1/igt@drm_fdinfo@virtual-busy-hang.html=
" target=3D"_blank">SKIP</a> ([i915#8414]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-3/igt@drm_fdinfo@virtual-busy-hang.htm=
l" target=3D"_blank">SKIP</a> ([i915#8414]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-4/igt@gem_close_race@multigpu-basic-pro=
cess.html" target=3D"_blank">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-1/igt@gem_create@create-ext-cpu-access=
-big.html" target=3D"_blank">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@gem_create@create-ext-cpu-access=
-sanity-check.html" target=3D"_blank">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@gem_create@create-ext-set-pat.ht=
ml" target=3D"_blank">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-st=
op.html" target=3D"_blank">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-3/igt@gem_ctx_persistence@hostile.html=
" target=3D"_blank">FAIL</a> ([i915#11980] / [i915#12580])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-4/igt@gem_ctx_persistence@saturated-hos=
tile-nopreempt.html" target=3D"_blank">SKIP</a> ([i915#5882]) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-4/igt@gem_ctx_sseu@invalid-sseu.html" t=
arget=3D"_blank">SKIP</a> ([i915#280])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-4/igt@gem_ctx_sseu@invalid-sseu.html" t=
arget=3D"_blank">SKIP</a> ([i915#280])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-12/igt@gem_ctx_sseu@invalid-sseu.html" =
target=3D"_blank">SKIP</a> ([i915#280])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-7/igt@gem_ctx_sseu@invalid-sseu.html" =
target=3D"_blank">SKIP</a> ([i915#280])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-7/igt@gem_ctx_sseu@invalid-sseu.html" =
target=3D"_blank">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html" tar=
get=3D"_blank">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-dg1-12/igt@gem_eio@reset-stress.html" target=3D"_blank"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
2074/shard-dg1-19/igt@gem_eio@reset-stress.html" target=3D"_blank">FAIL</a>=
 ([i915#12543] / [i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-dg1-16/igt@gem_eio@unwedge-stress.html" target=3D"_blan=
k">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_12074/shard-dg1-14/igt@gem_eio@unwedge-stress.html" target=3D"_blank">FAIL=
</a> ([i915#12714] / [i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-5/igt@gem_exec_balancer@noheartbeat.htm=
l" target=3D"_blank">SKIP</a> ([i915#8555])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-1/igt@gem_exec_balancer@noheartbeat.ht=
ml" target=3D"_blank">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-7/igt@gem_exec_balancer@parallel-bb-fir=
st.html" target=3D"_blank">SKIP</a> ([i915#4525]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-6/igt@gem_exec_balancer@sliced.html" t=
arget=3D"_blank">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-7/igt@gem_exec_capture@capture.html" t=
arget=3D"_blank">FAIL</a> ([i915#11965] / [i915#12558]) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-4/igt@gem_exec_capture@capture@vecs0-lm=
em0.html" target=3D"_blank">FAIL</a> ([i915#11965] / [i915#12558]) +2 other=
 tests fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-12/igt@gem_exec_capture@capture@vecs0-l=
mem0.html" target=3D"_blank">FAIL</a> ([i915#11965] / [i915#12558]) +2 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs1-smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-4/igt@gem_exec_capture@capture@vecs1-sm=
em.html" target=3D"_blank">FAIL</a> ([i915#11965]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html" target=3D"=
_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_12074/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html" target=3D"_b=
lank">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-5/igt@gem_exec_fair@basic-none-share@r=
cs0.html" target=3D"_blank">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-rkl-3/igt@gem_exec_fair@basic-pace-solo@rcs0.html" targ=
et=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_12074/shard-rkl-5/igt@gem_exec_fair@basic-pace-solo@rcs0.html" =
target=3D"_blank">FAIL</a> ([i915#2842]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-8/igt@gem_exec_fair@basic-throttle.html=
" target=3D"_blank">SKIP</a> ([i915#3539]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-4/igt@gem_exec_fence@submit3.html" targ=
et=3D"_blank">SKIP</a> ([i915#4812]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-11/igt@gem_exec_flush@basic-uc-ro-defau=
lt.html" target=3D"_blank">SKIP</a> ([i915#3539] / [i915#4852]) +2 other te=
sts skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-14/igt@gem_exec_flush@basic-uc-ro-defau=
lt.html" target=3D"_blank">SKIP</a> ([i915#3539] / [i915#4852]) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-2/igt@gem_exec_params@rsvd2-dirt.html"=
 target=3D"_blank">SKIP</a> ([i915#5107])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html"=
 target=3D"_blank">SKIP</a> ([i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-6/igt@gem_exec_reloc@basic-cpu-wc-nore=
loc.html" target=3D"_blank">SKIP</a> ([i915#3281]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-13/igt@gem_exec_reloc@basic-wc-cpu-nore=
loc.html" target=3D"_blank">SKIP</a> ([i915#3281]) +10 other tests skip</li=
>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-=
active.html" target=3D"_blank">SKIP</a> ([i915#3281]) +16 other tests skip<=
/li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-3/igt@gem_exec_reloc@basic-write-read-a=
ctive.html" target=3D"_blank">SKIP</a> ([i915#3281]) +8 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-common:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-3/igt@gem_exec_schedule@pi-common.html=
" target=3D"_blank">FAIL</a> ([i915#12296]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-15/igt@gem_exec_schedule@preempt-queue-=
contexts.html" target=3D"_blank">SKIP</a> ([i915#4812]) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-4/igt@gem_exec_schedule@reorder-wide.ht=
ml" target=3D"_blank">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test sk=
ip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-7/igt@gem_exec_schedule@reorder-wide.h=
tml" target=3D"_blank">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-=
fences.html" target=3D"_blank">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-f=
ences-interruptible.html" target=3D"_blank">SKIP</a> ([i915#4860]) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-2/igt@gem_huc_copy@huc-copy.html" targe=
t=3D"_blank">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-6/igt@gem_lmem_swapping@heavy-random.h=
tml" target=3D"_blank">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-5/igt@gem_lmem_swapping@parallel-random=
-verify.html" target=3D"_blank">SKIP</a> ([i915#4613])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@gem_lmem_swapping@parallel-rando=
m-verify.html" target=3D"_blank">SKIP</a> ([i915#4613]) +1 other test skip<=
/li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-5/igt@gem_lmem_swapping@parallel-rando=
m-verify.html" target=3D"_blank">SKIP</a> ([i915#4613]) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-5/igt@gem_mmap@bad-size.html" target=
=3D"_blank">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy-odd.=
html" target=3D"_blank">SKIP</a> ([i915#4077]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-15/igt@gem_mmap_gtt@flink-race.html" ta=
rget=3D"_blank">SKIP</a> ([i915#4077]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-1/igt@gem_mmap_wc@copy.html" target=3D"=
_blank">SKIP</a> ([i915#4083]) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-13/igt@gem_mmap_wc@copy.html" target=3D=
"_blank">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-4/igt@gem_partial_pwrite_pread@reads-un=
cached.html" target=3D"_blank">SKIP</a> ([i915#3282]) +3 other tests skip</=
li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-6/igt@gem_partial_pwrite_pread@reads-u=
ncached.html" target=3D"_blank">SKIP</a> ([i915#3282]) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-17/igt@gem_partial_pwrite_pread@write.h=
tml" target=3D"_blank">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-1/igt@gem_pxp@display-protected-crc.htm=
l" target=3D"_blank">SKIP</a> ([i915#4270]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@gem_pxp@reject-modify-context-pr=
otection-off-2.html" target=3D"_blank">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-2/igt@gem_pxp@verify-pxp-stale-buf-exe=
cution.html" target=3D"_blank">SKIP</a> ([i915#4270]) +1 other test skip</l=
i>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-buf-exec=
ution.html" target=3D"_blank">SKIP</a> ([i915#4270]) +1 other test skip</li=
>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-18/igt@gem_pxp@verify-pxp-stale-ctx-exe=
cution.html" target=3D"_blank">SKIP</a> ([i915#4270]) +1 other test skip</l=
i>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-6/igt@gem_pxp@verify-pxp-stale-ctx-exe=
cution.html" target=3D"_blank">SKIP</a> ([i915#4270]) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-5/igt@gem_readwrite@beyond-eob.html" ta=
rget=3D"_blank">SKIP</a> ([i915#3282]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-2/igt@gem_render_copy@y-tiled-ccs-to-y=
f-tiled-mc-ccs.html" target=3D"_blank">SKIP</a> ([i915#8428]) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-1/igt@gem_render_copy@y-tiled-to-vebox-=
y-tiled.html" target=3D"_blank">SKIP</a> ([i915#5190] / [i915#8428]) +9 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-5/igt@gem_render_tiled_blits@basic.html=
" target=3D"_blank">SKIP</a> ([i915#4079]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-1/igt@gem_tiled_blits@basic.html" targ=
et=3D"_blank">SKIP</a> ([i915#4077]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-3/igt@gem_unfence_active_buffers.html" =
target=3D"_blank">SKIP</a> ([i915#4879])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-16/igt@gem_unfence_active_buffers.html"=
 target=3D"_blank">SKIP</a> ([i915#4879])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-1/igt@gem_unfence_active_buffers.html"=
 target=3D"_blank">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@gem_userptr_blits@coherency-unsy=
nc.html" target=3D"_blank">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-4/igt@gem_userptr_blits@create-destroy-=
unsync.html" target=3D"_blank">SKIP</a> ([i915#3297])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-14/igt@gem_userptr_blits@create-destroy=
-unsync.html" target=3D"_blank">SKIP</a> ([i915#3297])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-6/igt@gem_userptr_blits@create-destroy=
-unsync.html" target=3D"_blank">SKIP</a> ([i915#3297])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-6/igt@gem_userptr_blits@create-destroy=
-unsync.html" target=3D"_blank">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-10/igt@gem_userptr_blits@dmabuf-unsync.=
html" target=3D"_blank">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-3/igt@gem_userptr_blits@forbidden-opera=
tions.html" target=3D"_blank">SKIP</a> ([i915#3282] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-1/igt@gem_userptr_blits@relocations.htm=
l" target=3D"_blank">SKIP</a> ([i915#3281] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-5/igt@gen9_exec_parse@allowed-all.html=
" target=3D"_blank">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-19/igt@gen9_exec_parse@bb-start-cmd.htm=
l" target=3D"_blank">SKIP</a> ([i915#2527]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-3/igt@gen9_exec_parse@bb-start-cmd.htm=
l" target=3D"_blank">SKIP</a> ([i915#2527] / [i915#2856]) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-5/igt@gen9_exec_parse@secure-batches.ht=
ml" target=3D"_blank">SKIP</a> ([i915#2856]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-3/igt@gen9_exec_parse@unaligned-jump.ht=
ml" target=3D"_blank">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-2/igt@i915_module_load@load.html" targe=
t=3D"_blank">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html=
" target=3D"_blank">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-4/igt@i915_pm_freq_api@freq-reset-mult=
iple.html" target=3D"_blank">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-fence.=
html" target=3D"_blank">WARN</a> ([i915#2681]) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-17/igt@i915_pm_rps@basic-api.html" targ=
et=3D"_blank">SKIP</a> ([i915#11681] / [i915#6621])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-5/igt@i915_pm_rps@basic-api.html" targ=
et=3D"_blank">SKIP</a> ([i915#11681] / [i915#6621])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-2/igt@i915_pm_rps@basic-api.html" targe=
t=3D"_blank">SKIP</a> ([i915#11681] / [i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-16/igt@i915_pm_rps@thresholds-park.html=
" target=3D"_blank">SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-5/igt@i915_pm_sseu@full-enable.html" t=
arget=3D"_blank">SKIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-2/igt@i915_power@sanity.html" target=3D=
"_blank">SKIP</a> ([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-2/igt@i915_query@query-topology-coheren=
t-slice-mask.html" target=3D"_blank">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-4/igt@intel_hwmon@hwmon-write.html" ta=
rget=3D"_blank">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-5/igt@kms_addfb_basic@clobberred-modifi=
er.html" target=3D"_blank">SKIP</a> ([i915#4212])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-13/igt@kms_addfb_basic@clobberred-modif=
ier.html" target=3D"_blank">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-=
on-discrete.html" target=3D"_blank">SKIP</a> ([i915#12454] / [i915#12712])<=
/li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-3/igt@kms_addfb_basic@tile-pitch-misma=
tch.html" target=3D"_blank">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-r=
c-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-2/igt@kms_async_flips@async-flip-with-p=
age-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html" target=3D"_blank">SKIP</a=
> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-5/igt@kms_async_flips@async-flip-with-p=
age-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html" target=3D"_blank">SKIP</a> (=
[i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html" target=3D"_blank">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-2/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html" target=3D"_blank">SKIP</a>=
 ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-=
4:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-dg1-16/igt@kms_atomic_transition@plane-toggle-modeset-t=
ransition@pipe-a-hdmi-a-4.html" target=3D"_blank">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-14/igt@kms_=
atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-4.html" tar=
get=3D"_blank">FAIL</a> ([i915#5956]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-=
270.html" target=3D"_blank">SKIP</a> ([i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-=
32bpp-rotate-0-hflip.html" target=3D"_blank">SKIP</a> ([i915#5286]) +3 othe=
r tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip.html" target=3D"_blank">SKIP</a> ([i915#4538] / [i915=
#5286]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html" target=3D"_blank">SKIP</a> ([i915#5286])=
 +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-15/igt@kms_big_fb@linear-8bpp-rotate-27=
0.html" target=3D"_blank">SKIP</a> ([i915#3638]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-9=
0.html" target=3D"_blank">SKIP</a> ([i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-1/igt@kms_big_fb@y-tiled-addfb-size-ove=
rflow.html" target=3D"_blank">SKIP</a> ([i915#5190]) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-=
270.html" target=3D"_blank">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-=
90.html" target=3D"_blank">SKIP</a> ([i915#4538] / [i915#5190]) +18 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-16/igt@kms_big_fb@yf-tiled-8bpp-rotate-=
90.html" target=3D"_blank">SKIP</a> ([i915#4538]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-8/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip-async-flip.html" target=3D"_blank">SKIP</a> +16 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-m=
tl-mc-ccs@pipe-a-hdmi-a-4.html" target=3D"_blank">SKIP</a> ([i915#6095]) +1=
82 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-5/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-mc-ccs@pipe-b-edp-1.html" target=3D"_blank">SKIP</a> ([i915#6095]) =
+79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-16/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html" target=3D"_blank">SKIP</a> ([i915#12313])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-4/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html" target=3D"_blank">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-bmg-ccs.html" target=3D"_blank">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-1/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html" target=3D"_blank">SKIP</a> ([i915#=
6095]) +112 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1 (NEW)=
:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-2/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs@pipe-c-hdmi-a-1.html" target=3D"_blank">SKIP</a> ([i915#6095=
]) +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-dp-4 (NEW):</p=
>
<ul>
<li>{shard-dg2-9}:      NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-rc-ccs@pipe-a-dp-4.html" target=3D"_blank">SKIP</a> ([i915#6095]) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-mc-ccs.html" target=3D"_blank">SKIP</a> ([i915#6095]) +34 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-2/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html" target=3D"_blank">SKIP</a> ([i915#1=
0307] / [i915#6095]) +160 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-=
yf-tiled-ccs@pipe-a-hdmi-a-1.html" target=3D"_blank">SKIP</a> ([i915#6095])=
 +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html" target=3D"_blank">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-=
ccs@pipe-d-hdmi-a-1.html" target=3D"_blank">SKIP</a> ([i915#10307] / [i915#=
10434] / [i915#6095]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-5/igt@kms_cdclk@mode-transition-all-out=
puts.html" target=3D"_blank">SKIP</a> ([i915#11616] / [i915#7213])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-12/igt@kms_chamelium_edid@dp-edid-resol=
ution-list.html" target=3D"_blank">SKIP</a> ([i915#7828]) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-2/igt@kms_chamelium_edid@dp-edid-stress=
-resolution-non-4k.html" target=3D"_blank">SKIP</a> ([i915#7828]) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-7/igt@kms_chamelium_frames@dp-crc-fast=
.html" target=3D"_blank">SKIP</a> ([i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_chamelium_frames@dp-crc-sing=
le.html" target=3D"_blank">SKIP</a> ([i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-4/igt@kms_chamelium_frames@hdmi-crc-mul=
tiple.html" target=3D"_blank">SKIP</a> ([i915#7828]) +11 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-for-eac=
h-pipe.html" target=3D"_blank">SKIP</a> ([i915#7828]) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-7/igt@kms_color@deep-color.html" target=
=3D"_blank">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-10/igt@kms_content_protection@atomic-dp=
ms@pipe-a-dp-4.html" target=3D"_blank">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-18/igt@kms_content_protection@content-t=
ype-change.html" target=3D"_blank">SKIP</a> ([i915#9424]) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_content_protection@dp-mst-li=
c-type-0.html" target=3D"_blank">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-4/igt@kms_content_protection@dp-mst-lic=
-type-1.html" target=3D"_blank">SKIP</a> ([i915#3116])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-6/igt@kms_content_protection@dp-mst-li=
c-type-1.html" target=3D"_blank">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-7/igt@kms_content_protection@dp-mst-ty=
pe-1.html" target=3D"_blank">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-8/igt@kms_content_protection@legacy.ht=
ml" target=3D"_blank">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [=
i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-9/igt@kms_content_protection@lic-type-=
0.html" target=3D"_blank">SKIP</a> ([i915#6944] / [i915#9424]) +1 other tes=
t skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-7/igt@kms_content_protection@lic-type-0=
.html" target=3D"_blank">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-5=
12x512.html" target=3D"_blank">SKIP</a> ([i915#11453] / [i915#3359]) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html" target=3D"_blank">SKIP</a> ([i915#11453] / [i915#3359]) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512=
x170.html" target=3D"_blank">SKIP</a> ([i915#11453] / [i915#3359]) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-move=
ment-128x42.html" target=3D"_blank">SKIP</a> ([i915#8814]) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html" target=3D"_blank">SKIP</a> ([i915#11453] / [i915#3359])<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-varying-size.html" target=3D"_blank">SKIP</a> ([i915#4103])<=
/li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-7/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-varying-size.html" target=3D"_blank">SKIP</a> ([i915#4103] /=
 [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-4/igt@kms_cursor_legacy@cursora-vs-fli=
pb-varying-size.html" target=3D"_blank">SKIP</a> ([i915#9809]) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html" target=3D"_blank">SKI=
P</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.ht=
ml" target=3D"_blank">SKIP</a> ([i915#9723])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml" target=3D"_blank">SKIP</a> ([i915#9833])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l" target=3D"_blank">SKIP</a> ([i915#9833]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-19/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml" target=3D"_blank">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-12/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html" target=3D"_blank">SKIP</a> ([i915#12402])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-9/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html" target=3D"_blank">SKIP</a> ([i915#12402])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-5/igt@kms_dsc@dsc-basic.html" target=3D=
"_blank">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-2/igt@kms_fbcon_fbt@psr.html" target=3D=
"_blank">SKIP</a> ([i915#3469]) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_fbcon_fbt@psr.html" target=
=3D"_blank">SKIP</a> ([i915#3469])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-17/igt@kms_fbcon_fbt@psr.html" target=
=3D"_blank">SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-3/igt@kms_feature_discovery@chamelium.=
html" target=3D"_blank">SKIP</a> ([i915#2065] / [i915#4854])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-2/igt@kms_feature_discovery@display-2x.=
html" target=3D"_blank">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-14/igt@kms_feature_discovery@display-3x=
.html" target=3D"_blank">SKIP</a> ([i915#1839]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-6/igt@kms_feature_discovery@display-3x=
.html" target=3D"_blank">SKIP</a> ([i915#1839]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-3/igt@kms_feature_discovery@dp-mst.html=
" target=3D"_blank">SKIP</a> ([i915#9337])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-1/igt@kms_flip@2x-flip-vs-rmfb-interru=
ptible.html" target=3D"_blank">SKIP</a> ([i915#3637]) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-17/igt@kms_flip@2x-flip-vs-wf_vblank-in=
terruptible.html" target=3D"_blank">SKIP</a> ([i915#9934]) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-4/igt@kms_flip@2x-plain-flip-interrupt=
ible.html" target=3D"_blank">SKIP</a> ([i915#3637]) +5 other tests skip</li=
>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check.h=
tml" target=3D"_blank">SKIP</a> ([i915#3637]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-snb7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@a=
b-vga1-hdmi-a1.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074/shard-snb2/igt@kms_flip@2x-wf_vb=
lank-ts-check-interruptible@ab-vga1-hdmi-a1.html" target=3D"_blank">FAIL</a=
> ([i915#2122]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-rkl-2/igt@kms_flip@blocking-wf_vblank.html" target=3D"_=
blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_12074/shard-rkl-7/igt@kms_flip@blocking-wf_vblank.html" target=3D"_bla=
nk">FAIL</a> ([i915#11961] / [i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-rkl-2/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html" t=
arget=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_12074/shard-rkl-7/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.=
html" target=3D"_blank">FAIL</a> ([i915#2122]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-tglu-2/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html" =
target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_12074/shard-tglu-4/igt@kms_flip@blocking-wf_vblank@c-hdmi-a=
1.html" target=3D"_blank">FAIL</a> ([i915#2122]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-dg1-17/igt@kms_flip@flip-vs-suspend-interruptible.html"=
 target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_12074/shard-dg1-16/igt@kms_flip@flip-vs-suspend-interrupti=
ble.html" target=3D"_blank">INCOMPLETE</a> ([i915#4839] / [i915#6113])</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-mtlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html"=
 target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_12074/shard-mtlp-1/igt@kms_flip@flip-vs-suspend-interrupti=
ble.html" target=3D"_blank">INCOMPLETE</a> ([i915#6113]) +1 other test inco=
mplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-dg1-17/igt@kms_flip@flip-vs-suspend-interruptible@d-hdm=
i-a4.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_12074/shard-dg1-16/igt@kms_flip@flip-vs-suspend-=
interruptible@d-hdmi-a4.html" target=3D"_blank">INCOMPLETE</a> ([i915#6113]=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-snb2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html" targe=
t=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_12074/shard-snb4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html" ta=
rget=3D"_blank">INCOMPLETE</a> ([i915#4839]) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-12/igt@kms_flip@plain-flip-fb-recreate-=
interruptible.html" target=3D"_blank">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-12/igt@kms_flip@plain-flip-fb-recreate-=
interruptible@a-hdmi-a3.html" target=3D"_blank">FAIL</a> ([i915#12457])</li=
>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-4/igt@kms_flip@plain-flip-fb-recreate-i=
nterruptible@b-hdmi-a1.html" target=3D"_blank">FAIL</a> ([i915#2122]) +3 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-mtlp-8/igt@kms_flip@plain-flip-ts-check-interruptible.h=
tml" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_12074/shard-mtlp-2/igt@kms_flip@plain-flip-ts-check-in=
terruptible.html" target=3D"_blank">FAIL</a> ([i915#11989] / [i915#2122])</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-mtlp-8/igt@kms_flip@plain-flip-ts-check-interruptible@a=
-edp1.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_12074/shard-mtlp-2/igt@kms_flip@plain-flip-ts-c=
heck-interruptible@a-edp1.html" target=3D"_blank">FAIL</a> ([i915#2122])</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-7/igt@kms_flip@wf_vblank-ts-check@a-hd=
mi-a1.html" target=3D"_blank">FAIL</a> ([i915#2122]) +1 other test fail</li=
>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling.html" target=3D"_blank">SKIP</a> ([i915#=
2672] / [i915#3555]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling.html" target=3D"_blank">SKIP</a> ([i915#=
2672] / [i915#3555] / [i915#8813]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html" target=3D"_bla=
nk">SKIP</a> ([i915#2672] / [i915#8813]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html" target=3D"_blank"=
>SKIP</a> ([i915#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p=
>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html" target=3D"_blank">SKIP</a> ([i915#25=
87] / [i915#2672] / [i915#3555])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html" target=3D"_blank">SKIP</a> ([i915#25=
87] / [i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html" target=3D"_blank">S=
KIP</a> ([i915#2672]) +8 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html" target=3D"_blank">=
SKIP</a> ([i915#2587] / [i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html" target=3D"_blank=
">SKIP</a> ([i915#2587] / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling.html" target=3D"_blank">SKIP</a> ([i915#267=
2] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html" target=3D"_blank">S=
KIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tile-upscaling.html" target=3D"_blank">SKIP</a> ([i915#2672] =
/ [i915#3555]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tile-upscaling.html" target=3D"_blank">SKIP</a> ([i915#2672]=
 / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-16bpp-yftile-downscaling.html" target=3D"_blank">SKIP</a> ([i915#26=
72] / [i915#3555]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytilercccs-downscaling.html" target=3D"_blank">SKIP</a> ([i915=
#2672] / [i915#3555] / [i915#5190]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p=
>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-spr-indfb-draw-mmap-gtt.html" target=3D"_blank">SKIP</a> ([i915#87=
08]) +11 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-spr-indfb-draw-mmap-gtt.html" target=3D"_blank">SKIP</a> ([i915#87=
08]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-spr-indfb-draw-blt.html" target=3D"_blank">SKIP</a> ([i915#5354]) +=
68 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-cur-indfb-draw-render.html" target=3D"_blank">SKIP</a> +25 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-s=
cndscrn-indfb-plflip-blt.html" target=3D"_blank">SKIP</a> ([i915#1825]) +23=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscren-pri-shrfb-draw-blt.html" target=3D"_blank">SKIP</a> ([i915#3458]=
) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-spr-indfb-draw-render.html" target=3D"_blank">SKIP</a> +67 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-f=
arfromfence-mmap-gtt.html" target=3D"_blank">SKIP</a> ([i915#8708]) +24 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb101010-draw-blt.html" target=3D"_blank">SKIP</a> ([i915#3458]) +19 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-mmap-wc.html" target=3D"_blank">SKIP</a> +47 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-shrfb-plflip-blt.html" target=3D"_blank">SKIP</a> ([i915#1825]) +2=
1 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-susp=
end.html" target=3D"_blank">SKIP</a> ([i915#3023]) +16 other tests skip</li=
>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-7/igt@kms_getfb@getfb-reject-ccs.html" =
target=3D"_blank">SKIP</a> ([i915#6118])</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-dg2-7/igt@kms_hdmi_inject@inject-audio.html" target=3D"=
_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_12074/shard-dg2-1/igt@kms_hdmi_inject@inject-audio.html" target=3D"_b=
lank">SKIP</a> ([i915#433])</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-rkl-5/igt@kms_hdmi_inject@inject-audio.html" target=3D"=
_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_12074/shard-rkl-7/igt@kms_hdmi_inject@inject-audio.html" target=3D"_b=
lank">SKIP</a> ([i915#433])</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-dg1-17/igt@kms_hdmi_inject@inject-audio.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_12074/shard-dg1-13/igt@kms_hdmi_inject@inject-audio.html" target=3D"=
_blank">SKIP</a> ([i915#433])</li>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-snb4/igt@kms_hdmi_inject@inject-audio.html" target=3D"_=
blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_12074/shard-snb2/igt@kms_hdmi_inject@inject-audio.html" target=3D"_bla=
nk">SKIP</a></li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-tglu-5/igt@kms_hdmi_inject@inject-audio.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_12074/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html" target=3D"=
_blank">SKIP</a> ([i915#433])</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-mtlp-3/igt@kms_hdmi_inject@inject-audio.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_12074/shard-mtlp-3/igt@kms_hdmi_inject@inject-audio.html" target=3D"=
_blank">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html" tar=
get=3D"_blank">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-14/igt@kms_hdr@bpc-switch-dpms.html" ta=
rget=3D"_blank">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li=
>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-6/igt@kms_hdr@bpc-switch-dpms.html" ta=
rget=3D"_blank">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-10/igt@kms_hdr@brightness-with-hdr@pipe=
-a-dp-4.html" target=3D"_blank">FAIL</a> ([i915#12701])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-5/igt@kms_hdr@invalid-hdr.html" target=
=3D"_blank">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_12074/shard-dg2-3/igt@kms_hdr@static-toggle-suspend.html" target=
=3D"_blank">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-3/igt@kms_joiner@basic-big-joiner.html=
" target=3D"_blank">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_joiner@basic-force-big-joine=
r.html" target=3D"_blank">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-7/igt@kms_joiner@invalid-modeset-big-jo=
iner.html" target=3D"_blank">SKIP</a> ([i915#10656])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-17/igt@kms_joiner@invalid-modeset-big-j=
oiner.html" target=3D"_blank">SKIP</a> ([i915#10656])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-5/igt@kms_joiner@invalid-modeset-big-j=
oiner.html" target=3D"_blank">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-5/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html" target=3D"_blank">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-2/igt@kms_panel_fitting@atomic-fastset.=
html" target=3D"_blank">SKIP</a> ([i915#6301])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset=
.html" target=3D"_blank">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b=
-with-3-lanes.html" target=3D"_blank">SKIP</a> +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-dg1-15/igt@kms_plane_alpha_blend@constant-alpha-min.htm=
l" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_12074/shard-dg1-16/igt@kms_plane_alpha_blend@constant-al=
pha-min.html" target=3D"_blank">DMESG-WARN</a> ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-5/igt@kms_plane_lowres@tiling-yf.html" =
target=3D"_blank">SKIP</a> ([i915#3555] / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-5/igt@kms_plane_scaling@2x-scaler-multi=
-pipe.html" target=3D"_blank">SKIP</a> ([i915#5354] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-1/igt@kms_plane_scaling@intel-max-src-s=
ize.html" target=3D"_blank">SKIP</a> ([i915#6953] / [i915#9423])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-s=
ize.html" target=3D"_blank">SKIP</a> ([i915#6953])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-=
size.html" target=3D"_blank">SKIP</a> ([i915#6953])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-3/igt@kms_plane_scaling@intel-max-src-=
size.html" target=3D"_blank">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-8/igt@kms_plane_scaling@intel-max-src-=
size@pipe-a-hdmi-a-1.html" target=3D"_blank">FAIL</a> ([i915#8292]) +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:=
</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-17/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-modifiers@pipe-d.html" target=3D"_blank">SKIP</a> ([i915=
#12247]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:=
</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-7/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-20x20@pipe-a.html" target=3D"_blank">SKIP</a> ([i915=
#12247]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-1/igt@kms_plane_scaling@planes-downscal=
e-factor-0-25-upscale-20x20@pipe-b.html" target=3D"_blank">SKIP</a> ([i915#=
12247]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-5/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25.html" target=3D"_blank">SKIP</a> ([i915#=
12247] / [i915#6953]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-5/igt@kms_plane_scaling@planes-downsca=
le-factor-0-25-upscale-factor-0-25@pipe-d.html" target=3D"_blank">SKIP</a> =
([i915#12247]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-5/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5.html" target=3D"_blank">SKIP</a> ([i915#12247] / [i915#6953])=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-7/igt@kms_plane_scaling@planes-unity-sc=
aling-downscale-factor-0-25@pipe-b.html" target=3D"_blank">SKIP</a> ([i915#=
12247]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-7/igt@kms_plane_scaling@planes-upscale-=
factor-0-25-downscale-factor-0-25.html" target=3D"_blank">SKIP</a> ([i915#1=
2247] / [i915#6953] / [i915#9423]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-17/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-25.html" target=3D"_blank">SKIP</a> ([i915#=
12247] / [i915#6953]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-17/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-25@pipe-b.html" target=3D"_blank">SKIP</a> =
([i915#12247] / [i915#12504]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-4/igt@kms_pm_backlight@brightness-with-=
dpms.html" target=3D"_blank">SKIP</a> ([i915#12343])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-3/igt@kms_pm_backlight@fade-with-dpms.h=
tml" target=3D"_blank">SKIP</a> ([i915#5354]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-4/igt@kms_pm_backlight@fade-with-suspe=
nd.html" target=3D"_blank">SKIP</a> ([i915#9812])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.ht=
ml" target=3D"_blank">SKIP</a> ([i915#3828])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html" target=3D"_blank">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_120=
74/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html" target=3D"_blank">FAIL</a> ([i=
915#9295])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-1/igt@kms_pm_dc@dc6-psr.html" target=3D=
"_blank">SKIP</a> ([i915#9685]) +2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html" target=
=3D"_blank">SKIP</a> ([i915#9685])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-19/igt@kms_pm_dc@dc6-psr.html" target=
=3D"_blank">SKIP</a> ([i915#9685]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-3/igt@kms_pm_dc@dc6-psr.html" target=
=3D"_blank">SKIP</a> ([i915#10139])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html" target=3D"_blank">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12=
074/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html" target=3D"_blank">SKIP</a> (=
[i915#9519]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-lpsp.=
html" target=3D"_blank">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress.ht=
ml" target=3D"_blank">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stres=
s-no-wait.html" target=3D"_blank">SKIP</a> ([i915#9519]) +1 other test skip=
</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-9/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss-no-wait.html" target=3D"_blank">SKIP</a> ([i915#9519])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-5/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss-no-wait.html" target=3D"_blank">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-4/igt@kms_prime@basic-crc-hybrid.html" =
target=3D"_blank">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-3/igt@kms_prime@basic-modeset-hybrid.h=
tml" target=3D"_blank">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
update-sf.html" target=3D"_blank">SKIP</a> ([i915#12316]) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-update-sf-dmg-area.html" target=3D"_blank">SKIP</a> ([i915#11520]) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane=
-move-continuous-exceed-sf.html" target=3D"_blank">SKIP</a> ([i915#11520]) =
+14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plan=
e-move-continuous-exceed-sf.html" target=3D"_blank">SKIP</a> ([i915#11520])=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-=
edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-exceed-sf@pipe-a-edp-1.html" target=3D"_blank">SKIP</a> =
([i915#9808])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-7/igt@kms_psr2_sf@psr2-cursor-plane-mo=
ve-continuous-exceed-fully-sf.html" target=3D"_blank">SKIP</a> ([i915#11520=
]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-19/igt@kms_psr2_sf@psr2-primary-plane-u=
pdate-sf-dmg-area-big-fb.html" target=3D"_blank">SKIP</a> ([i915#11520]) +6=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-7/igt@kms_psr2_su@page_flip-xrgb8888.ht=
ml" target=3D"_blank">SKIP</a> ([i915#9683]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-15/igt@kms_psr@fbc-pr-sprite-render.htm=
l" target=3D"_blank">SKIP</a> ([i915#1072] / [i915#9732]) +16 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-1/igt@kms_psr@fbc-psr-sprite-render.ht=
ml" target=3D"_blank">SKIP</a> ([i915#9688]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-2/igt@kms_psr@fbc-psr2-primary-mmap-gt=
t.html" target=3D"_blank">SKIP</a> ([i915#9732]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-2/igt@kms_psr@pr-cursor-mmap-cpu.html" =
target=3D"_blank">SKIP</a> ([i915#1072] / [i915#9732]) +25 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-3/igt@kms_psr@pr-cursor-plane-onoff.htm=
l" target=3D"_blank">SKIP</a> ([i915#1072] / [i915#9732]) +11 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_psr@psr2-cursor-mmap-gtt.htm=
l" target=3D"_blank">SKIP</a> ([i915#9732]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-3/igt@kms_rotation_crc@primary-4-tiled-=
reflect-x-180.html" target=3D"_blank">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-270.html" target=3D"_blank">SKIP</a> ([i915#5289]) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-n=
one.html" target=3D"_blank">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-dg1-12/igt@kms_setmode@basic.html" target=3D"_blank">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1207=
4/shard-dg1-18/igt@kms_setmode@basic.html" target=3D"_blank">FAIL</a> ([i91=
5#12317] / [i915#5465])</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_15662/shard-rkl-5/igt@kms_setmode@basic.html" target=3D"_blank">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12074=
/shard-rkl-2/igt@kms_setmode@basic.html" target=3D"_blank">FAIL</a> ([i915#=
12317])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-18/igt@kms_setmode@basic@pipe-a-hdmi-a-=
4.html" target=3D"_blank">FAIL</a> ([i915#12317])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-2/igt@kms_setmode@basic@pipe-b-hdmi-a-1=
.html" target=3D"_blank">FAIL</a> ([i915#12317])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg2-2/igt@kms_setmode@basic@pipe-b-hdmi-a-3=
.html" target=3D"_blank">FAIL</a> ([i915#5465]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-18/igt@kms_setmode@basic@pipe-b-hdmi-a-=
4.html" target=3D"_blank">FAIL</a> ([i915#5465])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-4/igt@kms_setmode@invalid-clone-exclusi=
ve-crtc.html" target=3D"_blank">SKIP</a> ([i915#3555]) +2 other tests skip<=
/li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-dg1-19/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html" target=3D"_blank">SKIP</a> ([i915#3555]) +1 other test skip<=
/li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-mtlp-4/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html" target=3D"_blank">SKIP</a> ([i915#3555] / [i915#8809] / [i91=
5#8823])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12074/shard-rkl-1/igt@kms_tiled_display@basic-test-patt=
ern.html" target=3D"_blank">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:<br>
    -</p>
</li>
</ul>

</div>

</div></blockquote></div></div>

--000000000000b5d3c706269f7685--
