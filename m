Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33FDCED25D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 09:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2CD10E477;
	Tue, 18 Nov 2025 09:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYcGWELZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D333810E475;
 Tue, 18 Nov 2025 09:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763459822; x=1794995822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gh1RHzoROJhQCy9WnzZoyY/uvYOA9LjG1uGkzZ1FBoE=;
 b=IYcGWELZpi7C9vSrFSNHkApBWrOMqoYzH5OhuYjfm6XW9I570YmhcLA2
 7c3e6FjdD3eWr9jR+Hh73AluO/T5do0o6Mobo43Dm+J97xX5Bjw9Y91jK
 uSOVQgtPPsPOTf6zKPFsVMGD7pGS9MMUaNVSzMKw/lVr/r29XVLH2zTN/
 H7AMlIpTsOl8ClrwK4exoexDRdMcEUBp85aeHrmBNEtu+Xhb2jLRFSW6r
 UZDFMsmwqhu7msDWZTkKFeAIZVaxTp7B61UJJcx4rZrQU7X1d5tFwFzQD
 y9mIfzVcL9fuY5M0OYMy8yjySOzYG2J+J0+NJ0SsQMktJGeHLwAx9yNql A==;
X-CSE-ConnectionGUID: r8p/acGqRh+nEhHrqnec3Q==
X-CSE-MsgGUID: O2VYQZYUSbGuUhfV/HIVkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65507170"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65507170"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:57:01 -0800
X-CSE-ConnectionGUID: BNxt+/NURbeqMGE3gad1XQ==
X-CSE-MsgGUID: nYQDonOdSQuTwMIoz1umAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190940691"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.136])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:57:00 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= i915.CI.Full: failure for
 tests/intel/gem_lmem_swapping: Run smem-oom helper loop in background
Date: Tue, 18 Nov 2025 10:56:57 +0100
Message-ID: <2239793.KiezcSG77Q@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176343637818.3464.14976069063950732187@a3b018990fe9>
References: <20251117113032.1143849-2-janusz.krzysztofik@linux.intel.com>
 <176343637818.3464.14976069063950732187@a3b018990fe9>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi I915-ci-infra@lists.freedesktop.org,

On Tuesday, 18 November 2025 04:26:18 CET Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_lmem_swapping: Run smem-oom helper loop in background
> URL   : https://patchwork.freedesktop.org/series/157662/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17559_full -> IGTPW_14071_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14071_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14071_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/index.html
> 
> Participating hosts (11 -> 9)
> ------------------------------
> 
>   Missing    (2): shard-glk10 pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14071_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@prime_mmap_coherency@write:
>     - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17559/shard-snb5/igt@prime_mmap_coherency@write.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14071/shard-snb4/igt@prime_mmap_coherency@write.html

Changes tested under this pre-merge run don't touch igt@prime_mmap_coherency, 
only igt@gem_lmem_swapping@smem-oom, then the above failures are not related.  
Please update filters and re-report.

Thanks,
Janusz

> 
>   
> Known issues
> ------------
...



