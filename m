Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A88D2E9C7
	for <igt-dev@archiver.kernel.org>; Mon, 11 Nov 2024 09:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C329C10E446;
	Mon, 11 Nov 2024 09:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwyQecV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EAC10E446
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Nov 2024 09:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731316066; x=1762852066;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gRoS3gpqpS59VHRK8mvArbjie1yTJ4lT/zgeyHEyPdQ=;
 b=WwyQecV94zjeOs3X1yZbvJiQOeBPbaB63F5MUq5GXdmkwgI/JAr7rjSz
 uywtj1BVrk8pmcW7/T4bgz3C5qlmoGshcyxy/89o/coM5dbIadZRPtBb8
 AMaNjBdq179qrMCRG3sC8dObFr9izdNlmheZI0J8XJAJ5ykAWomx/MLi7
 /3Za0p/pfyXm3H4IFRflDv5fAgUj5CK1qfEyBQzCm40nrPDZsW9CsM+7K
 jxsffP0fZ7PcXmUrmyT2b/4JEMfPAVaC4QkoQQP4CO3Jzp8ikRSAgPG59
 uguQTlVD10ElJgZXerTK+3mxUtuP6w1bRZVTTAcPe27owMVQULji3JnLs Q==;
X-CSE-ConnectionGUID: 1tEpeWUtSLuKc44XeZIn/g==
X-CSE-MsgGUID: 45ZHv53kRniBqSPnEEFXZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="31220602"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="31220602"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 01:07:45 -0800
X-CSE-ConnectionGUID: B5EnFm6tTieYWgWrqDHiBg==
X-CSE-MsgGUID: +tCwitlxSJ64NLX5to2hJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="86411286"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.75])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 01:07:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>,
 igt-dev@lists.freedesktop.org, clinton.a.taylor@intel.com,
 kamil.konieczny@linux.intel.com, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH v2] lib: sync PCI ID macros with kernel
In-Reply-To: <lkiuylps7ka6qbno3gjtpkjbvu6dxpbkjw6725cri35coysxcz@yfcafnu4oguh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241107231457.70157-1-ngai-mint.kwan@linux.intel.com>
 <874j4if2mb.fsf@intel.com>
 <lkiuylps7ka6qbno3gjtpkjbvu6dxpbkjw6725cri35coysxcz@yfcafnu4oguh>
Date: Mon, 11 Nov 2024 11:07:39 +0200
Message-ID: <87wmhacf50.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 08 Nov 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Fri, Nov 08, 2024 at 12:20:44PM +0200, Jani Nikula wrote:
>>On Thu, 07 Nov 2024, Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com> wrote:
>>> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
>>> index ef2f74be8..9eb1141d4 100644
>>> --- a/lib/i915/perf.c
>>> +++ b/lib/i915/perf.c
>>> @@ -37,7 +37,7 @@
>>>
>>>  #include <i915_drm.h>
>>>
>>> -#include "i915_pciids.h"
>>> +#include "pciids.h"
>>>  #include "i915_pciids_local.h"
>>
>>After this gets merged, maybe you could write a follow-up patch that
>>renames i915_pciids_local.h to pciids_local.h and cleans it up; there's
>
> Actually to remove it. Why are we still carrying that?

To cater for igt perf code, which uses smaller granularity than the
kernel. It's a good question whether we should split the macros up
further in kernel for the needs of perf.

> Or maybe keep it just for the IDs from the topic branch (which we won't
> add more to, hopefully) so we can keep sync'ing with drm-xe, or
> drm-intel or drm-next, depending on the context.

There no more PCI IDs in the topic branches, even PVC IDs are now in
-next, but we just enable those PCI IDs in the topic branch.

BR,
Jani.


-- 
Jani Nikula, Intel
