Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43418FED3C3
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 12:47:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C541810F591;
	Fri, 24 Apr 2026 12:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtPYeNUQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCB110F591
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 12:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777034858; x=1808570858;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yXDqRs5iLRw5argRtCaxCQmIVbi5899FdK+GouYJYWk=;
 b=QtPYeNUQOjNONEdfmtWRHYL82MrxSr7LPnhwobZ4ZFqflYplo2AygNsb
 wrBgune9U8xzy5Biaj77AAtY9wVZDh85DZSz/3p0wVx6nTR0+uh1HNMnX
 WIucUloZtYeZu5TPq3ai4OFyW6020AXrt8eHxMrvNqAeytVmBqQRe2dBL
 RPx9C8HqfvWw8IR5jpBNqzMbB1H6KarBxWvMhPfGBCaxRgmRfsU7jNn5f
 DewA7ilMzXAeHHbKlw/lZHapgdIoc/lgGBQWKfH2Ek2B8quv7H5dBB+OP
 b5I7GO1mxF1I/K9fmyjiQBxBFnNV9eByp2mpRxjneiOY911Rs2XzVqt2d A==;
X-CSE-ConnectionGUID: 7g/Wk6bsTQWpJzDdi20kEA==
X-CSE-MsgGUID: Xeyz/S/XT+uJgqe+KicTSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="78128012"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="78128012"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 05:47:38 -0700
X-CSE-ConnectionGUID: w8BV4tnnSn2Ns1m+UF60sw==
X-CSE-MsgGUID: Zgw4sp26RjygTssEBuC9aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="232851759"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 05:47:37 -0700
Date: Fri, 24 Apr 2026 14:47:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 5/5] tests/prime_udl: Rename into i915_prime_udl
Message-ID: <20260424124721.kvdk57tnuczrwpvt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
References: <20260422154423.141908-1-kamil.konieczny@linux.intel.com>
 <20260422154423.141908-6-kamil.konieczny@linux.intel.com>
 <664a9c92-c7eb-4c9f-8bc9-774afae310b3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <664a9c92-c7eb-4c9f-8bc9-774afae310b3@intel.com>
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

Hi Karthik,
On 2026-04-23 at 15:59:02 +0530, Karthik B S wrote:
> Hi Kamil,
> 
> On 4/22/2026 9:14 PM, Kamil Konieczny wrote:
> > This is an i915 test so rename it and move it to tests/intel/.
> > Add documentation so build will not become broken.
> > 
> > Cc: Karthik B S <karthik.b.s@intel.com>
> > Suggested-by: Karthik B S <karthik.b.s@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >   tests/{prime_udl.c => intel/i915_prime_udl.c} | 17 +++++++++++++++++
> >   tests/meson.build                             |  2 +-
> >   2 files changed, 18 insertions(+), 1 deletion(-)
> >   rename tests/{prime_udl.c => intel/i915_prime_udl.c} (88%)
> > 
> > diff --git a/tests/prime_udl.c b/tests/intel/i915_prime_udl.c
> > similarity index 88%
> > rename from tests/prime_udl.c
> > rename to tests/intel/i915_prime_udl.c
> > index db83152fc..0f2dd50c0 100644
> > --- a/tests/prime_udl.c
> > +++ b/tests/intel/i915_prime_udl.c
> > @@ -13,6 +13,23 @@
> >   #include "i915/gem_create.h"
> > +/**
> > + * TEST: i915 prime udl
> > + * Category: Display
> Since this is display test, could it be name kms_*?

Or should I just keep name intact? There is already
a line in xe.blocklist for igt@prime_.*
so no rename, only moveing it into tests/intel/
should be enough. Also, there are no kms tests in meson i915
progs, and this kms_* change will also require additional
change in xe.blocklist. What you think?

> > + * Description: Basic set of prime tests between Intel and DisplayLink.
> > + * Driver requirement: i915
> > + * Mega feature: General Display Features
> > + * Sub-category: Memory management tests
> > + * Functionality: prime import/export
> > + * Test category: GEM_Legacy
> > + * Feature: prime
> 
> And then we could only keep upto Mega feature as other fields aren't used
> for display.

Thank you, I will change it.

Regards,
Kamil

> 
> https://patchwork.freedesktop.org/patch/636176/?series=144584&rev=1
> 
> Regards,
> Karthik.B.S
> > + *
> > + * SUBTEST: share-import
> > + *
> > + * SUBTEST: share-import-addfb
> > + *
> > + */
> > +
> >   IGT_TEST_DESCRIPTION("Basic set of prime tests between Intel and DisplayLink");
> >   int intel_fd = -1, udl_fd = -1;
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 4c1a39e9e..196fff8ca 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -72,7 +72,6 @@ test_progs = [
> >   	'kms_vrr',
> >   	'kms_writeback',
> >   	'meta_test',
> > -	'prime_udl',
> >   	'prime_vgem',
> >   	'sriov_basic',
> >   	'syncobj_basic',
> > @@ -231,6 +230,7 @@ intel_i915_progs = [
> >   	'i915_pm_rps',
> >   	'i915_pm_sseu',
> >   	'i915_power',
> > +	'i915_prime_udl',
> >   	'i915_query',
> >   	'i915_selftest',
> >   	'i915_suspend',
