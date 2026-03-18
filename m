Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142D7FCD0C1
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 07:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFC410E698;
	Wed, 18 Mar 2026 07:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="H9AQ7kmP";
	dkim-atps=neutral
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8819510E698
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 07:11:01 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8cd858e860aso867400285a.2
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 00:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1773817860; x=1774422660;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=17dHsE0HGcFc/JzlFRakWD55gQZMmVkVr/9C+vvV8gE=;
 b=H9AQ7kmPsJTKMIuSiLE9Y0W0bL5Jvw7FXXiRMCQOC23AVwcYJvdGeRQlPCpbwhDJ+W
 j2YuzFHHicypFvZsL7ExJXshAqQGixujguGAUdo1mqWQSVjhhkugAj5uX997rzXkejBA
 4iXnYey0ZKxINSrX9icHuSV6cr5ybZskY8gno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773817860; x=1774422660;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=17dHsE0HGcFc/JzlFRakWD55gQZMmVkVr/9C+vvV8gE=;
 b=N8gXiH8g2CIcA1G7dU1MayLrFW5HAsuXBvS77dltv65MQbK+h5myfcqUK0j/koFmzN
 4oiAtuxah5SJD01QlK3lQJgUENWm3SC8SDTadouCVcakE4caqCLqU65o0hj8SvmlS8Yv
 N5oMqfcAhTYopQVPGwsXNfVVRJClUTQUgkm8fF9Dy3nkSwEfbJLeyzka1tFleIFug7ZN
 B01Jf4SB29DXWiuXvxYSA87cNexEaHT2X1rvUkC0rIlVTkTiYbwT+7DHcGvbkCiPqVjA
 pQy7nFjz8yMkKJ0JZeEspRthf+FVExSo41M386BeV7af8iqZde7vwc03F7oqzNgn43aX
 Jkpg==
X-Gm-Message-State: AOJu0YyNBEX2rjYw+Pz95phCeoFm0QwGKwqcK1NLpFOiPO/OH9KPkGZv
 5Y4Thh/yVsBmaTeBuK12e6RK6pRjsvqtixTYZt9DNbwEaUXAa8WdrHKdDl8yWl5H8OYlGsATXrx
 MWwY=
X-Gm-Gg: ATEYQzxSzAsdNQy5RZyJm0uLGCYmCtCChk4H4cqHhCImDPaTOW+T8i9EvVDPgwpa856
 xr2HlsTjM5nYu+4v0c98vomtv5x3542VAtE6SCxSoWtS0lahsu/GlyhYeAS4UVKwCx6mjzBNxb2
 BDf7H/cbho6LSciTurxkjaYwDqKSfsPAQvTYVftafxd972BJOmHi+m17p7t80xUDKw+Giy8yeyB
 Kk2w0sPLysOyg6a+uU8fQSyUpScViwHAsHXYWKQwFdsKh1wGOQVGFBUoYz9Dada9Da+y+aD3CdC
 pmJLJmNm5/yQZPY0MhQcpUOc+kSt1h3q0A0AVRMDQv+ZdLZHHlSvRc7+ztP2UJtT6DJYvr4RiV1
 kZCZ6hSBa66oJ/Hcm9wcaEiuhSlPYACvkooRzjbl8MWM4gd1qfh3Hykyp2dq5Iam2mRLRt33hZz
 6b0YZ2IOX+WBJANZ+RKlZxZWaRGlcn3l0GyV3GJnnS/6rn9cMCykxzwpBouEaU8Q==
X-Received: by 2002:a05:620a:4613:b0:8b5:5a33:22d2 with SMTP id
 af79cd13be357-8cfad315008mr290149085a.46.1773817860247; 
 Wed, 18 Mar 2026 00:11:00 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com.
 [209.85.160.170]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cfad1b62besm144880585a.37.2026.03.18.00.10.59
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2026 00:11:00 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-50905b779dfso80098271cf.3
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 00:10:59 -0700 (PDT)
X-Received: by 2002:a05:6102:d87:b0:5ff:cd6e:85ed with SMTP id
 ada2fe7eead31-6027d3e4aa5mr1247456137.35.1773817359216; Wed, 18 Mar 2026
 00:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260317160255.3351177-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260317160255.3351177-1-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 18 Mar 2026 15:02:02 +0800
X-Gmail-Original-Message-ID: <CAC=S1niqyEGCB_G1nog6CJ+wOQYwK44CTMRp1Uy6VbGMREWPuQ@mail.gmail.com>
X-Gm-Features: AaiRm51TbrdEjQ9MfVb_pQpUKqsOfWxFHLqev2yvXO8sMxPvNN73HJmSMt8qgbw
Message-ID: <CAC=S1niqyEGCB_G1nog6CJ+wOQYwK44CTMRp1Uy6VbGMREWPuQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t v3] tests/kms_content_protection: Optimize
 framebuffer management
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

On Wed, Mar 18, 2026 at 12:03=E2=80=AFAM Jason-JH Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> Refactor framebuffer management to improve reusability:
> - Create framebuffers once per CRTC at test initialization via
>   create_fbs() and reuse them across all subtests
> - Centralize cleanup in remove_fbs() called at test fixture end
> - Use per-CRTC framebuffer array (data.fbs[IGT_MAX_PIPES]) indexed
>   by crtc->crtc_index instead of single global framebuffers
>
> Each framebuffer is created with the actual resolution of the first
> output that can connect to that CRTC, avoiding buffer size mismatch
> issues (e.g., 3504x2190 panel incorrectly using 3840x2160 buffer).
>
> For MST tests, multiple outputs share bandwidth and may require mode
> override to fit within bandwidth constraints. When mode override
> changes the resolution, properly detach planes before removing the
> existing framebuffers, then recreate them with the new dimensions.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Suggested-by: Karthik B.S <karthik.b.s@intel.com>
> ---
>  tests/kms_content_protection.c | 216 +++++++++++++++++++++++++--------
>  1 file changed, 168 insertions(+), 48 deletions(-)
>

Reviewed-by: Fei Shao <fshao@chromium.org>
