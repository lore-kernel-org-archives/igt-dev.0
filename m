Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ED2C30658
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 18:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC47A10ECFC;
	Fri, 28 Jun 2024 18:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="eLpm71Yj";
	dkim-atps=neutral
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C2A10ED05
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 18:28:40 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e03609bd52dso746456276.1
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 11:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719599319; x=1720204119;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kw3l5BZJuUUAWC7ctGhGFStQQwryZIVVTEkhMgEfJJI=;
 b=eLpm71YjXQxmbhdyot39pxL8Fc50CbG/Uoya9nwPpp7Ri3n0rFaBD6FyZ8ZzlB/jOj
 +Zjm1GArd5Md4DueCKZvJqZ6VQgh6pF3Gd8K4wemtO6gyiu7VBgPY8vOsuIg679GgzvL
 M2uLhvfgy2zJvxnT/s0Wquu2qeFSZe1kmXj20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719599319; x=1720204119;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kw3l5BZJuUUAWC7ctGhGFStQQwryZIVVTEkhMgEfJJI=;
 b=W1w1iUy1NWrr11SQTEk5jhYp0R4gBjZ30+bjs03HCsnVKHctIfUmVXdkjs/I+/PmVY
 d1ZEy3enEJurYuVTGKc/7IAKpRsZTxdqxT0VTtZ6abRUg+g5nwzXCBG7h+Ua716rlZNu
 n1OVQDOg7NNyO+wjl87JPLOVv1NES5Ak34Oz43fI7OZURshRxoITU0SkvRLlYhntcny/
 jLSOnlcX+J8bNh1h7oddWNVOerZewz2SL1IgwdPDqnnkI0jllntNHi/jVFEwGC5hsNQA
 YElCvaISrXZJl85w9kVo0cejntG4ZeXUshWX06SoE6mNRU+Z4MGLLfVp/vTuHdceM7zT
 TVsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+FWQYBwk52ZvF2NBEpJdqJscgHYuBvSJsYRoSm3OGu4qPqI9gyr4XH4W2WetthuIA3u/lpi0k0m596UGxLNfjTJMe2nzNgSU/aDxo+Q==
X-Gm-Message-State: AOJu0YwZilXdDRnKtdfQWg8wmqwct2WV51uyZryrRub5dIWgxqV16hBy
 tGXtamTktOMp34Nfw6YpfrICbC8zxlXSIfr6w2JSr57IbAYlGckyUb42ACAV9lIhVrkEhtPTuvv
 Ro4z37gKppLy9qFwCgmSgkXGj/2hY7EwBUNVf
X-Google-Smtp-Source: AGHT+IFcb2uraLL+FCkFjGLm/VOGAWdLRsGtGeBJGauShs34tSM50IPhYA30tjwdMGnB+oPCIoxoZyDwgKKNo3N51k8=
X-Received: by 2002:a5b:c01:0:b0:dfe:de36:a9a1 with SMTP id
 3f1490d57ef6-e030404ed26mr16309146276.63.1719599319292; Fri, 28 Jun 2024
 11:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240627195615.3695848-1-zack.rusin@broadcom.com>
 <20240627195615.3695848-5-zack.rusin@broadcom.com>
 <20240628161309.ilhpxvqfk26aymsp@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240628161309.ilhpxvqfk26aymsp@kamilkon-DESK.igk.intel.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 28 Jun 2024 14:28:28 -0400
Message-ID: <CABQX2QPAPajvZ0U7Ga+e-_pd0K_m8DR=XOTw3_hs6mka1qJcnA@mail.gmail.com>
Subject: Re: [PATCH i-g-t 4/5] tests/vmwgfx: Fix and extend the reference
 counting test
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, 
 Zack Rusin <zack.rusin@broadcom.com>, ian.forbes@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com, 
 Petri Latvala <adrinael@adrinael.net>
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

On Fri, Jun 28, 2024 at 12:13=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Zack,
> On 2024-06-27 at 15:56:14 -0400, Zack Rusin wrote:
> > Fix a few issues related to buffer managment in the reference counting
> > test. Extend it to include various prime related reference counting
> > issues.
> - ^^^^^^
> imho better 'capabilities' or some other word.
>
> >
> > Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
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
> ------------------------- ^^^^^^^^^^^^
>
> > - *
> > - * Permission is hereby granted, free of charge, to any person
> > - * obtaining a copy of this software and associated documentation
> > - * files (the "Software"), to deal in the Software without
> > - * restriction, including without limitation the rights to use, copy,
> > - * modify, merge, publish, distribute, sublicense, and/or sell copies
> > - * of the Software, and to permit persons to whom the Software is
> > - * furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice shall be
> > - * included in all copies or substantial portions of the Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > - * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > - * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > - * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> > - * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> > - * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> > - * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> > - * SOFTWARE.
> > - *
> > - **********************************************************/
> > +/*
> > + * Copyright (c) 2021-2024 Broadcom. All Rights Reserved. The term
> ----------------------------- ^^^^^^^^^
>
> This is not the same. Btw why not:
>
>  * Copyright 2021-2023 VMware, Inc.
>  * Copyright 2024 Broadcom, Inc. and/or its subsidiaries.
>
> But I am a little reluctant to see '... subsidiaries' as this
> adds some unknown numbers/names here?
> +cc Petri

Unfortunately, this is just the way it is. Broadcom has acquired
VMware and its IP. Unless Intel's legal team's official position is
that Broadcom's legal team got it wrong, then that's the copyright
header we have to use.

> > @@ -1,28 +1,8 @@
> >  /* SPDX-License-Identifier: GPL-2.0 OR MIT */
> > -/**********************************************************
> > - * Copyright 2021-2023 VMware, Inc.
> ------------------------- ^
> Same here, you replaced VMware with Broadcom.

Yea, that's correct.

z
