Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6A7CD8CB2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 15:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6430410EAC3;
	Wed, 10 Jun 2026 15:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="O8DxqDxc";
	dkim-atps=neutral
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D5610EAC3
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 15:33:59 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-7e6dcad6018so5519674a34.3
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 08:33:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781105639; cv=none;
 d=google.com; s=arc-20240605;
 b=DpPadtsM5mVHuDVeKsMXHHJh2LYhC7yesQTThDoPD8T45L9Ykl0SNze0ktz24N6O8T
 5b/j0rj4ZM1G8OaULKSrNRVmZdW+efb0HHhMc4xhGsK+qheErysEPo3zFYgcrb0QIh5L
 iXZR36+DJLstqcsn9SLbELIaWrUKUd3lL9jGu2ZuJhro+Qft3+bWanqJCutELANMzkVn
 Abga0NuCTDiA8kcXSs61meku1il+3U102WDefo3q3bgqW2sY3YXisGjO7oQh3O2G72WH
 VrtlNLfNHOQJqvww/p2rv0BfOtCSXZEio+/68K5U5cfxSrzUOtu1eyu8MJiAaBbCwYQF
 K92g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wGc4sQ8/3HJ2UvgE6CIp+b9w0IroukHPtEGjAc+IULk=;
 fh=25pK5A1SHa1mDPw6Uz7y7ZW59zcuSZH6l6BuSZnHk6Q=;
 b=KRffckCWJwtt9ZiUA/LPuNAhvSy9T3GsT6V0/ny0m0jojowWiVKAhZrE5Ye9w6MIG5
 GB9JgzIvNneKIt7srwp4iXz4apsOdG8qfMPPqlhj/6zmncT5cMjbquzcgOqZUMeIn6Kd
 nseABqL7s97xQtLTh5V+hRgOM1pvilhjcjFi7LjHs8oOOxNyilYrxT9g7UTbRWr34ZED
 BcW8VsnyUcuHBJdRz+F7kGtCJAiwZAvGbpAxNTbfBx9Utq1v3k/u1Ql75LZi0gt7u8qf
 nNC/VIPnvjKLHZ5rWGZM5GE7I2toRo6lk4g0jnl9qpAvpmwMl2rfhYPRI3HahivvhnTg
 XlXg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1781105639; x=1781710439;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wGc4sQ8/3HJ2UvgE6CIp+b9w0IroukHPtEGjAc+IULk=;
 b=O8DxqDxcbEF8A/S+qGLRUeOvYS88CtzAbgu5Wf7b1jCrowaUaWzZkf90jg62T4l1kx
 zhM7zl4CYqgPQ3YMHKq1xBSHHL1FlaP5M3TohL3IblGbVBjQnHAXw6GK0Eu/xyhwnTIL
 ed6NxUfkyJDatqMQZw8UbHX5ivatEqKE0p7PGtiW/s8C2dkZIRT6t/4L4scAkg87a9CN
 UuFiMiM+b/pnMzQyuRTVecOX422xXPxOYqhjR3l1MoC4oBJ53WrxT1zGgx2E8knhVVLs
 m+AOlFs/70N0i3/CcsDsdCKnj/QZFzEJ0KgJolyHG98SRhtXicEAKZB7w/fteJjHqXf1
 kfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781105639; x=1781710439;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wGc4sQ8/3HJ2UvgE6CIp+b9w0IroukHPtEGjAc+IULk=;
 b=k4Z8J3IySy6cDblep71Ov6bH9t/nTZBRJUZDUMf6qPQh2H8O4B3UAz7jdXc9zaXPFF
 U1fWBGZ8PRdOkuVzADvTeBHX82gM42a5CIn17TbSMXVZkUMgRp2wQvotNcvcKtYAtnYY
 x+oBcUfPrM5EEV+frD0bvzG1ZF7Ea1lNO8MN0kVInBjOp7aSPcAsRXEAcsg/jdGUfSll
 OrNL8UeuKq7l1m5fJPrXwkB5qRe1wPS2jAXK1I0ovPYU3YdWM3pK7oNW1hyTbP+d07QH
 m6i66yX/oNN4h8IE/vNgNlDNhMy2vlU9P2RyTaOl3HDrSFTaC9aC+eYqYqmx3Y4VxTMO
 XVCw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+5yBR6B4sd89kFvAlcjpMuFTiZZPJVCOgt0vRkztVaAGW5pRYpHvgykTMsymdA4Ve+iLnftEBw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLU34lIk/m39/q5MXe58fi/gjFWH/hb67ZDrfLDjHbRWsydRhP
 FfBozq4JCkhRx0qa+J/8SUDoU4T5TtqIf/8rXkWAYLHh0Xv3bjlcGX7taSPZEtRdkxbkEWgYRA3
 yzqKc13bwcztCe0F4Tl0BfiGaMaRAWeB8V3VPIz5a
X-Gm-Gg: Acq92OGWhxDdk+gCELUse2VTcFgEhZqcrnsr/+0Dwt9+iJM8oli644GUotVAmQlI+gW
 wmyCIMDb6+x5vUhY5gTT4s1RijkKZLAMjLS7g/xAoanXtj6+OlQiVKE8fn9Z4B5jRJx/VFWkkOG
 E25eOmqHXz81f+yko24S7JQq9HoCR6DE8uhkU03KR4FUphpUmOTf/APTz+Xfiv3jly1wNzy6uEA
 QTGaJK53J7i7X0TZA/da7TQyDLrhdf7aoPcyc2j4Z2Ma8fqNTGQva1yYksIQySE2KbYXXnCW5cp
 k2Ez/J7CXBAIVvw=
X-Received: by 2002:a05:6820:3103:b0:696:7697:647a with SMTP id
 006d021491bc7-69e68b4a6e4mr14761594eaf.16.1781105638461; Wed, 10 Jun 2026
 08:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAJgzZorTqga=4+CnZ=1awR4A9YvV5Kq-Yw8QOS5PSvGoOkZBXw@mail.gmail.com>
 <CAJgzZooGLKb2SM1PUXeaX1fV3JZ2pU_3THo7USp2RXhxZGdNjQ@mail.gmail.com>
 <netazu42qvgnkmpd3yp6aftp72tp75oatonzcu5f3ilfkq56j5@6gbgzon56oyz>
 <20260610152410.spwucqqsbqwtaygh@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260610152410.spwucqqsbqwtaygh@kamilkon-DESK.igk.intel.com>
From: enh <enh@google.com>
Date: Wed, 10 Jun 2026 11:33:46 -0400
X-Gm-Features: AVVi8Cft2VrLOO2JsUvMStmyGfwbEf5l_UrPhXn0TSNkstVwqmtKIsWA2xS4Ogk
Message-ID: <CAJgzZorQPtbdGGvdPyddUq9Ru8x8+yZSXVA0aL-gW9=9uYOHNA@mail.gmail.com>
Subject: Re: [PATCH] fix android/riscv64 build with linux 7.0 uapi headers
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>, enh <enh@google.com>, 
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 igt-dev@lists.freedesktop.org
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

On Wed, Jun 10, 2026 at 11:24=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Krzysztof,
> On 2026-06-10 at 06:08:43 +0000, Krzysztof Karas wrote:
> > Hi enh,
> >
> > thanks for noting the differences between current igt and recent
> > linux changes. I'm adding Zbigniew and Kamil here, as they were
> > involved in the introduction of the patch you aim to fix below.
> >
> > Zbigniew, Kamil anything against the proposed change?
> >
> > On 2026-06-08 at 16:58:27 -0400, enh wrote:
> > > ping...
> > >
> > > On Thu, May 21, 2026 at 1:21=E2=80=AFPM enh <enh@google.com> wrote:
> > > >
>
> Change looks correct but cannot be apllied without proper s-o-b.
> See some nits below.
>
> > > > linux 7.0 adds a #include <linux/const.h> to the uapi header
> > > > include/uapi/header asm-riscv/asm/ptrace.h that breaks the
> > > > igt-gpu-tools build for android (which uses the upstream uapi heade=
rs
> > > > directly).
> > > >
> > > > the obvious fix is to just remove the #error (and the already-dead
> > > > duplicate #ifndef below it).
> > > >
> > > > this fixes the build, so it's all the change _i_ need, but i will n=
ote
> > > > two things:
> > > >
> > > > 1. your backup _AC() differs from the kernel one in that the kernel
> > > > one in that the kernel uses the double-expansion trick so that if
> > > > _AC() is _applied_ to a macro, that macro is expanded first. this
> > > > doesn't matter for your current use case, but is potentially a shar=
p
> > > > edge if further uses are added in future.
> > > >
> > > > 2. you don't seem to _need_ the _AC() macro at all? unless i'm miss=
ing
> > > > something, it's only used later in this same file by the _UL() and
> > > > _ULL() macros, which are themselves only used later in this same fi=
le.
> > > > so you could drop _all_ the macros and just explicitly write 0UL or
> > > > whatever.
> > > >
> > > > so there's potentially more cleanup you could do here, if you're in=
terested.
> > > >
> > > > (i don't have a gitlab account, so i'm assuming you also take patch=
es
> > > > via the mailing list.)
>
> No need for gitlab account, just send patch with s-o-b
> e-mail to ML. Also, no nicks in s-o-b, it should be your name,
> or are you ok if someone would take over this change?

oh, yeah, that would be great --- whatever fixes this fastest :-)

(i'm happy to test any alternative patch too. just cc: me [since i'm
not on the list] and i'll kick of an android build with the patch
locally.)

> > > > --- a/include/linux_scaffold.h
> > > > +++ b/include/linux_scaffold.h
> > > > @@ -22,16 +22,12 @@ static inline s64 sign_extend64(u64 value, int =
index)
> > > >         return (s64)(value << shift) >> shift;
> > > >  }
> > > >
> > > > +/* May already be defined by <linux/const.h> */
> > > >  #ifndef _AC
> > > >  #  define _AC(X, Y)      X##Y
> > > > -#else
> > > > -#  error "_AC macro already defined"
> > > >  #endif
>
> This should be __AC, not _AC macro:
>
> #ifndef __AC
> #  define __AC(X, Y)      X##Y
> #else
> #  error "__AC macro already defined"
> #endif
>
> Then below code could stay as is. Btw not sure if __AC
> error part still should be removed?

given that you're not _deliberately_ colliding with the kernel's names
here, like i say, i'd just inline the couple of UL and ULLs explicitly
and delete all this macro stuff that you don't really need ... but as
long as we can keep building against the linux 7 headers in android's
libc, anything's fine by me :-)

> Regards,
> Kamil
>
> > > >
> > > >  /* Make IGT build with Kernels < 4.17 */
> > > > -#ifndef _AC
> > > > -#  define _AC(X, Y)    __AC(X, Y)
> > > > -#endif
> > > >  #ifndef _UL
> > > >  #  define  _UL(x)              (_AC(x, UL))
> > > >  #endif
> >
> > --
> > Best Regards,
> > Krzysztof
