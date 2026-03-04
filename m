Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85600EB7ECD
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 11:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336D310E9AE;
	Wed,  4 Mar 2026 11:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gy6Cwkn8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D94910E9AE;
 Wed,  4 Mar 2026 11:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772623006; x=1804159006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ROKaE3IeakG5f+/vK9NtIf4aI5r5kffa5/wd6y5yNQ=;
 b=Gy6Cwkn8MGrryOzUs9z5N6LJbkKwTt9FrABNJZyo3g/efD4+cuLBRXwo
 ghmbv8Z//VLEQEU0JJEZ2GoEEGP8hEQHi5tTMEm6ox3C/v4GEn1eN0QqF
 bHn0WwCkaQxFe3xoe0Y68/ATNfoj8X3OpV/czWswnkTZu4K5sZoE/cT3p
 ryvBXLd/JwiWWNzTy6UivKviP4PVJbvpXfdCdUR3JMS11MrVaxxFJCIZg
 Z3pf7jNG4HM4XzoezJYxR5jn2VHJ4Pg7N8/sPtGmwpnAXb+CVLlIOjkgP
 By6vDVH3tLVmWI9khyGKTRGe/gyRLSPe5taA6M4boK5YriycpGR38XHSy A==;
X-CSE-ConnectionGUID: H3EdW3lZRk6zdXVDyQzfZw==
X-CSE-MsgGUID: sR7+9JndQ/e+vBD7yQ4/LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="99152700"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="99152700"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:16:46 -0800
X-CSE-ConnectionGUID: U8KUpHjXQnKSqi9yEkLKSQ==
X-CSE-MsgGUID: THwlf8m3SPq2hfTdU4VB/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="218262613"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.97])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:16:45 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= i915.CI.Full: failure for
 tests/intel/gem_lmem_swapping: Expect gem leak helper crashes
Date: Wed, 04 Mar 2026 12:16:41 +0100
Message-ID: <5090394.31r3eYUQgx@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <177254120163.309599.5399064099330440991@a3b018990fe9>
References: <20260302131817.3744919-2-janusz.krzysztofik@linux.intel.com>
 <177254120163.309599.5399064099330440991@a3b018990fe9>
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

On Tuesday, 3 March 2026 13:33:21 CET Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_lmem_swapping: Expect gem leak helper crashes
> URL   : https://patchwork.freedesktop.org/series/162418/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_18076_full -> IGTPW_14643_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14643_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14643_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14643/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14643_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-glk10:        NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14643/shard-glk10/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-rkl:          [PASS][2] -> [FAIL][3] +1 other test fail
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18076/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14643/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@syncobj_basic@bad-destroy:
>     - shard-snb:          [PASS][4] -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18076/shard-snb1/igt@syncobj_basic@bad-destroy.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14643/shard-snb5/igt@syncobj_basic@bad-destroy.html

The patch modifies only gem_lmem_swapping, while none of the above failures 
was reported by that tests and none of those machines have LMEM so this test 
would skip on them and couldn't have any impact on other tests.  Those 
failures are not related.  Please update filters and re-report.

Thanks,
Janusz

> 
>   
> New tests
> ---------



