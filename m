Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D80CD98C6
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 15:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AC110EA21;
	Wed, 10 Jun 2026 15:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LB1mEVZP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641EC10EA11
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 15:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781105054; x=1812641054;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Nl1pk/nxE6qnaBhY3q9MabVnf17e5x9EvzBOCr5KoiI=;
 b=LB1mEVZP/m1PCLBw5SeVzNzAm8La9ldG66m/egbkO2NXC1O86XTd1D72
 HYtDY1PPUo4fq6GJE4Lvv0rHC42S9aZR/lav2wyOR5xK40eTHvsElbMYu
 mLpi+gfzsoiwCuLegHuYvAfNLjW/M3rTl5J6DY16kOJGev5fOU+iEv7a1
 mmCpaU0qTDLR3BTvLOW5PiN+2f27RYEnjvD604+E6dIiHrQ9cZtboeNX1
 vHYErZ4JoP1G7jiNFIf2c2i9iNFnl0D9Zr1LgEd3IF6eUqa+Lz/SMBmLH
 8P9z8DPTkobil+iuL7PWksnZAQgzqL9OltbiA9NBl9mIhwpdksJJvPbAx Q==;
X-CSE-ConnectionGUID: bpZNiSmVQtuJ4AdiOr0jhA==
X-CSE-MsgGUID: wDy7wmtkT5ONMeQB0DiZOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84471740"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="84471740"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 08:24:13 -0700
X-CSE-ConnectionGUID: 87qJW1qqRuWMFDv7XqZKBw==
X-CSE-MsgGUID: 4whGd6t+TByXihRnvB8YeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="243739263"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 08:24:13 -0700
Date: Wed, 10 Jun 2026 17:24:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: enh <enh@google.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] fix android/riscv64 build with linux 7.0 uapi headers
Message-ID: <20260610152410.spwucqqsbqwtaygh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>, enh <enh@google.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <CAJgzZorTqga=4+CnZ=1awR4A9YvV5Kq-Yw8QOS5PSvGoOkZBXw@mail.gmail.com>
 <CAJgzZooGLKb2SM1PUXeaX1fV3JZ2pU_3THo7USp2RXhxZGdNjQ@mail.gmail.com>
 <netazu42qvgnkmpd3yp6aftp72tp75oatonzcu5f3ilfkq56j5@6gbgzon56oyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <netazu42qvgnkmpd3yp6aftp72tp75oatonzcu5f3ilfkq56j5@6gbgzon56oyz>
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

Hi Krzysztof,
On 2026-06-10 at 06:08:43 +0000, Krzysztof Karas wrote:
> Hi enh,
> 
> thanks for noting the differences between current igt and recent
> linux changes. I'm adding Zbigniew and Kamil here, as they were
> involved in the introduction of the patch you aim to fix below.
> 
> Zbigniew, Kamil anything against the proposed change?
> 
> On 2026-06-08 at 16:58:27 -0400, enh wrote:
> > ping...
> > 
> > On Thu, May 21, 2026 at 1:21 PM enh <enh@google.com> wrote:
> > >

Change looks correct but cannot be apllied without proper s-o-b.
See some nits below.

> > > linux 7.0 adds a #include <linux/const.h> to the uapi header
> > > include/uapi/header asm-riscv/asm/ptrace.h that breaks the
> > > igt-gpu-tools build for android (which uses the upstream uapi headers
> > > directly).
> > >
> > > the obvious fix is to just remove the #error (and the already-dead
> > > duplicate #ifndef below it).
> > >
> > > this fixes the build, so it's all the change _i_ need, but i will note
> > > two things:
> > >
> > > 1. your backup _AC() differs from the kernel one in that the kernel
> > > one in that the kernel uses the double-expansion trick so that if
> > > _AC() is _applied_ to a macro, that macro is expanded first. this
> > > doesn't matter for your current use case, but is potentially a sharp
> > > edge if further uses are added in future.
> > >
> > > 2. you don't seem to _need_ the _AC() macro at all? unless i'm missing
> > > something, it's only used later in this same file by the _UL() and
> > > _ULL() macros, which are themselves only used later in this same file.
> > > so you could drop _all_ the macros and just explicitly write 0UL or
> > > whatever.
> > >
> > > so there's potentially more cleanup you could do here, if you're interested.
> > >
> > > (i don't have a gitlab account, so i'm assuming you also take patches
> > > via the mailing list.)

No need for gitlab account, just send patch with s-o-b
e-mail to ML. Also, no nicks in s-o-b, it should be your name,
or are you ok if someone would take over this change?

> > >
> > > --- a/include/linux_scaffold.h
> > > +++ b/include/linux_scaffold.h
> > > @@ -22,16 +22,12 @@ static inline s64 sign_extend64(u64 value, int index)
> > >         return (s64)(value << shift) >> shift;
> > >  }
> > >
> > > +/* May already be defined by <linux/const.h> */
> > >  #ifndef _AC
> > >  #  define _AC(X, Y)      X##Y
> > > -#else
> > > -#  error "_AC macro already defined"
> > >  #endif

This should be __AC, not _AC macro:

#ifndef __AC
#  define __AC(X, Y)      X##Y
#else
#  error "__AC macro already defined"
#endif

Then below code could stay as is. Btw not sure if __AC 
error part still should be removed?

Regards,
Kamil

> > >
> > >  /* Make IGT build with Kernels < 4.17 */
> > > -#ifndef _AC
> > > -#  define _AC(X, Y)    __AC(X, Y)
> > > -#endif
> > >  #ifndef _UL
> > >  #  define  _UL(x)              (_AC(x, UL))
> > >  #endif
> 
> -- 
> Best Regards,
> Krzysztof
