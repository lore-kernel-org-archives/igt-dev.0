Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13714C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920D010EB56;
	Thu, 21 Mar 2024 15:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AUidJqSg";
	dkim-atps=neutral
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079AE10EB56
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:02:31 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2d28051376eso22321061fa.0
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 08:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711033350; x=1711638150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e0g78SLmzCQXz1XTV5o5A3NEK+W5b1alppFNtx1SK88=;
 b=AUidJqSgdVHMLcdGfuhI6LqsTxUm0CT/xmnU4ABAGmgKTFfRbimOCv8fZVvvC+I6wr
 PVQ1sIoVxoUckzLzqW6DVl+SJKe0jg7oNEqsXnCZvZ7yE8F3gGW4X7y3tFty0gP+o4Ya
 gjtNu/5rLGQ0hChxF4Dt3TWYvf9iA82DXk5d6GoBbWZ9u91HGPnog6JDeO/dPyZxY/MN
 PPNBI7/lM5rfbyMu0pwOgj7l6nlz5niwwFjO8bNEH2O2Sf1+kZ/+EEvla8dkab3daQ7m
 tF510hspVynM2PWvhuVGwJtVeMg/CfeJMDIZRpNgiMaupdY9fH/Q9D+7b1Q3Fn/77K85
 DQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711033350; x=1711638150;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e0g78SLmzCQXz1XTV5o5A3NEK+W5b1alppFNtx1SK88=;
 b=sOsG6H8jmkYtxTiN2qKVAhAR/hgAnAepeBg8R+cFhQwveGpusHMg0DPN5N3tkLYnEW
 WtY1PSB/Cd8Tpsy6CZUJH2r/ZyfG+dBhgQbfIYwkPQsgdN6rgGLML9MSvSthUpq/n0Pc
 zuanZNxfR9zfiT5TdIas0ekrcaQTMS+4AEBk35o8twNBAXH8Imr96l0wB0rsDxgQvKaD
 coa2B20lbuieNmtfmf4knv9Zidm0kN7MZbQydnxP/v/QOWnE0zxJjnaic1Zl8dcIwv/u
 IY9t0l2Cj+xbY1mEuOP8TgA2BAKxhfGqf1deJU/L/BrlWxftxLCjeHvGp41NIyQs2Q+I
 E/jg==
X-Gm-Message-State: AOJu0YwSBNKKmhRWeNJhj2778RYFoTpQnv0c6cPFxWptCghYcG/aSEIo
 6kyj59POjSuSE6w5GzpDlm9bJh2AwnLNshuIhpcoeX3Wj7Pb3Ua3yrmK8tLtVg+fPWfsDDlzmuu
 r+XASggwvQE93fGJ1p1KDQ+Wd3P5aXFlLFqk=
X-Google-Smtp-Source: AGHT+IFzKx8jE9vD6o9D3YfE/QePBaAn0c0Ua8uqbJJQv23vl9cPYi1f8/bUH7y8JqIuRQ1kx2w0wtgp4j5SVCl3spM=
X-Received: by 2002:a2e:3e07:0:b0:2d4:6893:24e1 with SMTP id
 l7-20020a2e3e07000000b002d4689324e1mr1794154lja.50.1711033349218; Thu, 21 Mar
 2024 08:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240304221800.1161896-1-mattst88@gmail.com>
 <20240313090911.27uhiwrd6de256dc@zkempczy-mobl2>
 <CAEdQ38F2TANoeavq6UvBHE_4kYkeLViNDMY==8cCEKTikdP1Ow@mail.gmail.com>
 <20240321070310.iydocnqqgxxigisz@zkempczy-mobl2>
In-Reply-To: <20240321070310.iydocnqqgxxigisz@zkempczy-mobl2>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 21 Mar 2024 11:02:16 -0400
Message-ID: <CAEdQ38FeutN1yPkK4ymmeb0YPeg85wo56s61w1wMQr9kPHspZw@mail.gmail.com>
Subject: Re: [PATCH i-g-t] lib: Inline igt_x86_features() into ifunc resolvers
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
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

On Thu, Mar 21, 2024 at 3:03=E2=80=AFAM Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
>
> On Wed, Mar 20, 2024 at 11:09:11PM -0400, Matt Turner wrote:
> > On Wed, Mar 13, 2024 at 5:09=E2=80=AFAM Zbigniew Kempczy=C5=84ski
> > <zbigniew.kempczynski@intel.com> wrote:
> > >
> > > On Mon, Mar 04, 2024 at 05:16:40PM -0500, Matt Turner wrote:
> > > > Quoting https://sourceware.org/glibc/wiki/GNU_IFUNC
> > > >
> > > > > When LD_BIND_NOW=3D1 or -Wl,z,now is in effect symbols must be
> > > > > immediately resolved at startup. In cases where an external funct=
ion
> > > > > call depends needs to be made that may fail if such a call has no=
t
> > > > > been initialized yet (PLT-based relocation which is processed lat=
er).
> > > > > For example calling strlen in an IFUNC resolver built with -Wl,z,=
now
> > > > > may lead to a segfault because the PLT is not yet resolved.
> > > >
> > > > We cannot rely on function calls through the PLT in ifunc resolvers=
 as
> > > > the PLT may not have been initialized yet.
> > > >
> > > > In practice, this causes crashes when igt is linked with -Wl,-z,now=
 or
> > > > when linked with the mold linker.
> > > >
> > > > To avoid this problem, we do two things:
> > > >     1. move igt_x86_features() to igt_x86.h so its definition is
> > > >        available to compilation units that call the function.
> > > >     2. mark the ifunc resolvers with __attribute__((flatten)) to en=
sure
> > > >        igt_x86_features() is inlined.
> > > >
> > > > Bug: https://bugs.gentoo.org/788625
> > > > Bug: https://bugs.gentoo.org/925348
> > > > Signed-off-by: Matt Turner <mattst88@gmail.com>
> > >
> > > Hi.
> > >
> > > I started review of your code, but this this touches some linking int=
risics
> > > I'm not familiar with yet so I need more time to explore this. I hope
> > > this is not a problem for you.
> >
> > Do you have any questions I can answer? I tried my best to explain the
> > how and the why of the change in the commit message.
>
> I wanted to prepare better for the discussion - I extracted few
> functions on which I'm reproducing segv issue when LD_BIND_NOW=3D1 is set=
.
> I confirm, GOT doesn't contain valid function addresses so jump goes
> to nowhere. I'm pretty sure intel_vbd_decode with LD_BIND_NOW=3D1 only
> reveals the problem, but it lays within linker logic:
>
> # LD_BIND_NOW=3D1 LD_PRELOAD=3D./build/lib/libigt.so.0 LD_DEBUG=3Dall ps
>
> ps definitely doesn't call igt_half_to_float() which in turn calls
> unresolved igt_x86_features@plt. It looks linker first tries to
> call all ifunc's to establish addresses, unfortunately it is doing
> this before filling GOT. Backtrace shows we're still in _start
> from /lib64/ld-linux-x86-64.so.2 so we even didn't get a chance
> to get to the main().

Right, exactly. I believe ifuncs are resolved regardless of whether
they're used.

> Before I'll give you my ack (I still want to experiment with this
> one more day) - may you explain what for you need to bind relocs
> immediately? This is slower than lazy binding as it resolves all
> PLTs instead resolving only required symbols.

Gentoo/Hardened uses `-z now` to improve security. By binding upfront,
the loader can mark the GOT as read-only for a security enhancement.
See https://wiki.gentoo.org/wiki/Hardened/Toolchain for more details.

Apparently (according to that page) `-z now` will become the default
in standard Gentoo profiles very soon.
