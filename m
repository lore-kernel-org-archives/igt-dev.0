Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3454C3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 12:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD06D10E121;
	Mon, 31 Mar 2025 12:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YoyDcOEa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7445910E121
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 12:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743425341; x=1774961341;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=trDvFy2aDkAzZ8qBQ7tdBmaMr4oCfPydchGgK8f5tO8=;
 b=YoyDcOEay5v462q9E61oW6FDi9hahCDV1SdOnwr4a5XD212RkQb+5iOS
 V1eHZ0r5W4lJXuq7ONPde4x94CcbqVs7YsaS9z03UIOIu9wmBRSEXg6/I
 Z1Ir9qxvWqUdvTnz5EsOpaEO4MSKeSLPDyBHAuICRaIp37mvRDX7JINe7
 v8FR2wKfgIreCpYpQGx8uZjsrSB5Oed9uRv9Ynp3yd59Sc90qHQGet8Ry
 s2gvz+FPdmc6UxsWKOGsxpbHxf+yPvAnklQZpAgJevD8Swz0LZD31RG5i
 QSqUWpFoidIkNdqxYl/iFSrndYTKJvZZYQP3lguYER0sIW6HEw6mjINRi A==;
X-CSE-ConnectionGUID: mcfdkjO9TjG8cHrkE+0g1g==
X-CSE-MsgGUID: VLlPl+QiR4eTM7DXfOsXxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="47432674"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="47432674"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 05:48:56 -0700
X-CSE-ConnectionGUID: qxPocxG4QteMPgQcQ8ikSw==
X-CSE-MsgGUID: VqPw8EO+SiKfbl3VroHKlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="130193791"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 05:48:54 -0700
Date: Mon, 31 Mar 2025 14:48:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH i-g-t v1 2/2] CONTRIBUTING: Add guide about igt libraries
Message-ID: <20250331124835.3mndwwv7ygfwfure@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20250327153139.37746-1-kamil.konieczny@linux.intel.com>
 <20250327153139.37746-3-kamil.konieczny@linux.intel.com>
 <20250331101412.jng7xwv7kkzkc4sc@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250331101412.jng7xwv7kkzkc4sc@zkempczy-mobl2>
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

Hi Zbigniew,
On 2025-03-31 at 12:14:12 +0200, Zbigniew Kempczyński wrote:
> On Thu, Mar 27, 2025 at 04:31:30PM +0100, Kamil Konieczny wrote:
> > Add some general guide about adding new library function and
> > a few guides for their usage outside of tests.
> > 
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

+cc Andrzej

> > ---
> >  CONTRIBUTING.md | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> > index b571b5e68..d85266a6c 100644
> > --- a/CONTRIBUTING.md
> > +++ b/CONTRIBUTING.md
> > @@ -38,6 +38,33 @@ The Code
> >  
> >  [igt-describe]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
> >  
> > +IGT libraries
> > +-------------
> > +- Tests and benchmarks are the main usage of IGT libraries, so they
> > +  could use test specific macros/functions, for example igt_assert,
> > +  igt_require, igt_skip, igt_info or igt_debug.
> > +
> > +- New library function could be written when it will have at least two
> > +  different users, for example if it could be used by two or more tests.
> 
> I think there's some exception and single user could be allowed. When
> it is very likely function will be used in the future I would accept
> single user of such library function.
> 

Right, I will add:

In some cases single user can be accepted, when it is very
likely it will be used in future.

> > +
> > +- In a new library function():
> > +  if it has macros (for example igt_assert/igt_require/igt_skip) then
> > +    write also __function() counterpart without them;
> > +  limit also usage of prints igt_info/igt_debug, this should be a part
> > +    of test code.
> 
> What if function has some input requirements? As an example check
> blt_block_copy() and emit_blt_block_copy(). How to handle such cases
> without igt_assert?
> 

Hmm, I will change this to "then consider to write also..."
so it is not strictly required.

Regards,
Kamil

> > +
> > +- Libraries and igt_runner
> > +  Runner should not use lib functions. It is crucial for CI runs so using
> > +  libraries puts a risk of bringing changes meant for tests which in turn
> > +  could break runner.
> > +  Note: You will find places where igt_runner uses lib functions - this will
> > +  be on ToDo list to be fixed.
> 
> Agree, runner should be separated from igt library code.
> 
> --
> Zbigniew
> 
> > +
> > +- Libraries and tools/
> > +  Tools should try to not use lib functions. Any abnormal condition should
> > +  be simply reported by printf or fprintf to stdout/stderr and then tool
> > +  should exit gracefully. Do not use igt_abort nor igt_assert, igt_print,
> > +  igt_debug nor other testing/printing macros from igt lib/
> >  
> >  Sending Patches
> >  ---------------
> > -- 
> > 2.49.0
> > 
