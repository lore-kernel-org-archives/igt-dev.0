Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E15CCD1A5
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 08:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFC510E58E;
	Tue, 21 Oct 2025 08:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KayLC46s";
	dkim-atps=neutral
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2743E10E390
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 09:43:22 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id
 a1e0cc1a2514c-932dfe14b2eso291496241.3
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 02:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1760953401; x=1761558201;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gLbMwjpX8sx4KDm6CX2MMylnLfRPYCXQQn+J+TZzxPk=;
 b=KayLC46sFbgwtxxtbrDxgnR2kOghkYy4G0FGjPuWgT/vjjt5MF8qPwhLSdkPLSWnfE
 0utiL6BVV52AaHyjZtVGpXDAkQwzXXzAsKwXYua0YbTWtxgD+UZsBzmxpmn3J41RS0DT
 8zKEGDS4ZTjxDwyuJgm+53A6ooyfRo0YLpf8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760953401; x=1761558201;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gLbMwjpX8sx4KDm6CX2MMylnLfRPYCXQQn+J+TZzxPk=;
 b=dQpyKEeD1f3bmjPVFmi9Ys1id33KEz070qyBFgCJxNdAUlf3DMWWa9kiIA4C8XYKVB
 7L1TrBBg/LxuAI8oBuxxe1ecLFBKepW1K/P1zd1Pib5qt0TRZOcNXILIJCIu0+ZFrQ3g
 cuHR6Kj7Jo9DiLcezqPKwkv3fbOpQjzyqi59wKmPSQ7bf3Xlql3ynTKsbRX9P+6HS17+
 e4Wa4ywz+EQewN+xfCebJ08VzyBm1viJRM4/Gh7iNUDILAeJmgtt0OoSYyPN4p4BHFVU
 7Go94Le9Mfkx+p16o/ZWCVk6VdsKZVuwF+tNvPfTDEsJzPkojw8BpkVvfGNbVN0gTMm1
 w1xQ==
X-Gm-Message-State: AOJu0YzNYeYDqgbBrfMMZ3582Z2Qcu8dEkhec/T0g8gkUPLVCxG6TT9z
 Fb+n/hCtSRE6apWkSM1/tJrJIzWzd6RiXjcePSW6JuhzpNLUagpyOjVObSIxsnI4fGXRVAQZ0Gp
 l87DSpk2ksYU/4eSJCsTFvdwY30htEZ+oKxN+UiRr
X-Gm-Gg: ASbGncsQLg19NzSohgdC4HxfMK8CxhD/eJti677pF0k1fRaQ+f4LfWnvFzLZArG/GeM
 n5Gfe/gCwS8s4ZbcMjpUhxthfTJKLmxNU8BPL2xfPv7zPX69rXLmimxr2aAm3fD04L0dDSlea2Q
 b5YHWJ0VdiQEAJFajqvVKmE1qNjzHWSCckQjTfrzm4V3IoL7WGUjoui9EWbI08h6lpnTy9Ei08v
 8WzSZAXiQ/xx4z8d2FFgCU/ycz7WHBX96rh+u0jBuTNRza/etIEfJ74swxvgeOme0rULt4v0eE9
 GUK7LFciNiRkJ6c=
X-Google-Smtp-Source: AGHT+IEAvRszxYixjo/IHzjKEiEiycVUW5tl1au3AlMg+EPhLKUQSNkxzMQ3ytGauPmGWwzWQ2Wk9SaAsakXkUwbfFc=
X-Received: by 2002:a05:6102:41a9:b0:51a:4916:c5f0 with SMTP id
 ada2fe7eead31-5d7dd6d63e7mr4424031137.32.1760953401241; Mon, 20 Oct 2025
 02:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
 <20251012171459.3773990-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20251012171459.3773990-3-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 20 Oct 2025 17:42:45 +0800
X-Gm-Features: AS18NWCoIwsUfLLofgxz33ep6QMjYZ2HcZJ6FbiAa-mpOYnKgGR64r9dbsKyQkA
Message-ID: <CAJ66y9ECaynd_4CZzJgg2r-W+s5rB6R7zgzQtyDdcjsZJwrymA@mail.gmail.com>
Subject: Re: [PATCH i-g-t 2/6] tests/kms_plane: Add support for
 planar-settings on non-Intel devices
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
> Add an is_intel_device() check before invoking Intel-specific
> requirements in the planar-settings test.
> This allows the test to run on non-Intel devices by skipping
> Intel-only pixel format settings checks.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_plane.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Fei Shao <fshao@chromium.org>
