Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3996C36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 14:23:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF3310E0AD;
	Tue,  1 Apr 2025 14:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drccbGA3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1094A10E0AD
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 14:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743517411; x=1775053411;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lkx+jPRd6lnRgXMM9FYaoI4re/a85H6QfjGQ2PiogpA=;
 b=drccbGA3DIK+jjXYQW31Ufjdc0Q/9kVi01QMaohMF7e2T5islp1YFYvx
 tSjXRq2drbg+6l+bywelMwCgrCvQK6gttlYj7aDnAoHmSevsW4H0t1uI4
 Jot4M/zJlat2uj0CtpM6RrWaix4rYdME8GrkJUIWeBX4PSMTxeM1gRlEI
 +YPTbz+GfybVhMAZ2DdInX4MeAAORos3mx/Dh4B+5Mzmun9mVKBkw7mzU
 JlJEFxl1DT8c3xkHkyRM1/iz8uKcY0CapS4Ql/BjqmSfgsgVHV0nOx1y3
 dWC92K0Jq7vnFCDgftuJLqvG2GJUOqk3mg1Xo5iYmWIlIFkeKQrz7b2yr w==;
X-CSE-ConnectionGUID: po+4W/vSRSu+Zyu64NGBXA==
X-CSE-MsgGUID: bEmLEDgmTnuSOPnOxt1/4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45015982"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="45015982"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 07:23:03 -0700
X-CSE-ConnectionGUID: 99BTC9VzRlepc/Z+9sRYpQ==
X-CSE-MsgGUID: XLdMkK7oSeSumzj/LywjzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131404516"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 07:22:59 -0700
Date: Tue, 1 Apr 2025 16:22:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] CONTRIBUTING: Add guide about igt libraries
Message-ID: <20250401142243.th7x75drmii7sdei@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20250331133424.35873-1-kamil.konieczny@linux.intel.com>
 <20250331133424.35873-3-kamil.konieczny@linux.intel.com>
 <87o6xh3z6h.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o6xh3z6h.wl-ashutosh.dixit@intel.com>
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

Hi Dixit,,
On 2025-03-31 at 10:08:54 -0700, Dixit, Ashutosh wrote:
> On Mon, 31 Mar 2025 06:34:24 -0700, Kamil Konieczny wrote:
> >
> > Add some general guide about adding new library function and
> > a few guides for their usage outside of tests.
> >
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Acked-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> > ---
> >  CONTRIBUTING.md | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> > index 8370451d6..d4efa61f5 100644
> > --- a/CONTRIBUTING.md
> > +++ b/CONTRIBUTING.md
> > @@ -38,6 +38,34 @@ The Code
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
> > +  In some cases single user can be accepted, when it is very likely it
> > +  will be used in future.
> > +
> > +- In a new library function():
> > +  if it uses some of the macros igt_assert/igt_require/igt_skip then
> > +  consider to write also __function() with the same functionality but
> > +  without them.
> > +
> > +- Libraries and igt_runner
> > +  Runner should not use lib functions. It is crucial for CI runs so using
> > +  libraries puts a risk of bringing changes meant for tests which in turn
> > +  could break runner.
> > +  Note: You will find places where igt_runner uses lib functions - this will
> > +  be on ToDo list to be fixed.
> > +
> > +- Libraries and tools/
> > +  Tools should try to not use lib functions. Any abnormal condition should
> > +  be simply reported by printf or fprintf to stdout/stderr and then tool
> > +  should exit gracefully. Do not use igt_abort nor igt_assert, igt_print,
> > +  igt_debug nor other testing/printing macros from igt lib/
> 
> Not sure about runner, but for tools, I'd rather have shared functions from
> lib/ rather than duplicating code. So we should be more specific here about
> which functions tools should not use. Maybe tools should not use 'igt_abort
> nor igt_assert, igt_print, igt_debug' etc. or even using these might be ok,
> as long as the tool works as expected?
> 
> Or maybe just say here that 'give some thought if you are planning to use
> IGT lib code in tools, some IGT lib functions might be be appropriate in
> tools'.
> 
> For example previously a lot of extra code was written in i915 perf
> library, just to avoid using IGT lib/. I changed this approach in xe perf
> lib and decided to use IGT lib/.
> 

You are right, I will rewrite this.

Regards,
Kamil

> 
> 
> >
> >  Sending Patches
> >  ---------------
> > --
> > 2.49.0
> >
