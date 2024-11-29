Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8835CD729E7
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 16:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8BA10E1B2;
	Fri, 29 Nov 2024 16:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlzUoah+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E805910E1B2;
 Fri, 29 Nov 2024 16:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732897188; x=1764433188;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CSQZLCtg+u6PgupQ7hVguq6medQ0eOIEzTRfnYi4d3s=;
 b=ZlzUoah+6NpEiBP2PqtPVqjlKdsk1T3anaveA6v7BNsMLsRn3/Xzw0jW
 69jykVOQx6blUK7eUnHec1KfBrpvbwWtRXEWPDAAmTL9zRxYI+ARsO44w
 jexoU9lvE0lr+b8uoGXSBluqAgNTKKUkangLu61QmkmYtofv11nz8dRYc
 hD4fofJvRMNuJfvPsRkX8mAiYwsTjoRoUG8tjxsAEObvDBa8t240TXdyG
 gyXOs/O91PJxMTfb/3coBjNmE9l8BPp7QjkcAgjqUzwrCStRSHnOhc+ZB
 WKGaWMDxG29o9xOamW6FzYG2TVN/+2qk2xvRnIrmRjuaoa66Vq+jmALVj Q==;
X-CSE-ConnectionGUID: i+PtA0E1SR6LiGZ4pJMkuQ==
X-CSE-MsgGUID: AR8kx6n6TfCSLvtHpSla4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="32497375"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="32497375"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 08:19:47 -0800
X-CSE-ConnectionGUID: PEe2+u4NSs2PnjhAchpLuw==
X-CSE-MsgGUID: S086Ys1BTBWN7V9yGjvuBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="123487800"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 08:19:46 -0800
Date: Fri, 29 Nov 2024 17:19:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests=2Fi?=
 =?utf-8?Q?ntel=2Fxe=5Ffault=5Finjection?= =?utf-8?Q?=3A?= Pick a valid PAT
 index for vm_bind
Message-ID: <20241129161944.vqyjuydnuixmhkgr@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241125185432.1187252-1-matthew.d.roper@intel.com>
 <173259026534.3135515.880555517162413975@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173259026534.3135515.880555517162413975@b555e5b46a47>
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
On 2024-11-26 at 03:04:25 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_fault_injection: Pick a valid PAT index for vm_bind
> URL   : https://patchwork.freedesktop.org/series/141767/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15744_full -> IGTPW_12196_full

Below are unrelated to Xe test change, no need for respin.

Regards,
Kamil

> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12196_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12196_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   Additional (1): shard-dg2-9 
>   Missing    (1): shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12196_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_getversion@basic:
>     - shard-dg2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-4/igt@core_getversion@basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@core_getversion@basic.html
> 
>   * igt@core_setmaster@master-drop-set-shared-fd:
>     - shard-dg2:          [PASS][3] -> [SKIP][4] +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-dg2-2/igt@core_setmaster@master-drop-set-shared-fd.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html
> 
>   * igt@gem_tiled_swapping@non-threaded:
>     - shard-snb:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-snb4/igt@gem_tiled_swapping@non-threaded.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-snb1/igt@gem_tiled_swapping@non-threaded.html
> 
>   * igt@i915_pm_rpm@system-suspend-devices:
>     - shard-rkl:          [PASS][7] -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-5/igt@i915_pm_rpm@system-suspend-devices.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-5/igt@i915_pm_rpm@system-suspend-devices.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - shard-tglu:         NOTRUN -> [DMESG-WARN][9]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-10/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@kms_plane@pixel-format-source-clamping:
>     - shard-tglu:         [PASS][10] -> [ABORT][11] +3 other tests abort
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-tglu-6/igt@kms_plane@pixel-format-source-clamping.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-tglu-4/igt@kms_plane@pixel-format-source-clamping.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-rkl:          NOTRUN -> [SKIP][12] +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-7/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_psr@psr2-sprite-blt:
>     - shard-mtlp:         [PASS][13] -> [FAIL][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-mtlp-4/igt@kms_psr@psr2-sprite-blt.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-mtlp-7/igt@kms_psr@psr2-sprite-blt.html
> 
>   * igt@perf_pmu@busy-idle-no-semaphores:
>     - shard-dg2:          NOTRUN -> [SKIP][15]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-dg2-11/igt@perf_pmu@busy-idle-no-semaphores.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_tiled_swapping@non-threaded:
>     - shard-rkl:          [DMESG-FAIL][16] ([i915#12964]) -> [FAIL][17]
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15744/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12196_full that come from known issues:
> 
...cut...
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12196/index.html
