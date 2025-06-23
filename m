Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463A7C77B7F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 10:01:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EC710E0E9;
	Mon, 23 Jun 2025 10:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfyFep4Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D5B10E05B;
 Mon, 23 Jun 2025 10:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750672883; x=1782208883;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MjIOBo0zw5aFxGv1nRmJ2qMzd6BMVW8wxd1yoGzn7NY=;
 b=nfyFep4ZuL60MohRTzTqPFyjO/rZu2/CepdYUScMbOsg5/2Cf5gbqpRY
 8c8SDQFT2t0Li+HOQPYNxqCalKTaScWKjtrnTN8kZiFIKfctg2IMzDpi0
 62pb6iQ3zLanUi9etVKevOwdv8JcQAJL3lpuwNz/8TDs7wF9mrQXjl/Z2
 mNFdJbDJV+VA8S+KVW7z30YC0J2euCqzwPDcbuppdz14a8LqOHfJlZc5E
 Ym/1RJs64/zbJrwLc3dKh1KhO5YU7CDpPsfDitp2mx1Uk1AxxwklujT4J
 XPkMn0PxJ9sgLnEsyB5aGmxWsD5Kw+n29JpNZM6TQiWlyf8IrMvE7lpFm g==;
X-CSE-ConnectionGUID: bfyqho3WSwKymjgvtxBcUg==
X-CSE-MsgGUID: fJfFa5StSJe8BZACQplyNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52740262"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52740262"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 03:01:23 -0700
X-CSE-ConnectionGUID: eKO5eKYtQsWdQHZt/KIEqw==
X-CSE-MsgGUID: pHS0JQk1RbyUXJhJoLUC2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="175159654"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 03:01:23 -0700
Date: Mon, 23 Jun 2025 12:01:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 README.md: Update oneliner build command
Message-ID: <20250623100119.snprhqyoet5sxuaw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250618230257.1721932-1-alex.hung@amd.com>
 <175034489306.96048.14671091982776928545@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175034489306.96048.14671091982776928545@1538d3639d33>
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
On 2025-06-19 at 14:54:53 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: README.md: Update oneliner build command
> URL   : https://patchwork.freedesktop.org/series/150487/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16725_full -> IGTPW_13321_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13321_full absolutely need to be
>   verified manually.

Unrelated to change in documentation.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13321_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13321/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13321_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@reload-no-display:
>     - shard-dg2:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16725/shard-dg2-8/igt@i915_module_load@reload-no-display.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13321/shard-dg2-5/igt@i915_module_load@reload-no-display.html
> 
>   * igt@prime_self_import@reimport-vs-gem_close-race:
>     - shard-dg1:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16725/shard-dg1-12/igt@prime_self_import@reimport-vs-gem_close-race.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13321/shard-dg1-15/igt@prime_self_import@reimport-vs-gem_close-race.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_16725_full and IGTPW_13321_full:
> 
> ### New IGT tests (2) ###
> 
>   * igt@kms_async_flips@test-cursor@pipe-a-vga-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.10] s
> 
>   * igt@kms_async_flips@test-cursor@pipe-b-vga-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.11] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13321_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - shard-dg2:          NOTRUN -> [ABORT][5] ([i915#13571])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13321/shard-dg2-10/igt@core_hotunplug@unbind-rebind.html
> 
...cut...
