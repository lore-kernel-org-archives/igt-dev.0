Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2C8D33998
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 15:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C8D10E4F0;
	Mon, 28 Oct 2024 15:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AEiSfMN5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F4010E4EC;
 Mon, 28 Oct 2024 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730128800; x=1761664800;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2NZOJzH6Nnh7jANyvmF1i5nKy8f4NoWTk1NY88eIf6g=;
 b=AEiSfMN5v1XdBow8x9AP7ozWpWkjjcehyTteUHUESXI+lw+2LANHDSr6
 rp6KuFpD2Ntba1mDxdUyK/vWLWLdCe+bcAx2J2BfcB4Q0WAgEgjv2l8wN
 Wr1xraVWrQya+bSbGExq7F9xPYJgA/hNYdidyxrCqlZ8KM7RpdPGK0Xp0
 BFt6glFLRARnAZTpuDpnLkNcEDKBK4h/tEoRLGPGab58Lu8nJJFRKkXXn
 749Vmj7WhTtgWLoUkRRft8x5rjinu3T0WUM3j9SRMzi+SRYBdOIPGYCCy
 ErlYFdjhj09CUvMms4ylQSrZ2r1p6b/dvj26XNMxFx+wyK2jmIEp0MZsR A==;
X-CSE-ConnectionGUID: xc9TH1qYSme1FAKCaZOxUQ==
X-CSE-MsgGUID: CrX8H8c3STKfZ9UtMj3xjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40268108"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40268108"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 08:20:00 -0700
X-CSE-ConnectionGUID: n4EVMOINSgGA3T14zmn+uA==
X-CSE-MsgGUID: ThL0pia8SkWbtFTDyEFysw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="81263101"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 08:19:58 -0700
Date: Mon, 28 Oct 2024 16:19:56 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: george.zhang@amd.com, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 scripts/run-test: Keep original prune behaviour (rev3)
Message-ID: <20241028151956.cxmt45cqgdzqgpdb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, george.zhang@amd.com,
 I915-ci-infra@lists.freedesktop.org
References: <20241025182944.866-1-george.zhang@amd.com>
 <173002680592.1352688.2232181753545810376@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173002680592.1352688.2232181753545810376@2413ebb6fbb6>
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
On 2024-10-27 at 11:00:05 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: scripts/run-test: Keep original prune behaviour (rev3)
> URL   : https://patchwork.freedesktop.org/series/140446/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8086_full -> XEIGTPW_11986_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11986_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11986_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11986_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_vblank@query-forked-hang:
>     - shard-bmg:          [PASS][1] -> [SKIP][2] +3 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-5/igt@kms_vblank@query-forked-hang.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11986/shard-bmg-3/igt@kms_vblank@query-forked-hang.html
> 
>   * igt@xe_exec_balancer@many-cm-parallel-basic:
>     - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +6 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-1/igt@xe_exec_balancer@many-cm-parallel-basic.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11986/shard-bmg-4/igt@xe_exec_balancer@many-cm-parallel-basic.html
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11986/shard-dg2-463/igt@xe_exec_balancer@many-cm-parallel-basic.html
> 
>   * igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:
>     - shard-bmg:          [PASS][6] -> [INCOMPLETE][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-5/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11986/shard-bmg-2/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
>     - shard-lnl:          [PASS][8] -> [FAIL][9] +2 other tests fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11986/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>     - shard-bmg:          [PASS][10] -> [FAIL][11] +4 other tests fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11986/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-lnl:          [PASS][12] -> [DMESG-WARN][13] +7 other tests dmesg-warn
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-lnl-7/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11986/shard-lnl-3/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-userptr:
>     - shard-dg2-set2:     [PASS][14] -> [DMESG-WARN][15] +4 other tests dmesg-warn
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-userptr.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11986/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-userptr.html
> 
>   * igt@xe_exec_threads@threads-cm-shared-vm-userptr:
>     - shard-dg2-set2:     [PASS][16] -> [FAIL][17]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-dg2-436/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11986/shard-dg2-466/igt@xe_exec_threads@threads-cm-shared-vm-userptr.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][18] ([Intel XE#2311]) -> [SKIP][19] +2 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11986/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [SKIP][20] ([Intel XE#2313]) -> [SKIP][21] +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11986/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-bmg:          [SKIP][22] ([Intel XE#2763]) -> [SKIP][23]
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8086/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11986/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 

Unrelated to change in scripts/

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11986_full that come from known issues:
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8086 -> IGTPW_11986
> 
>   IGTPW_11986: e56435971ab28c341fbac9a6f59185125537f4f6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2132-263b21a91964ddc599f4f85cf3511b0aafd2028e: 263b21a91964ddc599f4f85cf3511b0aafd2028e
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11986/index.html
