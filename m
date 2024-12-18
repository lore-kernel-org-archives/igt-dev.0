Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C076DE77183
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 05:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8119310E228;
	Wed, 18 Dec 2024 05:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjPiA5a4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747D910E228
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 05:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734501219; x=1766037219;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=/lvZOV9g7gt+oInbZ4cvzHsWCilmOHdn8SywK8JYxdQ=;
 b=fjPiA5a4mbzSBW2JbVJdD2Bl6lIGMcJluD5S5jCdBr3MGEdzzCHK/lJE
 T8RCGMUkxVa6nUGJpnlsQ+duws2xnMArbiOGDsB83DDo+fupPImkhSNTV
 sLOJ6Y38XSbbbPLRkm+R6r6NjkPAmUYtkiZRqcg9jVWwxkJYUkynGcj3j
 LbnRYcIqBvUh6Vw8m0JeQxxG/6aWU+D1jXqfhmTJ0EYOjx3HwMA/Kqd0U
 xOHW/WqnVA51Tk9/C+Pf6TUJPSNIXq1AWX6O7uOSqUzkzwI/tnzOh7n+/
 8FB71lBnzCSjd2xUJQrLZmnMWlp61WXMJ7uBTtzV7NnZrfq2wiTADyVU9 g==;
X-CSE-ConnectionGUID: THmNJmHFRAS8+0tzqZ2LJg==
X-CSE-MsgGUID: z8QsZxJZQVSSC4YhEhqtXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="46351332"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="46351332"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:53:26 -0800
X-CSE-ConnectionGUID: E7LOiH8OR3CgHpK8CFKnuQ==
X-CSE-MsgGUID: 4Y/WY70qRbi4XuqnQVt/6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128739232"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:53:24 -0800
Date: Wed, 18 Dec 2024 06:53:20 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Ilia Levi <ilia.levi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_core: Use suffix for casting to long to
 avoid overflow
Message-ID: <20241218055320.v7kojwf2rprxgjad@zkempczy-mobl2>
References: <20241217105807.94489-1-zbigniew.kempczynski@intel.com>
 <20241217164744.3phx2iddfzl3xwds@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217164744.3phx2iddfzl3xwds@kamilkon-desk.igk.intel.com>
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

On Tue, Dec 17, 2024 at 05:47:44PM +0100, Kamil Konieczny wrote:
> Hi Zbigniew,
> On 2024-12-17 at 11:58:07 +0100, Zbigniew Kempczyński wrote:
> 
> please improve subject, imho better something like:
> 
> Avoid overflow in micro/nano-seconds calculations
> or
> Fix overflow in micro/nano-seconds calculations
> 
> or propose yourself one line description.
> 
> > Multiplication without using casting to long (long) for at least
> > one argument in expression may cause overflow especially when we're
> > using this for calculating timeouts in nanoseconds precision.
> > 
> > Ensure we're picking valid ul/ull suffix for base definitions for
> > all dependents.
> > 
> > Reported-by: Ilia Levi <ilia.levi@intel.com>
> > Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/163
> > 
> 
> I agree here with Lucas, remove this empty line.
> 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Ilia Levi <ilia.levi@intel.com>
> > ---
> >  lib/igt_core.h | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/igt_core.h b/lib/igt_core.h
> > index 90f57402f0..1b6e70182b 100644
> > --- a/lib/igt_core.h
> > +++ b/lib/igt_core.h
> > @@ -1517,11 +1517,17 @@ void igt_kmsg(const char *format, ...);
> >  #define le32_to_cpu(x)  (x)
> >  #endif
> >  
> > -#define MSEC_PER_SEC (1000u)
> > +#if __WORDSIZE == 64
> 
> I am not sure if this is defined on all platforms where igt
> is compiled, on musl and on non-Linux like FreeBSD,
> why not make #ifndef/#define/#endif for __WORDSIZE ?

I think it would be good to add this to build system, I base on
results on:

https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1331414

We already rely on __WORDSIZE in other places in the code (PRIx64)
so I've assumed it's safe to use it here.

--
Zbigniew

> 
> BTW is it just sizeof(1ul) == 8 ?
> 
> With this fixed and subject improved
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Regards,
> Kamil
> 
> > +#define MSEC_PER_SEC (1000ul)
> > +#define USEC_PER_MSEC (1000ul)
> > +#else
> > +#define MSEC_PER_SEC (1000ull)
> > +#define USEC_PER_MSEC (1000ull)
> > +#endif
> > +
> >  #define USEC_PER_SEC (1000u * MSEC_PER_SEC)
> >  #define USEC_PER_DECISEC (100u * MSEC_PER_SEC)
> >  #define NSEC_PER_SEC (1000u * USEC_PER_SEC)
> > -#define USEC_PER_MSEC (1000u)
> >  #define NSEC_PER_MSEC (1000u * USEC_PER_MSEC)
> >  
> >  #define for_if(expr__) if (!(expr__)) {} else
> > -- 
> > 2.34.1
> > 
