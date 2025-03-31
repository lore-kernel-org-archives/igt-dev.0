Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFBDC3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 12:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3C010E036;
	Mon, 31 Mar 2025 12:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9GPEMYG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4909810E036
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743425814; x=1774961814;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2H3oifYyDky1q7aLg6BxleiAUym5RgRJ2S6jWm64KTo=;
 b=D9GPEMYGQbGvLGffhBXg3FXXO7L7r+tgATxiI+qLip9BJgTlyb6R6lYM
 DNWC3D8PkW5p+eoJRsZPCxYmnZgBl1uSc+uPnfZCP+I96nEsgODU6XCVS
 4TkPvMBikvqQn/C8VBgHlEN/ib7Qkc1u7nboNdxTwxsIfGHl8ogztoyHT
 TjxS7F7AyNNE2uIiOBdho2jvnPwc7UENrFxIgrhW5/m+iHjgtODTXqKbg
 jP9PZVC12hlAhgD7JbSXSpCO9XpbayAsjKXdvG7/UCHrFNmnO2lX3Wz7B
 Kg96fcTwQOuu8c0W3Tuxsx44zcYV1dO9h9MmkxpVgyrXY62w/YdJ1K/3H Q==;
X-CSE-ConnectionGUID: 9yRUuJWVTh2gi5iYQHpfoA==
X-CSE-MsgGUID: CXoK3faoSxC4zPSCeycc4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44596089"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44596089"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 05:56:53 -0700
X-CSE-ConnectionGUID: BqgB8pB4T/+5QoC9NsLpEg==
X-CSE-MsgGUID: qzqDC4yCTMOJ92f5XFlM0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="126547963"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 05:56:53 -0700
Date: Mon, 31 Mar 2025 14:56:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v1 2/2] CONTRIBUTING: Add guide about igt libraries
Message-ID: <20250331125650.dfulfaryzvqrqsx3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250327153139.37746-1-kamil.konieczny@linux.intel.com>
 <20250327153139.37746-3-kamil.konieczny@linux.intel.com>
 <be3e69b9-ac16-4f69-a6f5-7172eade29a1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be3e69b9-ac16-4f69-a6f5-7172eade29a1@intel.com>
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

Hi Hajda,,
On 2025-03-31 at 12:56:10 +0200, Hajda, Andrzej wrote:
> 
> W dniu 27.03.2025 o 16:31, Kamil Konieczny pisze:
> > Add some general guide about adding new library function and
> > a few guides for their usage outside of tests.
> > 

+cc
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >   CONTRIBUTING.md | 27 +++++++++++++++++++++++++++
> >   1 file changed, 27 insertions(+)
> > 
> > diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> > index b571b5e68..d85266a6c 100644
> > --- a/CONTRIBUTING.md
> > +++ b/CONTRIBUTING.md
> > @@ -38,6 +38,33 @@ The Code
> >   [igt-describe]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
> > +IGT libraries
> > +-------------
> > +- Tests and benchmarks are the main usage of IGT libraries, so they
> > +  could use test specific macros/functions, for example igt_assert,
> > +  igt_require, igt_skip, igt_info or igt_debug.
> > +
> > +- New library function could be written when it will have at least two
> > +  different users, for example if it could be used by two or more tests.
> > +
> > +- In a new library function():
> > +  if it has macros (for example igt_assert/igt_require/igt_skip) then
> > +    write also __function() counterpart without them;
> 
> 
> Not sure what does it mean. What are counterparts to above macros?
> 

I wasn't sure which word to use, maybe I should just drop it:

then consider to write also __function() without them;

What I mean was a function with same functionality but without any
macros affecting test control flow, so no igt_assert nor igt_require
nor other.

> 
> > +  limit also usage of prints igt_info/igt_debug, this should be a part
> > +    of test code.
> 
> 
> As Zbyszek mentioned, beside pure lib functions which should be rather
> quiet, there is bunch of code shared between different tests, I am not sure
> if this should apply to this code.
> 
> On the other side I am not sure how to emphasise difference between them,
> comment?
> 
> 
> Regards
> 
> Andrzej
> 

Well, printing really should be done in tests, libs could guess what
should/could be printed but best place for them is test itself.
Unless someone wrote lib function just for printing. Hmm, maybe I will
drop these two lines.

Regards,
Kamil

> 
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
> >   Sending Patches
> >   ---------------
