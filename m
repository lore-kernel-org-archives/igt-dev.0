Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AB0C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 03:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAD110E2DF;
	Mon, 29 Jul 2024 03:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="I9qs00zN";
	dkim-atps=neutral
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D6210E2DF
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 03:35:35 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e03a17a50a9so1639135276.1
 for <igt-dev@lists.freedesktop.org>; Sun, 28 Jul 2024 20:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722224135; x=1722828935;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s3w6L9QTV7oiCVt4IYD0gM1qmGc5Hq9HHNA0LNVnJ84=;
 b=I9qs00zNiyTWNRYJGw4muuV4necwKbGdTdnt7TQp1sLiOactZ8xvJoFvEK41kQWFVr
 uIypgzh9q4gchiMH4HAXANQBB6nS0T/cx3Xk/+knCval/+6s7z17PLGROfczEUUpIfm7
 azrsgpTTvF6VgT6hUeS8o+W6ESx5KMS3FvwSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722224135; x=1722828935;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s3w6L9QTV7oiCVt4IYD0gM1qmGc5Hq9HHNA0LNVnJ84=;
 b=f+hIomE1NEmpXNjPNkx5vyMyd8OZvusQ2PMwGQ0b0CuZbj8hx63R4btR/uVWAxARRt
 wGirQnJS2bvLlFKaT9xVn3X41fMyChbGAgq4FL2vf2hSynj3ejvN7TlqcEyHN1WFiU2h
 fJhe/HnZggjzb0JmCXPLzQFyc/WB06tSzmH1m1rB0A2k9uZZ7l03ZzlFfCoMSOYBc3lA
 u8vKxyywWeGGbJR3HeodJ0T0nhTwlTzFDQix0j68LRLIEzgUXQ7PUtC9LaUXDbAT6sD0
 Eh6dsVZfQUKVMfktejko0+c7lw9ilC9ofuthQZdjLaSyoj1rt5NaEgb7hHFfvA+ZIJqd
 lORA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIcWPMrN8uN6xhZGSjEQe3t5bGgv3vVxIMiGcPosb3ggfFMyujrJguXAoG4bcwwhH14PqAceLFtUEuLU1ryZEOht5YDlH7A+td8Fdtng==
X-Gm-Message-State: AOJu0Yxlh5rGmj0pbBNSelI1NfDsmoBnrsby1T9jBfnky8KHQs7d9vLY
 iyPCSsYqJRNv3hhSW2EpdkHeFyXoKk7+HwrR7kfPdE+yQXE530PCHjiprP5Im39bNceQ7EEEjE7
 Pi22IT43kp8PZEdd0fz80Ql5a3gpqkVDZFMS1
X-Google-Smtp-Source: AGHT+IG+ArPDpN+Sct64YSwSSxJZ6jw6RGrV7gOa6sa1GDu/ivntvVNQ2phN+QQs9mrh63UezVSZ3m+8HqlOYlcJ1m0=
X-Received: by 2002:a05:6902:2193:b0:e08:6091:710e with SMTP id
 3f1490d57ef6-e0b5462b118mr6815104276.52.1722224134711; Sun, 28 Jul 2024
 20:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240628190243.695367-1-zack.rusin@broadcom.com>
 <20240628190243.695367-5-zack.rusin@broadcom.com>
 <20240726191610.kklcm5sv4e3r4h6l@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240726191610.kklcm5sv4e3r4h6l@kamilkon-DESK.igk.intel.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Sun, 28 Jul 2024 23:35:23 -0400
Message-ID: <CABQX2QP8tdZfY3ai7+Z-O=Ahf8ju5hUwTsKon_ka9BnuZ_XnEw@mail.gmail.com>
Subject: Re: [PATCH i-g-t v3 4/4] tests/vmwgfx: Fix and extend the reference
 counting test
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, 
 Zack Rusin <zack.rusin@broadcom.com>, Petri Latvala <adrinael@adrinael.net>,
 ian.forbes@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
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

On Fri, Jul 26, 2024 at 3:16=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Zack,
> On 2024-06-28 at 15:02:43 -0400, Zack Rusin wrote:
> > Fix a few issues related to buffer managment in the reference counting
> > test. Extend it to include various prime related reference counting
> > issues.
> >
> > Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
>
> Sorry for late response. Could you split fixes from improvements?

It's really not worth it. The test is only valuable with all the
changes. If it makes it better I can remove it altogether in one
change and re-add it in its current form in the other but that seems
silly.

> > ---
> >  lib/igt_vmwgfx.c             |  45 +++-----
> >  lib/igt_vmwgfx.h             |  30 +----
> >  tests/vmwgfx/vmw_ref_count.c | 207 +++++++++++++++++++++++++++++------
> >  3 files changed, 193 insertions(+), 89 deletions(-)
> >
> > diff --git a/lib/igt_vmwgfx.c b/lib/igt_vmwgfx.c
> > index d2f699575..b62d7a326 100644
> > --- a/lib/igt_vmwgfx.c
> > +++ b/lib/igt_vmwgfx.c
> > @@ -1,28 +1,8 @@
> >  // SPDX-License-Identifier: GPL-2.0 OR MIT
> > -/**********************************************************
> > - * Copyright 2021-2023 VMware, Inc.
>
> Please do not remove old copyrigths.

I'm sorry but I can not do that. Broadcom acquired VMware, this is how
those copyrights have to look. You'd have to go through Broadcom's
legal team to contest this.

I'll respin the series with checkpatch.pl fixes.

z
