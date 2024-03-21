Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEB2C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 18:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6AB10F91F;
	Thu, 21 Mar 2024 18:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d6J0+kjc";
	dkim-atps=neutral
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4612210F91F
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 18:32:05 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d24a727f78so15885621fa.0
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 11:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711045923; x=1711650723; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAcwlvacFf9DtRay1LOHIqU6WEKZZs0TeSm+RujXOp4=;
 b=d6J0+kjcY7QzXW9fXlr81hpYea8kQW3SxaD0br3TNHiIm4GNRpwmgUW2n62Hh/Sz/f
 DYoRjd+Ns2dmZRdYDG+4Kd8wd0NAvoeM9lvxaYX6SMTEZndWH68Oe8fTDxIZv3wk440S
 BM61aSfb8GoNk1a/eAClHv4RNJ5P8IaCgKK5wfcmIe75H/xBWmIXEnElmtVx02c0zFlx
 oxMcCNJq+1GvgB/qOcS1vKnxWlFZ3agM5XtsvehozUu6J5dBRr4VNHi9S8+XfYL2RHAl
 EBDuaBsJPyVF4OVk67MGCWcbdM/EzJoDgGjBaf9z12hz3Ienljm8QTY1QqodJS8I1P/t
 rOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711045923; x=1711650723;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAcwlvacFf9DtRay1LOHIqU6WEKZZs0TeSm+RujXOp4=;
 b=Ks1bDUQsRuDp/sHfQ9sGeDWkApK9o5Syhh2qQVo0ZppIYdAht2ygwfV1qEVpugl/O2
 voT6fcUGHRwz8gnYQyAte21iNVJA98ssQC0osUEll+I21jBBsVnTtz4aDzktUWwzqLGB
 9KeHffJSuGGdYmMKshQeqZGEeM4FYhYUCuXW+wbtzGWdai1Em6ts1aKQTnRQAEQANLqJ
 kUNaD8E5Ak8I5LSMDfh1nzHVzVxvHvebaaS9iUIDn3OwUiC32lmmaisWr8jOMKq2MRQm
 ZR/NsBszgvIGal78fPbJ/Dh5kET9oMFJblIeS1rWGXUksxIAfAoMaL8x48y4nMvAVx1W
 9Mbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtu+SSskmbrGLYBM7+uw+QoTOBQMjU8CUqIz+T6+j+YJ+/HM0/HFUI1osnSrdyg3RA5+Har1PrCbiDPiUIS/ylcAcWBUBQHkPtj9REKw==
X-Gm-Message-State: AOJu0YxrVmjAvqVvFQTtR2JciTowOW7WdJGj9POB7QOweR9isF0/CDBh
 9G8mM94I1atBehDND5NghlSvCeJvLdGtq84DqPDlFK9zzSyVbZJaEfruSpxJR/fYyOmb53tJxlh
 4SWNrTzJtR/0I+ZTCAV2RfPcXhhQ=
X-Google-Smtp-Source: AGHT+IE1ryTD3D5Wgk3pt84Oqp0JBZOPRSrmRE9qSZAw9z9t/O0pd1kJ4a57cdJHI1LtiQPMYgt4JbQ4Xn0kbidqPzs=
X-Received: by 2002:a2e:8686:0:b0:2d4:842:dabe with SMTP id
 l6-20020a2e8686000000b002d40842dabemr270123lji.36.1711045922981; Thu, 21 Mar
 2024 11:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240304221800.1161896-1-mattst88@gmail.com>
 <20240321181755.iaqgm6mvt6iokxmi@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240321181755.iaqgm6mvt6iokxmi@kamilkon-desk.igk.intel.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 21 Mar 2024 14:31:50 -0400
Message-ID: <CAEdQ38HbHuQoQNGdXWstkK1GpayH-L09Ac2zCKvkuno3hYecsQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t] lib: Inline igt_x86_features() into ifunc resolvers
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Matt Turner <mattst88@gmail.com>, 
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
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

On Thu, Mar 21, 2024 at 2:18=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Matt,
> On 2024-03-04 at 17:16:40 -0500, Matt Turner wrote:
> > Quoting https://sourceware.org/glibc/wiki/GNU_IFUNC
> >
> > > When LD_BIND_NOW=3D1 or -Wl,z,now is in effect symbols must be
> > > immediately resolved at startup. In cases where an external function
> > > call depends needs to be made that may fail if such a call has not
> > > been initialized yet (PLT-based relocation which is processed later).
> > > For example calling strlen in an IFUNC resolver built with -Wl,z,now
> > > may lead to a segfault because the PLT is not yet resolved.
> >
>
> Add here (or at begin of patch?) that this is needed for Gentoo/Hardened
> security improving.

Thanks. I'll address the comments and send a v2.

To be clear, it's not *just* Gentoo/Hardened that wants this. E.g.
Fedora switched to -z now by default ages ago (F23 according to
https://fedoraproject.org/wiki/Changes/Harden_All_Packages) and
they've been overriding it for igt specifically since then. See
https://src.fedoraproject.org/rpms/igt-gpu-tools/blob/rawhide/f/igt-gpu-too=
ls.spec#_116

Aside: they also appear to have a script to make git snapshots, likely
indicating that they'd like to have more frequent releases of igt
(like Gentoo would as well).
