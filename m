Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA079CCD184
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 08:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5404E10E590;
	Tue, 21 Oct 2025 08:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IE2htCXQ";
	dkim-atps=neutral
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CDE10E384
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 09:42:50 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-9310a7b2668so969064241.3
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 02:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1760953369; x=1761558169;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bOHsSBEnGT/ith4fOIl12/8ghOD0jOjbpa7zE7t8DW4=;
 b=IE2htCXQylEXU8Xdiz4liXnHTzxfmBt3amTeFN7VxasQLYuItyYogaGqFcITOXRilA
 oGVd6rpGaq3cedwor7/w8yj54i6f2V2YiFD6xE2lOvuzZPpIVG95+DCu2IywmkUbtZn/
 4ES1mZK9Vl0NOsh8BUoMIB/x9tE2Ffq4pKq98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760953369; x=1761558169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bOHsSBEnGT/ith4fOIl12/8ghOD0jOjbpa7zE7t8DW4=;
 b=KwJeGbBW7/pqkmKNjX9Udt/HTo/vbvh2zU+MTaQO3n7P3FIlaqN5pW17hH3AMajkTi
 Zg3Y7Jdz4otH8NOlJVMZ3b13YgZwlnBJSH529QMDFAUHCpy5ZrfPy8mgAhAO+JO6y4KG
 bgBszwCQVpY6z20Ux9edUt9VpZx2PD0mcpKuAOQ5wIT5A4jEe/FFjZ0lS9YfBZ/0QQ0S
 MJVMIP7VGj2qx7F/gIbLokrFe3uh5FTU1ywkNK3lqiyNgIax2jxFAZmNoY9d922JY6X4
 fk9mxHJnZ1Cbx1wxCrMmnPgmJZhzp3QBdB57ALaawmwxqYoaT3K7WVgF01cfkipNd6dM
 OAhg==
X-Gm-Message-State: AOJu0YzdtJl5+lmDbmzOAtHp8E+zsMQTFmOotmztFPmL7PPrtOLU0KYF
 FPmIuENVQaHIvNQ5whIFX3dm2u58yZ3xFxPzjF5WSbESwC+pqEggQfFSjuP1dHKJcJ2cDpkh+SU
 3Ct3onR8Oh8h7nYpdXdjoLSxfHBb4+eGrxz481QwW
X-Gm-Gg: ASbGncuq1MCzwwfHbpCtZbskzxLaaBHQzsbR8HQQEu0zNmWxETmcUe2Nywaoe0ON01j
 Jn4y8ULh49xecIrTzrBMCvugFW5NL9clcQj94gUhq99XKTKbuM23Lv+n2L0t+xJ6VaRaa2LIVIp
 JbGSdfDqEjNzTABW7zIipnNycjW9XPxzQS0IbIaPPpk4JyQPztGAye9x5b/3jdlKKBo6YpGty+Q
 84YEkVQfhHJ7+pt3lZseViRZbQIlPLa/mN/3eQVk7areBDkvOamJMV19PYXh4HlYvc2rcG1c4Da
 rfly4QT3HTL4Y2p3T5gEzSFL0g==
X-Google-Smtp-Source: AGHT+IHEgB/43nNRnrjHklXxh4Mzb/BG8KEUk7x8EeYfWvCK4ty5jcAWmoLRJeuwXRUOazKByqAcCqnrH6syuRj32RQ=
X-Received: by 2002:a05:6102:1613:b0:5d5:f6ae:38d7 with SMTP id
 ada2fe7eead31-5d7dd6f82efmr3524589137.44.1760953369642; Mon, 20 Oct 2025
 02:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
 <20251012171459.3773990-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20251012171459.3773990-2-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 20 Oct 2025 17:42:13 +0800
X-Gm-Features: AS18NWDyt_6Grl2RZ4HZuJQ65000dY9fqc0AArXvFF_Bakkjj-_BEMybvkvtxM0
Message-ID: <CAJ66y9EPvepu7F6D0k12wbzhhb5o9=j3CRyxLgFbqf-po_3LTg@mail.gmail.com>
Subject: Re: [PATCH i-g-t 1/6] tests/kms_hdr: Use original 512x512 fb size on
 devices without scaler
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, 
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 21 Oct 2025 08:12:55 +0000
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

On Mon, Oct 13, 2025 at 1:15=E2=80=AFAM Jason-JH Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Ensure devices without scaler retain the original 512x512 framebuffer
> size during plane setup. Previously, all outputs were set to display
> resolution size, which may not be supported on devices lacking scaler.
> For such hardware, always use 512x512, matching the initial framebuffer
> creation, to improve test reliability.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_hdr.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Fei Shao <fshao@chromium.org>
