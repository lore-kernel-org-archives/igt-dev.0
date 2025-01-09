Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC4AE77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 14:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D4910EE1A;
	Thu,  9 Jan 2025 14:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xq4MNCza";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471B510EE14;
 Thu,  9 Jan 2025 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736434360; x=1767970360;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bp0lVbj0kuTLg2tAzmcZtco6dhF8x/Afw6W7rydpT2M=;
 b=Xq4MNCzaIsgLWnm6msHfzFceTxz10VMVVmfS+aQE0FZsUBLLeH2WqWnA
 0sGyMcxiGmQqgOQeylwACJ1qeZYtC5yO7d6K8UWeQHBYvYfCl5+Gr6/7H
 kaVAs9o53+YKZ07a3Ed71OLKFwbTc2eejfAjZ+P30DbJsEa1qR6LQfsTX
 s/2fqWodIN4gySXHt1C//MssQQ+WWJKzXySsfHL/AE3kV3xAodKNywZY3
 V7gcUS5HhCbux7ZLlD4ij2GfOVN/FFCpTWD/QlZGkKXCUNP2zFLedfdzm
 dnbIweX49XqxvPHVxh7pqD8ZQFsI66uG59d1edSu/QwjJXVmDpkWRPBB3 w==;
X-CSE-ConnectionGUID: JfJavzT0RuqYVOH8iekVww==
X-CSE-MsgGUID: qDTeigerRvW4YQgol4j/cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36855800"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="36855800"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 06:52:40 -0800
X-CSE-ConnectionGUID: j7KMKAKeQui4Tryq4dGWyQ==
X-CSE-MsgGUID: QR/IxDLsQg6tGPqdKIyVNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="103975474"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 06:52:39 -0800
Date: Thu, 9 Jan 2025 15:52:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Clint Taylor <clinton.a.taylor@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 Initial PTL support (rev6)
Message-ID: <20250109145236.ep4l3jj5kgzmeaix@kamilkon-desk.igk.intel.com>
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

These are unrelated,

Regards,
Kamil

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
