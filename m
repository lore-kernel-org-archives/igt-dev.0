Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA58C3ABC3
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 11:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30FC10EA26;
	Fri,  9 May 2025 11:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rlez1QC5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FE710EA26
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 11:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746791203; x=1778327203;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=OjaSymV1pW+g2wc+L8z18of45YDTihE4mAYOOu9Q1Bo=;
 b=Rlez1QC5F4MXOQb/tGZWFbzhBySsZSgxKllnLsWC6+gCPsz1dhnGgWA4
 z6PYZCEBzc/Mv3l52ActYCCWi278sgeobXdpFCrHvbaP9/zJjdvon9BMF
 nbPHVofEy8jR9dQrme3O/UOBiFaCUCUoqWqfZ15JHeM/BoFm3FHIeiMLO
 qDkZloaiue+5QmCV46JhLywGY+hhx3T+MY0qG1LtwFw81HmFOURw8c7zC
 v227lahqa5hb2SDQX9puFYOypTOAzP1tJcJr7tmPKyEoZJXtlZHo+SIgm
 IKm7q+8TlByRobv/VJ7h1VPzGDIjbBKMoLOzmTbF2PKp6TqeGRylzmLGY A==;
X-CSE-ConnectionGUID: GefsVXFGRTSUxEeDclSmKg==
X-CSE-MsgGUID: 0eeWE+BuSHm7Enbzi2FyKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48316303"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="48316303"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 04:46:42 -0700
X-CSE-ConnectionGUID: yZR1TbDAQiydDFVeKEd98Q==
X-CSE-MsgGUID: wJL8N7BYRmywXoTjqD2pEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="137110627"
Received: from apalm-mobl1.ger.corp.intel.com (HELO [10.245.84.12])
 ([10.245.84.12])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 04:46:42 -0700
Message-ID: <773ee729-6240-4158-8740-ac7033ae3f23@linux.intel.com>
Date: Fri, 9 May 2025 13:46:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBsaWIveGUveGVf?=
 =?UTF-8?Q?legacy=3A_Move_test=5Flegacy=5Fmode_to_lib/_=28rev3=29?=
To: igt-dev@lists.freedesktop.org
References: <20250417193032.329-1-peter.senna@linux.intel.com>
 <174679036295.63689.1942812379992527726@c664b1dc75d1>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174679036295.63689.1942812379992527726@c664b1dc75d1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear I915,

On 5/9/2025 1:32 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/xe/xe_legacy: Move test_legacy_mode to lib/ (rev3)
> URL   : https://patchwork.freedesktop.org/series/147939/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8359_FULL -> XEIGTPW_13098_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13098_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13098_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13098_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13098/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a6.html
> 
>   * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-nomemset:
>     - shard-bmg:          [PASS][2] -> [SKIP][3] +14 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-nomemset.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13098/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-new-busy-nomemset:
>     - shard-lnl:          [PASS][4] -> [SKIP][5] +24 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-new-busy-nomemset.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13098/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-new-busy-nomemset.html
> 
>   * igt@xe_oa@oa-exponents@ccs-0:
>     - shard-lnl:          [PASS][6] -> [TIMEOUT][7] +1 other test timeout
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-2/igt@xe_oa@oa-exponents@ccs-0.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13098/shard-lnl-5/igt@xe_oa@oa-exponents@ccs-0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-lnl:          [SKIP][8] ([Intel XE#367]) -> [SKIP][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13098/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>     - shard-bmg:          [SKIP][10] ([Intel XE#367]) -> [SKIP][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13098/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio:
>     - shard-bmg:          [SKIP][12] ([Intel XE#2252]) -> [SKIP][13] +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13098/shard-bmg-1/igt@kms_chamelium_audio@hdmi-audio.html
>     - shard-lnl:          [SKIP][14] ([Intel XE#373]) -> [SKIP][15] +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-4/igt@kms_chamelium_audio@hdmi-audio.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13098/shard-lnl-5/igt@kms_chamelium_audio@hdmi-audio.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x10:
>     - shard-bmg:          [SKIP][16] ([Intel XE#2320]) -> [SKIP][17]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13098/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x10.html
>     - shard-lnl:          [SKIP][18] ([Intel XE#1424]) -> [SKIP][19]
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-32x10.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13098/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> 
>   * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>     - shard-lnl:          [SKIP][20] ([Intel XE#4837]) -> [SKIP][21]
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-7/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13098/shard-lnl-5/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
>     - shard-lnl:          [SKIP][22] ([Intel XE#1392]) -> [SKIP][23]
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13098/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_system_allocator@many-large-mmap-free-huge:
>     - shard-lnl:          [SKIP][24] ([Intel XE#4943]) -> [SKIP][25] +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-lnl-2/igt@xe_exec_system_allocator@many-large-mmap-free-huge.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13098/shard-lnl-5/igt@xe_exec_system_allocator@many-large-mmap-free-huge.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge:
>     - shard-bmg:          [SKIP][26] ([Intel XE#4943]) -> [SKIP][27] +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13098/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-huge.html

These are unrelated to my change. Thank you.
