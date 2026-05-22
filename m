Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC29CD5BAC
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 19:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BED310E29A;
	Fri, 22 May 2026 19:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="aobk5Nml";
	dkim-atps=neutral
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3255310F759
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 19:54:30 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2b4650d5f5cso32045325ad.0
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 12:54:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779479670; cv=none;
 d=google.com; s=arc-20240605;
 b=ARLtuwAdYR3yRIoiHqe/fApxZRvvDszWs1LxZQ3ckKOG2RqKD+3LrHfGwxPkX27Ctb
 RGNIMZdGc2MM/dNITq69nD3Dl5q+7s5Tv11kYkythm9mLlbOGNGaoIEh9BSrxdASY0vW
 mNh3PVaxCGGJafJHt4H1TLixXQgFYY7lkYYmDxrrOr2OKRlg6h0+ST5Gf48H720EP8Fu
 XKKzjIsBiIiZsPBkYl/7JnM2dQhC33g9pAdIr9tcnqO9cTmb+sVIueOLpEC9xTwU92dN
 LNMZmzdoW3zN2+AgE+2L6TxkGdct52QbrzyM2Eyg78C4nh6JMfT1+Q6l+kED2150h6IQ
 mYrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=McQDLexxB9lEY0sbKvXs0czGehnIeKyJCU5ADeAgzdA=;
 fh=rumbRs8gQ66TkRYUfMbKPRl9F5uypM8v8mQgSATmj90=;
 b=iB1zlPfkkrPdxW+08KedR98okmb/22Sm6GJIb3Wq1FGEqQLaSljHrZrjh9/xtB3vD8
 6RRlQirC39zXmdyylc70Xxn0uEdpILMK4a8rxw7s3Z4FoTEKCzFF8ou3Xbms/l+wkNSf
 Ah4sqJcKm29Z7lVkJSqnaHnMegJS4a2c+28njog9qhvGqkFFRGE5zBbSC14gJICEN5yN
 kpiDdZ/9W7mnH6sL7q0iS13LCh8EZEne+tgvFtY8VsgW8y+BPuvbknHuCf+5dq6GZfPW
 nvssdIYjBtHLPJhBm0zSRmJycsRRB65Hwu1TiUOAXAwz7Q0LP3REci9puO6Jt1TZV8RW
 b5nQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1779479670; x=1780084470;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=McQDLexxB9lEY0sbKvXs0czGehnIeKyJCU5ADeAgzdA=;
 b=aobk5NmlWoTNr/FUjPnct/iz/GKWUl5yz4rJz291hbtBfb1LviRQ8Sa0tLRveIDK3v
 HQvVRwaoolP77XJSVdsVKh9Rw2W87uHWGjYuTCUQcXeBBwvm014koKwfIsGzB6nEKxtg
 StaAD6roNujldFsoZeGf1Y6EREn6NTMUkJzErK+nHCYxwc8XED8Ajk9+U4VRwm36SHVU
 i03uw5CrVJbav6QRTf84hXiQ3HA5GLgYXYagzhJDCq3//a+mwqPXTJXxp9VhJ7Xr24NW
 LgVxkW5CV6eRYuuq+X2LTdbU8YNR1HsWNsSaLztYeYEMaZD0sPiD6pCjRXdQSicH86kI
 lwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779479670; x=1780084470;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=McQDLexxB9lEY0sbKvXs0czGehnIeKyJCU5ADeAgzdA=;
 b=TDyYcIRMSuzHD1XMcKW+Wr1g4WlzhbakuR1ecQay0y4SolF3S6F0Oru8Tgs8N7RSwn
 GfZ0/7z2oUufMq0KD3jrZZSAZ/34qGz4hiAl4fWnjkP4Ll+pRxWDVeKZZHvWCpDisFX+
 oFPjFbNhdQU8u1hE4WcxFh1q+bDhWyI5f98psg9z1Inr0lOcFr/vvJlUnp6nF2SvI3AG
 QdGXD4x3QR4ScL1hSzfR0CqFykxY1ZJo/ltW7feOoRtL5zFNhQwJqjvSf99MLgRlPb9j
 IUD+EMmYuGuO0363CNS24biUvH7qhJlIWAm4gSBNJ3Ah7qlAXVN6sxLrG3xZQNG9zBSj
 nIlA==
X-Gm-Message-State: AOJu0YwI+3kA6XiUEwvl3o2kJr7axim9I51ae+zfxGHGX6e/13XmOSOd
 WXFt9WyoECHhmYHtfvM1js6EhH4g5QbQ93r1Zo2/rHRbCVWQGQfLSf1J3vWWRUzkoqn66X6wPF6
 cCh+DUlWd197eRRzA04mIiCCTE4shAPyntoGrbXmFTg==
X-Gm-Gg: Acq92OH5HQAl5+8syDkqOqeLuL/LsgGbVrgrrBX9JtO7L4Ye98eI/W9gy3ZLB6UbgPq
 MOB5efGdwmhBX7zc/Bi58384Ay66PkMQpVDk+JDCYXHNwZBrNjZ0Xp9F2gkTwPGLfoai6/+tb0L
 neYnKoSP8rYjOyllH5CM1RkgeyPGVClUETfrSwhCqRnwu39LAUVkMPsBTim8vu5M0RMkTWi/IdO
 D3gsKYVUlU0WFNLi2+5NuBQOcTFuSTh9taJL8IaUqzfbF7qlPpjpKspPqHpIVwdPZaUaGtj4YVJ
 kvxzSUxVI3eE62pIaA==
X-Received: by 2002:a17:903:3d10:b0:2bc:78ec:54c0 with SMTP id
 d9443c01a7336-2beb0662bf3mr59741805ad.31.1779479669677; Fri, 22 May 2026
 12:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260505194419.500600-5-dev@lankhorst.se>
In-Reply-To: <20260505194419.500600-5-dev@lankhorst.se>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 22 May 2026 20:54:18 +0100
X-Gm-Features: AVHnY4Jg5Nr7jkhYa5cNeBFngyxHoTEVCpBtHOg_M2QKIawIUTrehPqsgLK9Ycc
Message-ID: <CAPj87rNytB9RtK_k6xtm0tqz=+i_Yf-BEu9pA1ggPk-jLEh0=A@mail.gmail.com>
Subject: Re: [PATCH i-g-t 1/4] lib/igt_kms: Add support for the
 BACKGROUND_COLOR property.
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: igt-dev@lists.freedesktop.org, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Maarten,

On Tue, 5 May 2026 at 20:44, Maarten Lankhorst <dev@lankhorst.se> wrote:
> The background color is a 64-bits property that contains the ARGB values
> of the background with 16 bits for each component.
>
> Add support for the BACKGROUND_COLOR property, and set to pitch black
> as the default.

Did you see the previous attempt at
https://lists.freedesktop.org/archives/igt-dev/2025-December/101222.html
? It unfortunately passed without review.

I think we should take whichever series is best, but it would be great
if you could please look at the prior one to see if there's anything
your series could gain from that, and equally Cristi if you could
please check this one out on VOP2.

Cheers,
Daniel
