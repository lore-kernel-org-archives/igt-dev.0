Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F212BCD1294
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 11:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836E5112A40;
	Wed,  3 Apr 2024 11:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Kfve3jVX";
	dkim-atps=neutral
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B2A112A40
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 11:45:06 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dcbef31a9dbso4065108276.1
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Apr 2024 04:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712144705; x=1712749505;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H6ji7ukJRPmQhB2qcavC1ueRDs+bCKiR3kOICzSoFek=;
 b=Kfve3jVXRiIKyagHA1DNmouphsXeook7g33nPScs3I3XOcuV7ISrh627CbvN0V9LQq
 WlDQPLsRk/nhCxu0HbmoM6644MzycFruSUQpGM+3u56lm78sr1F+RqL8L6XH4NT2kQGZ
 vlqmvmyuu/Q0hLk/L0GU3X5U8/F/k4CyaxSXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712144705; x=1712749505;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H6ji7ukJRPmQhB2qcavC1ueRDs+bCKiR3kOICzSoFek=;
 b=Ayvf9SxX8s/BhgagqxJ5LHZyLOTRDWWskuVM0xJ/kfjC9NR/y9JcQ0ZSBZJcSiAPfc
 zzlohFzxqSM4RUnVHbJFwlMGEeGMTKlKR9SiIBIgEcQfb4bnL81rOpXC+j3rfx/3bHAO
 WCM0BAEE6O/4BPervM5kFmlYF38W/2OG0RkcqzSLdrH5x6ZTuWy3YyGwXvSA4QYOz5l/
 G8j08x00kq8f4HGUCCG7yg47pci+Q0r6pc6C3W1KvktA3pryIdCrjxxhqZXi8wZ2nOP4
 rd8+MU0EqkvDT75MKDgFA36jiC00ZfEXjZFuXdbxtNemkkppmwkQXVSxJxyu0m/17bNn
 FxbA==
X-Gm-Message-State: AOJu0Yz+2kOEJItLpt0mbHy4576WTo1t28BoeUnsU89vR1dlQl8c+m52
 tNsY74tSa+1Sq8xsGkG3STNgOFsS0zTNoJw+JUTZ5lfg2LYvwGY7nCKHroKQQveGcplsROgQJmN
 q27PkLfWm6WxmjiAKOf6JFrgv08U/bqXZYrmL
X-Google-Smtp-Source: AGHT+IFKuYjWza+zXPjWPA5Q0rMCrbgx3HRhz5yHT+6Ft++wJj/e+mXelEtAPaLvU/P/29AJlfH7r0I4bvMQuFJPxtI=
X-Received: by 2002:a25:b84a:0:b0:dcd:65fa:ea06 with SMTP id
 b10-20020a25b84a000000b00dcd65faea06mr14285654ybm.24.1712144705293; Wed, 03
 Apr 2024 04:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240402232813.2670131-1-zack.rusin@broadcom.com>
 <20240402232813.2670131-6-zack.rusin@broadcom.com>
 <20240403104246.6c94eea0.pekka.paalanen@collabora.com>
In-Reply-To: <20240403104246.6c94eea0.pekka.paalanen@collabora.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 3 Apr 2024 07:44:54 -0400
Message-ID: <CABQX2QPW83H5T9Gc5yT8a277tNgjEvC-xK6wDGewq+vQEYZ=2A@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/vmwgfx: Sort primary plane formats by order of
 preference
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com, 
 stable@vger.kernel.org
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

On Wed, Apr 3, 2024 at 3:43=E2=80=AFAM Pekka Paalanen
<pekka.paalanen@collabora.com> wrote:
>
> On Tue,  2 Apr 2024 19:28:13 -0400
> Zack Rusin <zack.rusin@broadcom.com> wrote:
>
> > The table of primary plane formats wasn't sorted at all, leading to
> > applications picking our least desirable formats by defaults.
> >
> > Sort the primary plane formats according to our order of preference.
>
> This is good.
>
> > Fixes IGT's kms_atomic plane-invalid-params which assumes that the
> > preferred format is a 32bpp format.
>
> That sounds strange, why would IGT depend on preferred format being
> 32bpp?
>
> That must be an oversight. IGT cannot dictate the format that hardware
> must prefer. XRGB8888 is strongly suggested to be supported in general,
> but why also preferred?

I think it's just a side-effect of the pixman's assert that's failing:
https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/lib/igt_fb.c#n4190
i.e. pixman assumes everything is 4 byte aligned.
I should have rephrased the message as "IGT assumes that the preferred
fb format is 4 byte aligned because our 16bpp formats are packed and
pixman can't convert them".

z
