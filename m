Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA70C4828F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 18:36:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF5810E5CA;
	Wed,  7 Feb 2024 18:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9XNF4qw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8A710E70D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 18:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707330979; x=1738866979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m0pyHRukdovx6v3RPmIyW/H+lrPmNH+93mNbERoxwsM=;
 b=d9XNF4qwbcG2fv87zYxjn2/6BW2K/LHEs4RB37drbDmcEI8USTo94gpQ
 vJXcqWdJBKOYslEAge/I2adOMw4nqplH7IGdQiJWPI3/NhbqOHCZ623Wj
 wQ8Q818JVjr9fKfjzvilbfdAip2b+tESzuEmOPdWLg7R/pakirkTLRs87
 Mxy1e5p+YMvE9xCcWu5ho2iUDqvIsyH90LXwdiH5z2Z5Uo3QoLHg/Jprk
 pFWGOtvYp6Sdd9zckN+WenG/EpY/nfNloYWXJBN3UqsB/XKd5HdQBbFle
 rTvw0J+T7D4C19+XDhAWCUYajeh7U8BxAnmBGr19lj2YivKtWJRmTSQj1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="11693479"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="11693479"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 10:36:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="6177760"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.22.5])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 10:36:16 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/2] xe_live_ktest: Use xe_live_test kernel module
Date: Wed, 07 Feb 2024 19:36:12 +0100
Message-ID: <3267150.N7aMVyhfb1@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <mfqfe7r6n26cfdbkv2vvyk5oe5ba36jdublmscyuyvwyhqpkdx@jd3nqwyzh634>
References: <20240202004529.552806-1-lucas.demarchi@intel.com>
 <1760950.X513TT2pbd@jkrzyszt-mobl2.ger.corp.intel.com>
 <mfqfe7r6n26cfdbkv2vvyk5oe5ba36jdublmscyuyvwyhqpkdx@jd3nqwyzh634>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Wednesday, 7 February 2024 18:26:53 CET Lucas De Marchi wrote:
> On Wed, Feb 07, 2024 at 12:27:48PM +0100, Janusz Krzysztofik wrote:
> >On Friday, 2 February 2024 01:45:29 CET Lucas De Marchi wrote:
> >> https://patchwork.freedesktop.org/series/126786/ groups all the live
> >> tests into a single kernel module. Use that module to run any of the
> >> tests triggered by igt.
> >>
> >> To make the live kunit tests work, rename the subtests so they match
> >> what the kernel uses.
> >
> >There was some discussion on this patch on today's XE IGT status meeting, 
and
> >the conclusion was: can we have these split into two patches, one for 
subtest
> >renaming, and one for switching to single module?
> 
> that would break the test. Wouldn't it make more sense to squash the
> subtest rename in your series since it's changing the logic
> for filtering (https://lore.kernel.org/igt-dev/2202702.NgBsaNRSFp@jkrzyszt-mobl2.ger.corp.intel.com/)

The rename part can be applied immediately, I believe.  Looking at current CI 
results we can see 2 cases:

1. If the test successfully (re)loads the KUnit base module in list only mode 
(e.g. after xe and its dependencies, including kunit, were unloaded by a 
preceding test) and that is followed by successful load of a xe kunit test 
module then the test is no longer able to reload the base kunit module in exec 
mode and skips.  Renaming the subtests won't change that.

2. If the test finds the xe module and its dependencies, including kunit, 
already loaded then it can't reload the kunit module in list mode and falls 
back to the legacy processing path.  That path works, i.e., returns results 
from test cases as results from IGT dynamic sub-subtests, even if subtest name 
doesn't match suite name.

Then, renaming subtests even before my series is finally accepted and applied 
won't break anything.

Thanks,
Janusz

> 
> If we squash the subtest renaming there and leave the module rename
> here, then we don't break anything (although this part here needs to
> land with the kernel side too).
> 
> Lucas De Marchi
> 




