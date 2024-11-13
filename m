Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B86D462A8
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 14:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC0A10E252;
	Wed, 13 Nov 2024 14:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cVzdgT6Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609AB10E252
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 14:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731507203; x=1763043203;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9rgMh5sUmVUVUg9Nz3ogDCQ8e4mYobcoMKLNAs6b8u4=;
 b=cVzdgT6Zrj5Nbl9fduJ/BpOZmw6/5F40Vs6c3250gDAqLtXfMtkn0kud
 kCOKQBtKzFkpG1bd/3Ys4pXrnj2T7NK8ls54ciE/Q5q0I/H0Y+SohPa8e
 xjcsETeUyonvxf07Jc1pYOfj+AqRFY1ulN5OKxaBGOttosICy+GnFdIMS
 TLYHBNnBJkNMGVpZklXuIR8+f1i9e/lAw7/rxHS71MDlu9z3/i0zW1xM5
 uDJNatqiTVJkT5UNGVEnQEs20qgRUSaMzqQkv5vy5neNAU+FtejZpMVgX
 Zbfr9fW4eFjNpWhImtIHzKiihWKmJmpi7z3tH+2HKyk52KUEjHHvbBQAz g==;
X-CSE-ConnectionGUID: HJ6VfkY0Q1GT6C9cpam4hA==
X-CSE-MsgGUID: MC96fWMlQ1WyYhZupGiPYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42809379"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="42809379"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:13:23 -0800
X-CSE-ConnectionGUID: o7dbKNW6R6aBd5iAU+RC2w==
X-CSE-MsgGUID: e1T9lpnPREKVhwxj89rLQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="87875957"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 06:13:22 -0800
Date: Wed, 13 Nov 2024 15:13:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>,
 clinton.a.taylor@intel.com, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH v2] lib: sync PCI ID macros with kernel
Message-ID: <20241113141319.rshtc275frebo7lf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>,
 clinton.a.taylor@intel.com, zbigniew.kempczynski@intel.com
References: <20241107231457.70157-1-ngai-mint.kwan@linux.intel.com>
 <874j4if2mb.fsf@intel.com>
 <lkiuylps7ka6qbno3gjtpkjbvu6dxpbkjw6725cri35coysxcz@yfcafnu4oguh>
 <87wmhacf50.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87wmhacf50.fsf@intel.com>
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

Hi Jani,
On 2024-11-11 at 11:07:39 +0200, Jani Nikula wrote:
> On Fri, 08 Nov 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > On Fri, Nov 08, 2024 at 12:20:44PM +0200, Jani Nikula wrote:
> >>On Thu, 07 Nov 2024, Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com> wrote:
> >>> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
> >>> index ef2f74be8..9eb1141d4 100644
> >>> --- a/lib/i915/perf.c
> >>> +++ b/lib/i915/perf.c
> >>> @@ -37,7 +37,7 @@
> >>>
> >>>  #include <i915_drm.h>
> >>>
> >>> -#include "i915_pciids.h"
> >>> +#include "pciids.h"
> >>>  #include "i915_pciids_local.h"
> >>
> >>After this gets merged, maybe you could write a follow-up patch that
> >>renames i915_pciids_local.h to pciids_local.h and cleans it up; there's
> >
> > Actually to remove it. Why are we still carrying that?
> 
> To cater for igt perf code, which uses smaller granularity than the
> kernel. It's a good question whether we should split the macros up
> further in kernel for the needs of perf.

This should definitly be part of a comment in that header.

I will merge this now, it should have a follow up in igt README.md
as how to update this file.

Regards,
Kamil

> 
> > Or maybe keep it just for the IDs from the topic branch (which we won't
> > add more to, hopefully) so we can keep sync'ing with drm-xe, or
> > drm-intel or drm-next, depending on the context.
> 
> There no more PCI IDs in the topic branches, even PVC IDs are now in
> -next, but we just enable those PCI IDs in the topic branch.
> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel
