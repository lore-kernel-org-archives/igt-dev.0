Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EDBC5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 13:08:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3870510F602;
	Mon, 11 Mar 2024 13:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DjPeO3Qs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F63611264E;
 Mon, 11 Mar 2024 13:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710162480; x=1741698480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X6oA2JDk4Eqs//SDxIkOMtyc6CIb+Vu2mdbVTjTWObc=;
 b=DjPeO3Qsmr06ZaAMvDw0RIULtAJzJSb+Ao7y3BYM+I7vuSJGLsMVNt+m
 Yh5Ia6S+VoqqwHGqLP9iZIsk8m1A6dszpTkgkKJl8dLc26bTuFp6l79xE
 CFIDXo0v881+FD/ITqTuirw32bDRMJUFdpCPHpaalwkyWcmuZdQtW+oc2
 wFAJtWIuHTzJ035vJPAEXuYySRUDIKu4nVt6SzrANuII0iSly3AgW8q7G
 ED9B+Trl6lYIAzz6n37o2G5DAPys6eVl/JyjSGXKGbD4ktn5gbN8i5DS7
 esT8njod3pHdGlWGpMgExLxSVuk8V8FyqtkSfM/eiLxBWZDIIcFHhvX6p A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4999936"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4999936"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="34309704"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 06:07:57 -0700
Date: Mon, 11 Mar 2024 14:07:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 tests/intel/xe_pm: Fix runtime_pm tests
Message-ID: <20240311130754.acpcgy5wiyx2wbny@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240307183103.188082-1-rodrigo.vivi@intel.com>
 <170987429944.611156.2570029856524079774@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170987429944.611156.2570029856524079774@8e613ede5ea5>
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
On 2024-03-08 at 05:04:59 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_pm: Fix runtime_pm tests
> URL   : https://patchwork.freedesktop.org/series/130876/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14405_full -> IGTPW_10793_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10793_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10793_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10793/index.html
> 
> Participating hosts (8 -> 9)
> ------------------------------
> 
>   Additional (1): shard-snb-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10793_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_schedule@deep@ccs0:
>     - shard-dg2:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14405/shard-dg2-3/igt@gem_exec_schedule@deep@ccs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10793/shard-dg2-11/igt@gem_exec_schedule@deep@ccs0.html
> 
>   * igt@gem_workarounds@reset-context:
>     - shard-dg2:          [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14405/shard-dg2-5/igt@gem_workarounds@reset-context.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10793/shard-dg2-3/igt@gem_workarounds@reset-context.html
>     - shard-dg1:          [PASS][5] -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14405/shard-dg1-16/igt@gem_workarounds@reset-context.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10793/shard-dg1-19/igt@gem_workarounds@reset-context.html
> 
>   * igt@i915_pm_rpm@gem-execbuf:
>     - shard-dg2:          NOTRUN -> [SKIP][7]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10793/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf.html
> 
>   * igt@perf_pmu@all-busy-check-all:
>     - shard-dg2:          [PASS][8] -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14405/shard-dg2-11/igt@perf_pmu@all-busy-check-all.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10793/shard-dg2-11/igt@perf_pmu@all-busy-check-all.html
> 

These are unrelated, no need for respin (already merged).

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10793_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#8411])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10793/shard-mtlp-8/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@debugfs_test@basic-hwmon:
>     - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#9318])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10793/shard-rkl-7/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7749 -> IGTPW_10793
> 
>   CI-20190529: 20190529
>   CI_DRM_14405: 56720b5e1da1b816a1bf532359941adb002c4432 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10793: 10793
>   IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10793/index.html
