Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3F6C5DF66
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 16:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4468710E88F;
	Mon, 17 Aug 2026 16:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q51NapB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3484310E88F
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 16:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786982980; x=1818518980;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1o3OflNCahXyTovWKulZ2lGqvh2PBUOsVOGXzSdG/rM=;
 b=Q51NapB1/75JPQwLz/jbIg4ewyv1bZzYV8u4VTrhYO9mzk0Ycqt3tasr
 uCR49pZP2n5dGO3wPSy2GxCxciU3zFgYE82r0+5AEakYf+65Q/0mnXwSu
 IbC5733NgAEC/ivYLaq8Fc2n0OaIDEESvAmj6j4diJVmk3BfUoswAawAE
 YVLaAHJKbkcLxI3sRnfwKUiew9mhwaeOPq4W+ReTV7l7TOIVfIF0bvBpI
 u9SSAF9EJKYNH2/EfOnD+BzGOpGo6IS5Wp1PwGyt+c7IQMrQyBiUQ/aD+
 L33c2I91XksgMulFBc9B6utpqKnra/riD4N+xMXFM58p66J/I6hkUC3qM g==;
X-CSE-ConnectionGUID: sNv6s5IaTrqvmH92LpRTrg==
X-CSE-MsgGUID: N/TFEWl2TC2dqmXiyS5XjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="91333420"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="91333420"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 09:09:40 -0700
X-CSE-ConnectionGUID: IDFrz+U5RZqytyio0DLCHw==
X-CSE-MsgGUID: 6KQmwoXURFqIzP+96gD/LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="261699914"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 09:09:38 -0700
Date: Mon, 17 Aug 2026 18:09:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: aditya.chauhan@intel.com
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 himanshu.girotra@intel.com
Subject: Re: [PATCH i-g-t] intel-ci: Update Core Blocklists for LNL,PTL.NVL
Message-ID: <20260817160918.bd3oaobvfumgjyaw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 aditya.chauhan@intel.com, igt-dev@lists.freedesktop.org,
 ramadevi.gandi@intel.com, himanshu.girotra@intel.com
References: <20260817105411.1695841-1-aditya.chauhan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817105411.1695841-1-aditya.chauhan@intel.com>
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

Hi aditya.chauhan,
On 2026-08-17 at 16:24:11 +0530, aditya.chauhan@intel.com wrote:
> From: Aditya Chauhan <aditya.chauhan@intel.com>
> 
> Update core blocklists for NVL,PTL,LNL by including vram dependent tests,
> d3cold tests, s3 tests, mgpu tests
> 
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>  tests/intel-ci/xe.lnl.core.blocklist.txt | 15 +++++++++++++++
>  tests/intel-ci/xe.nvl.core.blocklist.txt | 20 ++++++++++++++++++++
>  tests/intel-ci/xe.ptl.core.blocklist.txt | 10 ++++++++++
>  3 files changed, 45 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
> index f921ca3a4..c1d2f425c 100644
> --- a/tests/intel-ci/xe.lnl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
> @@ -28,6 +28,15 @@ igt@xe_pm@d3hot-mmap-vram
>  igt@xe_sysfs_tile@physical_vram_size_bytes
>  igt@xe_vm@out-of-memory
>  igt@xe_compute_preempt@compute-preempt-many-vram.*
> +igt@xe_vm@overcommit.*
> +igt@xe_madvise@atomic.*
> +igt@xe_pm_residency@aspm_link_residency

Can you keep (or at least try to keep) alphabetical order?

> +##################################################################
> +# Valid skip as VM_BIND decompression and the compressed PAT
> +# index variants (wt / uc-comp) require VRAM
> +##################################################################
> +igt@xe_ccs@vm-bind.*
> +igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-(wt|uc-comp)-(single|multi)-vma
>  ##################################################################
>  # No d3cold support for LNL
>  ##################################################################
> @@ -43,6 +52,11 @@ igt@xe_pm_residency@cpg-basic
>  ##################################################################
>  igt@intel_hwmon@.*
>  ##################################################################
> +# Survivability mode is a discrete-only feature
> +##################################################################
> +igt@xe_configfs@survivability-mode
> +igt@xe_survivability@.*

imho one in place of two would be better:

igt@.*survivability.*

> +##################################################################
>  # Expected Skip for xe2+ paltforms
>  ##################################################################
>  igt@xe_media_fill@media-fill
> @@ -57,6 +71,7 @@ igt@xe_pat@pat-index-xe3p-xpc
>  # Expected skip on integrated platforms
>  ##################################################################
>  igt@.*@.*multigpu.*
> +igt@xe_multigpu_svm@.*

Here also replace old one igt@.*@.*multigpu.* with:

igt@.*multigpu.*

>  igt@xe_peer2peer@.*
>  #######################################################
>  # Expected behavior - CCS mode enabled only for platforms
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> index b36921519..2f64bfd0d 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -21,6 +21,16 @@ igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
>  igt@xe_compute_preempt@.*vram.*
>  igt@xe_sriov_vram@.*
>  igt@xe_vm@out-of-memory
> +igt@xe_vm@overcommit.*
> +igt@xe_madvise@atomic.*

Same here, keep alphabetical order.

> +##################################################################
> +# Valid skip: Flat CCS / device-memory compression is tied to
> +# dedicated VRAM. NVL has no VRAM, so compressed-surface bind and
> +# the compressed PAT index variants (wt / uc-comp) are not
> +# applicable, and neither are device/global atomics on VRAM.
> +##################################################################
> +igt@xe_ccs@vm-bind.*
> +igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-(wt|uc-comp)-(single|multi)-vma
>  ##################################################################
>  # Valid skip: PAT index tests targeting older/different platforms
>  # These PAT (Page Attribute Table) index subtests validate
> @@ -63,6 +73,7 @@ igt@xe_huc_copy@huc_copy
>  igt@xe_exec_balancer@.*
>  igt@xe_oa@oa-tlb-invalidate
>  igt@xe_pxp@.*
> +igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
>  ##################################################################
>  # Valid skip: test applicable only for i2c capable systems
>  ##################################################################
> @@ -71,6 +82,7 @@ igt@xe_pm@d3hot-i2c
>  # Valid skip: multigpu/multitile tests are not supported on NVL
>  ##################################################################
>  igt@.*@.*multigpu.*
> +igt@xe_multigpu_svm@.*

Same here, one is enough:

igt@.*multigpu.*

>  igt@xe_peer2peer@.*
>  igt@.*@.*tiles
>  ##################################################################
> @@ -80,6 +92,14 @@ igt@intel_hwmon@.*
>  igt@xe_mmap@pci-membarrier.*
>  igt@xe_configfs@survivability-mode
>  igt@xe_survivability@.*
> +igt@xe_pm@.*d3cold.*
> +igt@xe_pm_residency@aspm_link_residency

Same here, alphabetical order.

> +##################################################################
> +# Valid skip: S3 (deep) suspend is not supported on NVL
> +##################################################################
> +igt@xe_gt_freq@freq_suspend
> +igt@xe_pm@s3.*
> +igt@xe_pm_residency@cpg-basic
>  ##################################################################
>  # Valid skip: EU debugger and SIP (System Interrupt Protocol)
>  # support is not yet available in the kernel for NVL. These tests
> diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
> index dc094e7e8..2574c0cc9 100644
> --- a/tests/intel-ci/xe.ptl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
> @@ -22,6 +22,15 @@ igt@xe_pm@d3hot-mmap-vram
>  igt@xe_compute_preempt@.*vram.*
>  igt@xe_vm@out-of-memory
>  igt@xe_evict.*
> +igt@xe_vm@overcommit.*
> +igt@xe_madvise@atomic.*
> +igt@xe_pm_residency@aspm_link_residency

Same here.

> +##################################################################
> +# Expected skip as VM_BIND decompression and the compressed PAT
> +# index variants (wt / uc-comp) require device-local memory
> +##################################################################
> +igt@xe_ccs@vm-bind.*
> +igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-(wt|uc-comp)-(single|multi)-vma
>  ##################################################################
>  # No d3cold support for HW as of now
>  ##################################################################
> @@ -48,6 +57,7 @@ igt@xe_configfs@survivability-mode
>  ##################################################################
>  igt@intel_hwmon@.*
>  igt@.*@.*multigpu.*
> +igt@xe_multigpu_svm@.*

Same here, one for multigpu.

Regards,
Kamil

>  igt@xe_peer2peer@.*
>  igt@xe_mmap@pci-membarrier.*
>  igt@xe_pm@d3hot-i2c
> -- 
> 2.34.1
> 
