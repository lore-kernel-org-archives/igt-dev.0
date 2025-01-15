Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E56FC02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 15:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F9910E6ED;
	Wed, 15 Jan 2025 15:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OivuAS9X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829C410E508;
 Wed, 15 Jan 2025 15:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736954169; x=1768490169;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NCih+PR4a6I4fnD8bHtnIbqG0CwCOdMVlSOdKt5qUP0=;
 b=OivuAS9XYJ/BFx8VnOihW5MdglH5hpzesTh4uRwH3fsklTSbaepXF4VR
 K3qw5eU5w8cRHWJucCq8qohUiB1RbktdlZnflCsS9I0CN6bkxiWWw7T1M
 Fq6WamQKGp1CEKbC7IxiwMYUciDMsua+N3rJYS22MJGQdgHtegY0FzPEl
 /CnHsLsCQ+lvHMSJ/MdWRk/PBRM4dc60KKcfuZJflGeLkX/8FE6DMf4ct
 apP6WWtOVS5h9wZeWRlzxXmq5gnEPUbNzcd26tjWuPoqoZFC21B+1KCbD
 bcJiLYrd1RQvCDxvgqrya1tVK/n4aHdaAlYVk8qcNodblYpCFdY/YhXWw A==;
X-CSE-ConnectionGUID: renTZ3GzTounmToB4/gvxA==
X-CSE-MsgGUID: gEZ0kAJ4RaqT25isVpN51A==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="48689691"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="48689691"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 07:16:08 -0800
X-CSE-ConnectionGUID: 1oU0A/JDT5SNJqh95S/RQQ==
X-CSE-MsgGUID: BspMDEsfRRGAJvdE7pFN0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="110135520"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 07:16:07 -0800
Date: Wed, 15 Jan 2025 16:16:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Clint Taylor <clinton.a.taylor@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 Initial PTL support (rev6)
Message-ID: <20250115151604.uddp3le3gtmfzoic@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Clint Taylor <clinton.a.taylor@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
 <173643279483.1645445.6728014542556156152@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173643279483.1645445.6728014542556156152@b555e5b46a47>
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
On 2025-01-09 at 14:26:34 -0000, Patchwork wrote:

below regressions are unrelated, please re-report and
respin i915 tests.

Regards,
Kamil

> == Series Details ==
> 
> Series: Initial PTL support (rev6)
> URL   : https://patchwork.freedesktop.org/series/141325/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8183 -> IGTPW_12418
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12418 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12418, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/index.html
> 
> Participating hosts (38 -> 37)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12418:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - fi-cfl-guc:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - bat-arlh-2:         [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/bat-arlh-2/igt@i915_selftest@live@gt_heartbeat.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/bat-arlh-2/igt@i915_selftest@live@gt_heartbeat.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12418 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live:
>     - bat-arlh-2:         [PASS][5] -> [INCOMPLETE][6] ([i915#13050])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/bat-arlh-2/igt@i915_selftest@live.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/bat-arlh-2/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arls-5:         [PASS][7] -> [DMESG-FAIL][8] ([i915#13393]) +1 other test dmesg-fail
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/bat-arls-5/igt@i915_selftest@live@workarounds.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/bat-arls-5/igt@i915_selftest@live@workarounds.html
> 
>   * igt@runner@aborted:
>     - fi-pnv-d510:        NOTRUN -> [FAIL][9] ([i915#13350])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/fi-pnv-d510/igt@runner@aborted.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@workarounds:
>     - {bat-mtlp-9}:       [DMESG-FAIL][10] ([i915#13393]) -> [PASS][11] +1 other test pass
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#13050]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13050
>   [i915#13350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13350
>   [i915#13393]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8183 -> IGTPW_12418
> 
>   CI-20190529: 20190529
>   CI_DRM_15929: 14e0c4a8247c9514dc57b2231602fb6d9455802b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12418: 23052ace3ac04fd0203b573736255ba4919c63d3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8183: b2dbc6f22815128c0dd5c737504f42e1f1a6ad62 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/index.html
