Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139ECCCFA1A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 13:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D4B10E025;
	Wed, 12 Nov 2025 13:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPYpHASS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AC810E025;
 Wed, 12 Nov 2025 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953074; x=1794489074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TLzhfMIrAm5ezbg/XbEb4Qasr6W2801uVj5xhrdYpi8=;
 b=gPYpHASSLUEa50S48rIio8y4yJcVwq+K+vt+X3ccRmXPPNunUPbNZWID
 jAbKTBYECvMzDrd7zc6tTH+P7XQM+QseqRRrPR9ZKnxApsMd0w0pb62Y9
 JIhwWOc/7PlAstUg+0mhvpdKx+accO9LvWzA5sry/nhbuRNTD2/INhfdx
 cGX56Ka1oaPQcNXSF3NieKCP9taIZkKAFNqETHN8tVH45avWt0Q/uzPyX
 d4zVWa4PKaolCMqyUPUS5qckZxwBoxYxKFX2Jqh/ss+8mLwF373Ue1H8Q
 vG71RtupL3gfQDdJ+6g22UQwC/Wl0UU3bmBfFSrq6DChQEawXalF3mY1S Q==;
X-CSE-ConnectionGUID: cJPRVSpQTtKM10QVgONqTQ==
X-CSE-MsgGUID: bTUj0usyQSSHw31FmE4kZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65050306"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="65050306"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:11:14 -0800
X-CSE-ConnectionGUID: HzLHFeGDQxKv9/dklS1k3g==
X-CSE-MsgGUID: wF7QuwPgTy+x9Egcr1bxAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188857053"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.63])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:11:13 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= i915.CI.BAT: failure for
 tests/gem_lmem_swapping: Run smem-oom helper loop in background
Date: Wed, 12 Nov 2025 14:11:10 +0100
Message-ID: <2769487.KRxA6XjA2N@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176294958941.45329.12366520535453748445@10055242dc62>
References: <20251112104913.701052-2-janusz.krzysztofik@linux.intel.com>
 <176294958941.45329.12366520535453748445@10055242dc62>
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

On Wednesday, 12 November 2025 13:13:09 CET Patchwork wrote:
> == Series Details ==
> 
> Series: tests/gem_lmem_swapping: Run smem-oom helper loop in background
> URL   : https://patchwork.freedesktop.org/series/157429/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8621 -> IGTPW_14044
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14044 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14044, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14044/index.html
> 
> Participating hosts (44 -> 43)
> ------------------------------
> 
>   Additional (1): bat-adls-6 
>   Missing    (2): fi-snb-2520m bat-mtlp-6 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14044:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@evict:
>     - fi-kbl-guc:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8621/fi-kbl-guc/igt@i915_selftest@live@evict.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14044/fi-kbl-guc/igt@i915_selftest@live@evict.html

Looking at results from igt@i915_selftest@live, one can see @evict dynamic 
sub-subtest completed successfully, then @hugepages didn't complete.  But 
anyway, that's out of scope of the change under this pre-merge testing, which 
may only affect igt@gem_lmem_swapping@smem-oom, then not related.  Please 
update CBL filters and re-report.

Thanks,
Janusz


> 
>   
> Known issues
> ------------
...


