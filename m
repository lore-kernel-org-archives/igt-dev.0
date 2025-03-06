Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326D4C282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 12:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE9510E8D7;
	Thu,  6 Mar 2025 12:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TyVG32Oe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB8D10E8D7
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 12:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741264368; x=1772800368;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=W/ZnyuCD8iJms7j3f3zvZqPe3bM8hyD8MrnF2dSvOu4=;
 b=TyVG32Oe9eujsxdTppeXPIZhBrjmLnXhNo23YVisar0kaNm3Th1MAKXt
 e/tnpVJ8QqRcloAP4/UeQrydRO0eN6dcYkwnBDijNYEy6YYzykT7JU0LW
 3e2vchisuyKW59ftdpTfsQDDfY9T1OM180KLx7Ozp67y+FUO4YtyJiG/b
 BxqYEOcIRFB0YEb28wX9yskB6W1HIBSODgrH1ELwS6Tuzh9taoMAGzuoi
 RlN4oD4aQ92OPanufFmPE20XIjIUFWJbUrnmO2yRvim5AcAl5B0iRvQXl
 LsJLYl7Nayy+tzffs7y9bVYVBkbKLcVBXr5NveSuvenWRaZv6OqUjGhdn w==;
X-CSE-ConnectionGUID: C3tNNobYSx+ZBeBJQG2hOg==
X-CSE-MsgGUID: YhJ8wj63Qt+MOD7BwAYQ9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42510122"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="42510122"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 04:32:47 -0800
X-CSE-ConnectionGUID: 8Hs2d88hQ76/C0KZVkgJuw==
X-CSE-MsgGUID: fmcQcI9UTTeNupzZiAwrHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123170219"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 04:32:44 -0800
Date: Thu, 6 Mar 2025 13:32:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, christian.koenig@amd.com,
 alexander.deucher@amd.com, jesse.zhang@amd.com,
 harry.wentland@amd.com, zbigniew.kempczynski@intel.com,
 ryszard.knop@intel.com, lucas.demarchi@intel.com,
 katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, vitaly.prosyak@amd.com
Subject: Re: [PATCH v7 i-g-t 1/3] runner/kmemleak: library to interact with
 kmemleak
Message-ID: <20250306123229.bmy6fhk7nojrs2wg@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, christian.koenig@amd.com,
 alexander.deucher@amd.com, jesse.zhang@amd.com,
 harry.wentland@amd.com, zbigniew.kempczynski@intel.com,
 ryszard.knop@intel.com, lucas.demarchi@intel.com,
 katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, vitaly.prosyak@amd.com
References: <20250227101853.361504-1-peter.senna@linux.intel.com>
 <20250227101853.361504-2-peter.senna@linux.intel.com>
 <9290bd2c-7e90-45a6-879e-1e0f25192a43@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9290bd2c-7e90-45a6-879e-1e0f25192a43@linux.intel.com>
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

Hi Peter,
On 2025-02-28 at 08:04:30 +0100, Peter Senna Tschudin wrote:
> 
> 
> On 27.02.2025 11:18, Peter Senna Tschudin wrote:
> > Adds a simple library for interacting with kmemleak and add
> > unit testing for the library. There are two modes intended to
> > integrate with igt_runner:
> > - once: collect kmemleaks after all test completed
> > - each: collect kmemleaks after eachb test completes
> > 
> > To use the library include "kmemleak.h", call runner_kmemleak_init()
> > to check if kmemleak is enabled and finally call runner_kmemleak()
> > to collect kmemleaks. runner_kmemleak() expect the following
> > arguments:
> >   - const char *last_test: Name of the last lest or NULL
> >   - int resdirfd: file descriptor of the results directory
> >   - bool kmemleak_each: Are we scanning once or scanning after
> >     each test?
> >   - bool sync: sync after each write?
> > 
> > Cc: christian.koenig@amd.com
> > Cc: alexander.deucher@amd.com
> > Cc: jesse.zhang@amd.com
> > Cc: harry.wentland@amd.com
> > Cc: zbigniew.kempczynski@intel.com
> > Cc: kamil.konieczny@linux.intel.com
> > Cc: ryszard.knop@intel.com
> > Cc: lucas.demarchi@intel.com
> > Cc: katarzyna.piecielska@intel.com
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

A note to Peter for future reference: please send such r-b
additions with at least a word or two why and from where
it comes, give a link to lore.kernel.org or to patchwork
so you will make my work easy and do not require from me
to search your other mailing threads.

You could also remind about it a maintainer to add this at merge
or send new release with this added, then an explanation will
naturally appear in release notes in cover letter.

Regards,
Kamil

> > Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> > ---
> >  runner/kmemleak.c             | 273 ++++++++++++++++++++++++++++++++++
> >  runner/kmemleak.h             |  16 ++
> >  runner/meson.build            |  11 +-
> >  runner/runner_kmemleak_test.c | 267 +++++++++++++++++++++++++++++++++
[...]

