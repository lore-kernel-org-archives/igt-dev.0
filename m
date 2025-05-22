Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B6BC54E65
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 05:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3264F99A3A;
	Thu, 22 May 2025 05:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdtSNJtt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC05399A21;
 Thu, 22 May 2025 05:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747890239; x=1779426239;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=y2xxgtsegcdgHJo7o5H2707ZYLGm/6voi56Tv9TvYfk=;
 b=ZdtSNJtt89Z1lo+JknQMF5pH93iCsGVmdHsLrtpTTypC19Ln7Ve56VAe
 XOIim5w7uqg0NKx57KY+THmNGqoI3znwV7ogkkyJKhlu3779g6KEZNkxR
 ecQYPd9Zie07fEDT8HKzK8OwnD86V9BYsbHp/UyXlD7N7akM2MDCbaIR5
 cRSxGpJWGE/gJ6GV3fRLs2YijY7AeFRyKx5RfH3rDu92z/j8gTthmueOl
 pPAvsLzwGQcwvB9wTG/LlvP/0ww78PYSwMdns+OuYScW4n5LL9kiRuxUT
 q/CDc+7bL+jZtJqkdJLoZgMjuC0fjH/KzwEg2F7ZLLQiwzyVs0etWxw2p g==;
X-CSE-ConnectionGUID: pAOy9kXDTLq/tcaqx4YARQ==
X-CSE-MsgGUID: q8yChFPbR7m+OUp4o8WiCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60945552"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="60945552"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 22:03:58 -0700
X-CSE-ConnectionGUID: edHQBaw6SBeKWi5ezHTcDA==
X-CSE-MsgGUID: jzU9oYdwTUSaWYE5gSGriQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="144367150"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 22:03:56 -0700
Date: Thu, 22 May 2025 07:03:53 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 Simplify compute preemption tests
Message-ID: <a6tvaspnrpymbcnwc6jxsfsrh2x4x45xmtalknrihkxapx4onu@usiki7mhtnrt>
References: <20250521195925.74357-1-zbigniew.kempczynski@intel.com>
 <174787121714.11823.12633280201163098064@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174787121714.11823.12633280201163098064@1538d3639d33>
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

On Wed, May 21, 2025 at 11:46:57PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Simplify compute preemption tests                               
>    URL:     https://patchwork.freedesktop.org/series/149348/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13166/index.html 
> 
>                CI Bug Log - changes from IGT_8372 -> IGTPW_13166
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_13166 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_13166, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13166/index.html
> 
> Participating hosts (45 -> 44)
> 
>    Missing (1): fi-snb-2520m
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_13166:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@active:
>           * fi-bsw-nick: PASS -> DMESG-FAIL +1 other test dmesg-fail

Series is not related to the above regression. May I ask for continue
run or rerun?

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_13166 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@i915_selftest@live:
> 
>           * bat-dg2-8: PASS -> DMESG-FAIL (i915#12061) +1 other test
>             dmesg-fail
>      * igt@i915_selftest@live@hugepages:
> 
>           * bat-arlh-3: PASS -> DMESG-FAIL (i915#14243)
>      * igt@i915_selftest@live@workarounds:
> 
>           * bat-dg2-9: PASS -> DMESG-FAIL (i915#12061) +1 other test
>             dmesg-fail
> 
>     Possible fixes
> 
>      * igt@i915_selftest@live@workarounds:
>           * bat-arlh-3: DMESG-FAIL (i915#12061) -> PASS
>           * bat-dg2-11: DMESG-FAIL (i915#12061) -> PASS +1 other test pass
> 
>     Warnings
> 
>      * igt@i915_selftest@live:
>           * bat-arlh-3: DMESG-FAIL (i915#12061) -> DMESG-FAIL (i915#14243)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8372 -> IGTPW_13166
> 
>    CI-20190529: 20190529
>    CI_DRM_16576: 3695d568b260d85e65f9331ca1180a9dd2b5560b @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_13166: 13166
>    IGT_8372: 8372
