Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF52C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 10:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A6210E386;
	Mon, 29 Jul 2024 10:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="JbBuPZQt";
	dkim-atps=neutral
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5BC10E386
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 10:03:17 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-81f95052c2cso120413439f.0
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 03:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722247397; x=1722852197;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r+RmP4Yzi5bc0D2bKT0kidGN0QY6Q7JdbuTGYNe/u0k=;
 b=JbBuPZQtAReFtgwRFTcF4TNYx8m1fL7iW9+BbBOZPInXmXNmjJGsvl6eKGlSOywJRo
 y0ugDz/IS7jxdsx1Hibxj1MG354dMFcAYkB9f4JgSjGC+PtDPynbhdRUDJGi1qM3LPbN
 nS0gC+Y7pKs7ovZXuBx7TDYXGlRWSNvND89O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722247397; x=1722852197;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r+RmP4Yzi5bc0D2bKT0kidGN0QY6Q7JdbuTGYNe/u0k=;
 b=qAU1piACYLSXn5pELc04UO9xPi5GESMYMkQw2UO+Cgy++QhK5pQFPt2cxekfyI69UM
 VRyJLjLyj/kY1ycLxlfx/8q5IWyS8S4bCUMBpDW6QL9Fd9uxAP50w7XoImESs21Mcdv7
 8WT4k+MPegWB+bd1jwZjXjN/z+sCa0/saZofeu/h3ro6YIGnlo7/v7zw7B18ldwfyC2t
 tVzD1ZsWnb96IHaDq4zRN372x/HrAiJHLZ/jjzYCz4T1TWo5qyW7ushUN641cZqz0RGM
 zVgjLSMKFD+rPEtajRKjxx2lD9FDTaX6sL76aIipCoawZSGssuR87F2iy2IoaOvdKHo4
 ZDQQ==
X-Gm-Message-State: AOJu0YwnbFfTyn+UJPZAmbVZUunnihTq4++qePpGxm1UYfIyFqh4nSJI
 gXf702FU5uWVSOVFd680eNkfafCxa99NJ9tldYajwWyq2c2t4DId8Nn2QoQqIafFoPOMnCviqDF
 46KLtuPLBd8+q7q3pSSEH71b7XUBtxgpNbu4r
X-Google-Smtp-Source: AGHT+IHwA1nWwYBcDDs0y/uQX0wK06w5E+PN07Nfinw3mAV2ia2d3h4tLEP8RWFwCu46yqygO2KP0YYG74/Eq1UO2cM=
X-Received: by 2002:a5e:9518:0:b0:81f:92b6:8235 with SMTP id
 ca18e2360f4ac-81f95bccea5mr723609839f.6.1722247396987; Mon, 29 Jul 2024
 03:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240729043846.1892343-1-zack.rusin@broadcom.com>
 <CAKLwHdUoj8bghv7O5JUVx5BCOnZcXnzsrJ_ejt7vGqET3UW8hQ@mail.gmail.com>
In-Reply-To: <CAKLwHdUoj8bghv7O5JUVx5BCOnZcXnzsrJ_ejt7vGqET3UW8hQ@mail.gmail.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Mon, 29 Jul 2024 13:03:06 +0300
Message-ID: <CAKLwHdUnFr5GS_5bTCHebRGSmdr-zp+CA694j+Cb_RY=u+SfEQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t v4 0/4] Add vmwgfx prime tests
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: igt-dev@lists.freedesktop.org, ian.forbes@broadcom.com, 
 maaz.mombasawala@broadcom.com, kamil.konieczny@linux.intel.com
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

Argh, wrong clipboard. Let's try again.

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin

On Mon, Jul 29, 2024 at 12:58=E2=80=AFPM Martin Krastev
<martin.krastev@broadcom.com> wrote:
>
> LGTM to the series.
>
> Signed-off-by: Martin Krastev <martin.krastev@broadcom.com>
>
> Regards,
> Martin
>
> On Mon, Jul 29, 2024 at 7:38=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.c=
om> wrote:
> >
> > The following series makes some adjustments for testing prime/dma-buf
> > on vmwgfx, adds a vmwgfx dedicated test for it and fixes some minor
> > issues.
> >
> > The last patch in the series adds very basic prime tests to dumb_buffer
> > test to verify dumb_buffer<->prime functionality.
> >
> > v2: Add a reference counting and dumb buffer tests plus fix issues
> > spotted by Kamil
> > v3: Fix a silly compile error in vmw_prime test and remove dumb buffer
> > test
> > v4: checkpatch.pl improvements suggested by Kamil
> >
> > Maaz Mombasawala (1):
> >   tests/vmwgfx: Removing incorrect assert in mob_repeated_unref
> >
> > Zack Rusin (3):
> >   lib/vmwgfx: Allow using any buffer handle as a surface backing
> >   tests/vmwgfx: Add a prime test
> >   tests/vmwgfx: Fix and extend the reference counting test
> >
> >  lib/igt_vmwgfx.c                |  76 ++---
> >  lib/igt_vmwgfx.h                |  43 +--
> >  tests/vmwgfx/meson.build        |   7 +-
> >  tests/vmwgfx/vmw_mob_stress.c   |   5 +-
> >  tests/vmwgfx/vmw_prime.c        | 584 ++++++++++++++++++++++++++++++++
> >  tests/vmwgfx/vmw_ref_count.c    | 214 +++++++++---
> >  tests/vmwgfx/vmw_surface_copy.c |   8 +-
> >  tests/vmwgfx/vmw_tri.c          |  12 +-
> >  8 files changed, 821 insertions(+), 128 deletions(-)
> >  create mode 100644 tests/vmwgfx/vmw_prime.c
> >
> > --
> > 2.43.0
> >
