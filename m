Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E574ACA0FF7
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 08:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847E110E3D3;
	Fri, 29 Aug 2025 08:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RVkQYP8q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A9310E063;
 Fri, 29 Aug 2025 08:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756455835; x=1787991835;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JVItP9J3ywVDt3njTLtootgtOCX8GhxXx4vdRDV/RdY=;
 b=RVkQYP8qrRg4V+CCKrpKn62BaUoerq/8aODDWq9Hkt2FD1xh8gVPpZii
 PXgFYaaKfVCBMCOFZT4QhdgyiLI1PFU5qzXhBbZj6fAOJHU4dRAHk+gRm
 cZ6tSKQqLpeN8dye/HLAYSnhp1OrFcfm436a5Pe9cSBIqkCqU+Szj5gKj
 40+5dFvefsibYipMfMayK8tvU8+VSs3nKZnlS8STMdqOjzs1W8VV662LP
 PALjqgGfkvzJ01eRg9A87bDtbrimPQtJwjzYiEL1v5U/l4GPzABovmRyC
 vKOAYZ7RpffgTw4RG3kXNhXHDkko4pBFKcgccuNXhLYXtuuCuknrd5c6b w==;
X-CSE-ConnectionGUID: c/DmKNpyRrG/33kDbAFZsQ==
X-CSE-MsgGUID: omzAqkx1R1aSj6+upHdO4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="70107621"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70107621"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 01:23:54 -0700
X-CSE-ConnectionGUID: z1oSQHP9ShylcoV7IHpdfA==
X-CSE-MsgGUID: ZVhMh6KoQNiuJb2BZPjciw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="175614347"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 01:23:53 -0700
Date: Fri, 29 Aug 2025 10:23:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 runner/executor: Abort if dmesg is flooded (rev6)
Message-ID: <20250829082340.bpdbecj3mvevdmrv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250828103124.36280-1-kamil.konieczny@linux.intel.com>
 <175644937811.283133.4062942582191132023@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175644937811.283133.4062942582191132023@1538d3639d33>
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
On 2025-08-29 at 06:36:18 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner/executor: Abort if dmesg is flooded (rev6)
> URL   : https://patchwork.freedesktop.org/series/150246/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8514_full -> IGTPW_13652_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13652_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13652_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13652/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13652_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-snb:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8514/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13652/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html

This abort is unrelated, it was caused by bug in kernel or driver.

> 
>   * igt@kms_plane_cursor@primary:
>     - shard-dg2:          [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8514/shard-dg2-3/igt@kms_plane_cursor@primary.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13652/shard-dg2-1/igt@kms_plane_cursor@primary.html
> 

Also unrelated.

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13652_full that come from known issues:

...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8514 -> IGTPW_13652
> 
>   CI-20190529: 20190529
>   CI_DRM_17082: a59cf1d7fe0e19ce3a6e8cf2a20cfb24896baa97 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_13652: 13a2aaad0a309d26ad657be98296a8bc0fe1c01d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8514: 8514
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13652/index.html
