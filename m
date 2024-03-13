Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C151EC54791
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 16:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0A110E2DE;
	Wed, 13 Mar 2024 16:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Et3vZd9T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2197F10E2DE
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 16:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710348769; x=1741884769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wGC5C826aJqi81FLSUCct0dByZBTbJ3m7cdVlg3axD8=;
 b=Et3vZd9TZQbxWGV25teu1cQYV0pHyqU+gGLdfzWSdqJHz7PVn9bN8N0q
 5sNCeIVggqudVlpTB/OE5JccZGyTcGj0qwZo4g2WWRYmraAmUXSf3Wloq
 tGUvL2ka10RZoUXaYwMWyYl0K51J8yiq+hysmp58am4QDXfFSwVC1aafo
 6oHRt0n44bNBuXJFpXCFgjjd1P20aHoyXFt5KspT+waNuRMz1CWBDZtgw
 Puys7YE8GS1cAbjlN8FO2BG1ilQBiNUSAjWLXMNpwKjtQGY6ct2pTH/TJ
 nRtu8FP9yI9xHQ8G5LDuoYtYi1KC/0Y11ZcBJPcRLBJ9zDj+x1gMAc1/q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16283701"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="16283701"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 09:52:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="42915849"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.25.211])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 09:52:47 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: lgci.bug.filing@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= Fi.CI.IGT: failure for lib/kunit: Execute test
 cases synchronously (rev5)
Date: Wed, 13 Mar 2024 17:52:44 +0100
Message-ID: <2984694.A7TYtsqqnE@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <171034760395.732671.5727539964803646204@8e613ede5ea5>
References: <20240227151128.16802-4-janusz.krzysztofik@linux.intel.com>
 <171034760395.732671.5727539964803646204@8e613ede5ea5>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi BUG Filing,

On Wednesday, 13 March 2024 17:33:23 CET Patchwork wrote:
> == Series Details ==
> 
> Series: lib/kunit: Execute test cases synchronously (rev5)
> URL   : https://patchwork.freedesktop.org/series/126017/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14424_full -> IGTPW_10822_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10822_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10822_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10822/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   Additional (1): shard-dg2-4 
>   Missing    (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10822_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-tglu:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14424/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10822/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_flip@plain-flip-ts-check@a-hdmi-a4:
>     - shard-dg1:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14424/shard-dg1-17/igt@kms_flip@plain-flip-ts-check@a-hdmi-a4.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10822/shard-dg1-15/igt@kms_flip@plain-flip-ts-check@a-hdmi-a4.html
> 
>   * igt@sysfs_timeslice_duration@timeout@ccs3:
>     - shard-dg2:          [PASS][5] -> [TIMEOUT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14424/shard-dg2-2/igt@sysfs_timeslice_duration@timeout@ccs3.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10822/shard-dg2-6/igt@sysfs_timeslice_duration@timeout@ccs3.html

None of the above is related to the scope of this patch series which touches 
only KUnit tests (drm_buddy, drm_mm, kms_selftest or xe_live_ktest for now).  

BUG Filing, please update filters and re-report.

Thanks,
Janusz

> 
>   
> #### Suppressed ####
<snip>


