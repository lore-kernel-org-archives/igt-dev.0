Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AF2CD8CA4
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 20:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3EF10E1BE;
	Mon,  8 Jun 2026 20:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="MuTZopLs";
	dkim-atps=neutral
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989BA10E1BE
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 20:58:39 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-43d2c7b5a6aso3741194fac.0
 for <igt-dev@lists.freedesktop.org>; Mon, 08 Jun 2026 13:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780952319; cv=none;
 d=google.com; s=arc-20240605;
 b=ehUEtmkTC/3ZouwrqOfVg7fAHvKh3JCrp/ayYTn6nYUe/tYa7GMoBOm8lVd/puJEq3
 jlvHp6JnkQeBJk7v5dvFTNfYy3b6MxCvyjR75bLCWMBuLi3IielbTJNfNiUghSOBf6XZ
 6s7Jyvvb8L6y34zqC+j9PspdPr22Pcga75kvGD2JMriAZ8r0RqPGG5rnSK2Glj0GyZzO
 wS9fJZWgYi2bcSIbnGiRlmg8xh1/AYU0U7SD9EAPlIgDzc444Ff30+wGAg747zBG+7H+
 H/ptBLwYRgYD19rU+KwQukIdcsIpaomyK9vBPwYeGoSsczTE/WcY0T/2goc2KzKblFzA
 BCVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=lgcK9xyd8jnkKESAWdawMjLLvJiOqsSLpD0P9SvXUzA=;
 fh=EX0PTiD1xokl/cAGDPMTEx05jGXdhO5EftfjRYYG43A=;
 b=GVAtwx5yAp9pgMugIVkOcVI6syT9SuRmHJAv7SsWjiTeZ9kN6x/IEwwy2QSvNVBGhX
 o2tB/ppNL/GYpRnJQiJ3iVFd9OOULsIJt4B3nKJMZpSkfb27N9ofCWRm5gXwGN+CaoIq
 6fMlzMGZ4OU1hkltEciiOWFuD32Aq+0TOBaJfvZCKfdYjn2KdYnmsvh0yolQLRdKZS+C
 lC4YUK6MJhiYyUtVfDPQDvH7D1I7YytKD3VwNlMm+cGhMKUG1YjLRfiCCQiFiUW8qN6r
 xiRrGqlJsnQdxw0bLt5LN8IXehST43njKSo+adCrw94hC8SguOPd14PsP1wWHhuiqmFn
 /o2w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1780952319; x=1781557119;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lgcK9xyd8jnkKESAWdawMjLLvJiOqsSLpD0P9SvXUzA=;
 b=MuTZopLssJsDcBZWcvSTqbOagvL9aNI/2tXQlDkYEqupCfUwT9O9CWCg+jTybD85EA
 OLVhUizeDLxs4vJAxENNv8kXSb4uctqokM6fkijA86PEJ2LGTZXIYRhoE/Jf94X83dTE
 AKEdffYLzkhXO9VH/g/wnBVcKoXQlOVRXeR6AetKCil2TrYquoesRWxjW85KAjt9eojP
 pyr4qrHIL6+MoLdqocLd5TX9+JiJ0s4qlTvQ6EhNXAleRz04v4z4gRVOF0N0xp05VHoC
 92hZqd84yvmLUdx4y/qwepMXsEwaH8Nj8k6RXi1l+TwEaboOMThKEclNZ5+c2gzMdzTy
 B+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780952319; x=1781557119;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lgcK9xyd8jnkKESAWdawMjLLvJiOqsSLpD0P9SvXUzA=;
 b=sH/LPOFt20UQvmv0Ud4y5H6ya1RcokWDaQOe0/MLuVFW7D3QAkf5+aLTkDUWXavJhe
 h2A6GuDgkP4cPPe1rp77fC2EsBp4nqReQmO5Z6MWHP2zTKfdoEEKHGQpnu+RzifDE1vF
 +7I4F/WjuD1OZSTYGs+mjXR9U2rxGsWW0oAFKXvFM+5YeTKYDurOCqssD66USwvYBBoq
 MTOq4nivCDtEd/tAu+eDqQEDl6orzCr7o7VGqSqSofcCOCqJN4BozARJHoxc5EJ4qSse
 7fWcnB5LDmgf2dMuxCU9O9IJs7h/MTC0TU1boLtEjbk4NJggF+SXHyj7w5qsw5J9ZQaL
 zedQ==
X-Gm-Message-State: AOJu0YzSkbjDwZvSnkQODaSzhyfkWkdctHuDDT9qjJwFIY9jHh5K0lEc
 QgxyXY9P2lxAImHD+fmwyv1PgK3ItUBcKrV10EgaMmwmMPupJQRFPMG22GnFHU+X7Pi5ryx6erv
 XnlFR4L4a01fXfYXf3jqOBe60LSoV7HVuOkswZWt4hKMkAz4keeXwW5ey
X-Gm-Gg: Acq92OES+lZYOx1GsROIfVMOl0Ns7LrpUuY7BqDMkCVSboZQ0eUnGBE4ijajvwFZ+Hg
 nMxRHOicHiLZkrM7oBdnK1h4sCxvlRTVt9ykdD2lr85kgMJZENBW5+A3TEaoaA4DJmoT2Ahxc2U
 mxVMkozdCXRSgbBIQ98EclKCYS+Eei8DkBzXLgWHn9EJZ4mPEp0zSYrRJJXtb9K7rSoGKqcgjNG
 NkFL3zlZPabo0PlcbDdroj7/D3tWM5P1fXZAYuOXJ1pw4wxAvva86jsmZlLneJOXTvCSfsdxcON
 BVcE6jyJkkXvg4k86qAzOWwdZQ==
X-Received: by 2002:a05:6870:c191:b0:42f:c146:da68 with SMTP id
 586e51a60fabf-4413d837a93mr8747294fac.16.1780952318184; Mon, 08 Jun 2026
 13:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAJgzZorTqga=4+CnZ=1awR4A9YvV5Kq-Yw8QOS5PSvGoOkZBXw@mail.gmail.com>
In-Reply-To: <CAJgzZorTqga=4+CnZ=1awR4A9YvV5Kq-Yw8QOS5PSvGoOkZBXw@mail.gmail.com>
From: enh <enh@google.com>
Date: Mon, 8 Jun 2026 16:58:27 -0400
X-Gm-Features: AVVi8CdQeE9mXfYwnNIwQzVlrzB5DRUckwL0DAfi_eJzqMaqYagMUIfoUfGpHdY
Message-ID: <CAJgzZooGLKb2SM1PUXeaX1fV3JZ2pU_3THo7USp2RXhxZGdNjQ@mail.gmail.com>
Subject: Re: [PATCH] fix android/riscv64 build with linux 7.0 uapi headers
To: igt-dev@lists.freedesktop.org
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

ping...

On Thu, May 21, 2026 at 1:21=E2=80=AFPM enh <enh@google.com> wrote:
>
> linux 7.0 adds a #include <linux/const.h> to the uapi header
> include/uapi/header asm-riscv/asm/ptrace.h that breaks the
> igt-gpu-tools build for android (which uses the upstream uapi headers
> directly).
>
> the obvious fix is to just remove the #error (and the already-dead
> duplicate #ifndef below it).
>
> this fixes the build, so it's all the change _i_ need, but i will note
> two things:
>
> 1. your backup _AC() differs from the kernel one in that the kernel
> one in that the kernel uses the double-expansion trick so that if
> _AC() is _applied_ to a macro, that macro is expanded first. this
> doesn't matter for your current use case, but is potentially a sharp
> edge if further uses are added in future.
>
> 2. you don't seem to _need_ the _AC() macro at all? unless i'm missing
> something, it's only used later in this same file by the _UL() and
> _ULL() macros, which are themselves only used later in this same file.
> so you could drop _all_ the macros and just explicitly write 0UL or
> whatever.
>
> so there's potentially more cleanup you could do here, if you're interest=
ed.
>
> (i don't have a gitlab account, so i'm assuming you also take patches
> via the mailing list.)
>
> --- a/include/linux_scaffold.h
> +++ b/include/linux_scaffold.h
> @@ -22,16 +22,12 @@ static inline s64 sign_extend64(u64 value, int index)
>         return (s64)(value << shift) >> shift;
>  }
>
> +/* May already be defined by <linux/const.h> */
>  #ifndef _AC
>  #  define _AC(X, Y)      X##Y
> -#else
> -#  error "_AC macro already defined"
>  #endif
>
>  /* Make IGT build with Kernels < 4.17 */
> -#ifndef _AC
> -#  define _AC(X, Y)    __AC(X, Y)
> -#endif
>  #ifndef _UL
>  #  define  _UL(x)              (_AC(x, UL))
>  #endif
