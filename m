Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56B7C369C4
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 11:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C2810E8D5;
	Wed, 16 Apr 2025 11:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKy1INTE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAA410E8D3;
 Wed, 16 Apr 2025 11:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744803372; x=1776339372;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cnU2pibshypiug7NxSqC3Q11qcuBO6dLpmr48auPjrA=;
 b=dKy1INTEVOBcqsUiw4+t8Ag9FJ9W8c1dPmpKHDWiTinUZqve0MKFU9mq
 wpyJIOOuyDNHDVRPi6eS9L6rvqWCG7W9sFTl0Q/LIq84sP3PX5cvkBsZO
 BhGQHbbQfyehbxoSqlJIky1WqI7jypBJQYE9E9bHBWu+wOjrpQoyPNo7/
 q2QzpJ1N829nXy0iXg4eSP+nbTredGXcSgB86egz9KvvfM9WH/SRdKmk6
 RaAXAkEvjU1stNwoK7hft7cdnCae06U6FmKf4sYec4+AV7gT1Ykab5cc2
 wKeKAp/54N5a3l53My3PK17Y7qYg2Xe0wAWCoSqpBdgHBevyWypwlY8AB A==;
X-CSE-ConnectionGUID: AmoxgEGeSrGVoIhgMOLUlQ==
X-CSE-MsgGUID: 3MGXIaXcTL+PH14LlCFx9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="45481272"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="45481272"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 04:36:11 -0700
X-CSE-ConnectionGUID: h+uRoOnySjmCgd815If/Uw==
X-CSE-MsgGUID: fzLBkQ79RxubUH/iLsq+4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="130289545"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 04:36:10 -0700
Date: Wed, 16 Apr 2025 13:36:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 rename drm_fdinfo into i915_fdinfo (rev7)
Message-ID: <20250416113608.la47lawy37ymrrqx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250414172336.59158-1-kamil.konieczny@linux.intel.com>
 <174470446723.4402.4552218649160271055@b68e5b3b99e1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174470446723.4402.4552218649160271055@b68e5b3b99e1>
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
On 2025-04-15 at 08:07:47 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: rename drm_fdinfo into i915_fdinfo (rev7)
> URL   : https://patchwork.freedesktop.org/series/140053/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8318_FULL -> XEIGTPW_12973_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12973_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12973_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 

Unrelated as this is i915 test,

Regards,
Kamil

>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12973_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@drm_fdinfo@idle:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][1] +23 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12973/shard-dg2-464/igt@drm_fdinfo@idle.html
>     - shard-lnl:          NOTRUN -> [SKIP][2] +24 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12973/shard-lnl-7/igt@drm_fdinfo@idle.html
> 
>   * igt@drm_fdinfo@virtual-busy:
>     - shard-bmg:          NOTRUN -> [SKIP][3] +23 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12973/shard-bmg-6/igt@drm_fdinfo@virtual-busy.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][4] -> [DMESG-WARN][5] +6 other tests dmesg-warn
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12973/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-dp2-hdmi-a3.html
> 
>   * igt@kms_vblank@wait-forked-busy-hang:
>     - shard-bmg:          [PASS][6] -> [FAIL][7] +1 other test fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-1/igt@kms_vblank@wait-forked-busy-hang.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12973/shard-bmg-6/igt@kms_vblank@wait-forked-busy-hang.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_vm_add_compute_exec_queue:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12973/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_vm_add_compute_exec_queue.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          [FAIL][9] ([Intel XE#1178]) -> [TIMEOUT][10] +1 other test timeout
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-bmg-3/igt@kms_content_protection@legacy.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12973/shard-bmg-6/igt@kms_content_protection@legacy.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12973_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:
>     - shard-lnl:          [PASS][11] -> [ABORT][12] ([Intel XE#4624]) +1 other test abort
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8318/shard-lnl-7/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12973/shard-lnl-3/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html

...cut...

>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8318 -> IGTPW_12973
>   * Linux: xe-2947-7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa -> xe-2950-ee6ca91bfc76e36e7520d3603772b55fcc3837b8
> 
>   IGTPW_12973: 5b31a2038d4e97ebe57b3254b1b3ea57cd1573a8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8318: 6a33ce105328c5c7cdc63cdd799698638f20db28 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2947-7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa: 7fabc0c4629ff44d0472fa70ed6ae5caa334c3aa
>   xe-2950-ee6ca91bfc76e36e7520d3603772b55fcc3837b8: ee6ca91bfc76e36e7520d3603772b55fcc3837b8
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12973/index.html
