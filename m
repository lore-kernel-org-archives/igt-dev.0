Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9035F8E4A8
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 04:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5249810E288;
	Fri, 17 Apr 2026 04:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cinvgnl7";
	dkim-atps=neutral
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98BA10E288
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 04:13:35 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-56d8a5f0e44so1211111e0c.1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 21:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1776399214; x=1777004014;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MjWIQ5pyZ4x9UgDGxLpl8gJ10Z4YYvFivpP7X03AGA8=;
 b=cinvgnl79lBGoJsIGY3nI3XqOgHsd/MnmZrTZA1I2P0HAz91v8jy4hUX83sdZ3+QQ7
 jQ06N1XsooS6etY3E176Ug6VuMdtnG4vCTkg7gr63n8StY0N6xcPnjPSYH9irOA0X/rU
 hWHQPK+Yey8dL8y/2T6Tx8rPtIJrInEBV+lvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776399214; x=1777004014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MjWIQ5pyZ4x9UgDGxLpl8gJ10Z4YYvFivpP7X03AGA8=;
 b=gTeKri6YYdxwTgzTNrMDmot4aqTks74U0XI+br7qoNPtuTO3g/LZn5d1yGCjHR7QKH
 X0sh6awiSpbMzqsv/oXZNg/Ztw56vvTd+AcxdOMkdS6fOeVsVlCZ3DccM/mjkJAHFgPk
 O9Wutj49BHZOoPSYjzlDH/3ubg6WQjuVn2bvw8z2b1GREOTByrdsjqlCAQgZK1jK8Rre
 hmHfHgWYlnj+jAZkGgisM0LS8Gq0ueVNXT/3bJ1Q0/uRviJ2GRYXAEAMN1+y5hXkyP0D
 sBGuHU68XcrfaqeHLz+meJKReHaSHJDwuBxDHfqKM/liMu2IOMFm8TRRPnMThFUvY+ym
 vReg==
X-Gm-Message-State: AOJu0YwtW4Hhtdxu1aMKCkxQ8AIaEb+spYwB9eN1nQc3+KoAuueFJ2V3
 ecZhPSRlnCe6l6i2LrP/hn1VtzEq4b5ODkdOvL+Oiub6aEe8bgJQyHZg9e1MsgZx6IfK9b/RkG3
 albY=
X-Gm-Gg: AeBDiet7WYkmgEJ+PLTKvOSZdUkujUuujYUGNZZlS2wOG6IyJlsyzLHJnBXOUFN6L5Q
 a4rFjAR9fTqnL6J63RtWe+aMAbOUyVbHfxe4+rL7Gdmxyz7obAjapP3ddcFFWG4CaESQcvHMtbA
 OCkRxIu0NKU1EKWp3Hsii1RQdDpfusg/cD2EPZ2Rtr4CcU5gtLAcqmhg+Wjve8RM6fIkX+VDOTF
 SRoN766nuq+1mFz29ZClZZoQ+aThRqfhMsy9MLWlSIdR5qTNZhvNbWA51VZuGkA13QmCMVgPNvo
 oslsdJwXkjxBo79+7gHPIH4uyziKRnzFrQFJU5D8psg01/dk53JA5fpEfCO2t641BBs4k+UlFI4
 7lAGFNpuPXlinUVPppN3eR3h5T6Y/PXJaaWYifsJ/5/st6flxdfEWDpK+pDEVFRlXKoM+gLJT6z
 DS6e6Nx97Ekm7DmRYJE2+pcxdf3xYjfhrqJ+4ZlTf2u84A7XC2sFrUlDF+oUhpdvQhgKp+
X-Received: by 2002:a05:6122:130c:b0:56f:a0c1:2517 with SMTP id
 71dfb90a1353d-56fa67104e9mr360263e0c.8.1776399214123; 
 Thu, 16 Apr 2026 21:13:34 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56fa92f22a4sm226361e0c.12.2026.04.16.21.13.33
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 21:13:33 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-6058a955e04so205282137.0
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 21:13:33 -0700 (PDT)
X-Received: by 2002:a05:6102:5e94:b0:610:347f:9f3b with SMTP id
 ada2fe7eead31-616fb8a0537mr377875137.3.1776399212663; Thu, 16 Apr 2026
 21:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
 <20260330032205.467130-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20260330032205.467130-3-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 17 Apr 2026 12:12:56 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngoriNOHz_8m3Z_CZ8ZL0D-oUKTsSoD_c2z6q4T3fo65w@mail.gmail.com>
X-Gm-Features: AQROBzBaoOZjUA4CRxFOiTZpfcQTPPCw11AeR7gSDrAT-Q70k44tCNVua8Tctaw
Message-ID: <CAC=S1ngoriNOHz_8m3Z_CZ8ZL0D-oUKTsSoD_c2z6q4T3fo65w@mail.gmail.com>
Subject: Re: [PATCH i-g-t v5 2/3] tests/kms_content_protection: Pass crtc
 parameter and use per-CRTC FBs
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

On Mon, Mar 30, 2026 at 11:22=E2=80=AFAM Jason-JH Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> Refactor functions to accept crtc parameter and use per-CRTC
> framebuffers (data.fbs[crtc->crtc_index]).
>
> Modified: modeset_with_fb(), test_cp_enable/disable(),
> test_cp_enable_with_retry(), test_mst_cp_disable(),
> prepare_modeset_on_mst_output(), test_fini(),
> test_content_protection_cleanup().
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_content_protection.c | 74 ++++++++++++++++++++--------------
>  1 file changed, 43 insertions(+), 31 deletions(-)

Reviewed-by: Fei Shao <fshao@chromium.org>
