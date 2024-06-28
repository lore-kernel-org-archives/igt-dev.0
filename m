Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C2AC3065A
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 18:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A339310ECFB;
	Fri, 28 Jun 2024 18:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="SmCXg3Qb";
	dkim-atps=neutral
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835A210ECFB
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 18:34:21 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dff06b3f413so882383276.3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 11:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719599660; x=1720204460;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jTOjg7JUY8obyp+OkXaILj7XlVffsxyDGlBK4xkkGs8=;
 b=SmCXg3QbrsLdqsQ4bvdPAH2y0JG5MlX+d2Sgamtkel3DJ04tUdIM4wjbGU23F9sOEu
 lXpCZ6EyPI341pII2ucV1E6DNdxnSGTf+XB34UvrD+yndUCt8RNDPwfNUDihCFXiO+nW
 omAjVrH5LrCIlqn8i2RI2Er9L1dzvNr/iYuaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719599660; x=1720204460;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jTOjg7JUY8obyp+OkXaILj7XlVffsxyDGlBK4xkkGs8=;
 b=T/37dfIxOiuMpWR721XUs+qqLf0J005UjZQpT5g+rwReAuttXRT5PZQW612/XaCb/y
 t6yMZ69lzu8JOMjSw7SdEfsTy2pCrh4iv1Lcs5J5iI+fkDq+vOsl1pmIPuymSllYl9Bn
 FNO+ibpMIlE/RzESRTQwHkH+IM50stGzgGpjUKbvKdS65ijR8MxTV4BKbozRmre/e50B
 m7+oDwTaQf5OBkZDS9AViATrI8t7wVLZOH4zsHWMl4g48/GIVc68AJjxfmpsPPa1EQL5
 y7537qAGb/uXoZFWkh4prZ7vVexa3Aj4CQlw8LYfXOR2F65XOJULL+JWWFW4Qf5fkD5A
 QzUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmTAsOWyqL604KIvHq7u+W+GbrsRg5cMd0QcFQ8M1CdIUJXGzO4Z3y2uQFfwuFXBv+58Pjzt5cHQAcJtwp/Hi+kQ+gQfjx8Aq2MIVVmA==
X-Gm-Message-State: AOJu0YyTZZnrptUUh6BGn1Ean0tWeJ+c2xpUNi0kUrz0uDpuGb1lCsih
 vAYOMj1Ds7RX8V0rA1gwogzYFXfVPmCXya8mWh5a0UHKZ+uBqZww6dBRQltNDEd7nmEuilAZeom
 qBaYWjxajP9e50QQ1RQi5OHWcNA8pYtlixwQg
X-Google-Smtp-Source: AGHT+IHzR2yGKp2VftPnO78hwkH2P88iHcxNAlFbZB+DI6nPWlhrmQvxAVDN3kTi0+HPkHkgv9ypvUHA3/nywa3bfK8=
X-Received: by 2002:a25:2e0d:0:b0:e03:5e49:ce93 with SMTP id
 3f1490d57ef6-e035e49cfe5mr2448106276.14.1719599660545; Fri, 28 Jun 2024
 11:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240627195615.3695848-1-zack.rusin@broadcom.com>
 <20240627195615.3695848-6-zack.rusin@broadcom.com>
 <20240628160257.ut6vfxyho7kqlwh6@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240628160257.ut6vfxyho7kqlwh6@kamilkon-DESK.igk.intel.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 28 Jun 2024 14:34:09 -0400
Message-ID: <CABQX2QMfU4KXzJtvuuOYVAY59kZBo1yzdh0DZyTSv5sYACH-Aw@mail.gmail.com>
Subject: Re: [PATCH i-g-t 5/5] tests/dumb_buffer: Add subtests for mixing dumb
 buffers with prime
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, 
 Zack Rusin <zack.rusin@broadcom.com>, ian.forbes@broadcom.com, 
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

On Fri, Jun 28, 2024 at 12:03=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Zack,
> On 2024-06-27 at 15:56:15 -0400, Zack Rusin wrote:
> > New versions of KWin are extensively using dumb buffers with prime. Add
> > some basic tests to verify that mixing the dumb buffer interface
> > with prime ends up with a well formed buffer.
> >
> > Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> > ---
> >  tests/dumb_buffer.c | 96 +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 96 insertions(+)
> >
>
> This seems unrelated to your series, please send it in separate
> one. Few more nits below.

Sounds good. It's generally just improvements to prime/dmabuf testing
framework in igt, but I'm happy to send that as a separate patch.

> > diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> > index 8e243459c..0651f5d83 100644
> > --- a/tests/dumb_buffer.c
> > +++ b/tests/dumb_buffer.c
> > @@ -69,6 +69,20 @@
> >   * SUBTEST: map-uaf
> >   *
> >   * SUBTEST: map-valid
> > + *
> > + * SUBTEST: dmabuf-read
> > + * Description: Make a dumb buffer, map it using the dumb buffer inter=
face,
> > + *              export it via prime, mmap the prime buffer and check
> > + *              that its contents matches what we wrote to the dumb
> > + *              buffer.
> > + * Functionality: dumb_buffers, prime, dmabuf, mmap
> ----- ^
> Do you need it here?

We don't. I just looked at other files e.g. kms_flip.c and kms_prime.c
which seem to list "Functionality" for the added tests so I was trying
to follow what I assumed best practice was. I'm happy to remove any
part of the docs for it.

z
