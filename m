Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC079C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 03:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314B710EE18;
	Thu, 21 Mar 2024 03:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l1JBWoDQ";
	dkim-atps=neutral
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AAC10EE18
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 03:09:25 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d48f03a8bbso14861421fa.0
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 20:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710990564; x=1711595364; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MUioduBdLUazsxO28UIWDZyXElRa4JZ8tu49q43RI04=;
 b=l1JBWoDQJ1BJh7ZveAJda7V0uqpxnQjPBMqB+lbL1/JpHlSd/jXnM7tpUNzvofBPfg
 es8XRkX6yJzj7JMfDufnKJLTFmPQR/DOCROeLhybb8UJLyvCtZFV9W2AhihDphAswu07
 XY8QCYkKYJMCaG0fppE73skfccY3MBU0i/SgjJ8Dh47sramHBXLl75Sx7+4C1hHZaJft
 qYg3iAFdi89aQydoji3ZotzC0S1P1Ec2NwJGbvlmxr9ABLsjRX0SgccHpmMzK4DRYFQe
 TXg2A7XyYMmfxItN5zKhUaZ0XRq0NeLDu9VpJKrCafhosV+nfa5tpqrBb/Mq9ZqvLuGD
 6Zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710990564; x=1711595364;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MUioduBdLUazsxO28UIWDZyXElRa4JZ8tu49q43RI04=;
 b=SxhwTpjc6J135JoNnD0dAOxhDnW3mesur0HsOv5mgI7pXOACdE+aLEbUR3xJjoqWKy
 fSHhYGGClg17mqN9OZZjZYJKtYwssLqSUVepo5BSw80QjooNO7/WskFY/m/WGfDbt9Mu
 tkupHdmOPai0V9OmtCX022pAVrOwgRyT7I3IQXqqezCddMLFe2Uk7C5AG9c5dOSBJox6
 owhHTxY/1VX9VoH1aCift5pTnH0PJ8/qbX4py7VVbbNaN8F244uHF0Lsy7OTAEpF5R/v
 ipOLPp6QDeG6E/o02Velo9n87LdVgVJ1THdcDA8uvWc1ujTDR6DA2HOIVUk8t6D9352N
 RS2w==
X-Gm-Message-State: AOJu0YxLUyehJVzmB6+h0pmVsQ436SIYADsz/A7Z3Mcfxb7uU7aejnSU
 MeAY70yFY1QV0uOChD3RPmR6l0vd6gHQ44WVpPZPZW3z2OiT2jkqowdHZPWlGNeUhRt9aC3PmFs
 tK5PrhwM1eerosWX5Zb4sUsxyj1o=
X-Google-Smtp-Source: AGHT+IFcHqdOb0u8eNZcgeEWdjEYt7qMrDExizBNH1rtZRiGhggyy546io/+ponfZwzRlTfLdFDW7M1H4ZKSGJ6bJ3g=
X-Received: by 2002:a2e:2e03:0:b0:2d4:91c4:fca8 with SMTP id
 u3-20020a2e2e03000000b002d491c4fca8mr487072lju.11.1710990563526; Wed, 20 Mar
 2024 20:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240304221800.1161896-1-mattst88@gmail.com>
 <20240313090911.27uhiwrd6de256dc@zkempczy-mobl2>
In-Reply-To: <20240313090911.27uhiwrd6de256dc@zkempczy-mobl2>
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 20 Mar 2024 23:09:11 -0400
Message-ID: <CAEdQ38F2TANoeavq6UvBHE_4kYkeLViNDMY==8cCEKTikdP1Ow@mail.gmail.com>
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

On Wed, Mar 13, 2024 at 5:09=E2=80=AFAM Zbigniew Kempczy=C5=84ski
<zbigniew.kempczynski@intel.com> wrote:
>
> On Mon, Mar 04, 2024 at 05:16:40PM -0500, Matt Turner wrote:
> > Quoting https://sourceware.org/glibc/wiki/GNU_IFUNC
> >
> > > When LD_BIND_NOW=3D1 or -Wl,z,now is in effect symbols must be
> > > immediately resolved at startup. In cases where an external function
> > > call depends needs to be made that may fail if such a call has not
> > > been initialized yet (PLT-based relocation which is processed later).
> > > For example calling strlen in an IFUNC resolver built with -Wl,z,now
> > > may lead to a segfault because the PLT is not yet resolved.
> >
> > We cannot rely on function calls through the PLT in ifunc resolvers as
> > the PLT may not have been initialized yet.
> >
> > In practice, this causes crashes when igt is linked with -Wl,-z,now or
> > when linked with the mold linker.
> >
> > To avoid this problem, we do two things:
> >     1. move igt_x86_features() to igt_x86.h so its definition is
> >        available to compilation units that call the function.
> >     2. mark the ifunc resolvers with __attribute__((flatten)) to ensure
> >        igt_x86_features() is inlined.
> >
> > Bug: https://bugs.gentoo.org/788625
> > Bug: https://bugs.gentoo.org/925348
> > Signed-off-by: Matt Turner <mattst88@gmail.com>
>
> Hi.
>
> I started review of your code, but this this touches some linking intrisi=
cs
> I'm not familiar with yet so I need more time to explore this. I hope
> this is not a problem for you.

Do you have any questions I can answer? I tried my best to explain the
how and the why of the change in the commit message.
