Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359ABFF8860
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 14:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AA510E786;
	Mon, 27 Apr 2026 14:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/wGRGlY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8D910E786;
 Mon, 27 Apr 2026 14:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777301111; x=1808837111;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S6zRy5F02EcvhccHPlHebsLM6fgo71+fyD8ai9X03nU=;
 b=S/wGRGlYfKOG/j6uuyfeHWm/h3bUhAT3LfJ0KJxE61j8QX10rmQPii16
 i0oF/MV8ojHKVzUMBTbjONAbG9lho2EDu+HdprwM5opPvlQBs86GKiKz0
 1G0KDVy6ahXrDEDxxY7PG8Ywm9IBjhAIEpFBLRhpZMUTyFscpfxRWll8U
 8+P2Nk1GOklRg6KGeSriKGw7AyM+nVYSn0kqRxXgL7z13UZLew5gNTysg
 QMgpAsNz3Plot9SckeLyWmSLSh2Z821cJnu4SOlfPsNGGp+uzNN50bpfa
 vUryPCCUhONn+SWYyLI157aw+8v6uK7DWD/7YjoRIRkPI8wXx/SEs4nRz Q==;
X-CSE-ConnectionGUID: j1tyXAFYS4++C4Cz7ApJVg==
X-CSE-MsgGUID: Io4iw7DSQ+uW8ltHXfD1Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="95602737"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="95602737"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 07:45:10 -0700
X-CSE-ConnectionGUID: VjrVkLjMSNm6mDgsFg8vKg==
X-CSE-MsgGUID: lwUyy+/bR7G1wuzlWhBSqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="233537450"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 07:45:09 -0700
Date: Mon, 27 Apr 2026 16:45:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 Few fixes for igt_display_reset_outputs() in lib/igt_kms
Message-ID: <20260427144506.jmb5o7pevuvkkeb3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260424151355.129423-1-kamil.konieczny@linux.intel.com>
 <177706790443.9783.10744440356900654019@5ab824fced77>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177706790443.9783.10744440356900654019@5ab824fced77>
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

Hi igt-dev,
On 2026-04-24 at 21:58:24 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Few fixes for igt_display_reset_outputs() in lib/igt_kms
> URL   : https://patchwork.freedesktop.org/series/165439/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_18362_full -> IGTPW_15053_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15053_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15053_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15053/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15053_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - shard-dg1:          NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15053/shard-dg1-19/igt@i915_selftest@live.html
> 

Not related.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15053_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-tglu-1:       NOTRUN -> [SKIP][2] ([i915#11078])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15053/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html
> 
...cut..
