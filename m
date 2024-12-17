Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7C2E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 19:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3B610E3E3;
	Tue, 17 Dec 2024 19:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAEIa22C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A26210E3E3
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 19:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734463071; x=1765999071;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ykzDx5kEqEFbK1z+1yR74XZUmhE+ec/s0rR46A3FDyo=;
 b=SAEIa22C0U+N3g3Fq5zrU/iX3urGsjEMCpOTr9dg7E06vHDk04C2yrsV
 t9+lradC3pV2OCjx3m0XIkU4ixUSavFKVPhU3PrgeJfnpXaTUlst7CZdf
 WCT8eRKW7br01c8Rmla8W+GXRyVP/FZxlWy5LEjUzB4AjJJHUb82OHK9h
 fRZ6q3X/oizP1PdcRVheD4WSfX2/onKbz+nJ9wPxEWV0e5Q6P514qXIcB
 TEYP9/U1mi0uDhFNn6z7p7YaTanpyiZvQsSBdDJLnnyIiVDHMj08Wik3n
 tD3MwlSAt9D9lzhDPWNsx4kfun9hR6iOJoosPGrAT5H3d7dDPNxGOUkTl A==;
X-CSE-ConnectionGUID: xsIIusZCTDeE+hPjeny4OA==
X-CSE-MsgGUID: ESCRoyKjQ4ectGn4mQw68g==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="38684621"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="38684621"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 11:17:51 -0800
X-CSE-ConnectionGUID: vNFq49gvSKKZbkrrQRa5jw==
X-CSE-MsgGUID: b/6j2n1OTSuXvkf6GFhSxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97476568"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 11:17:49 -0800
Date: Tue, 17 Dec 2024 20:17:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, Ilia Levi <ilia.levi@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_core: Use suffix for casting to long to
 avoid overflow
Message-ID: <20241217191747.47pdi56ikddqkvff@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, Ilia Levi <ilia.levi@intel.com>
References: <20241217105807.94489-1-zbigniew.kempczynski@intel.com>
 <20241217164744.3phx2iddfzl3xwds@kamilkon-desk.igk.intel.com>
 <xftmhtseiintjbu3z7gkel6233bghjtagumlyamwox2yp2athh@m7fxvnl6cf7a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xftmhtseiintjbu3z7gkel6233bghjtagumlyamwox2yp2athh@m7fxvnl6cf7a>
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

Hi Lucas,
On 2024-12-17 at 12:03:49 -0600, Lucas De Marchi wrote:
> On Tue, Dec 17, 2024 at 05:47:44PM +0100, Kamil Konieczny wrote:
> > Hi Zbigniew,
> > On 2024-12-17 at 11:58:07 +0100, Zbigniew Kempczyński wrote:
> > 
> > please improve subject, imho better something like:
> > 
> > Avoid overflow in micro/nano-seconds calculations
> > or
> > Fix overflow in micro/nano-seconds calculations
> > 
> > or propose yourself one line description.
> > 
> > > Multiplication without using casting to long (long) for at least
> > > one argument in expression may cause overflow especially when we're
> > > using this for calculating timeouts in nanoseconds precision.
> > > 
> > > Ensure we're picking valid ul/ull suffix for base definitions for
> > > all dependents.
> > > 
> > > Reported-by: Ilia Levi <ilia.levi@intel.com>
> > > Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/163
> > > 
> > 
> > I agree here with Lucas, remove this empty line.
> > 
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Ilia Levi <ilia.levi@intel.com>
> > > ---
> > >  lib/igt_core.h | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/lib/igt_core.h b/lib/igt_core.h
> > > index 90f57402f0..1b6e70182b 100644
> > > --- a/lib/igt_core.h
> > > +++ b/lib/igt_core.h
> > > @@ -1517,11 +1517,17 @@ void igt_kmsg(const char *format, ...);
> > >  #define le32_to_cpu(x)  (x)
> > >  #endif
> > > 
> > > -#define MSEC_PER_SEC (1000u)
> > > +#if __WORDSIZE == 64
> > 
> > I am not sure if this is defined on all platforms where igt
> > is compiled, on musl and on non-Linux like FreeBSD,
> > why not make #ifndef/#define/#endif for __WORDSIZE ?
> 
> because if it's not defined, how are you going to decide which side of
> them to use?
> 
> from the tools/  include in kernel, one could do
> 
> #ifndef __WORDSIZE
> #define __WORDSIZE (__SIZEOF_LONG__ * 8)
> #endif
> 
> another possible solution is checking ULONG_MAX, like in dnf:
> 
> https://github.com/rpm-software-management/libdnf/pull/1159/files
> 
> but I think the kernel one is cleaner.
> 
> Lucas De Marchi
> 

Why not just 'sizeof(1ul) == 8' ?
Btw we still have problem here when sizeof(1ull) == 4
(I hope such architectures are out of our interest though)

Regards,
Kamil

> > 
> > BTW is it just sizeof(1ul) == 8 ?
> > 
> > With this fixed and subject improved
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > 
> > Regards,
> > Kamil
> > 
> > > +#define MSEC_PER_SEC (1000ul)
> > > +#define USEC_PER_MSEC (1000ul)
> > > +#else
> > > +#define MSEC_PER_SEC (1000ull)
> > > +#define USEC_PER_MSEC (1000ull)
> > > +#endif
> > > +
> > >  #define USEC_PER_SEC (1000u * MSEC_PER_SEC)
> > >  #define USEC_PER_DECISEC (100u * MSEC_PER_SEC)
> > >  #define NSEC_PER_SEC (1000u * USEC_PER_SEC)
> > > -#define USEC_PER_MSEC (1000u)
> > >  #define NSEC_PER_MSEC (1000u * USEC_PER_MSEC)
> > > 
> > >  #define for_if(expr__) if (!(expr__)) {} else
> > > --
> > > 2.34.1
> > > 
